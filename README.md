# Brewster
A spectral inversion code for retrieval analysis of emission spectra from brown dwarfs and giant planets.

## What's needed to run the code:
- Everything in this repository
- Atmospheric Models
- Line lists 
- Clouds (.mieff files) (This must be at the same level as the brewster directory)
- gFortran compiler (https://gcc.gnu.org/wiki/GFortranBinaries or https://hpc.sourceforge.net)
 
 The Atmospheric Models can live anywhere on your machine.

## Current Installation Process for Brewster
1. If you do not have a fortran compiler on your machine, get the proper version of the gfortran compiler from https://gcc.gnu.org/wiki/GFortranBinaries or https://hpc.sourceforge.net.
2. Git clone or fork the directory and place wherever your code lives. (If you plan to make any changes to the code you might like to incorporate into the master branch via a pull request, you should probably fork it.)
3. To keep various package versions clean and organized, you should create a Python 3 environment, ideally Python 3.7, as that is the version that will be needed to run the code on a cluster. (See list of packages needed in requirements.txt)
4. You will need to get access to the Linelist and Clouds files that are shared via Dropbox. Place the Clouds and Linelists folders separately at the same level as the Brewster code. i.e: 
```bash
|--Folder_Where_all_your_code_lives
   |-- Brewster
   |-- Clouds
   |-- Linelists
 ```
5. Build the code by running ``` ./build``` in the terminal in the Brewster directory. If you get an error or this is not a fresh build, run make clean before rebuilding the code. This will create ciamod and forwardmodel (which show up as missing imports in brewster.py and testkit.py), as well as various .o, .mod, and .so files.
6. To test that everything is properly installed, run the check_brewster.py file, by typing ```python check_brewster.py``` in the terminal making sure you are in the brewster working directory.

## Notes for BDNYC from Carolina Navarrete
This version of Brewster is forked from Brewster V1, with the latest updates being constantly integrated. Template scripts have been modified to fit 1. our team's use of DARWIN (Find documentation here: https://docs.hpc.udel.edu/abstract/darwin/darwin) and 2. the type of retrievals our team is focused on running. For template scripts for the WISE1049AB project reference the branch ```WISE1049AB``` using ```git switch WISE1049AB```

Please fork from this repository to make your own local changes and then open a pull request if you would like to integrate it into the ```master``` branch within Brewster BDNYC.

