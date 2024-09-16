#!/bin/bash
#set -x

for x in {501..41123}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&

for x in {41124..82246}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&

for x in {82247..123369}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {123370..164492}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {164493..205615}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&

for x in {205616..246738}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&

for x in {246739..287861}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {287862..328984}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {328985..370107}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {370108..411230}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&	

for x in {411231..452353}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done&

for x in {452354..493478}
do
	acc=`sed -n ''${x}'p' SraAccList.csv`
	if [ ! -f "/mnt/databases/Logan/Sequences/${acc}.contigs.fa" ]; then
		aws s3 cp s3://logan-pub/c/${acc}/${acc}.contigs.fa.zst . --no-sign-request
		zstd -d ${acc}.contigs.fa.zst
		rm ${acc}.contigs.fa.zst
		echo "Currently at accession line no. ${x}"
	fi
done	