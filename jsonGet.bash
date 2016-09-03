#!/usr/bin/bash

echo "----- execute python -----"
jsondat=`python3 python_json.py test.json.txt`

echo "----- python return json data ---------------"
echo "$jsondat"
echo "-------------------------------"
echo ""

echo "----- set enviroment ---------------"
echo "$jsondat"|while read line
do
	bkupenv=
	echo "[Line data]:--------------------:"$line
	for column in $line;
	do
		#echo "----- get enviroment ---------------"
		env=`echo $column|cut -d"=" -f1`
		echo "ENVIRON-----:$env"

		#echo "----- backup enviroment ---------------"
		aa=`eval echo "$"$env`
		bkupenv="$bkupenv $env=$aa"

		#echo "----- unset  enviroment ---------------"
		eval "export $env="

		echo "----- export enviroment ---------------"
		echo "[Column data]:-----:$column"
		eval "export $column"
	done

	echo "----- execute Generate Process ---------------"

	echo "----- restore enviroment ---------------"
	echo "bkupenv-----$bkupenv"
	for res in $bkupenv;
	do
		eval "export $res"
	done
done



