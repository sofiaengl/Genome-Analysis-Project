#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J 08_Genome_Comparison_MUMmerplot_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load MUMmer/4.0.1-GCCcore-13.3.0

# Stop if error
set -euo pipefail

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/08_Genome_Comparison_MUMmerplot_output

# Canu assembly
Canu=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output/efaecium_PacBio_Assembly.contigs.fasta

# Reference genome
Reference=/home/soen7850/Genome-Analysis-Project/Data/Refrence_Genome/GCF_009734005.1_ASM973400v2_genomic.fna

# Commands
nucmer --prefix $Output/MUMmer_alignment $Reference $Canu

delta-filter -1 $Output/MUMmer_alignment.delta > $Output/MUMmer_alignment.filtered.delta # Filter best alignments

mummerplot --png --layout --filter --prefix $Output/MUMmer_plot $Output/MUMmer_alignment.filtered.delta -R $Reference -Q $Canu # Generate dotplot


