# This script is recommended for Developers. It's a developer tools starter pack.
# Contributor: @DiamondBond
# <INIT>
target=ubuntu_generic_x64
clear

# <ADD REPOS>
sudo add-apt-repository -y ppa:webupd8team/java

# <INDEX UPDATE>
sudo apt-get -y update

# <INSTALL>
#sudo apt-get -y install oracle-java7-installer
sudo apt-get install git git-core gnupg ccache lzop flex bison gperf build-essential zip curl g++-multilib tofrodos python-markdown xsltproc readline-common bzip2 squashfs-tools pngcrush schedtool python
bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip
#sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

# <MORE INSTALL>
mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
echo "export PATH=~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

echo "done!"
sleep 1;
