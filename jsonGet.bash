#!/usr/bin/bash


aaa=`python3 python_json.py`

echo "----- json data ---------------"
echo "$aaa"
echo "-------------------------------"
echo ""

echo "----- select ---------------"
echo "abc1.txt"
targetFile="abc1.txt"
echo ""

echo "----- target ---------------"
ret=`echo "$aaa"|grep $targetFile`
echo $ret
echo ""

for lis in $ret;
do
	re=`echo "$lis"|cut -d '=' -f1`
	test -n "$re" && export "$re"
	eval "export $lis"

done

echo "----- enviroment ---------------"
echo "infilename　=" $infilename
echo "AA_PATH 　　　=" $AA_PATH
echo "AA_OUT  　　　=" $AA_OUT


