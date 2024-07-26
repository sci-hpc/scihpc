

Running MPI jobs
================

To run MPI job, you should load OpenMPI module as an e.g.::

   $ module load OpenMPI/3.1.1-GCC-7.3.0-2.30

This load, OpenMPI version 3.1.1 which is compiled with gcc 7.3.0-2.30 and define the environment variable ``OMPI_MCA_btl=self,vader,tcp``.
. There are also other versions if you need any other. To search for them run ``module spider OpenMPI``. 
   

There are several ways of launching an MPI application within a SLURM
allocation, e.g. ``srun``, ``mpirun``, ``mpiexec``.
Unfortunately, the best way to launch your program depends on the MPI
implementation (and possibly your application), and choosing the wrong command
can severly affect the efficiency of your parallel run. Our recommendation is
the following::

    mpirun -np $SLURM_NTASKS your_code &> log.out



.. With OpenMPI, ``mpirun`` seems to be working correctly. Also, it seems that
.. ``srun`` fails to launch your application in parallel, so here we recommend
.. using ``mpirun``::

    $ mpirun ./my_application

.. NOTE: If you're running on the ``multinode`` partition you automatically
.. get the ``--exclusive`` flag, e.i. you get allocated (and charged for) **full**
.. nodes, even if you explicitly ask for less resources per node. This is not the
.. case for the ``normal`` partition.
