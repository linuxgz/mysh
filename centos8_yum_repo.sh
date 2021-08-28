#!/bin/bash

if [ -f /etc/yum/pluginconf.d/fastestmirror.conf ]; then
sed -i "s|enabled=1|enabled=0|g" /etc/yum/pluginconf.d/fastestmirror.conf
fi

repopath=/etc/yum.repos.d/
yumurl=https://mirrors.aliyun.com/repo/Centos-8.repo
datestyle=+%Y-%m-%d-%H-%M
bkf_name=backup_$(date ${datestyle})
yumupdate="yum clean all && yum makecache && yum -y update && yum -y upgrade"
mkdir ${repopath}${bkf_name}
backup_path=${repopath}${bkf_name}
mv ${repopath}*.repo ${backup_path}
curl -o ${repopath}CentOS-Base.repo ${yumurl} \
&& \
eval ${yumupdate}\
&& \
echo "bye++++++++++++++++++++++++++++++++++++++++"