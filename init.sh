#!/bin/sh

# install rgbds
git clone git://github.com/bentley/rgbds.git && \
cd rgbds && \
make && \
mkdir -p /usr/local/man/man1 && \
mkdir -p /usr/local/man/man7 && \
sudo make install && \
cd .. && \
rm -rf rgbds

# set up the submodule (extras/)
git submodule init && \
git submodule update && \
sudo easy_install pip && \
sudo pip install -r extras/requirements.txt

