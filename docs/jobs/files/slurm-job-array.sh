#!/bin/bash -l

#####################
# job-array example #
#####################

#SBATCH --job-name=example

# 8 jobs will run in this array at the same time
#SBATCH --array=1-8

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# determine the partition
#SBATCH --partition=short

# 100MB memory per core
#SBATCH --mem-per-cpu=100MB

#SBATCH --output="stdout.txt"
#SBATCH --error="stderr.txt"

# you may not place bash commands before the last SBATCH directive

ml purge # it's a good practice to first unload all modules
ml your_modules # then load what module you need, if any

# define and create a unique scratch directory
SCRATCH_DIRECTORY=/scratch1/${USER}/job-array-example/${SLURM_JOBID}
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

cp ${SLURM_SUBMIT_DIR}/test.py ${SCRATCH_DIRECTORY}

# each job will see a different ${SLURM_ARRAY_TASK_ID}
echo "now processing task id:: " ${SLURM_ARRAY_TASK_ID}

ml purge # unload all modules
ml Anaconda3 # load Anaconda3 module to use python

python test.py > output_${SLURM_ARRAY_TASK_ID}.txt

# after the job is done we copy our output back to $SLURM_SUBMIT_DIR
cp output_${SLURM_ARRAY_TASK_ID}.txt ${SLURM_SUBMIT_DIR}

# we step out of the scratch directory and remove it
cd ${SLURM_SUBMIT_DIR}
rm -rf ${SCRATCH_DIRECTORY}

# happy end
exit 0
