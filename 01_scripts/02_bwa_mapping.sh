#!/bin/bash
# GLOBAL VARIABLES
TRIMMED="03_trimmed"
REFERENCE="02_raw_data"
MAPPED="04_mapping_bwa"
PROJECT_NAME=$(ls -1 $REFERENCE/*.fasta | sed 's/02_raw_data\///g' | sed 's/\.ensembl\.cdna.fasta//g')

# Indexing reference sequences in the FASTA format
cp $REFERENCE/*.fasta $TRIMMED
bwa index -p $PROJECT_NAME $TRIMMED/*.fasta

# Performing the alignment (mapping)
for file in `ls -1 $TRIMMED/*_R1.fastq | sed 's/_R1\.fastq//g'`; do
    bwa mem -t 10 $PROJECT_NAME $TRIMMED/${file}_R1.fastq $TRIMMED/${file}_R2.fastq >${file}.sam
done

# Cleaning up
mv $TRIMMED/*.sam $MAPPED
mv $TRIMMED/*.sa $MAPPED
mv $TRIMMED/*.amb $MAPPED
mv $TRIMMED/*.ann $MAPPED
mv $TRIMMED/*.bwt $MAPPED
mv $TRIMMED/*.pac $MAPPED
