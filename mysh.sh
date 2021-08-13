#!/bin/bash
# set MYSHPATH

# MYSHPATH=$(pwd)

# -----------------------------
# SHELL Begin
# show needed info for your new.
echo "Show the basic info you need know"
echo $SHELL
echo $(pwd)
echo $(who)
echo "--------------------------------"

# build your own shell.
echo "add your own alias to this shell"
SH1=bash
SH2=zsh
select SHN in "$SH1" "$SH2"
do
	case $SHN in
		"$SH1")
			echo "now add your alias to bash"
			. $MYSHPATH/add_my_aliases_to_bash
			break
			;;
		"$SH2")
			echo "now add your aliases to zsh"
			. $MYSHPATH/add_my_aliases_to_zsh
			break
			;;
		*)
			echo "wrong"
	esac
done











# no1, impertant update sources.list
# sudo bash $MYSHPATH/change_sources_list.sh

# update & upgrade
# bash $MYSHPATH/update_upgrade.sh

# install google pinyin
# sudo bash $MYSHPATH/apt-get_install_fcitx_googlepinyin

# 
