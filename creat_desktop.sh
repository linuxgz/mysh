#!/bin/bash
echo "input name for the desktop file:"
read FILENAME
touch ~/${FILENAME}.desktop
echo "just touch the ${FILENAME}.desktop at your home dir."
echo " 
[Desktop Entry]
Version=1.0
Type=Application
Name=save_list
Comment=
Icon=
Path=
Terminal=true
StartupNotify=false
" >> ~/${FILENAME}.desktop
echo "input the sh file with full derictions , just like /home/xxx/sss.sh "
read SPH
echo "your input is ${SPH} "
chmod +x ${SPH}
echo "Exec=$SPH" >> ~/${FILENAME}.desktop
echo "if you not root, you will need input your passwd to use the sudo"
sudo mv ~/${FILENAME}.desktop /usr/share/applications/${FILENAME}.desktop \
&& \
sudo ln -s /usr/share/applications/${FILENAME}.desktop ~/${FILENAME}.desktop \
&& \
echo "now well done."

