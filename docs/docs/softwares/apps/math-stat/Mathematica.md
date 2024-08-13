# Mathematica

Wolfram Mathematica is a modern technical computing system spanning most areas of technical computing — including neural networks, machine learning, image processing, geometry, data science, visualizations, and others. The system is used in many technical, scientific, engineering, mathematical and computing fields.

* [Homepage](https://www.wolfram.com/mathematica/)
* [Documentation](https://reference.wolfram.com/language/?source=nav)


## Mathematica on Scicluster

Interactive Session
-------------------

Request an Interactive Job with X11 forwarding
++++++++++++++++++++++++++++++++++++++++++++++

Login to the frontend
::

  ssh -Y username@login-node

To run Mathematica interactively, you need to request an interactive session on a compute node. See :doc:`/jobs/interactive`.

After requesting an interactive job for example on `compute-0-3` node, run in **another** terminal
::

  ssh -Y compute-0-3

Usage
+++++

To launch Mathematica in your above mentioned terminal, you will first need to make sure you have the correct module loaded. You can search for all available Mathematica versions.
::

  module avail Mathematica

Load the appropriate module file. For example, to run version 12.3.
::

  module load Mathematica/12.3.0

Once you have the appropriate module loaded in an interactive job, start Mathematica. The `&` will put the program in the background so you can continue to use your terminal session.
::

  Mathematica &

Batch mode
----------

Serial job
++++++++++

Consider this simple one line script (hello_world.nb)
::

    Print["Hello, World."]

Below is a Slurm script (job.slurm) appropriate for a serial Mathematica job:
::

    #!/bin/bash
    #SBATCH --job-name=myjob         # create a short name for your job
    #SBATCH --nodes=1                # node count
    #SBATCH --ntasks=1               # total number of tasks across all nodes
    #SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
    #SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G per cpu-core is default)
    #SBATCH --time=00:01:00          # total run time limit (HH:MM:SS)

    module purge
    module load Mathematica/12.3.0

    math -run < hello_world.nb &> output

Submit the job with:
::

    sbatch job.slurm

Parallel job
++++++++++++

Consider this simple parallel Mathematica script (simple_par.nb):
::

    Print[ParallelEvaluate[$KernelID]]
    Print[ParallelEvaluate[$ProcessID]]

which can be submitted as a parallel job, using this script (job.slurm):
::

    #!/bin/bash
    #SBATCH --job-name=myjob         # create a short name for your job
    #SBATCH --nodes=1                # node count
    #SBATCH --ntasks=1               # total number of tasks across all nodes
    #SBATCH --cpus-per-task=4        # cpu-cores per task (>1 if multi-threaded tasks)
    #SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G per cpu-core is default)
    #SBATCH --time=00:01:00          # total run time limit (HH:MM:SS)

    module purge
    module load Mathematica/12.3.0

    math -run < simple_par.nb &> output

You can see :ref:`job_script_examples` for more advanced examples.
