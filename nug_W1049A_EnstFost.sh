#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=64                # 2 nodes * 32 ppn
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=1
#SBATCH --job-name=W1049A_EF_MCNUGGETS
#SBATCH --output=W_EF_SLAB_NUG.o%j
#SBATCH --error=W_EF_SLAB_NUG.e%j
#SBATCH --partition=standard
#SBATCH --mem-per-cpu=5G
#SBATCH --time=12:00:00
#SBATCH --mail-user=cnavarrete@amnh.org
#SBATCH --mail-type=ALL
#SBATCH --export=NONE

# Load environment and modules
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/3940/brewster_global/brewster/"
vpkg_require my-sci-app/20201102

# OpenMPI setup (assuming you use OpenMPI)
. /opt/shared/slurm/templates/libexec/openmpi.sh

# Set working dir
cd /home/3940/brewster_global/brewster/
export TMPDIR="/lustre/xg-phy240309/users/3940/brewster_global/brewster/tmpdir/$SLURM_JOBID.tmp"
mkdir -p $TMPDIR

# Run Python script with MPI
${UD_MPIRUN} python "/home/3940/brewster_global/brewster/mcnuggets_W1049A_EnstFost.py" > ../log_files/W1049A_EFSlab_nug.log
