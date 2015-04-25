# <INIT>
target=ubuntu_x64
clear

# <ADD REPOS>
sudo add-apt-repository ppa:bumblebee/stable -y

# <INDEX UPDATE>
sudo apt-get update

# <INSTALL>
sudo apt-get install bumblebee #Bumblebee 
sudo apt-get install nvidia-331 #Nvidia Drivers, Nvidia Settings & Primus

# <EXTRA>
#Config:
echo "and add the modify as follows:
[bumblebee] section: after "Driver=" insert "nvidia"
[nvidia-driver] section: after "KernelDriver=" insert "nvidia-XXX"
[nvidia-driver] section: after "LibraryPath=" insert "/usr/lib/nvidia-XXX, /usr/lib/nvidia-XXX:/usr/lib32/nvidia-XXX"
[nvidia-driver] section: after "XorgModulePath=" insert "/usr/lib/nvidia-XXX/xorg,/usr/lib/xorg/modules"
Where XXX is the nvidia driver you have installed, for example: nvidia-331.
In the terminal, nano should have started, go and edit as said above now.
When finished press CTRL+O and ENTER to save then CTRL+X to exit." >> ~/Desktop/nvoptions.txt
#Show Config
xdg-open ~/Desktop/nvoptions.txt
#Edit
sudo nano /etc/bumblebee/bumblebee.conf

#Post-Config
sudo service bumblebeed restart

#<REMOVAL>
rm -rf ~/Desktop/nvoptions.txt

# <END>
clear
echo "Done!"
exit
