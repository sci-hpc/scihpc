#!/bin/bash -l

#######################################
# example for a hybrid MPI OpenMP job #
#######################################

#SBATCH --job-name=example

# we ask for 2 MPI tasks with 18 cores each on 1 node
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=18

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# 500MB memory per core
#SBATCH --mem-per-cpu=500MB

# determine the partition
#SBATCH --partition=para

#SBATCH --output="stdout_%j"
#SBATCH --error="stderr_%j"

# you may not place bash commands before the last SBATCH directive

# define and create a unique shared directory
SHARED_DIRECTORY=/work8/${USER}/${SLURM_JOBID} # please note it's vital to use /work8 for shared drectory
mkdir -p ${SHARED_DIRECTORY}
cd ${SHARED_DIRECTORY}

# unload all modules then load your OMP modules
ml purge
ml OpenMPI

# we set OMP_NUM_THREADS to the number cpu cores per MPI task
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# we execute the job and time it
time mpirun -np $SLURM_NTASKS ./my_binary.x &> my_output

# happy end
exit 0
