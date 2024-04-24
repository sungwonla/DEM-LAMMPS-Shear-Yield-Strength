#!/bin/bash
# Request an hour of runtime:
#SBATCH --time=100:00:00 --constraint=intel
#SBATCH --ntasks-per-node=8
#SBATCH --nodes=1
# Use 16 MPI tasks:
# SBATCH -n 16

# Specify a job name:
#SBATCH -J Shear

# Specify an output file
#SBATCH -o MyMPIJob-%j.out
#SBATCH -e MyMPIJob-%j.out

module load ffmpeg
module load hpcx-mpi
module load lammps-mpi/20230208

# Run a command

mpirun -n 2 lmp < trial.txt
