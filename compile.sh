#!/bin/bash

SOURCE_FILES="\
main.cpp \
DataStructs.cpp \
rk4.cpp \
FluxFunctions.cpp \
RHSoperator.cpp"

# Compilación de la aplicación double.p
mpic++ -g -O3 -pg -D_DOUBLE_ $SOURCE_FILES -Iincludes -o double.p

# Compilación de la aplicación single.p
mpic++ -g -O3 -pg $SOURCE_FILES -Iincludes -o single.p

# Ejecución de la aplicación double.p
echo "Running double.p with MPI"
mpirun -np <num_procesos> ./double.p <num_points> <wave_number>

# Ejecución de la aplicación single.p
echo "Running single.p with MPI"
mpirun -np <num_procesos> ./single.p <num_points> <wave_number>
