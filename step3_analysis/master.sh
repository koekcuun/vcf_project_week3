#!/bin/bash

# Step 3: run the scripts in Code (of 1_datasets) that create .txt files with the different separate populations

# Link the datalocation to the datafolder
ln -s ~/vcf_project_week3/step2_stats/RESULTS/* DATA/.
rm DATA/*.txt

# Copy to results
cp DATA/* RESULTS/.

# Run all the scripts present in code
for file in ./CODE/*sh
	do
		$file
	done
cd CODE/
Rscript admixture_barplot.R
Rscript plotpca_redknots.R
cd ../
