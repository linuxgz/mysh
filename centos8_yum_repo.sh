#!/bin/bash

if [ -f /etc/yum/pluginconf.d/fastestmirror.conf ]; then
sed -i "s|enabled=1|enabled=0|g" /etc/yum/pluginconf.d/fastestmirror.conf
fi


repopath=/etc/yum.repos.d/
yum_centos8_url=https://mirrors.aliyun.com/repo/Centos-8.repo
yum_centos7_urls=https://mirrors.aliyun.com/repo/Centos-7.repo
datestyle=+%Y-%m-%d-%H-%M
centos_num=$(uname -n)
echo "系统版本为 $centos_num " 
bkf_name=backup_$(date ${datestyle})
yumupdate="yum clean all && yum makecache && yum -y update && yum -y upgrade"
mkdir ${repopath}${bkf_name}
backup_path=${repopath}${bkf_name}
if [ -a  ${repopath}*.repo ]; then
	mv ${repopath}*.repo ${backup_path}
fi
echo "已经备份原来的repo文件"
case ${centos_num} in
	CentOS8)	
		curl -o ${repopath}CentOS-Base.repo ${yum_centos8_url}
		echo "正在从阿里下载CentOS8 的yum源 "
	;;
	CentOS7)
		curl -o ${repopath}CentOS-Base.repo ${yum_centos7_url}
		ehco "正在从阿里下载CentOS7的yum源"
	;;
	*)
		echo " 版本信息不对，请查看。"

esac 

eval ${yumupdate}\
&& \
echo "bye++++++++++++++++++++++++++++++++++++++++"
