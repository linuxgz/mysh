#!/bin/bash
# To down a website to a local.
echo 
# wget加上参数之后，即可成为相当强大的下载工具。

#wget命令详解
##
#-r, --recursive（递归） specify recursive download.（指定递归下载）
#
#-k, --convert-links（转换链接） make links in downloaded HTML point to local files.（将下载的HTML页面中的链接转换为相对链接即本地链接）
#
#-p, --page-requisites（页面必需元素） get all images, etc. needed to display HTML page.（下载所有的图片等页面显示所需的内容）
#
#-np, --no-parent（不追溯至父级） don't ascend to the parent directory.
#
#另外断点续传用-nc参数 日志 用-o参数
#
#连接到https://xxx.com/不安全，使用“不检查证书”，后面需加上  --no-check-certificate 即可成功安装
#
#wget -r   -p -np -k -E  http://www.xxx.com 抓取整站
#
#wget -l 1 -p -np -k       http://www.xxx.com 抓取第一级
#
#wget -m -e robots=off -k -E "http://www.abc.net/"
#可以将全站下载以本地的当前工作目录，生成可访问、完整的镜像。
#解释：
#-m  //镜像，就是整站抓取
#-e robots=off   //忽略robots协议，强制、流氓抓取
#-k  //将绝对URL链接转换为本地相对URL
#-E //将所有text/html文档以.html扩展名保存

# SHELL Begin.
# --------------------------------------------

echo "input a web site :"

read DURL

#here declare some needed choice items.
A=Normal
B=Clone


echo "Now you need choose which way to wget ?"
select choices in "$A" "$B"
do
	case $choices in
		"$A")
			echo "wget -r -p -np -k will down a whole site."
			wget -r -p -np -k "$DURL"
			break
			;;
		"$B")
			echo "Begin to clone the websit,it will take long time."
			wget -m -e robots=off -k -E "$DURL"
			break
			;;
		*)
			echo "try again"
	esac
done




