#!/bin/bash

# Presumes source file "bowtie2-2.2.6.tar.gz" is present next to this script

# Prerequisites of bowtie2
# TBB
sudo apt-get --yes install libtbb-dev

# Extract and cd to bowtie2 dir
tar -xzvf bowtie2-*.tar.gz
cd bowtie2-*

# Change Makefile to allow custom installation dir
sed -i "s|prefix = /usr/local|prefix = $INSTALL_PATH/bowtie2|" Makefile

# Make and install according to manuals
make WITH_TBB=1
sudo make install

# Back to parent dir
cd ..




