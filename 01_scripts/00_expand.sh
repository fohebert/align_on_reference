#!/bin/bash

# Expand compressed files in .tar.gz format
tar -zxvf 02_raw_data/*.tar.gz

# Rename files for a better file processing in downstream analyses
for file in `ls -1 02_raw_data/*.fastq`; do
    new_name=$(echo $file | sed 's/02_raw_data\///g' | sed 's/HI\.[0-9]*\.[0-9]*\.Index_[0-9]*\.//g')
    mv 02_scripts/$file 02_scripts/$new_name;
done
