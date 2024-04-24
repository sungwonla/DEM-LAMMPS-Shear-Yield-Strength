# DEM-LAMMPS-Shear-Yield-Strength
DEM simulations in LAMMPS used to assess the impacts of varying material stiffness and cohesion on the collective shear yield strength of granular materials

lamrun.sh - the bash script, change "trial.txt" in the bottom line to the LAMMPS input file
pouring.txt - LAMMPS input file for creating the initial configuration of grains, generates "packing-2000000.restart" file that is read and used as the setup for shearing
shearing.txt - LAMMPS input file that reads the restart file, shears grains with a moving top wall (and periodic boundary conditions), and outputs stresses on moving top wall (normal-z, along direction of shear-x, and perpendicular to both-y) that can be post-processed to show the shear yield stress for the granular material, as well as outputs the z-position (height) of the topmost grain on the moving top wall that can be post-processed to calculate solid packing fraction
normalForcePlotterx.m - MATLAB script that plots the stresses on the moving top wall by reading LAMMPS output files
rvolumepacking.m - MATLAB script that calculates the volume packing fraction by reading LAMMPS output files
