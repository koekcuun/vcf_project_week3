#!/bin/bash

# Step 2: run the scripts in Code (of 2_stats) that perform several exploratory statistical test on the data

# Link the results created in step 1 to the datafolder of step 2
ln -s ~/vcf_project_week3/step1_datasets/RESULTS/* DATA/.
rm DATA/*info.txt

# Copy the data to results
cp DATA/* RESULTS/.

# Run all the scripts present in Code
# While the statistical scripts run, a logfile called main.log is created, in which all the steps are logged.

for file in ./CODE/*
	do
		$file
	done
