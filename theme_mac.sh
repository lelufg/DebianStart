# <REPOS>
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/apps
sudo add-apt-repository ppa:docky-core/ppa

# <UPDATE>
sudo apt-get update

# <INSTALL>
sudo apt-get install mbuntu-y-ithemes-v4
sudo apt-get install mbuntu-y-icons-v4
sudo apt-get install slingscold
sudo apt-get install indicator-synapse
sudo apt-get install docky
sudo apt-get install mbuntu-y-docky-skins-v4
sudo apt-get install mbuntu-y-bscreen-v4
sudo apt-get install unity-tweak-tool
sudo apt-get install libreoffice-style-sifr
sudo apt-get install mbuntu-y-lightdm-v4

# <CONFIG>
cd && wget -O Wallpapers.zip http://drive.noobslab.com/data/Mac-14.10/MBuntu-Wallpapers.zip

cd && wget -O Mac.po http://drive.noobslab.com/data/Mac-14.10/change-name-on-panel/mac.po
cd /usr/share/locale/en/LC_MESSAGES; sudo msgfmt -o unity.mo ~/Mac.po;rm ~/Mac.po;cd

cd && wget -O config.sh http://drive.noobslab.com/data/Mac-14.10/config.sh
chmod +x config.sh;./config.sh

sudo xhost +SI:localuser:lightdm
sudo su lightdm -s /bin/bash
gsettings set com.canonical.unity-greeter draw-grid false;exit
sudo mv /usr/share/unity-greeter/logo.png /usr/share/unity-greeter/logo.png.backup
cd;wget -O logo.png http://drive.noobslab.com/data/Mac-14.10/ubuntu_logo.png
sudo mv logo.png /usr/share/unity-greeter/;gsettings set com.canonical.unity-greeter draw-grid false

wget -O launcher_bfb.png http://drive.noobslab.com/data/Mac-14.10/launcher-logo/apple/launcher_bfb.png
sudo mv launcher_bfb.png /usr/share/unity/icons/

wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac-14.10/macfonts.zip
sudo unzip mac-fonts.zip -d /usr/share/fonts; rm mac-fonts.zip
sudo fc-cache -f -v

echo "Heres your MAC with xtra cheese :P"
