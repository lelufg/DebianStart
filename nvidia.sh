# <INIT>
target=ubuntu_gnome_x64
clear

# <ADD REPOS>
sudo add-apt-repository ppa:bumblebee/stable -y #Bubmblebee & Drivers

# <INDEX UPDATE>
sudo apt-get update

# <REMOVAL>
sudo apt-get purge nvidia* bumblebee*

# <INSTALL>
sudo apt-get install bumblebee #Bumblebee 
sudo apt-get install nvidia-331primus #Nvidia Drivers

# <EXTRA>
#Config
sudo nano /etc/bumblebee/bumblebee.conf
#Post-Config
sudo service bumblebeed restart

# <END>
clear
echo "Done!"
exit
