#! /bin/bash
# LANG=zh_CN.UTF-8
# ##################################################################
# 2021年 09月 22日 星期三 16:27:31 CST
# Written by:root
# FileName:Check_suid_sgid_stick.sh 
# Usage:
# Contact me by linuxgz@163.com
# ##################################################################

SearchPath=$1
Expr_7='-perm -7000'
Expr_6='-perm -6000'
Expr_5='-perm -5000'
Expr_4='-perm -4000'
Expr_3='-perm -3000'
Expr_2='-perm -2000'
Expr_1='-perm -1000'
SavePath=/root/SSSID_list.txt
if [ $# -lt 1 ]; then
        SearchPath=/
fi
SavePath=./perm_list_`date +%s`
for i in "$Expr_7" "$Expr_6" "$Expr_5" "$Expr_4" "$Expr_3" "$Expr_2" "$Expr_1"  ; do
        echo -e "\n###> Start ... find $i <####">> $SavePath
        find $SearchPath $i >> $SavePath  2>>${SavePath}_fasle
        echo -e "\n###> End $i ... check $SavePath <###\n" >> $SavePath 
done
echo "finished check $SavePath "
less $SavePath 
echo "finished check $SavePath " 
exit
