#!/bin/bash

# Script to clean out everything before running the next simulation


for d in step1_datasets step2_stats step3_analysis; do
	cd $d
	for i in DATA RESULTS; do
		rm -rf $i
	done
	cd ../
done

