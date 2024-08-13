# Parallel Computing

A very simplified description of parallel computing which is sufficient for us now is to break parallel workloads into these categories:

- Fine grained:
Each process does a lot of communication with the other processes. Think of a model which uses a grid of cells, and at each iteration all the cells exchange information with their neighboring cells. These types of applications are typically limited by inter-process communication bandwidth.

- Coarse grained:
Each process occasionally communicates with other processes. A model which has independent units that occasionally exchange information globally would fall into this category. These types of processes are typically CPU or I/O limited. 

- Embarrassingly Parallel:
Processes do not communicate with each other and run completely independently, possibly including a step to merge results when the last process finishes. These types of processes are typically CPU or I/O limited.

When a task is broken up to be parallelized, the subtasks can be ran in more than one way. Models we care about for this are: MPI (distributed memory), OpenMP/CUDA (shared memory) and independent tasks.

