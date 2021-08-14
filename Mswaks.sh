#!/bin/bash
# SMTP by comd from mysh.
#Swaks 是一个功能强大，灵活，可编写脚本，面向事务的 SMTP 测试工具，目前 Swaks 托管在私有 svn 存储库中。
#    官方项目 http：//jetmore.org/john/code/swaks/
# MRKETZHRKVKTWEWYCM
# 利用 SMTP 发送邮件
# swaks --to 收件箱 --from 发件箱 --body 邮件内容 --header "Subject:hello" --server smtp.qq.com -p 25 -au 发件箱 -ap SMTP的密码
#    --to //收件人邮箱;
#    --from //发件人邮箱;
#    --ehlo qq.com //伪造邮件的ehlo头，即发件人邮箱的域名，身法认证;
#    --body "https://goobe.io" //引号内为邮件正文;
#    --header "Subject:hello" //邮件头信息，Subject为邮件标题;
#    --data email.txt //将正常邮件内容保存成TXT文件，再作为正常邮件发出;
#    --help 显示命令帮助
#    --verison 显示版本信息
#
#	输出内容的含义:
#    “===”:swaks输出的信息行
#    “*“:swaks中产生的错误
#    ” ->”:发送到目标的预期行(无错误)
#    “<- “:服务器的预期回复(无错误)
#    “<**”:服务器返回的错误信息
#————————————————
# 发送附件
#waks --to 收件箱 --from 发件箱  --body 邮件内容  --header "Subject:hello" --attach example.doc --server smtp.qq.com -p 25 -au 发件箱 -ap SMTP密
#5.伪造邮件
#--data email.txt //将正常邮件内容保存成TXT文件，再作为正常邮件发出
#发送内容为 email.txt (记得添加文件路经) 里的全部内容
#= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
#先找一分邮件，查看邮件原文，复制里面的内容，存为 .txt
#
#= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#去掉 Received 和 To 两行 （发送时用 --from 和 --to 代替）
#= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#————————————————
#swaks --data ./email.txt --to 收件箱 --from 发件箱 --server smtp.qq.com -p 25 -au 发件箱 -ap SMTP密码
#
MP=RKETZHRKVKTWEWYC
MYATT=/etc/passwd
MYSTM=linuxgz@163.com
MYSERVER=smtp.163.com
FRM="linuxgz@163.com"
STM=$MYSTM
STP=$MP
SMTPSERVER=$MYSERVER
if [ $# -eq 1 ]
then
	DATE=$1
	swaks --date $DATE --to $MYSTM --from $FRM --server $SMTPSERVER -p 25 -au $STM -ap $STP
elif [ $# -eq 2 ]
then
	DATE=$1
	ATTACH=$2
	swaks --data $DATE --attach $ATTACH --to $FRM --from $FRM --server $SMTPSERVER -p 25 -au $STM -ap $STP
else
	
	TOM=$1
	BODY=$2
	HEADER=$3
	ATTACH=$4
	if [ -z $ATTACH ]
	then
		ATTACH=$MYATT
	fi
	swaks --to $TOM --from $FRM --body $BODY --header "Subject:$HEADER" --attach $ATTACH --server $SMTPSERVER -p 25 -au $STM -ap $STP
fi

