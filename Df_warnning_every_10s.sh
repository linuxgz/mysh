#!/bin/bash
# LANG=zh_CN.UTF-8
# ##################################################################
# 2021年 09月 23日 星期四 10:07:27 CST
# Written by:xgz
# FileName:Df_warnning_every_10s.sh 
# Usage:
# Contact me by linuxgz@163.com
# ##################################################################

Sed_Expr_Now_Used="df|sed -nr '/^\/dev\/sd.*/s@^/dev/(sd[a-z]+[0-9]+)[[:space:]]+.*
[[:space:]]+([0-9]+%).*@\1:\2@p'"

Now_Used=`eval ${Sed_Expr_Now_Used}`
echo -e "Now used is\n${Now_Used}%"

Sed_Expr="df |sed -nr '/^\/dev\/sd.*/s@.*[[:space:]]+([0-9]+)%.*@\1@p'|sort -nr | head -1" 
warnning=80
if [ $# -gt 0 ]; then
	warnning=$1
fi
warn_word="warning !!!! "

while : ; do
	Used=`eval $Sed_Expr`
	if [ $Used -gt $warnning ];then
		echo $warn_word
	else
		echo "nomorl"
	fi

	sleep 10
done

