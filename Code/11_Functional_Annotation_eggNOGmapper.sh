#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 15:00:00
#SBATCH -J 10_Functional_Annotation_eggNOGmapper
#SBATCH --mail-type=ALL
#SBATCH --mail-user sofia.englundh.7850@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load eggnog-mapper/2.1.13-gfbf-2024a

# Stop if error
set -euo pipefail

# Output
Output=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/10_Functional_Annotation_eggNOGmapper_output

# Prokka proteins
Prokka_faa=/home/soen7850/Genome-Analysis-Project/Analyses/02_Genome_Assembly_and_Annotation/09_Genome_Annotation_Prokka_output/Prokka_Canu.faa

# Database path
Database_dir=/sw/data/eggNOG/5.0/snowy

# Commands
emapper.py -i $Prokka_faa --itype proteins --data_dir $Database_dir --cpu 2 -m diamond --output eggNOGmapper_Canu --output_dir $Output --override
