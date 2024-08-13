

Compilers
=========

The default development environment on Scicluster is provided by GNU Compiler Collection. The GNU foundation maintains a number of high quality compilers, including a compiler for C (gcc), C++ (g++), and Fortran (gfortran). The gcc compiler is the foundation underneath all three, and the term "gcc" often means the suite of these three GNU compilers.

Version
-------

Currently we provide  ``GCC-7.3``, ``GCC-9.3``, ``GCC-10.2``, ``GCC-10.3``, `GCC/11.2.0` and `GCC/12.3.0` at the moment, via module system. To enable 7.3 version as e.g., run

```bash
ml GCCcore/7.3.0
```
   
To disable,

```bash
ml unload GCCcore/7.3.0.
```

and to see all,

```bash  
ml spider GCC
```

Fortran compilers
-----------------

GNU fortran compiler can be invoked by: ``gfortran``.


Usage of GNU fortran compiler
---------------------------------

For plain Fortran codes (all Fortran standards) the general form
for usage of the gnu fortran compiler is as follows:

```bash
gfortran [options] file1 [file2 ...]
```

where options represents zero or more compiler options, and fileN is a
Fortran source (.f .for .ftn .f90 .fpp .F .FOR .F90), assembly
(.s .S), object (.o), static library (.a), or an other linkable file.

The form above also applies for Fortran codes parallelized with [OpenMP](http://www.openmp.org/),
[in Wikipedia](https://en.wikipedia.org/wiki/OpenMP); you only have to select the necessary compiler options for OpenMP.

For Fortran codes parallelized with MPI the general form is quite similar:

```bash
mpif90 [options] file1 [file2 ...]
```

The wrapper mpif90 is using the gfortran compiler and invokes all the necessary MPI machinery automatically for you.  Therefore, everything else is the same for compiling MPI codes as for compiling plain Fortran codes.


C and C++ compilers
-------------------

GNU C/C++ compiler can be invoked by: ``gcc`` and ``g++`` correspondingly.


Usage of GNU C/C++ compilers
----------------------------------

For plain C/C++ codes the general form for usage of the GNU gcc/g++ compilers are as follows:

```bash
gcc  [options] file1 [file2 ...]  # C
g++ [options] file1 [file2 ...]  # C++
```

where options represents zero or more compiler options, fileN is a C/C++ source (.C .c .cc .cpp .cxx .c++), assembly (.s .S), object (.o), static library (.a), or other linkable file.

The form above also applies for C/C++ codes parallelized with OpenMP; you only have to select the necessary compiler options for OpenMP.

For C/C++ codes parallelized with MPI the general form is quite similar:

```bash
mpicc [options] file1 [file2 ...]  # C when using OpenMPI
mpic++ [options] file1 [file2 ...]  # C++ when using OpenMPI
```

Both mpicc and mpic++ are using the GNU compilers, they are just wrappers that invoke all the necessary MPI machinery automatically for
you. Therefore, everything else is the same for compiling MPI codes as for compiling plain C/C++ codes.
