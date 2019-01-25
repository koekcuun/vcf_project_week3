#!/bin/bash

# Create separate .txt files containing the individuals per population

# Make a list of all the individuals from the cleaned up .vcf file called samples.txt
grep \#CHROM DATA/*.vcf | perl -p -e 's/\t(\w+)\_\w+\.bam/\n\1/g' | grep -v CHROM > RESULTS/temp

# Make a txt file called allpops, with each sample and their corresponding population
grep -v ID DATA/*info.txt | cut -f 2,4 | perl -p -e 's/(\w{2}\d{3}\t\w+)\x20(\w+)/\1\_\2/g' > RESULTS/temp2 

cd RESULTS/

# Compare the two previously created files, keep only the samples that are present in the
# original file, and create new .txt files per population
grep -Fwf temp temp2 | perl -p -e 's/(\w{2}\d{3})(\t)/\1\_sorted\.bam\2/g' > allpops.pop

awk -F'\t'  '{print$1 > $2".txt"}' allpops.pop

# rm the two temporary files again
rm temp*

cd ../
