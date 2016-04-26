#!/bin/bash

## Installation of base required utilites or skipping them if already installed:
# bzip2
# build-essentials including make, gcc, g++, etc.
sudo apt-get --yes install bzip2 build-essential

# Binaries installation path and mkdiring it
INSTALL_PATH=/opt/bioinformatics
if [ ! -d $INSTALL_PATH ]; then
	sudo mkdir $INSTALL_PATH
fi
export INSTALL_PATH

## Installation of dependency tools

# install idba-ud
./install-idba-ud.sh

# install cabog
./install-cabog.sh

# install abyss
./install-abyss.sh

# install quake
./install-quake.sh

# install mummer
./install-mummer.sh

# install bowtie2
./install-bowtie2.sh

## Compile and installation of InteMAP itself according to InteMAP_Manual.pdf
# Extract and cd to InteMAP dir
tar -xzvf InteMAP*.tar.gz
cd InteMAP*

# Compile
cd src/mergeassembly
make
cd ../../
make
chmod +x runInteMAP.py

# Install (copy of files)
if [ ! -d $INSTALL_PATH/intemap ]; then
	sudo mkdir $INSTALL_PATH/intemap
fi
sudo cp -r * $INSTALL_PATH/intemap
cd ..

## Including $INSTALL_PATH bin dirs to $PATH
ADD_TO_PATH="$INSTALL_PATH/abyss/bin/:$INSTALL_PATH/bowtie2/bin/:$INSTALL_PATH/idba/bin/:$INSTALL_PATH/intemap/:$INSTALL_PATH/jellyfish/bin/:$INSTALL_PATH/mummer/:$INSTALL_PATH/mummer/aux_bin/:$INSTALL_PATH/quake/bin/:$INSTALL_PATH/wgs/Linux-amd64/bin/"

grep -q "PATH=\$PATH:$INSTALL_PATH/.*" /etc/profile && sudo sed -i "s|PATH=\$PATH:$INSTALL_PATH/.*|PATH=\$PATH:$ADD_TO_PATH|" /etc/profile  ||  echo "PATH=\$PATH:$ADD_TO_PATH" | sudo tee -a /etc/profile


