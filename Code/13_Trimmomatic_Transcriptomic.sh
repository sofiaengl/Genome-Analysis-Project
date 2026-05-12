#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 10:00:00
#SBATCH -J 13_Trimmomatic_Transcriptomic.sh
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load Trimmomatic/0.39-Java-17

# Raw Data
RNA_BH=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw

RNA_Serum=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw

# Output
output_BH=/home/soen7850/Genome-Analysis-Project/Analyses//03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/BH

output_Serum=/home/soen7850/Genome-Analysis-Project/Analyses//03_Measure_Expression_RNASeq/13_Trimmomatic_Transcriptomic_output/Serum

# Commands BH
for file in ERR1797972 ERR1797973 ERR1797974
do

trimmomatic PE -threads 2 -phred33 \
$RNA_BH/${file}_1.fastq.gz $RNA_BH/${file}_2.fastq.gz \
$output_BH/${file}_forward_paired.fastq.gz \
$output_BH/${file}_forward_unpaired.fastq.gz \
$output_BH/${file}_reverse_paired.fastq.gz \
$output_BH/${file}_reverse_unpaired.fastq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:7 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 > $output_BH/${file}_trimmomatic.log 2>&1

done

# Commands Serum
for file in ERR1797969 ERR1797970 ERR1797971
do

trimmomatic PE -threads 2 -phred33 \
$RNA_Serum/${file}_1.fastq.gz $RNA_Serum/${file}_2.fastq.gz \
$output_Serum/${file}_forward_paired.fastq.gz \
$output_Serum/${file}_forward_unpaired.fastq.gz \
$output_Serum/${file}_reverse_paired.fastq.gz \
$output_Serum/${file}_reverse_unpaired.fastq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:7 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 > $output_Serum/${file}_trimmomatic.log 2>&1

done
