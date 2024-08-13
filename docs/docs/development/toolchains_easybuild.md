Toolchains and EasyBuild
========================

We use a build and installation framework called [EasyBuild](https://easybuild.readthedocs.io/en/latest/) that provides module files for the software we build.

Toolchains
----------
When we install applications, we use pre-defined build environments called toolchains. These are modules that include core compilers and libraries (e.g. GCC, OpenMPI, zlib). We do this to keep our build process simpler and also provide the same software built with different compilers and options. The two common toolchains you will interact with are ``foss`` and ``intel`` (currently we don't have ``intel`` in our cluster). Each of these have module versions corresponding to the year they were built. Toolchain name and version information is appended to the name of a module so it is clear what will be compatible. For example GSL/2.3-foss-2018b, the software name is GSL (version 2.3) that is built with the foss toolchain version 2018b. The easiest way to see what software a toolchain includes is to load it and then list loaded modules.

```
ml foss/2018b
```

then

```
ml list
```

which shows the loaded modules

```
Currently Loaded Modules:
1) GCCcore/7.3.0                  6) XZ/5.2.4-GCCcore-7.3.0           11) OpenBLAS/0.3.1-GCC-7.3.0-2.30
2) zlib/1.2.11-GCCcore-7.3.0      7) libxml2/2.9.8-GCCcore-7.3.0      12) gompi/2018b
3) binutils/2.30-GCCcore-7.3.0    8) libpciaccess/0.14-GCCcore-7.3.0  13) FFTW/3.3.8-gompi-2018b
4) GCC/7.3.0-2.30                 9) hwloc/1.11.10-GCCcore-7.3.0      14) ScaLAPACK/2.0.2-gompi-2018b-OpenBLAS-0.3.1
5) numactl/2.0.11-GCCcore-7.3.0  10) OpenMPI/3.1.1-GCC-7.3.0-2.30     15) foss/2018b
```


Toolchain Trees
---------------

One place toolchains can be a little confusing is that there are various levels to a given toolchain depending on how many libraries are included. For example, ``foss/2018b`` is a parent toolchain to ``GCCcore/7.3.0`` since ``foss`` includes ``GCC-7.3.0`` as well as ``OpenMPI-3.1.1``. The following toolchains could be considered as a tree (leaf to root):

#### Base toolchains

``GCCcore`` - GCC compiler

#### Toolchains with MPI

``gompi`` - GCCcore + OpenMPI

#### Full toolchains (also include math libraries)

``foss`` - gompi + OpenBLAS + ScalaPack

