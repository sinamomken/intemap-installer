#!/bin/bash

# Presumes source file "abyss-1.9.0.tar.gz" is present next to this script

# Installation of prerequisites
# boost
# sparsehash
# openmpi
sudo apt-get --yes install libboost-all-dev sparsehash libopenmpi-dev

# Prerequisites for compile of abyss itself
sudo apt-get --yes install autoconf automake libsqlite3-dev

# Extract and cd to abyss dir
tar -xzvf abyss-*.tar.gz
cd abyss-*

# Compile & install commands according to README.md
./configure --prefix=$INSTALL_PATH/abyss --with-mpi=/usr/lib/openmpi
make
sudo make install

# Back to parent dir
cd ..

