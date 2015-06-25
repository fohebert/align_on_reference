# RNA-seq pipeline

## General Description & Disclaimer
This pipeline was designed to clean raw read files and map them back on a reference transcriptome. Be careful when using the scripts, everything is well formatted for the specific requirements of the KATAK cluster at Laval University. Follow the instructions step by step to produce the desired output, but if this pipeline is used on another cluster, there is absolutely no guarantee that it will work properly. You can always go back into the script files and change the code according to your needs.
<br>
## Step 1 - Copying and expanding raw files
**Description**<br>
First, you need to copy the files that are on the external hard-drive to your account on KATAK, in the "raw data" folder of the pipeline. Here's how you can perform this task:<br>

*Copying the files from external hard-drive to raw data folder using the "[rsync](https://en.wikipedia.org/wiki/Rsync)" utility. Open a terminal window and type the following code:*<br><br>
`rsync -avzP /Volumes/$HD/*.fastq.gz ckavoekl@ibis.ulaval.ca:/home/ckavoek1/align_on_reference/02_raw_data`<br><br>
**Note**: $HD = name of your external hard-drive<br> 

