#!/bin/bash -l

##########################
# example for an MPI job #
##########################

#SBATCH --job-name=example

# 20 MPI tasks in total
#SBATCH --ntasks=20

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

# we execute the job and time it
time mpirun -np $SLURM_NTASKS ./my_binary.x &> my_output

# happy end
exit 0
