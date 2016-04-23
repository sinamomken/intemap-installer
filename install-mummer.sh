#!/bin/bash

# Presumes source file "MUMmer3.23.tar.gz" is present next to this script

# Prerequisites of MUMmer
# csh
sudo apt-get --yes install csh

# Extract and cd to mummer dir
tar -xzvf MUMmer*.tar.gz
cd MUMmer*

# make installation dirs
if [ ! -d $INSTALL_PATH/mummer ]; then
	sudo mkdir $INSTALL_PATH/mummer
fi

if [ ! -d $INSTALL_PATH/mummer/aux_bin ]; then
	sudo mkdir $INSTALL_PATH/mummer/aux_bin
fi

# change 2 config lines in Makeflie
sed -i "s|BIN_DIR     := \$(TOP_DIR)|BIN_DIR     := $INSTALL_PATH/mummer|" Makefile

sed -i 's|AUX_BIN_DIR := \$(TOP_DIR)/aux_bin|AUX_BIN_DIR := $(BIN_DIR)/aux_bin|' Makefile

# Compile and install mummer according to INSTALL manual
make check
sudo make install

# Back to parent dir
cd ..


