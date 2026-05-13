#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 08:00:00
#SBATCH -J 16_Read_counting_HTSeq
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load HTSeq/2.1.2-gfbf-2024a

# Input file
input_BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/15_RNA_Mapping_BWA_output/BH/*_sorted.bam

input_Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/15_RNA_Mapping_BWA_output/Serum/*_sorted.bam

# Annotation file
annotation=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/10_Genome_Annotation_Prokka_output/Prokka_Canu.noFASTA.gff

# Output
output_BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/16_Read_counting_HTSeq_output/BH

output_Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/16_Read_counting_HTSeq_output/Serum

# Commands Serum
htseq-count -f bam -s no -r pos -t CDS -i ID $input_Serum $annotation \
> $output_Serum/_counts.txt

# Commands BH
htseq-count -f bam -s no -r pos -t CDS -i ID $input_BH $annotation \
> $output_BH/_counts.txt
