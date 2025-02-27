#!/bin/bash -l
#############################
# example for a GPU job #
#############################

#SBATCH --job-name=example

# we can ask for 1 p4000, 1 k80 or 2 k80 gpus.
#SBATCH --gpus=k80:2

#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=32G
#SBATCH --time=0-00:05:00
#SBATCH --partition=para

#SBATCH --output="k80.out"
#SBATCH --error="k80.err"

# you may not place bash commands before the last SBATCH directive

ml purge # it's a good practice to first unload all modules
ml CUDA  # then load what module you need

##Compile the cuda code using the nvcc compiler
nvcc -o stats.exe stats.cu

## Run the code
./stats.exe
rm ./stats.exe