#!/usr/bin/bash


aaa=`python3 python_json.py test.json`

echo "----- json data ---------------"
echo "$aaa"
echo "-------------------------------"
echo ""

echo "----- select ---------------"
echo "abc2.txt"
targetFile="abc2.txt"
echo ""

echo "----- target ---------------"
ret=`echo "$aaa"|grep $targetFile`
echo $ret
echo ""

for lis in $ret;
do
	re=`echo "$lis"|cut -d '=' -f1`
	test -n "$re" && export "$re"
	echo $lis
	eval "export $lis"

done

echo "----- enviroment ---------------"
echo "infilename　=" $infilename
echo "outfilename　=" $outfilename
echo "A1_PATH 　　　=" $A1_PATH
echo "A1_OUT  　　　=" $A1_OUT

echo "A2_PATH 　　　=" $A2_PATH
echo "A2_OUT  　　　=" $A2_OUT

echo "A3_PATH 　　　=" $A3_PATH
echo "A3_OUT  　　　=" $A3_OUT


