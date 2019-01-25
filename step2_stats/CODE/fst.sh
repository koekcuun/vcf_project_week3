#!/bin/bash

cd RESULTS/

data=../DATA/*.vcf

echo "--------------------------------" >> main.log

for filename in *.txt
	do
		for filename2 in *.txt
			do
			if [ $filename2 != $filename ]
			then
				name="${filename%.*}"
				name2="${filename2%.*}"
				outname=$name"_"$name2
				vcftools --vcf $data --weir-fst-pop $filename --weir-fst-pop $filename2 --out $outname

				echo "Log Fixation index for $name and $name2:" >> main.log
				grep -E ".+" $outname".log" >> main.log
				echo "" >> main.log

				rm $outname".log"
			fi
			done
	done
cd ../
