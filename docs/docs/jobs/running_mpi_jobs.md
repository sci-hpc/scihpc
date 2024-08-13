# Running MPI jobs

To run MPI job, you should load OpenMPI module as an e.g.:

```bash
module load OpenMPI
```

You can press tab button twice to see the available versions. See ...

This loads the default OpenMPI module and define the environment variable ``OMPI_MCA_btl=self,vader,tcp``.
. There are also other versions if you need any other. To search for them run ``module spider OpenMPI``. 
   

There are several ways of launching an MPI application within a SLURM
allocation, e.g. ``srun``, ``mpirun``, ``mpiexec``.
Unfortunately, the best way to launch your program depends on the MPI
implementation (and possibly your application), and choosing the wrong command
can severely affect the efficiency of your parallel run.  What we **recommend** is the following:

```bash
mpirun -np $SLURM_NTASKS your_code &> log.out
```
