# <INIT>
target=ubuntu_unity_x64
clear

# <ADD REPOS>
sudo add-apt-repository -y ppa:videolan/stable-daily #VLC
sudo add-apt-repository -y ppa:gnome3-team/gnome3 #Gnome Updates
sudo add-apt-repository -y ppa:numix/ppa #Numix Theme
sudo add-apt-repository -y ppa:webupd8team/java #Java
sudo add-apt-repository ppa:webupd8team/popcorntime #Popcorn Time
sudo add-apt-repository ppa:webupd8team/atom #Text Editor
sudo add-apt-repository ppa:caffeine-developers/ppa # Caffeine

# <EXTRA REPOS>
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb
rm -f getdeb-repository_0.1-1~getdeb1_all.deb
rm -f playdeb_0.3-1~getdeb1_all.deb

# <INDEX UPDATE>
sudo apt-get -y update

# <INSTALL>
sudo apt-get -y install vlc audacious popcorn-time #Media
sudo apt-get -y install ubuntu-restricted-extras #Wide playback support
sudo apt-get -y install pidgin #Social
sudo apt-get -y install zip unzip rar unrar #Utils
sudo apt-get -y install build-essential git lzop valgrind #Dev Stuffs
sudo apt-get -y install steam #Gaming client
sudo apt-get -y install numix-gtk-theme numix-icon-theme numix-icon-theme-circle #Numix Project
sudo apt-get -y install unity-tweak-tool #GTK Control
sudo apt-get -y install compiz compiz-plugins compizconfig-settings-manager #Compiz
sudo apt-get -y install libappindicator3-1 gir1.2-appindicator3-0.1 #Dependancies
sudo apt-get -y install atom caffeine #Text Editor
#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
#Use the force luke!
sudo apt-get -f install
#Java
sudo apt-get -y install oracle-java7-installer

# <CONFIG>
#Bash Aliases
echo "# User defined aliases
#alias #template='#template'

# User defined functions
function updateme(){
clear
sleep 3
echo Updating...
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sleep 3
clear
echo Update complete!
}

function cleanmeup(){
clear
sleep 3
echo Cleaning up...
sudo apt-get -f install
sudo apt-get -y autoremove
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
sudo apt-get -y remove --purge firefox firefox-globalmenu
rm -rf ~/.mozilla/firefox/
rm -rf ~/.macromedia/ && rm -rf ~/.adobe/
rm -rf /etc/firefox/
rm -rf /usr/lib/firefox/
rm -rf /usr/lib/firefox-addons/
#Media
sudo apt-get -y remove --purge totem totem-common empathy rhythmbox
#Games
sudo apt-get -y purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy gnome-mahjongg gnome-mines
#Amazon
sudo apt-get remove --purge unity-webapps-*

# <KERNEL>
#PF Kernel
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-image-4.0.0-pf2_0_amd64.deb
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-headers-4.0.0-pf2_0_amd64.deb
sudo dpkg -i *.deb
rm -f linux*.deb
#For hibernation to work
sudo apt-get -y install tuxonice-userui

# <UPDATE & CLEANUP>
updateme && cleanmeup

# <END>
clear
echo "Done!"
exit
