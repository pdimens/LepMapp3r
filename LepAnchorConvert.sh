#! /usr/bin/env bash

if [[ -z "$1" ]]; then
    echo -e "\nThis script will create Lep-Anchor inputs from LepMap3 output files.\nRequires the reference genome as the only argument."
    echo -e "\n [usage]: LepAnchorConvert.sh genome.fasta"
    exit
fi

#rm -r bedfiles oriented cleanMap.input LepAnchor_snps.txt map.clean *.sizes intervals/LepAnchor_input

# generate the snp file
#echo -e "\n---.gz files in working dir---\n"
#ls *.gz 
#echo -e "\n------------------------------"
#echo -ne "\nWhat is the name of the data.gz file? "
#read
#zcat ${REPLY} | awk '(NR>=7){print $1"\t"$2}' > LepAnchor_snps.txt
zcat data_f.call.gz | awk '(NR>=7){print $1"\t"$2}' > LepAnchor_snps.txt

# generate CleanMap input
echo -e "\n---map.*.master file in working dir---\n"
ls map.*.master
echo -e "\n--------------------------------------"
echo -ne "\nWhat is the name of the map file? "
read
paste LepAnchor_snps.txt ${REPLY} > cleanMap.input
# add "#" sign at the beginning of the file
echo -n "#" | cat - cleanMap.input > cleanMap.input.corr
#sed 's/chrom  pos/#chrom      pos/g' cleanMap.input > cleanMap.input.corr

# get contig sizes
echo -ne "\n1) Calculating contig sizes from $(basename $1)....."
awk -f /bin/contigLength.awk $1 > $(basename $1).sizes && echo "done!"

# make the bed files
mkdir -p bedfiles
echo -ne "\n2) Using CleanMap module on generated mapfile....."
java -cp /bin CleanMap map=cleanMap.input.corr > map.clean 2>/dev/null && echo "done!"
echo -ne "\n3) Using Map2Bed module to convert cleaned mapfile....." 
java -cp /bin Map2Bed map=map.clean contigLength=$(basename $1).sizes > bedfiles/map.bed  && echo "done!"

NUMCHROM=$(ls intervals | wc -l)

mkdir -p oriented intervals/LepAnchor_input

# generate PlaceAndOrientContigs input
echo -ne "\n4) Creating interval input files for $NUMCHROM chromosomes....."
for i in $(seq 1 $NUMCHROM)
do
    awk -vn=$i '(NR==FNR){map[NR-1]=$0}(NR!=FNR){$1=map[$1] "\t" n;print}' LepAnchor_snps.txt intervals/reordered.$i.*.intervals > intervals/LepAnchor_input/order.$i.intervals.input
    #java -cp /bin PlaceAndOrientContigs map=order${i}.intervals.input bed=chr.$i.bed
    #java -cp /bin PlaceAndOrientContigs bed=bedfiles/map.bed chromosome=$i > oriented/chr$i.la
    #awk -vn=X '(NR==FNR){map[NR-1]=$0}(NR!=FNR && /^[^#]/){print map[$1],n,$2,$3}' LepAnchor_snps.txt reordered.$i.txt > order.$i.m.input
    #java -cp /bin PlaceAndOrientContigs map=order.$i.m.input bed=bedfiles/map.bed noIntervals=1 ...

done && echo "done!"


