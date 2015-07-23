#!/bin/bash
# GLOBAL VARIABLES
TRIMMED="03_trimmed"
REFERENCE="02_raw_data"
MAPPED="04_mapping_bwa"
PROJECT_NAME=$(ls -1 $REFERENCE/*.fasta | sed 's/02_raw_data\///g' | sed 's/\.ensembl\.cdna.fasta//g')

# Indexing reference sequences in the FASTA format
#cp $REFERENCE/*.fasta $TRIMMED
#bwa index -p $PROJECT_NAME $TRIMMED/*.fasta

# Performing the alignment (mapping)
for file in `ls -1 $TRIMMED/*_R1.paired.fastq | sed 's/_R1\.paired\.fastq//g'`; do
    bwa mem -t 10 $PROJECT_NAME ${file}_R1.paired.fastq ${file}_R2.paired.fastq >${file}.sam
done

# Cleaning up
mv $TRIMMED/*.{sam,sa,amb,ann,bwt,pac} $MAPPED
