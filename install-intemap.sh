#!/bin/bash

# installation of base required utilites or skipping them if already installed:
# bzip2
# build-essentials including make, gcc, g++, etc.
sudo apt-get --yes install bzip2 build-essential

# Binaries installation path and mkdiring it
INSTALL_PATH=/opt/bioinformatics
if [ ! -d $INSTALL_PATH ]; then
	sudo mkdir $INSTALL_PATH
fi
export INSTALL_PATH

# install idba-ud
./install-idba-ud.sh

# install cabog
./install-cabog.sh

# install abyss
./install-abyss.sh

# install quake
./install-quake.sh


# Including $INSTALL_PATH dirs in $PATH

