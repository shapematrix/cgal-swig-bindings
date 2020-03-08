[![Build Status](https://travis-ci.org/CGAL/cgal-swig-bindings.svg?branch=master)](https://travis-ci.org/CGAL/cgal-swig-bindings)

# cgal-bindings adapted for Python 3

For general information regarding SWIG CGAL bindings, please refer to the [wiki](https://github.com/CGAL/cgal-swig-bindings/wiki). Here we describe additional steps needed to generate the **Python 3** bindings after cloning this repository to your local Ubuntu or Mac system. This information pertains to Ubuntu 18.04 and Mac OS with all the latest updates as of the end of February, 2020. Is is assumed that CGAL 4.x or 5.x is already installed on your system.

## Python 3 and packages
Typically both Ubuntu and Mac come with Python 3 pre-installed. As of now, there was Python 3 version 3.6.9 found on Ubuntu and version 3.7 on Mac OS. The steps listed below are only needed if corresponding packages are not found on your system. 

For **SWIG** (see below) to operate properly, one also needs to install:
1. *pip*  for Python 3: `sudo apt install python3-pip` (Ubuntu)
2. *numpy* package for Python: `sudo pip3 install numpy`. One also needs to install additional *numpy* files manually (see below) 
3. Python 3 development tools: `sudo apt install python3-dev 2to3` (Ubuntu)

*NOTE*. The last item might be optional - need to test that.

### Installing additional SWIG-related *numpy* files
Standard *numpy* installation does not include optional files for generating SWIG wrappers. To install those, do the following:
1. Check the exact version of the *numpy* package installed (we currently have *numpy v.1.18.1* on both Mac and Ubuntu)
2. Download zip archive for this version from the official *numpy* [repository](https://github.com/numpy/numpy/releases)
3. Locate your *numpy* installation. Examples are `/usr/local/lib/python3.6/dist-packages/numpy` on Ubuntu system, and `/Library/Python/3.7/site-packages/numpy` on Mac.
4. Under the *numpy* installation folder, create `tools` subfolder.
5. Unzip the numpy source archive, locate the `tools` folder and copy the whole `swig` sub-folder from there to `<your-numpy-folder>/tools/`

## Installing SWIG
SWIG is installed in a standard way, depending on the system used:
```
sudo apt install swig   # Ubuntu
brew install swig       # Mac
```
Currently, SWIG version 3.x was installed in both cases

## Building the bindings
**IMPORTANT: All changes related to Python 3 are made in the `python3` branch. This branch (not the `master`!) should be checked out locally.**

To build the bindings on the local system, do the following:
- Create the build folder (we are using the name `build3` for it) at the same level as this _README.md_ file: `mkdir build3`
- In your system's CGAL installation, find the folder containing `CGALConfig.cmake` file. Examples: `/usr/lib/x86_64-linux-gnu/cmake/CGAL` (Ubuntu); `/usr/local/lib/cmake/CGAL` (Mac) 
- From the `build3` folder, execute command

`cmake -DCGAL_DIR=<the-above-folder> -DBUILD_PYTHON=ON -DBUILD_JAVA=OFF -S ../`, 

for example

`cmake -D=/usr/local/lib/cmake/CGAL -DBUILD_PYTHON=ON -DBUILD_JAVA=OFF -S ../` (on Mac).

A set of files and folders will be generated: `build-python  CMakeCache.txt  CMakeFiles  cmake_install.cmake  CTestTestfile.cmake  lib  Makefile  SWIG_CGAL`
- Staying in the `build3` folder, run the `make` command. It may take around 10 minutes to build all the targets, with some warnings generated.

_NOTE_. **For MAC only**, it was necessary to exclude 2 packages: **`interpolation`** and **`Convex_hull_2`** from compilation targets because of mysterios errors about certain iterators not being forward iterators. This was done by adding conditional if(APPLE) in the `CMakeLists.txt` file at the main level of the repository.

After the build is completed, one also needs to set Python path environment variable in the terminal shell, by adding
the following command to `.bashrc` (Ubuntu) or `.bash_profile` (Mac):
```
export PYTHONPATH=<...>/cgal-swig-bindings/build3/build-python
```

With all the steps above completed, all Python examples found in the `examples` folder except `test_polyline_simplification_2.py` should run without errors using `python3 <filename>` command.




