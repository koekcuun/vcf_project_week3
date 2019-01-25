#! /bin/bash

##########
#MASTER OVERALL
#########

for x in step1_datasets step2_stats step3_analysis; do
	cd $x
	for i in DATA RESULTS; do
		mkdir $i
	done
	./master.sh
	cd ../
done
