#!/bin/bash
# LANG=zh_CN.UTF-8
# ##################################################################
# 2021年 09月 25日 星期六 13:08:17 CST
# Written by:xgz
# FileName:markdown.sh 
# Usage:
# Contact me by linuxgz@163.com
# ##################################################################
      function taocl() {
        curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README-zh.md|
          pandoc -f markdown -t html |
          iconv -f 'utf-8' -t 'unicode' |
          xmlstarlet fo --html --dropdtd |
          xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
          xmlstarlet unesc | fmt -80
      }
function taocl
