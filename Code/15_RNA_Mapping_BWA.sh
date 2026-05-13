#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH -J 15_RNA_Mapping_BWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.3.1-GCC-13.3.0

# Raw Data
reference=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output/efaecium_PacBio_Assembly.contigs.fasta

BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/BH

Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/Serum

# Output
output_BH=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/15_RNA_Mapping_BWA_output/BH

output_Serum=/home/soen7850/Genome-Analysis-Project/Analyses/03_Measure_Expression_RNASeq/15_RNA_Mapping_BWA_output/Serum

# Commands

# Index the reference genome:
bwa index $reference

# RNA mapping with BWA - BH
for file in ERR1797972 ERR1797973 ERR1797974
do

bwa mem -t 1 $reference $BH/${file}_forward_paired.fastq.gz $BH/${file}_reverse_paired.fastq.gz \
| samtools sort -@ 1 -o $output_BH/${file}_sorted.bam

samtools index $output_BH/${file}_sorted.bam

done

# RNA mapping with BWA - Serum

for file in ERR1797969 ERR1797970 ERR1797971
do

bwa mem -t 1 $reference $Serum/${file}_forward_paired.fastq.gz $Serum/${file}_reverse_paired.fastq.gz \
| samtools sort -@ 1 -o $output_Serum/${file}_sorted.bam

samtools index $output_Serum/${file}_sorted.bam

done
