#!/bin/bash
#SBATCH --account EcoGenetics
#SBATCH --mem=64G
#SBATCH --cpus-per-task=8
#SBATCH --time=36:00:00

# Align sample data to reference genome with bwa using 8 threads
# pipe the output directly to samtools which name sorts the data using 8 threads and outputs file in BAM format
bwa mem \
    -t 8 \
    /faststorage/project/EcoGenetics/BACKUP/reference_genomes/orchesella_cincta/GCA_001718145.1/GCA_001718145.1_ASM171814v1_genomic \
    /faststorage/project/EcoGenetics/BACKUP/population_genetics/collembola/Orchesella_cincta/FÅJ-C5/E100049659_L01_ANIcnqkR228559-607_1.fq.gz \
    /faststorage/project/EcoGenetics/BACKUP/population_genetics/collembola/Orchesella_cincta/FÅJ-C5/E100049659_L01_ANIcnqkR228559-607_2.fq.gz \
| samtools sort \
    -@ 7 \
    -n \
    -O BAM \
    > /faststorage/project/EcoGenetics/people/Jeppe_Bayer/data_preparation/OrcCin/OrcCin.sorted.bam

exit 0