#!/bin/bash


Uptime=$(cat /proc/uptime)
Start_time=$(date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S")
echo "你的系统已经运行：$Uptime 秒 ,系统启动时间${Start_time}"

#"输出: 5113396.94 575949.85
#第一数字即是系统已运行的时间5113396.94秒，运用系统工具date即可算出系统启动时间
#date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S"
#输出: 2018-01-02 06:50:52
#--------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#查看/proc/uptime文件计算系统运行时间

Yunxing_time=$(cat /proc/uptime| awk -F. '{run_days=$1 / 86400;run_hour=($1 % 86400)/3600;run_minute=($1 % 3600)/60;run_second=$1 % 60;printf("系统已运行：%d天%d时%d分%d秒",run_days,run_hour,run_minute,run_second)}')
echo ${Yunxing_time}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#输出:系统已运行：1天1时36分13秒
#Linux查看物理CPU个数、核数、逻辑CPU个数
# 总核数 = 物理CPU个数 X 每颗物理CPU的核数 
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数
# 查看物理CPU个数
Cpu_num=$(cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l)
echo "物理CPU ${Cpu_num}个"
# 查看每个物理CPU中core的个数(即核数)
Cpu_cores_num=$(cat /proc/cpuinfo| grep "cpu cores"| uniq)
echo "每个物理CPU中有${Cpu_cores_num}个"

# 查看逻辑CPU的个数
Cpu_luoji_num=$(cat /proc/cpuinfo| grep "processor"| wc -l)
echo "逻辑CPU的个数为 ${Cpu_luoji_num}"

# 查看CPU信息（型号）
Cpu_type=$(cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c)
echo "CPU信息（型号）:${Cpu_type}"
# 输入命令cat /proc/cpuinfo 查看physical id有几个就有几个物理cpu；查看processor有几个就有几个逻辑cpu。

