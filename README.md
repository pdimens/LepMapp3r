![alt text](https://github.com/pdimens/LepMapp3r/blob/master/LepMapp3r.png)
#### Interactive dDocent-like bash wrapper for using LepMap3 to create linkage maps
#### NOT YET READY FOR USE
LepMapp3r is a wrapper for LepMap3 (Rasta 2017) intended to link the modules together into a single workflow. To use it correctly, LepMap3 needs to be installed in `/bin/LM3`, however you can always modify LepMapp3r to point to where your installation is by editing `line 4`. Additionally, you will need LepMapp3rQA.r installed in `/bin` as well, or wherever you want (so long as you change the location on line `138`). To use LepMapp3r, simply run the command without any arguments.

### Installation
An simple installation script script has been provided (still working on it) to download and install `LepMap3`, `LepMapp3r`, and `LepMapp3rQA` onto a system in the correct `$PATH`.

```bash
git clone https://github.com/pdimens/LepMapp3r.git
cd LepMapp3r && chmod +x LM3.install.sh
./LM3.install.sh
```

## LepMapp3r workflow
`ParentCall2` -> `SeparateChromosomes2` -> `JoinSingles2ALL` -> `OrderMarkers2` -> Trimming Ends -> `OrderMarkers2`

By default, if you run LepMapp3r without arguments it will start at `ParentCall2` and work through until the end. Ordering markers may take a while, so it is recommended to run LepMapp3r in a `screen` environment. LepMapp3r creates several folders during operation, and for safety, it is made to identify if these folders exist so as to skip that step and not overwrite data. 
Running `LepMapp3r` with any arguments e.g. `help` `-h` `--help` `potato` `axolotl` will invoke the help text.

### Be aware
LepMap3 is a **very** comprehensive software, and LepMapp3r cannot (will not?) incorporate all the features and nuances within the various modules. Your study is unique, so you are encouraged to fork this repo and adapt LepMapp3r to your needs! All of the code in LepMapp3r is written cleanly in human-readable bash, so give it a shot and adapt it to your workflow. 

## Citation
Pasi Rastas, Lep-MAP3: robust linkage mapping even for low-coverage whole genome sequencing data, Bioinformatics, Volume 33, Issue 23, 01 December 2017, Pages 3726–3732,https://doi.org/10.1093/bioinformatics/btx494

### As of yet incomplete. 

To do:
 - include basic installation script to install into $PATH
 - add reordering (incomplete)
