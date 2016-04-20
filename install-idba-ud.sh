#!/bin/bash

# Presumes source file "idba-1.1.1.tar.gz" is present next to this script

# Compile from the guide of idba itself
tar -xzvf idba-*.tar.gz
cd idba-*
./configure
make

# Copy binary files to desired location
# make idba folder in INSTALL_PATH
if [ ! -d $INSTALL_PATH/idba ]; then
	sudo mkdir $INSTALL_PATH/idba
fi

# Copy every file in 'bin' to idba folder in destination
sudo cp -r bin $INSTALL_PATH/idba

# Back to parent dir
cd ..
