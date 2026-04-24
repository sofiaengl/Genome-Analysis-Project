#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 04:00:00
#SBATCH -J 04_Genome_Assembly_Short_Reads_Illumina_Nanopore_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load SPAdes/4.2.0-GCC-13.3.0

# Illumina paired reads (trimmed)
Illumina_1=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/02_Trimmoatic_Illumina_output/E745-1.output_forward_paired.fastq.gz
Illumina_2=/home/soen7850/Genome-Analysis-Project/Analyses/01_Preprocessing/02_Trimmoatic_Illumina_output/E745-1.output_reverse_paired.fastq.gz

# Nanopore long reads
Nanopore=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Nanopore/E745_all.fasta.gz

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/04_Genome_Assembly_Illumina_Nanopore_output

# Run SPAdes
spades.py \
-1 $Illumina_1 \
-2 $Illumina_2 \
--nanopore $Nanopore \
-o $Output
