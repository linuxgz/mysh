#!/bin/bash

if [ -f /etc/yum/pluginconf.d/fastestmirror.conf ]; then
sed -i "s|enabled=1|enabled=0|g" /etc/yum/pluginconf.d/fastestmirror.conf
fi


repopath=/etc/yum.repos.d/
yum_centos8_url=https://mirrors.aliyun.com/repo/Centos-8.repo
yum_centos7_url=https://mirrors.aliyun.com/repo/Centos-7.repo
datestyle=+%Y-%m-%d-%H-%M
var=$(cat /etc/redhat-release)
centos_num=${var:21:1}
echo "系统版本为 $var " 
bkf_name=backup_$(date ${datestyle})
yumupdate="yum clean all && yum makecache && yum -y update && yum -y upgrade"
mkdir ${repopath}${bkf_name}
backup_path=${repopath}${bkf_name}

mv ${repopath}*.repo ${backup_path} 2>/dev/null
echo "已经备份原来的repo文件"

case ${centos_num} in
        8)
                echo "正在从阿里下载CentOS8 的yum源 "
                curl -o ${repopath}CentOS-Base.repo ${yum_centos8_url}
        ;;
        7)
                echo "正在从阿里下载CentOS7的yum源"
                curl -o ${repopath}CentOS-Base.repo ${yum_centos7_url}
        ;;
        *)
                echo " 版本信息不对，请查看。"
esac 
echo "开始清理yum缓存,建立新缓存,升级库,升级软件>>>>>>"
eval ${yumupdate}\
&& \
echo "bye++++++++++++++++++++++++++++++++++++++++"
