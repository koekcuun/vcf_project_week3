#!/bin/bash

#!/usr/bin/Rscript

# Calculate relatedness using vcftools
# Write into a logfile called main.log

cd RESULTS/

data=../DATA/*.vcf
vcftools --vcf $data --relatedness --out redknots

echo "-------------------------------" >> main.log
echo "Log Relatedness" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

rm redknots.log

cd ../
