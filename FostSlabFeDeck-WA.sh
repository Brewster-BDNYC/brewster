#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6G 
#SBATCH --job-name=W1049A_FostSlabFeDeck-WA
#SBATCH --output=outputs/W1049A_FostSlabFeDeck-WA.o%j
#SBATCH --error=outputs/W1049A_FostSlabFeDeck-WA.e%j
#SBATCH --partition=standard
#SBATCH --time=00:30:00
#SBATCH --mail-user=cnavarrete@amnh.org
#SBATCH --mail-type=ALL
#SBATCH --export=NONE

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/3940/brewster_global/brewster_v1.1/brewster/"
vpkg_require my-sci-app/20201102

#UD_QUIET_JOB_SETUP=YES                                                          	\
#export UD_JOB_EXIT_FN_SIGNALS="SIGTERM EXIT"                                               	\
#UD_PREFER_MEM_PER_CPU=YES                                                         	\
#UD_REQUIRE_MEM_PER_CPU=YES                                                        	\
#UD_MPI_RANK_DISTRIB_BY=CORE                                                        	\
#UD_DISABLE_IB_INTERFACES=YES                                                       	\
# Do standard Open MPI environment setup (networks, etc.)                                         	\

. /opt/shared/slurm/templates/libexec/openmpi.sh
cd /home/3940/brewster_global/brewster_v1.1/brewster/

#export TMPDIR="/lustre/xg-phy240309/users/3941/brewster_extra/tmpdir/$SLURM_JOBID.tmp"
#mkdir -p $TMPDIR

${UD_MPIRUN} python "/home/3940/brewster_global/brewster_v1.1/brewster/FostSlabFeDeck-WA.py" > ../log_files/W1049A_FostSlabFeDeck-WA.log

#rm -r *core.*

mpi_rc=$?

