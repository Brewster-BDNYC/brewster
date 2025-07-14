#!/bin/bash -l
#SBATCH --nodes=3
#SBATCH --ntasks=192
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6G 
#SBATCH --job-name=runname
#SBATCH --output=runname_check.o%j
#SBATCH --error=runname_check.e%j
#SBATCH --partition=standard
#SBATCH --time=00:30:00
#SBATCH --mail-user=user@amnh.org
#SBATCH --mail-type=ALL
#SBATCH --export=NONE
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/path/to/brewster/"
vpkg_require my-sci-app/20250130
#UD_QUIET_JOB_SETUP=YES                                                          	\
#export UD_JOB_EXIT_FN_SIGNALS="SIGTERM EXIT"                                               	\
#UD_PREFER_MEM_PER_CPU=YES                                                         	\
#UD_REQUIRE_MEM_PER_CPU=YES                                                        	\
#UD_MPI_RANK_DISTRIB_BY=CORE                                                        	\
#UD_DISABLE_IB_INTERFACES=YES                                                       	\
# Do standard Open MPI environment setup (networks, etc.)                                         	\
. /opt/shared/slurm/templates/libexec/openmpi.sh
cd /path/to/brewster/
#export TMPDIR="/lustre/xg-phy240309/users/3941/brewster_extra/tmpdir/$SLURM_JOBID.tmp"
#mkdir -p $TMPDIR
${UD_MPIRUN} python "/path/to/brewster/runname.py" > ../log_files/runname.log
#rm -r *core.*
mpi_rc=$?

