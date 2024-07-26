# Job script examples

## General blueprint for a jobscript

You can save the following example to a file (e.g. run.sh) on scicluster. Comment
the two ``cp`` commands that are just for illustratory purpose (lines 46 and 55)
and change the SBATCH directives where applicable. You can then run the script
by typing:

```
sbatch run.sh
```

Please note that all values that you define with SBATCH directives are hard
values. When you, for example, ask for 6000 MB of memory (``--mem=6000MB``) and
your job uses more than that, the job will be automatically killed by the manager.

Important: Please note that the standard out and err streams from the code are redirected to a file despite the specification of standard out and err for the job.
This is very important unless stdout/stderr from your code is less than a few MB.
The job output is spooled locally on the execution node and copied to the user working directory only after the job completes.
Since the spool size is small (a few GB) you can overfill the disk and crash all the jobs on the node. With redirection approach you avoid this and in addition you can monitor out.txt during runtime.

```bash
--8<-- "docs/docs/jobs/files/slurm-blueprint.sh"
```

## Job arrays

### Running many sequential jobs in parallel using job arrays

In this example we wish to run many similar sequential jobs in parallel using job arrays.
We take Python as an example but this does not matter for the job arrays:

```python
--8<-- "docs/docs/jobs/files/test.py"
```

Save this to a file called "test.py" and try it out: `python test.py`

```
start at 15:23:48
sleep for 10 seconds ...
stop at 15:23:58
```

Good. Now we would like to run this script 8 times at the same time.
For this we use the following script:

```bash
--8<-- "docs/docs/jobs/files/slurm-job-array.sh"
```

Submit the script and after a short while you should see 8 output files
in your submit directory:

```
ls -l output*.txt

-rw------- 1 user user 60 Oct 14 14:44 output_1.txt
-rw------- 1 user user 60 Oct 14 14:44 output_10.txt
-rw------- 1 user user 60 Oct 14 14:44 output_11.txt
-rw------- 1 user user 60 Oct 14 14:44 output_12.txt
-rw------- 1 user user 60 Oct 14 14:44 output_13.txt
-rw------- 1 user user 60 Oct 14 14:44 output_14.txt
-rw------- 1 user user 60 Oct 14 14:44 output_15.txt
-rw------- 1 user user 60 Oct 14 14:44 output_16.txt
```

### Packaging smaller parallel jobs into one large parallel job

There are several ways to package smaller parallel jobs into one large parallel
job. The preferred way is to use Job Arrays. Browse the web for many examples
on how to do it. Here we want to present a more pedestrian alternative which
can give a lot of flexibility.

In this example we imagine that we wish to run 2 MPI jobs at the same time,
each using 4 tasks, thus totalling to 8 tasks.  Once they finish, we wish to
do a post-processing step and then resubmit another set of 2 jobs with 4 tasks
each:

```bash
--8<-- "docs/docs/jobs/files/slurm-smaller-jobs.sh"
```


The ``wait`` commands are important here - the run script will only continue
once all commands started with ``&`` have completed.

## OpenMP and MPI

You can copy and paste the examples given here to a file (e.g. run.sh) and start it with:

```
sbatch run.sh
```


### Example for an OpenMP job

```bash
--8<-- "docs/docs/jobs/files/slurm-OMP.sh"
```


### Example for an MPI job

```bash
--8<-- "docs/docs/jobs/files/slurm-MPI.sh"
```


### Example for a hybrid MPI/OpenMP job

```bash
--8<-- "docs/docs/jobs/files/slurm-MPI-OMP.sh"
```


If you want to start more than one MPI rank per node you can
use ``--ntasks-per-node`` in combination with ``--nodes``:

```bash
#SBATCH --nodes=2 --ntasks-per-node=2 --cpus-per-task=8
```

This will start 2 MPI tasks each on 2 nodes, where each task can use up to 8 threads.

### Example for a GPU job

```bash
--8<-- "docs/docs/jobs/files/slurm-gpu.sh"
```
## General tips

### Example on how to allocate entire memory on one node

```bash
--8<-- "docs/docs/jobs/files/slurm-big-memory.sh"
```


### How to recover files before a job times out

Possibly you would like to clean up the work directory or recover
files for restart in case a job times out. In this example we ask Slurm
to send a signal to our script 120 seconds before it times out to give
us a chance to perform clean-up actions.

```bash
--8<-- "docs/docs/jobs/files/slurm-timeout-cleanup.sh"
```

