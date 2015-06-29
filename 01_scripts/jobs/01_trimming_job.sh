#!/bin/bash
#$ -N trim_cecilia
#$ -M claudia.kasper@iee.unibe.ch
#$ -m beas
#$ -pe smp 10
#$ -l h_vmem=100G
#$ -l h_rt=96:00:00
#$ -cwd
#$ -S /bin/bash

time ./01_scripts/01_trimming.sh
