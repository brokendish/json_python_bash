#!/usr/bin/bash


aaa=`python3 python_json.py test.json`

echo "----- json data ---------------"
echo "$aaa"
echo "-------------------------------"
echo ""

echo "----- select ---------------"
echo "abc3.txt"
targetFile="abc3.txt"
echo ""

echo "----- target ---------------"
ret=`echo "$aaa"|grep $targetFile`
echo $ret
echo ""

echo "----- unset enviroment ---------------"
export infilename=
export outfilename=
export copyfilename=

echo "----- set enviroment ---------------"
for lis in $ret;
do
#	re=`echo "$lis"|cut -d '=' -f1`
#	test -n "$re" && export "$re"
	echo $lis
	eval "export $lis"

done

echo "----- enviroment ---------------"
echo "infilename　=" $infilename
echo "outfilename　=" $outfilename
echo "copyfilename　=" $copyfilename
echo "A1_PATH 　　　=" $A1_PATH
echo "A1_OUT  　　　=" $A1_OUT

echo "A2_PATH 　　　=" $A2_PATH
echo "A2_OUT  　　　=" $A2_OUT

echo "A3_PATH 　　　=" $A3_PATH
echo "A3_OUT  　　　=" $A3_OUT


