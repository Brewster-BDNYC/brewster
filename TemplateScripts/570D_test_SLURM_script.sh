#!/bin/bash
#SBATCH -J G570D_check_full
#SBATCH --output=G570_check.o%j
#SBATCH --error=G570_check.e%j
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=48
#SBATCH --time=37:00:00
#SBATCH --mail-user=your_email@example.com
#SBATCH --mail-type=ALL

source ~/.bashrc
module load openmpi3/3.1.4

declare -xr WDIR="path/to/your/working/directory" 

declare PATH=${PATH}:${WDIR}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${WDIR}:~/

# Active python 3 environment
source activate retrievals #activate YOUR conda environment

time_start=`date '+%T%t%d_%h_06'`
  
echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $SLURM_JOB_NODELIST
echo ------------------------------------------------------
echo SBATCH: sbatch is running on $SLURM_SUBMIT_HOST
echo SBATCH: originating queue is $SLURM_SUBMIT_PARTITION
echo SBATCH: executing queue is $SLURM_JOB_PARTITION
echo SBATCH: working directory is $SLURM_SUBMIT_DIR
echo SBATCH: job identifier is $SLURM_JOBID
echo SBATCH: job name is $SLURM_JOB_NAME
echo SBATCH: node file is $SLURM_JOB_NODELIST
echo SBATCH: current home directory is $SLURM_SUBMIT_HOME
echo SBATCH: PATH = $SLURM_SUBMIT_PATH
echo ------------------------------------------------------


cd ${WDIR}


mpirun python G570D_test.py > path/to/your/logs/G570D_test.log 2>&1

time_end=`date '+%T%t%d_%h_06'`
echo Started at: $time_start
echo Ended at: $time_end
echo ------------------------------------------------------
echo Job ends

