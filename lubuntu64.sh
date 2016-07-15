# This script works better on Lubuntu x64 arch. 
# Contributor: @luca020400
# <INIT>
target=lubuntu_x64
clear

# <ADD REPOS>
sudo add-apt-repository -y ppa:videolan/stable-daily #VLC
sudo add-apt-repository -y ppa:webupd8team/popcorntime #Popcorn Time
sudo add-apt-repository -y ppa:webupd8team/atom #Text Editor
sudo add-apt-repository -y ppa:caffeine-developers/ppa # Caffeine
sudo add-apt-repository -y ppa:atareao/atareao #Touchpad Indicator
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make #Ubuntu Make

# <INDEX UPDATE>
sudo apt-get -y update

# <INSTALL>
sudo apt-get -y install vlc popcorn-time #Media
sudo apt-get -y install ubuntu-restricted-extras #Wide playback support
sudo apt-get -y install zip unzip rar unrar #Utils
sudo apt-get -y install build-essential git lzop valgrind #Dev Stuffs
sudo apt-get -y install atom #Text Editor
sudo apt-get -y install caffeine touchpad-indicator
#Skype
wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
rm -f skype-ubuntu-precise_4.3.0.37-1_i386.deb
#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
#Use the force luke!
sudo apt-get -f install

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
}

function imgur() {
    for i in "$@"; do
        curl -# -F "image"=@"$i" -F "key"="4907fcd89e761c6b07eeb8292d5a9b2a" imgur.com/api/upload.xml|\
        grep -Eo '<[a-z_]+>http[^<]+'|sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\x1B[0;34m\1:\x1B[0m /'
    done
}

function screenshot() {
gnome-screenshot -d 10
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
sudo apt-get -y remove --purge gnome-mplayer

# <KERNEL>
#PF Kernel
cd ~/Downloads/
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-image-4.0.0-pf2_0_amd64.deb
wget http://77.244.44.75/debian/dists/testing/main/binary-amd64/linux-headers-4.0.0-pf2_0_amd64.deb
sudo dpkg -i *.deb
#rm -f linux*.deb
cd ~/
#For hibernation to work
sudo apt-get -y install tuxonice-userui

# <UPDATE & CLEANUP>
updateme && cleanmeup

# <END>
clear
echo "Done!"
exit
