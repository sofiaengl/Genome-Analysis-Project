#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J 12_FastQC_Transcriptomic.sh
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load FastQC/0.12.1-Java-17

# Raw Data
RNA_BH=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw/*fastq.gz

RNA_Serum=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw/*fastq.gz

# Output
output_BH=/home/soen7850/Genome-Analysis-Project/Analyses//03_Measure_Expression_RNASeq/12_FastQC_Transcriptomic_output/BH

output_Serum=/home/soen7850/Genome-Analysis-Project/Analyses//03_Measure_Expression_RNASeq/12_FastQC_Transcriptomic_output/Serum

# Commands
fastqc $RNA_BH -o $output_BH

fastqc $RNA_Serum -o $output_Serum
