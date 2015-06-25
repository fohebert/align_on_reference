# RNA-seq pipeline

## General Description & Disclaimer
This pipeline was designed to clean raw read files and map them back on a reference transcriptome. Be careful when using the scripts, everything is well formatted for the specific requirements of the KATAK cluster at Laval University. Follow the instructions step by step to produce the desired output, but if this pipeline is used on another cluster, there is absolutely no guarantee that it will work properly. You can always go back into the script files and change the code according to your needs.
<br>
## Step 1 - Copying and expanding raw files
**Description**<br>
First, you need to copy the files that are on the external hard-drive to your account on KATAK, in the "raw data" folder of the pipeline. Here's how you can perform this task:<br>

*Copying the files from external hard-drive to raw data folder using the "[rsync](https://en.wikipedia.org/wiki/Rsync)" utility. Open a terminal window and type the following code:*<br><br>
`rsync -avzP /Volumes/$HD/*.fastq.tar.gz ckavoekl@ibis.ulaval.ca:/home/ckavoek1/align_on_reference/02_raw_data`<br><br>
**Note**: $HD = name of your external hard-drive<br>

*1.1 First, go to the pipeline main folder:*<br><br>
`cd /home/ckavoekl/align_on_reference`<br><br>
*1.2 Submit the expand job:<br><br>
`qsub 01_scripts/jobs/expand.job.sh`
<br>
## Step 2 - Trimming reads (PHRED score > 2)
**Description**<br>
This step will clean the reads according to a sequencing quality threshold, i.e. PHRED score greater than 2. Trimmomatic will discard the bases from both ends that show a sequencing quality below the user-defined threshold. In this case, the threshold is quite low (PHRED > 2). Agressive trimming leads to loss of important information, so the threshold is set low. Still from the main folder of the pipeline (i.e. /home/ckavoek1/align_on_reference), here's how you can perform this task:<br>

*2.1 Submit the trimming job:*<br><br>
`qsub 01_scripts/jobs/01_trimming.job.sh`<br><br>
**Note**: This will take all the FASTA files found in '02_raw_data/', trim/clean them and place the output files (i.e. trimmed read files) into the folder for the next step, i.e. 03_trimmed.<br>

## Step 3 - Aligning the reads on the reference
Line
