# init script for ubuntu 14.04.02 by Diamond Bond

# repos
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:nrbrtx/sysvinit-backlight
sudo apt-add-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:caffeine-developers/ppa
sudo add-apt-repository -y ppa:eugenesan/ppa

echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -

# update repo index
sudo apt-get update 

# install apps
#recommended
sudo apt-get install synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager bleachbit openjdk-7-jre oracle-java8-installer flashplugin-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libswscale-extra-2 ubuntu-restricted-extras ubuntu-wallpapers*
#post installation triggers
sudo /usr/share/doc/libdvdread4/install-css.sh
#personal
sudo apt-get install git unity-tweak-tool gnome-tweak-tool pidgin transmission tlp tlp-rdw icedtea-7-plugin openjdk-7-jre steam grub-customizer zsh caffeine smartgit smartgithg
#compiz
sudo apt-get install compiz compizconfig-settings-manager compiz-plugins
#intel backlight fix
#sudo apt-get install sysvinit-backlight
#numix theme
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# upgrade
#sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# privacy from ubuntu
#sudo apt-get remove unity-lens-shopping
gsettings set com.canonical.Unity.Lenses remote-content-search none;
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
#echo -e "\n127.0.0.1 productsearch.ubuntu.com" | sudo tee -a /etc/hosts >/dev/null;
sudo apt-get remove unity-lens-friends unity-lens-gdocs unity-lens-vm unity-lens-video unity-lens-music unity-lens-photos unity-lens-shopping unity-lens-photo unity-lens-gwibber unity-lens-help unity-lens-sshsearch
#sudo apt-get remove unity-lens-files

# disable daily cron scheduled updates
sudo chmod -x /etc/cron.daily/mlocate

# debloating
#firefox
sudo apt-get purge firefox firefox-globalmenu
sudo apt-get purge rhythmbox
rm -rf ~/.mozilla/firefox/
rm -rf ~/.macromedia/ && rm -rf ~/.adobe/
rm -rf /etc/firefox/
rm -rf /usr/lib/firefox/
rm -rf /usr/lib/firefox-addons/
#media
sudo apt-get remove totem-common empathy
sudo apt-get install audacious vlc

# disable overlay scrollbars
gsettings set com.canonical.desktop.interface scrollbar-mode normal

# clean up
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

echo "done!"
exit
