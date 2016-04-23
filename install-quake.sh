#!/bin/bash

## 1- Install JellyFish:
# Presumes source file "jellyfish-2.2.4.tar.gz" is present next to this script

# Extract and cd to jellyfish dir
tar -xzvf jellyfish-*.tar.gz
cd jellyfish-*

# Compile & install commands according to README of jellyfish
./configure --prefix=$INSTALL_PATH/jellyfish
make
sudo make install

# Back to parent dir
cd ..

## 2- Install Quake itself:
# Presumes source file "quake-0.3.5.tar.gz" is present next to this script

# Prerequisites of Quake
# boost
# jellyfish
# R
# R VGAM
# openmp
sudo apt-get --yes install libboost-all-dev r-base r-cran-vgam libopenmpi-dev

# Extract and cd to quake dir
tar -xzvf quake-*.tar.gz
cd Quake/src

# Change 2nd line of makefile of Quake
sed -i '2s|.*|CFLAGS=-O3 -fopenmp -I/usr/include/boost/ -I.|' Makefile

# Simple compile according to README
make

# make quake folder in INSTALL_PATH
if [ ! -d $INSTALL_PATH/quake ]; then
	sudo mkdir $INSTALL_PATH/quake
fi

# cp bin files into $INSTALL_PATH/quake
cd ..
sudo cp -r * $INSTALL_PATH/quake

# Make symlink of jellyfish to quake
sudo ln -s $INSTALL_PATH/jellyfish/bin/jellyfish $INSTALL_PATH/quake/bin

# Back to parent dir
cd ..

