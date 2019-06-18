![LepMapp3r](https://github.com/pdimens/LepMapp3r/blob/master/LepMapp3r.png)
#### Interactive bash wrapper for using LepMap3 to create linkage maps
LepMapp3r is a wrapper for LepMap3 [(Rastas 2017)](https://academic.oup.com/bioinformatics/article/33/23/3726/4061277) intended to link the modules together into a single workflow. Detailed information on installation and usage can be found on the [LepMapp3r Wiki](https://github.com/pdimens/LepMapp3r/wiki).

### Installation
A simple installation script script has been provided to download and install `LepMap3`, `LepMapp3r`, and `LepMapp3rQA` onto a system in the correct `$PATH`. Intended for Unix-like systems, e.g. Linux. BSD, macOS.

### Before you begin
Please read through [the LepMap3 manual](https://sourceforge.net/p/lep-map3/wiki/LM3%20Home/#lep-map3-documentation). You will need to create a pedigree file from your data and have your filtered VCF file ready to go in the working directory.

### Be aware
LepMap3 is a **very** comprehensive software, and LepMapp3r cannot (will not?) incorporate all the features and nuances within the various modules. Your study is unique, so you are encouraged to fork this repo and adapt LepMapp3r to your needs! All of the code in LepMapp3r is written [more or less] cleanly in human-readable bash, so give it a shot and adapt it to your workflow. If using LepMapp3r and publishing, cite **Pasi Rastas** for his work on LepMap3, and if you like using it, give Pavel Dimens a shout out on Twitter [@pvdimens](https://twitter.com/PVDimens) [![alt text](http://i.imgur.com/wWzX9uB.png)](https://twitter.com/PVDimens)  =)

## Citation
Pasi Rastas, Lep-MAP3: robust linkage mapping even for low-coverage whole genome sequencing data, Bioinformatics, Volume 33, Issue 23, 01 December 2017, Pages 3726–3732,https://doi.org/10.1093/bioinformatics/btx494
