#!/bin/bash -l

###################################################
# Example for a job that consumes a lot of memory #
###################################################

#SBATCH --job-name=example

# we ask for 1 node
#SBATCH --nodes=1

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# determine the partition, e.g. long
#SBATCH --partition=long 

# total memory for this job
# this is a hard limit
# note that if you ask for more than one CPU has, your account gets
# charged for the other (idle) CPUs as well
#SBATCH --mem=16000MB

#SBATCH --output="stdout.txt"
#SBATCH --error="stderr.txt"

# you may not place bash commands before the last SBATCH directive

ml purge # it's a good practice to first unload all modules
ml your_modules # then load what module you need, if any

SCRATCH_DIRECTORY=/scratch1/${USER}/example/${SLURM_JOBID}
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

# we copy everything we need to the scratch directory
# ${SLURM_SUBMIT_DIR} points to the path where this script was submitted from
cp ${SLURM_SUBMIT_DIR}/my_binary.x ${SCRATCH_DIRECTORY}

# we execute the job and time it
time ./my_binary.x > my_output

# after the job is done we copy our output back to $SLURM_SUBMIT_DIR
cp ${SCRATCH_DIRECTORY}/my_output ${SLURM_SUBMIT_DIR}

# we step out of the scratch directory and remove it
cd ${SLURM_SUBMIT_DIR}
rm -rf ${SCRATCH_DIRECTORY}

# happy end
exit 0
