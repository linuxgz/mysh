#!/bin/bash
# update git mysh 
cd ~/mysh \
&& \
git add * \
&& \
git commit -a -m "save them" \
&& \
git push git@github.com:linuxgz/mysh master

