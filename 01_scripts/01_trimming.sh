#!/bin/bash
#Cleaning and trimming data with trimmoatic

# Global variables
RAW_FOLDER="02_raw_data"
TRIMMED_FOLDER="03_trimmed"
VECTORS="./00_archive/UniVec.fasta"
TRIMMOMATIC_PROGRAM="/prg/trinityrnaseq/trinityrnaseq_r20140717/trinity-plugins/Trimmomatic-0.32/trimmomatic.jar"

# Filtering and trimming data with trimmomatic
ls -1 $RAW_FOLDER/*.fastq | \
    sed 's/_R[12]\.fastq//g' | \
    sed 's/02_raw_data\///g' | \
    sort -u | \
    
    while read i
    do
       echo $i
       java -Xmx80G -jar $TRIMMOMATIC_PROGRAM PE \
           -threads 10 \
           -phred33 \
           "$i"_R1.fastq \
           "$i"_R2.fastq \
           "$i"_R1.paired.fastq \
           "$i"_R1.single.fastq \
           "$i"_R2.paired.fastq \
           "$i"_R2.single.fastq \
           ILLUMINACLIP:$VECTORS:2:30:10 \
           SLIDINGWINDOW:20:2 \
           LEADING:2 \
           TRAILING:2 \
           MINLEN:70
    done

# Transfer trimmed files to $TRIMMED_FOLDER folder
mv $RAW_FOLDER/*single* $TRIMMED_FOLDER
mv $RAW_FOLDER/*paired* $TRIMMED_FOLDER

# Indicate that the trimming is done
touch finished.01_trimming
