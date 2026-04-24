#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J 06_Assembly_Evaluation_QUAST_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load QUAST/5.3.0-gfbf-2024a

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/06_Assembly_Evaluation_QUAST_output
Reference=/home/soen7850/Genome-Analysis-Project/Data/Refrence_Genome/GCF_009734005.1_ASM973400v2_genomic.fna

# SPAdes assembly
SPAdes=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/04_Genome_Assembly_Illumina_Nanopore_output/contigs.fasta

# Canu assembly
canu=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output/efaecium_PacBio_Assembly.contigs.fasta

# Commands
quast.py $SPAdes -r $Reference -o $Output/SPAdes --gene-finding
quast.py $canu -r $Reference -o $Output/canu --gene-finding
