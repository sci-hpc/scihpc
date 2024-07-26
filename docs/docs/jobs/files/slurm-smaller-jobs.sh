#!/bin/bash

#SBATCH --job-name=example
#SBATCH --ntasks=8
#SBATCH --time=0-00:05:00
#SBATCH --mem-per-cpu=100MB
#SBATCH --output="stdout.txt"
#SBATCH --error="stderr.txt"

# determine the partition
#SBATCH --partition=para

cd ${SLURM_SUBMIT_DIR}

# first set of parallel runs

ml purge
ml OpenMPI

mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &

wait

# here a post-processing step
# ...

# another set of parallel runs
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &

wait

exit 0
