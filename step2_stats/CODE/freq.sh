#!/bin/bash

#!/usr/bin/Rscript

# Calculate the allele frequencies using vcftools
# Write into a logfile called main.log

cd RESULTS/

data=../DATA/*.vcf
vcftools --vcf $data --freq2 --out redknots

echo "----------------------------------" >> main.log
echo "Log Allele frequencies" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

rm redknots.log

cd ../
