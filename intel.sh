wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - && sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - && sudo apt-key add -
sudo apt-get install ttf-ancient-fonts aptdaemon

#32
#wget -O intel-graphics-32.deb https://download.01.org/gfx/ubuntu/14.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.8-0intel1_i386.deb
#sudo dpkg -i intel-graphics-32.deb

#64
wget -O intel-graphics-64.deb https://download.01.org/gfx/ubuntu/14.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.8-0intel1_amd64.deb
sudo dpkg -i intel-graphics-64.deb
