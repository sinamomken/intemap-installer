#!/bin/bash

# Presumes source file "wgs-8.3rc2.tar.bz2" is present next to this script

# Installation of prerequisite packages for kmer & wgs
sudo apt-get --yes install libbz2-dev python-dev zlib1g-dev

# Compile according to README of wgs
bzip2 -dc wgs-*.tar.bz2 | tar -xf -
cd wgs-*
cd kmer && make install && cd ..
cd src && make && cd ..

# Copy binary files to desired location
# make wgs folder in INSTALL_PATH
if [ ! -d $INSTALL_PATH/wgs ]; then
	sudo mkdir $INSTALL_PATH/wgs
fi

# Copy bin folders to wgs folder in destination
sudo cp -r kmer $INSTALL_PATH/wgs
sudo cp -r Linux-amd64 $INSTALL_PATH/wgs

# Back to parent dir
cd ..
