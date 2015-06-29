#!/bin/bash
# GLOBAL VARIABLES
TRIMMED_READS="03_trimmed"
REFERENCE="02_raw_data"
MAPPED="04_mapping_bwa"
PROJECT_NAME=$(ls -1 $REFERENCE/*.fasta | sed 's/02_raw_data\///g' | sed 's/\.cdna.all\.fasta//g')

# Indexing reference sequences in the FASTA format
cp $REFERENCE/*.fasta $TRIMMED
bwa index -p $PROJECT_NAME $TRIMMED/*.fasta

# Performing the alignment (mapping)
for file in `ls -1 $TRIMMED_READS/*_R1.fastq | sed 's/_R1\.fastq//g'`; do
    bwa mem -t 10 $PROJECT_NAME $TRIMMED_READS/${file}_R1.fastq $TRIMMED_READS/${file}_R2.fastq >${file}.sam
done

# Cleaning up
mv $TRIMMED_READS/*.sam $MAPPED
mv $TRIMMED_READS/*.sa $MAPPED
mv $TRIMMED_READS/*.amb $MAPPED
mv $TRIMMED_READS/*.ann $MAPPED
mv $TRIMMED_READS/*.bwt $MAPPED
mv $TRIMMED_READS/*.pac $MAPPED
