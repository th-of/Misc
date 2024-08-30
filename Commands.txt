# Retrieve contigs from the Logan database using the aws cli and a list of SRA accession numbers ("SraAccList.csv").
# Accession file contains 493 476 accession numbers, split into 12 parallell processes doing 41123 each.
---
#!/bin/bash
#set -x

for x in {1..41123}
do
        acc=`sed -n ''${x}'p' SraAccList.csv`
        aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
        zstd -d ${acc}.contigs.fa.zst
        rm ${acc}.contigs.fa.zst
done&

for x in {41124..82246}
do
        acc=`sed -n ''${x}'p' SraAccList.csv`
        aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
        zstd -d ${acc}.contigs.fa.zst
        rm ${acc}.contigs.fa.zst
done&
---

# Deactivate the base conda environment, uses an older version of blast (dependency for something)
conda deactivate

# makeblastdb terminates with the error: terminate called after throwing an instance of 'std::bad_alloc' 
# if the input file is too big (>600 GB), couldn't figure out how to fix it. Doesn't seem to be a
# system resources issue. Split into smaller batches:

# Concatenate the first 10 000 fasta files
find ./Sequences/ -type f -name "*.fa" | sed -n '1,10000p' | xargs cat > comb1.fasta

# Concatenate the fasta files 10 001 to 20 000
find ./Sequences/ -type f -name "*.fa" | sed -n '10001,20000p' | xargs cat > comb2.fasta

# Concatenate the fasta files 20 001 to 30 000
find ./Sequences/ -type f -name "*.fa" | sed -n '20001,30000p' | xargs cat > comb3.fasta

# etc..
# makeblastdb is quite slow at 180 000 sequences / second (on my machine)
nohup makeblastdb -in comb1.fasta -dbtype nucl -input_type fasta -out big_db1 -max_file_sz 3GB -logfile makedb_log1.txt &

tblastn -db big_db1 -num_threads 8 -query ${query_sequence} -out local_search1.txt


