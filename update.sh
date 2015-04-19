# <INIT>
target=ubuntu_gnome_x64
clear

# <ADD REPOS>
sudo add-apt-repository -y ppa:videolan/stable-daily #VLC
sudo add-apt-repository -y ppa:gnome3-team/gnome3 #Gnome Updates
sudo add-apt-repository ppa:linrunner/tlp #Battery savings
sudo add-apt-repository ppa:caffeine-developers/ppa #Caffeine

# <INDEX UPDATE>
sudo apt-get update

# <INSTALL>
sudo apt-get install vlc audacious #Media
sudo apt-get install ubuntu-restricted-extras #Wide playback support
sudo apt-get install pidgin skype #Social
sudo apt-get install compiz compizconfig-settings-manager compiz-plugins #Desktop Effects
sudo apt-get install tlp #Improve battery life
sudo apt-get install zip unzip rar unrar #Utils
sudo apt-get install build-essential git lzop #Dev Stuffs
sudo apt-get install bleachbit #CCleaner
sudo apt-get install caffeine #Caffeine

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
sudo apt-get purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy

# <END>
clear
echo "Done!"
exit
