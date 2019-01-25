#!/bin/bash

#!/usr/bin/Rscript

# Run a heterozychosity test using vcftools
# Write into a logfile called main.log

cd RESULTS/

data=../DATA/*.vcf
vcftools --vcf $data --het --out redknots

echo "---------------------------------" >> main.log
echo "Log Heterozychosity" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

rm redknots.log

cd ../
