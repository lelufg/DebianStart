# <INIT>
target=ubuntu_gnome_x64
clear

# <ADD REPOS>
sudo add-apt-repository -y ppa:videolan/stable-daily #VLC
sudo add-apt-repository -y ppa:gnome3-team/gnome3 #Gnome Updates
sudo add-apt-repository ppa:numix/ppa #Numix Theme
sudo add-apt-repository ppa:webupd8team/java #Java

# <EXTRA REPOS>
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb
rm -f getdeb-repository_0.1-1~getdeb1_all.deb
rm -f playdeb_0.3-1~getdeb1_all.deb

# <INDEX UPDATE>
sudo apt-get update

# <INSTALL>
sudo apt-get install vlc audacious #Media
sudo apt-get install ubuntu-restricted-extras #Wide playback support
sudo apt-get install pidgin skype #Social
sudo apt-get install zip unzip rar unrar #Utils
sudo apt-get install build-essential git lzop #Dev Stuffs
sudo apt-get install steam #Gaming client
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle #Numix Project
sudo apt-get install unity-tweak-tool #GTK Control
sudo apt-get install compiz compiz-plugins compizconfig-settings-manager #Compiz
sudo apt-get install filezilla #FTP
#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
#Use the force luke!
sudo apt-get -f install
#Java
sudo apt-get install oracle-java7-installer

# <CONFIG>
#Bash Aliases
echo "# User defined aliases
#alias #template='#template'

# User defined functions
function updateme(){
clear
sleep 3
echo Updating...
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sleep 3
clear
echo Update complete!
}

function cleanmeup(){
clear
sleep 3
echo Cleaning up...
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
sleep 3
clear
echo Cleaned up!
}

function boost(){
clear
sleep 3
echo Boosting...
free -m | sed -n -e '3p' | grep -Po "\d+$"
sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
free -m | sed -n -e '3p' | grep -Po "\d+$"
echo Boosted!
}" >> ~/.bash_aliases

#Reload Bash
source ~/.bashrc

# <REMOVAL>
#Firefox
sudo apt-get remove --purge firefox firefox-globalmenu
rm -rf ~/.mozilla/firefox/
rm -rf ~/.macromedia/ && rm -rf ~/.adobe/
rm -rf /etc/firefox/
rm -rf /usr/lib/firefox/
rm -rf /usr/lib/firefox-addons/
#Media
sudo apt-get remove --purge totem totem-common empathy rhythmbox
#Games
sudo apt-get purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-mahjongg gnome-mines

# <KERNEL>
#PF Kernel - 3.19 but very snappy
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-image-3.19.0-pf3_0_amd64.deb
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-headers-3.19.0-pf3_0_amd64.deb
sudo dpkg -i linux*.deb
rm -f linux*.deb
#For hibernation to work
apt-get install tuxonice-userui

# <UPDATE & CLEANUP>
updateme && cleanmeup

# <END>
clear
echo "Done!"
exit