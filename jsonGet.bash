#!/usr/bin/bash

echo "----- execute python -----"
jsondat=`python3 python_json.py test.json.txt`

echo "----- python return json data ---------------"
echo "$jsondat"
echo "-------------------------------"
echo ""

#------------------------------
# function GenerateTarget
#
# param:$1 jsondatalist
#       $2 filename 
#------------------------------
function GenerateTarget(){
	#echo "----- target---------------"
	targetlist=$1
	targetFile=$2

	ret=`echo "$targetlist"|grep $targetFile`
	targetlist=$ret
	
	if [ -n "$targetlist" ]; then
		#echo "----- set enviroment ---------------"
		echo "$targetlist"|while read line
		do
			bkupenv=
			#echo "[Line data]:--------------------:"$line
			for column in $line;
			do
				#echo "----- get enviroment ---------------"
				env=`echo $column|cut -d"=" -f1`
				#echo "ENVIRON-----:$env"
		
				#echo "----- backup enviroment ---------------"
				aa=`eval echo "$"$env`
				bkupenv="$bkupenv $env=$aa"
		
				#echo "----- unset  enviroment ---------------"
				eval "export $env="
		
				#echo "----- export enviroment ---------------"
				#echo "[Column data]:-----:$column"
				eval "export $column"
			done
		
			#echo "----- execute Generate Process ---------------"
			Generate

			#echo "----- restore enviroment ---------------"
			#echo "bkupenv-----$bkupenv"
			for res in $bkupenv;
			do
				eval "export $res"
			done
		done
	else
		#echo "----- execute Generate Process ---------------"
		Generate
	fi
}

function Generate(){
	echo "--------------- Generate() ---------------"
	echo "infilename" : "$infilename"
	echo "A1_PATH" : "$A1_PATH"
	echo "A1_OUT" : "$A1_OUT"
	echo "A2_PATH" : "$A2_PATH"
	echo "A2_OUT" : "$A2_OUT"
	echo "A3_PATH" : "$A3_PATH"
	echo "A3_OUT" : "$A3_OUT"
	echo "copyfilename" : "$copyfilename"
	echo "outfilename" : "$outfilename"

}

#----- Generate
GenerateTarget "$jsondat" abc1.txt
GenerateTarget "$jsondat" abc2.txt
GenerateTarget "$jsondat" abc3.txt
GenerateTarget "$jsondat" abc4.txt
GenerateTarget "$jsondat" abc5.txt
GenerateTarget "$jsondat" abc6.txt

