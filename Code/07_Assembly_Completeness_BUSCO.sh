#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -J 07_Assembly_Completeness_BUSCO_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load BUSCO/5.8.2-gfbf-2024a

# Stop if error
set -euo pipefail

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/07_Assembly_Completeness_BUSCO_output

# Canu assembly
canu=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output/efaecium_PacBio_Assembly.contigs.fasta

# Commands
busco -i $canu -m genome -l lactobacillales_odb10 --out_path $Output -o canu_lactobacillales

