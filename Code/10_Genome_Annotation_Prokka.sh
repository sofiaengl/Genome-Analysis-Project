#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J 09_Genome_Annotation_Prokka_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load prokka/1.14.5-gompi-2024a

# Stop if error
set -euo pipefail

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/09_Genome_Annotation_Prokka_output

# Canu assembly
Canu=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/05_Genome_Assembly_Canu_output/efaecium_PacBio_Assembly.contigs.fasta

# Commands
prokka --force --outdir $Output --prefix Prokka_Canu --addgenes --genus Enterococcus --species faecium --strain E745 $Canu
