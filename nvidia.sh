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
#Config:
echo "and add the modify as follows:
[bumblebee] section: after "Driver=" insert "nvidia"
[nvidia-driver] section: after "KernelDriver=" insert "nvidia-XXX"
[nvidia-driver] section: after "LibraryPath=" insert "/usr/lib/nvidia-XXX, /usr/lib/nvidia-331-updates:/usr/lib32/nvidia-XXX"
[nvidia-driver] section: after "XorgModulePath=" insert "/usr/lib/nvidia-XXX/xorg,/usr/lib/xorg/modules"
Where XXX is the nvidia driver you have installed, in the example: nvidia-331.
In the terminal, nano should have started, go and edit as said now." >> ~/Desktop/nvoptions.txt
#Show Config
xdg-open ~/Desktop/nvoptions.txt
#Edit
sudo nano /etc/bumblebee/bumblebee.conf

#Post-Config
sudo service bumblebeed restart

#<REMOVAL>
rm -rf ~/Desktop/options.txt

# <END>
clear
echo "Done!"
exit
