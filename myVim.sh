
#!/bin/bash
# 编辑配置文件前备份被编辑文件在所在文件夹，备份名称以原文件+备份时间精确到秒结尾。
# 格式 myVim 被编辑的文件
datestyle=+%Y-%m-%d-%H-%M-%S
Vim_source_file=$1
Backup_file=${Vim_source_file}-$(date ${datestyle})
cp ${Vim_source_file} ${Backup_file}
vim ${Vim_source_file}

