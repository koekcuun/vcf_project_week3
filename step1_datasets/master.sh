#!/bin/bash

# Step 1: run the scripts in Code (of 1_datasets) that create .txt files with the different separate populations

# Link the datalocation to the datafolder
ln -s ~/vcf_project_week3/DATA_REPOSITORY/* DATA/.

# Copy to results
cp DATA/* RESULTS/.

# Run all the scripts present in code
./CODE/*
