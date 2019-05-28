#! /usr/bin/env bash

echo "Downloading LepMap3 binaries from the official SourceForge repository..."
wget -O LepMap3.zip "https://downloads.sourceforge.net/project/lep-map3/binary%2Bcode.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flep-map3%2Ffiles%2F&ts=1559020265&use_mirror=pilotfiber"

echo "Unzipping LepMap3..."
unzip LepMap3.zip 

echo "Copying files to PATH locations..."
mkdir LM3
chmod +x LepMapp3r/*
cp ./bin/* LepMapper/LepMapp3rQA.r LM3
sudo mv LM3 LepMapp3r /bin

echo "[Installation summary]"
echo -e "File\tLocation"
echo -e "LepMapp3r\t/bin"
for LM3FILE in $(ls /bin/LM3/*)
do
    echo -e "$LM3FILE\t$(dirname $LM3FILE)"
done

echo "Installation complete! You may now safely delete the entire LepMapp3r folder"
