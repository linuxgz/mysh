#!/bin/bash

echo "
###########################################################
"
echo " it may take long time to finish."
sudo apt update \
&& \
sudo apt upgrade -y \
&& sudo apt full-upgrade -y \
|| sudo  apt --fix-broken install -y \
&& \
sudo apt autoremove \
&& \
echo "well done"


#expect eof

# sudo apt-get update && sudo apt-get upgrade -y

# apt-get upgrade #更新已经安装的软件
# aptitude safe-upgrade

# apt-get dist-upgrade # 升级系统
# aptitude full-upgrade # same
