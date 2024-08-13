# Python

When you first log in to the cluster, the system python is available but this is almost always not what you want. They are installed in `/usr/bin` paths and we use them for administration purposes.

We have also installed different python versions each compiled by different gcc compilers. Currently they are:

```
Python/2.7.15-fosscuda-2018b
Python/2.7.18-GCCcore-9.3.0
Python/2.7.18-GCCcore-10.2.0
Python/2.7.18-GCCcore-10.3.0-bare
Python/3.8.6-GCCcore-10.2.0
Python/3.9.5-GCCcore-10.3.0-bare
Python/3.9.5-GCCcore-10.3.0
Python/3.11.3-GCCcore-12.3.0
```

## Anaconda

We have installed the Anaconda Python distribution as replacement to the system Python. Anaconda provides many additional packages which are ideal for scientific computing.

To use Anaconda, We first remove all the loaded modules

```bash
ml purge
```

Then load the Anaconda3

```bash
ml Anaconda3
```

You can use tab completion to see what versions are available. To see all the pre-installed Anaconda packages and their versions use the `conda list` command:

```
[testuser1@sci ~]$ conda list
# packages in environment at /home/modules/software/Anaconda3/2024.02-1:
#
# Name                    Version                   Build  Channel
_anaconda_depends         2024.02             py311_mkl_1  
_libgcc_mutex             0.1                        main  
_openmp_mutex             5.1                       1_gnu  
abseil-cpp                20211102.0           hd4dd3e8_0  
aiobotocore               2.7.0           py311h06a4308_0  
aiohttp                   3.9.3           py311h5eee18b_0  
aioitertools              0.7.1              pyhd3eb1b0_0  
aiosignal                 1.2.0              pyhd3eb1b0_0  
alabaster                 0.7.12             pyhd3eb1b0_0  
altair                    5.0.1           py311h06a4308_0  
anaconda-anon-usage       0.4.3           py311hfc0e8ea_100  
anaconda-catalogs         0.2.0           py311h06a4308_0  
anaconda-client           1.12.3          py311h06a4308_0  
anaconda-cloud-auth       0.1.4           py311h06a4308_0  
anaconda-navigator        2.5.2           py311h06a4308_0  
anaconda-project          0.11.1          py311h06a4308_0  
anyio                     4.2.0           py311h06a4308_0  
aom                       3.6.0                h6a678d5_0  
appdirs                   1.4.4              pyhd3eb1b0_0  
archspec                  0.2.1              pyhd3eb1b0_0  
argon2-cffi               21.3.0             pyhd3eb1b0_0  
argon2-cffi-bindings      21.2.0          py311h5eee18b_0  
arrow                     1.2.3           py311h06a4308_1  
arrow-cpp                 14.0.2               h374c478_1  
astroid                   2.14.2          py311h06a4308_0  
astropy                   5.3.4           py311hf4808d0_0
...
```

If we run python:

