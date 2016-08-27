#!/usr/bin/bash


aaa=`python3 python_json.py`

echo "#-#-#-#-#-#-#-#"
echo "$aaa"
echo "#-#-#-#-#-#-#-#"

targetFile="abc1.txt"

ret=`echo "$aaa"|grep $targetFile`
echo $ret

export filename=
export AA_PATH=
export AA_OUT=

for lis in $ret;
do
	eval "export $lis"

done

echo "----- enviroment ---------------"
echo "infilename　=" $infilename
echo "AA_PATH 　　　=" $AA_PATH
echo "AA_OUT  　　　=" $AA_OUT


