#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J 03_FastQC_Illumina_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load FastQC

# Raw Data
Illumina_1=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/02_Trimmoatic_Illumina_output/E745-1.output_forward_paired.fastq.gz

Illumina_2=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/02_Trimmoatic_Illumina_output/E745-1.output_reverse_paired.fastq.gz

# Output
output=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/03_FastQC_Illumina_Trimmed_output

# Commands
fastqc $Illumina_1 $Illumina_2 -o $output
