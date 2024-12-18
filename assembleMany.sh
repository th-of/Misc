#!/bin/bash
set -x
cd "$(dirname "$0")"
source /home/thomas/software/bakta/runbakta.sh
source /home/thomas/software/ncbi-blast-2.15.0+/runNCBItools.sh

find ~+ ./ -name "M*.fq.gz" > read_files.txt

samples_count=$(grep "_1" read_files.txt | wc -l)
mkdir Annotated_genomes

for x in $(seq 1 2 $samples_count);
do
	seq1=`sed -n ''${x}'p' read_files.txt`
	num2=$((x + 1))
	seq2=`sed -n ''${num2}'p' read_files.txt`
	sample_name=`echo $seq1 | sed -n 's|.*/\([^/]*\)/\1_.*|\1|p'`
	echo ${sample_name}
	fastp -i $seq1 -I $seq2 -o ${sample_name}_trimmed_1.fq.gz -O ${sample_name}_trimmed_2.fq.gz -q 20 --length_required 80 --cut_tail --cut_front --cut_mean_quality 20
	/home/thomas/software/Unicycler/unicycler-runner.py -1 ${sample_name}_trimmed_1.fq.gz -2 ${sample_name}_trimmed_2.fq.gz -t 12 -o ${sample_name}_assembled
	bakta --output ${sample_name}_annotation/ --prefix ${sample_name} --threads 8 ${sample_name}_assembled/assembly.fasta
	cp ${sample_name}_annotation/*.gbff ./Annotated_genomes/${sample_name}.gbff
done




