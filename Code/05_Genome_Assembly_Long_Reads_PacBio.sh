#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 05:00:00
#SBATCH -J 05_Genome_Assembly_Long_Reads_PacBio_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load SAMtools/1.22.1-GCC-13.3.0
module load canu/2.3-GCCcore-13.3.0-Java-17

# PacBio reads
Rawdata=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio/*

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output

# Run Canu
canu \
-p efaecium_PacBio_Assembly \
-d $Output \
genomeSize=3m \
-nanopore $Rawdata \
useGrid=false \
maxThreads=4
