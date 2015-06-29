#!/bin/bash
#$ -N expand
#$ -M claudia.kasper@iee.unibe.ch
#$ -m eas
#$ -pe smp 1
#$ -l h_vmem=4G
#$ -l h_rt=48:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/00_expand.sh
