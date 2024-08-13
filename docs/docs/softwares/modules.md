# Software Module Scheme

Since a HPC cluster is shared among many users, and also holds a significant size in contrast to most desktop computers, the amount of installed software spans many applications in many different versions. It is not possible (nor desirable) to use them all at the same time, since different versions of the same application may conflict with each other. Therefore, it is practical to provide the production environment, outside of the application itself. This is done using a set of instructions and variable settings that are specific for the given application called an *application module*. This also simplifies control of which application versions are available in a specific session.


The main command for using this system is the *module* command. You can find a
list of all its options by typing:

```bash
module --help
```

## Which modules are currently loaded?

To see the modules currently active in your session, use the
command:

```bash
module list
```

 
## Which modules are available?

In order to see a complete list of available modules, issue the
command:

```bash
module av
```

## How to load a module

In order to make, for instance, the openmpi (default version) available, issue the command::

```bash
module load OpenMPI
```

This will load OpenMPI/4.1.1-GCC-10.3.0 and its dependencies. 
 

## How to unload a module

```bash
module unload OpenMPI
```

## Search in available modules

To search for ``GGG`` modules as an example:

```bash
module spider gcc
```

Note the `spider` argument is case-insensitive.

!!! tip "The `ml` alias"

    Module system provides different commands for working with installed softwares/libraries. Please note we can use the `ml` alias with slightly different syntax, for rapid typing.

!!! tip "Module names auto-completion"

    The `module` command supports auto-completion, so you can just start typing the name of a module, and press Tab to let the shell automatically complete the module name and/or version.

These commands and more can be summarized as:

| Module command | Short version | Description    |
| --------------- | -------------- | -------------- |
| `module avail` | `ml av` | List available software|
| `module load OpenBLAS` | `ml OpenBLAS` | Load a module to use the associated software |
| `module load GCC/12.3.0` | `ml GCC/12.3.0` | Load specific version of a module |
| `module unload Siesta` | `ml -Siesta` | Unload a module |
| `module spider fftw` | `ml spider fftw` | Search for particular library/software (here `FFTW`). Search is done case-insensitively.|
| `module keyword lapack` | `ml key lapack` | Search for `lapack` in module names and descriptions|
| `module whatis ScaLAPACK` | `ml whatis ScaLAPACK` | Display information about the `ScaLAPACK` module |
| `module help ScaLAPACK` | `ml help ScaLAPACK` | Display module specific help |
| `module purge` | `ml purge` | Remove all modules
| `module save foo` | `ml save foo` | Save the state of all loaded modules in a collection named `foo` |
| `module restore foo` | `ml restore foo` | Restore the state of saved modules from the `foo` collection |
