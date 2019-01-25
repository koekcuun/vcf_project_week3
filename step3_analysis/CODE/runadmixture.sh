#file which will..
#.. be converted into a .bed plink file that can..
#..be read by 'admixture'. (sudo apt install admixture)
#Authors: Sascha Brunner & Cuun Koek
#date: 22/01/19
#########

cd RESULTS/

data=../DATA/*.vcf

#create chrom-map.txt
bcftools view -H $data | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom-map.txt

# use plink to create a map and a ped
vcftools --vcf $data --plink --chrom-map chrom-map.txt --out redknots

echo "----------------------------------" >> main.log
echo "Log Plink" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

#convert .ped to .bed file using plink program
#(.ped couldn't be read by "admixture")
plink2 --vcf $data --allow-extra-chr --make-bed --out redknots

#add log to main log
echo "----------------------------------" >> main.log
echo "Log admixture" >> main.log
grep -E ".+" redknots.log >> main.log
echo "" >> main.log

#remove admixture_data.log
rm redknots.log

#create loop which gives the cross-validation and add logs to main log
for K in 1 2 3 4 5; \
do admixture --cv redknots.bed $K | tee log${K}.out >> main.log; done

#compare k values
echo "Choose output file with the lowest CV value: ...."
for CV in log*.out; do
  grep "CV error" $CV
done

#remove logs as the have been added to the main log
rm log*.out
cd ../
