#!/bin/bash -l
#SBATCH --nodes=2
#SBATCH --ntasks=128
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=5G 
#SBATCH --job-name=WISE1049B_NC_pf7
#SBATCH --output=WISE1049B_NC_pf7_check.o%j
#SBATCH --error=WISE1049B_NC_pf7_check.e%j
#SBATCH --partition=standard
#SBATCH --time=60:00:00
#SBATCH --mail-user=jramirez@amnh.org
#SBATCH --mail-type=ALL
#SBATCH --export=NONE
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/3941/brewster_global/brewster/"
vpkg_require my-sci-app/20250130
#UD_QUIET_JOB_SETUP=YES                                                          	\
#export UD_JOB_EXIT_FN_SIGNALS="SIGTERM EXIT"                                               	\
#UD_PREFER_MEM_PER_CPU=YES                                                         	\
#UD_REQUIRE_MEM_PER_CPU=YES                                                        	\
#UD_MPI_RANK_DISTRIB_BY=CORE                                                        	\
#UD_DISABLE_IB_INTERFACES=YES                                                       	\
# Do standard Open MPI environment setup (networks, etc.)                                         	\
. /opt/shared/slurm/templates/libexec/openmpi.sh
cd /home/3941/brewster_global/brewster/
#export TMPDIR="/lustre/xg-phy240309/users/3941/brewster_extra/tmpdir/$SLURM_JOBID.tmp"
#mkdir -p $TMPDIR
${UD_MPIRUN} python "/home/3941/brewster_global/brewster/WISE1049B_NC_pf7.py" > /home/3941/brewster_global/brewster/log_files/WISE1049B_NC_pf7.log
#rm -r *core.*
mpi_rc=$?

