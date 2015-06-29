#!/bin/bash
#$ -N bwa
#$ -M claudia.kasper@iee.unibe.ch
#$ -m eas
#$ -pe smp 10
#$ -l h_vmem=40G
#$ -l h_rt=96:00:00
#$ -cwd
#$ -S /bin/bash

time ./01_scripts/02_bwa_mapping.sh
