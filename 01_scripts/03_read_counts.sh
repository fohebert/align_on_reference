#!/bin/bash

# GLOBAL VARIABLES
MAPPED="04_mapping_bwa"
READ_COUNTS="05_read_counts"
REFERENCE="02_raw_data"

# Converting SAM --> BAM & sorting according to coordinates & 
# filtering out unmapped reads
for file in `ls -1 $MAPPED/*.sam | sed 's/\.sam//g' | sed 's/04_mapping_bwa\///g'`; do
    samtools view -bS $MAPPED/$file.sam | \
    samtools sort - | \
    samtools view -h -F 4 - >$MAPPED/$file.mapped-reads.bam
done

# Producing count files
for sam_file in `ls -1 $MAPPED/*.mapped-reads.bam | sed 's/04_mapping_bwa//g'`; do
    
    awk '{print $3}' $MAPPED/$sam_file | \
    cat - $REFERENCE/Orenil.cdna.ensembl.names.txt | \
    sort -n | \
    uniq -c | \
    sed 's/ //g' | \
    sed 's/ENS/\tENS/g' | \
    awk '{print $1-1}' | \
    sed 's/ /\t/g' >$MAPPED/${sam_file%.mapped-reads.bam}.on-Tilapia.read-count.txt

done

# Preparing the header file for the final matrix
ls -1 $MAPPED/*.read-count.txt | sed 's/\.on-Tilapia\.read-count\.txt//g' >$READ_COUNTS/temp.sp
01_scripts/transpose.py $READ_COUNTS/temp.sp $READ_COUNTS/head.sp

# Putting together the pieces of info needed in the matrix
paste $REFERENCE/Orenil.cdna.ensembl.names.txt $MAPPED/*read-count.txt >$READ_COUNTS/matrix.temp
cat $READ_COUNTS/head.sp $READ_COUNTS/matrix.temp >$READ_COUNTS/samples.read-count.tsv

# Cleaning intermediate files
# rm $READ_COUNTS/head.sp
# rm $READ_COUNTS/matrix.temp
# rm $MAPPED/*.read-count.txt
