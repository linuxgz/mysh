#!/bin/bash
# For kali linux source
# 
# set my path for new pc
MYPATH=$MYSHPATH
sudo mv /etc/apt/sources.list /etc/apt/sources.list_backup_by_xgz_$(date '+%Y%m%d%H%M%S')
# sudo echo "# this a backup for the old sources.list, if need you mv the name." >> /etc/apt/sources.list_back_by_xgz
sudo cp $MYPATH/sources.list /etc/apt/sources.list

