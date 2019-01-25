#!/usr/bin/env bash

###############
#a program which takes the vcf file and makes a PC analysis using an Rscript
#NOTE: "vcftools" needs to be installed! "plink2" needs to be installed!
#authors: Sascha Brunner & Cuun Koek
#date: 23/01/19
###############

cd ./RESULTS/

#create PCA dataframe using plink2; --bfile is the input command for BED files (.bed .fam .bim)
#--pca generates 10 pcs in the output file
plink2 --bfile redknots --allow-extra-chr --pca 10 --out redknots

#add log to main log
echo "----------------------------------" >> main.log
echo "Log PCA" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log
rm redknots.log

#join the two separate files to one data table so it can be read by R
join -t \t <(sort pca_final_data.eigenvec) <(sort allpops.pop) > pca_redknots.txt

