#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J 14_FastQC_Transcriptomic_Trimmed.sh
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load FastQC/0.12.1-Java-17

# Raw Data
Trimmed_Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/Serum/*.fastq.gz

Trimmed_BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/BH/*.fastq.gz

# Output
output_BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/14_FastQC_Transcriptomic_Trimmed_output/BH

output_Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/14_FastQC_Transcriptomic_Trimmed_output/Serum

# Commands
fastqc $Trimmed_BH -o $output_BH

fastqc $Trimmed_Serum -o $output_Serum
