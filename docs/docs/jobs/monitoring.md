# Monitoring your jobs

## SLURM commands

To monitor your jobs, you can use of of those commands. For details run them
with the `-`-help option:

``scontrol show jobid <jobid>`` lists detailed information for a job (useful for troubleshooting).
``scontrol show nodes`` lists nodes and their properties.

``sacct -j <jobid> --format=JobID,JobName,MaxRSS,Elapsed`` will give you
statistics on completed jobs by jobID. Once your job has
completed, you can get additional information that was not available during
the run. This includes run time, memory used, etc.

## CPU load and memory consumption of your job

Scicluster has only limited resources and usually a high demand.
Therefore using the available resources as efficient as possible is paramount to have short queueing times
and getting most out of your quota.


## Understanding your job status

When you use the
``squeue`` command, you will see that the queue is divided in 3 parts: Active
jobs, Idle jobs, and Blocked jobs.

Active jobs are the jobs that are running at the moment. Idle jobs are next in
line to start running, when the needed resources become available. Each user
can by default have only one job in the Idle Jobs queue.

Blocked jobs are all other jobs. Their state can be *Idle*, *Hold*, or
*Deferred*. *Idle* means that they are waiting to get to the Idle queue. They
will eventually start when the resources become available. The jobs with the
*Hold* state have been put on hold either by the system, or by the user. F.e.
if you have one job in the Idle queue, that is not very important to you, and
it is blocking other, more urgent, jobs from starting, you might want to put
that one job on hold. Jobs on hold will not start until the hold is released.
*Deferred* jobs will not start. In most cases, the job is deferred because it
is asking for a combination of resources that Scicluster can not provide.

Please contact the support staff, if you don't understand why your job has a
hold or deferred state.