```
[testuser1@sci ~]$ python
Python 3.11.7 (main, Dec 15 2023, 18:12:31) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

The Anaconda Python distribution is system software. This means that you can use any of its packages but you cannot make any modifications to them (such as an upgrade) and you cannot install new ones in their location. You can, however, install whatever packages you want in your home directory in custom environments. The two most popular package managers for installing Python packages are [conda](https://docs.conda.io/en/latest) and pip.

 
Conda enables you to easily install complex packages and software. Creating multiple environments enables you to have installations of the
same software in different versions or incompatible software collections at once. You can easily share a list of the installed packages with
collaborators or colleagues, so they can setup the same environment in a matter of minutes.

Unlike pip, conda serves as both a package and environment manager. It is not limited to a single programming language, supporting packages for Python, R, Fortran, and more. Conda primarily uses the main channel of Anaconda Cloud for installations, but it can also access other channels like bioconda, intel, r, and conda-forge. It always installs pre-compiled binary files, which often offer better performance by utilizing Intel MKL. Below is an example of creating an environment and installing packages in it:

```bash
ml purge
ml Anaconda3/2024.02-1
source $EBROOTANACONDA3/etc/profile.d/conda.sh
conda create --name myenv <package-1> <package-2> ... <package-N>
conda activate myenv
```

!!! warning "Home disk quota"

    Installing python packages can simply make you run out of your home disk quota. So we strongly recommend to move your `.conda` folder to the work directory.

    ```bash
    cd ~
    mkdir -p /work8/$USER/.conda
    ln -s /work8/$USER/.conda .
    ```

As an example let us install the [yt](https://yt-project.org/) package:

```
conda create --name myproject yt
```

After a few seconds, it tell us it want to get and install many packages (~ 76 MB) including `python-3.11.9`. As the default python version of the loaded Anaconda module is `3.11.7` and the python minor version is not important for installing `yt` we decide to explicitly determine python version to reduce downloading packages:

```
conda create --name myproject yt python=3.11.7
```

Now the download size is decreased to ~ 43 MB. To activate and test:

```
conda activate myproject
yt --help
```

!!! note "Install the environment in a specific path"

    If we want to install the conda environment in another directory than our
    home, we can add `--prefix PATH`. This enables multiple users of a project to
    share the conda environment by installing it into their project folder instead
    of the users home

    ```
    conda create --prefix /work8/$USER/envs/myproject yt python=3.11.7
    ```
  

## Daily usage

To load this environment we have to use the following commands either on the
command line (by assigning an interactive job) or in our job script:

```
ml purge
ml Anaconda3
source $EBROOTANACONDA3/etc/profile.d/conda.sh
conda activate myproject
```

Then we can use all software as usual.

To deactivate the current environment:

  conda deactivate

If we need to install additional software or packages,
we can search for it with:

```
conda search SOMESOFTWARE --channel conda-forge
```

and install it with:

```
conda install -n myproject SOMESOFTWARE
```

To see installed packages:

```
conda list
```

To list available environments:

```
conda env list
```

To remove "myproject" environment:

```
conda remove --name myproject --all
```

If the python package we are looking for is not available in conda
we can usually use `pip` from within a conda environment to install additional python packages:

```
pip install package_name
```
See also the [pip](https://pip.pypa.io/en/stable/) docs.


To update a single package with conda:

```
conda update -n myproject package_name
```

or to update all packages:

```
conda update -n myproject --all
```

You can find the original documentation at 
  
## Share your environment

To export a list of all packages/programs installed with conda 
in a certain environment (in this case "myproject"):

```
conda list --explicit --name myproject > package-list.txt
```
  
To setup a new environment (let's call it "newproj") from an exported package list:

```
conda create --name newproj --file package-list.txt
```

For more details, please see [Managing packages](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html) and [Managing environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).

## Using python in interactive jobs

When we want to use python interactively for a time longer than just a short test, we should submit an [interactive](../jobs/interactive.md) job. Before running our code, we should setup the environment as explained above.

## Using jupyter Lab

To use [jupyter](https://jupyter.org/) notebook submit an interactive job and setup your environment, then in a node that is assigned to us (e.g. compute-0-0), we run

```
jupyter lab --no-browser --port=8888
```

This will start jupyter and print some information (including an address where the jupyter is running at)

Then on the frontend node we run

```
ssh -NL 8888:localhost:8888 compute-0-0
```

and in our computer (one that we used to connect to the frontend) run

```
ssh -NL 8888:localhost:8888 your_username@login-node
```

Finally we go to the address where the jupyter is running in our web browser, e.g.

```
http://localhost:8888/?token=14ba92d6b0529c3d748b03e31542f988ee3d10b147b7c3f0
```

## Using python for long time jobs

For longer usage it will be better to submit a batch script. This could be like

```bash
#!/bin/bash
#SBATCH -J jupyter
#SBATCH --partition long
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output="stdout_jup.txt"
#SBATCH --error="stderr_jup.txt"
#SBATCH --mem-per-cpu=1000
#SBATCH --time=7-0:0:0
ulimit -s unlimited
cd $SLURM_SUBMIT_DIR
ml purge
ml Anaconda3
source /home/modules/software/Anaconda3/2020.02/etc/profile.d/conda.sh
conda activate base

python ./your_python_script.py >& out    
```
or for using jupyter, replace the last line with

```
jupyter notebook --no-browser --port=8888 >& out
```

and repeat the ssh tunneling as explained above.