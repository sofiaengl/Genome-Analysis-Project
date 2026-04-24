#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J 02_Trimmomatic_Illumina_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load Trimmomatic/0.39-Java-17

# Raw Data
Illumina_1=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz
Illumina_2=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz

# Output
output=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/02_Trimmoatic_Illumina_output

# Commands
trimmomatic PE -threads 2 -phred33 \
$Illumina_1 $Illumina_2 \
$output/E745-1.output_forward_paired.fastq.gz \
$output/E745-1.output_forward_unpaired.fastq.gz \
$output/E745-1.output_reverse_paired.fastq.gz \
$output/E745-1.output_reverse_unpaired.fastq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:7 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 > $output/trimmomatic.log 2>&1
