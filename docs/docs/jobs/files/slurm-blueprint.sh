#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=example

# Define, how many nodes you need. Here, we ask for 1 node.
#SBATCH --nodes=1
# You can further define the number of tasks with --ntasks-per-*
# See "man sbatch" for details. e.g. --ntasks=4 will ask for 4 cpus.

# Define, how long the job will run in real time. This is a hard cap meaning
# that if the job runs longer than what is written here, it will be
# force-stopped by the server. If you make the expected time too long, it will
# take longer for the job to start. Here, we say the job will take 5 minutes.
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# Define the partition on which the job shall run, e.g. long
#SBATCH --partition long

# How much memory you need.
# --mem will define memory per node and
# --mem-per-cpu will define memory per CPU/core. Choose one of those.
#SBATCH --mem-per-cpu=1500MB
##SBATCH --mem=5GB    # this one is not in effect, due to the double hash

#SBATCH --output="stdout.txt" # standard output
#SBATCH --error="stderr.txt"  # standard error <-- This is our last SBATCH directive

# You may not place any commands before the last SBATCH directive

# Define and create a unique scratch directory for this job
SCRATCH_DIRECTORY=/scratch1/${USER}/${SLURM_JOBID}
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

# You can copy everything you need to the scratch directory
# ${SLURM_SUBMIT_DIR} points to the path where this script was submitted from
cp ${SLURM_SUBMIT_DIR}/myfile.txt ${SCRATCH_DIRECTORY}

ml purge # it's a good practice to first unload all modules
ml your_modules # then load what module you need, if any

# This is where the actual work is done.
./my_code >& out.txt

# After the job is done we copy our output back to $SLURM_SUBMIT_DIR
cp ${SCRATCH_DIRECTORY}/my_output ${SLURM_SUBMIT_DIR}


# After everything is saved to your home directory, it's recommended to delete the work directory to
# save space on /scratch1
cd ${SLURM_SUBMIT_DIR}
rm -rf ${SCRATCH_DIRECTORY}

# Finish the script
exit 0
