#!/bin/bash

#!/usr/bin/Rscript

# Run a Hardy Weinberg test using vcftools
# Write into a logfile called main.log

cd RESULTS/

data=../DATA/*.vcf
vcftools --vcf $data --hardy --out redknots

echo "-------------------------------" >> main.log
echo "Log Hardy Weinberg" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

rm redknots.log

cd ../
