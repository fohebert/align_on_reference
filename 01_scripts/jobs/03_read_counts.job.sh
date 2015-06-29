#!/bin/bash
#$ -N read-count
#$ -M claudia.kasper@iee.unibe.ch
#$ -m eas
#$ -pe smp 5
#$ -l h_vmem=40G
#$ -l h_rt=96:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/03_read_counts.sh
