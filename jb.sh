#!/bin/bash

echo 'start...'

echo "----------------"

fdate=$(date -d "yesterday 13:00 " '+%Y-%m-%d')

if [[ $# -eq 1 ]] ; then
    fdate=$1
fi

echo $fdate

file1="pre_01-"
file1=${file1}$fdate
file1=${file1}.log
echo $file1
file2="pre_02-"
file2=${file2}$fdate
file2=${file2}.log
echo $file2

total_file_name='pre_total'-$fdate
total_file_name=${total_file_name}.log
echo $total_file_name

value=`cat pre_counter`
#echo "$value"
#echo $((1+$value))
#a=`expr "$a" + "$num"`
echo $((1+$value)) > pre_counter

echo "header 1" > $total_file_name
echo "header 2" >> $total_file_name
echo '' >> $total_file_name

cat $file1 >> $total_file_name
cat $file2 >> $total_file_name

echo '' >> $total_file_name
echo "footer 1" >> $total_file_name
ft2="footer 2: "
ft2=${ft2}$value
echo $ft2 >> $total_file_name
lines1=`wc -l < $file1`
lines2=`wc -l < $file2`
echo $(($lines1+$lines2)) >> $total_file_name
