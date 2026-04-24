#!/bin/bash -l 

#SBATCH -A uppmax2026-1-61 
#SBATCH -p pelle 
#SBATCH -c 2 
#SBATCH -t 01:00:00 
#SBATCH -J 01_FastQC_Illumina_1
#SBATCH --mail-type=ALL 
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out 

# Load modules
module load FastQC/0.12.1-Java-17
 
# Raw Data
Illumina_1=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz

Illumina_2=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz

# Output
output=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing

# Commands
fastqc $Illumina_1 $Illumina_2 -o $output
