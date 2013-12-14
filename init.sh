#!/bin/sh

# install rgbds
git clone git://github.com/bentley/rgbds.git && \
cd rgbds && \
make && \
sudo mkdir -p /usr/local/man/man{1,7} && \
sudo make install && \
cd .. && \
rm -rf rgbds

# set up the submodule (extras/)
git submodule init && \
git submodule update && \
sudo easy_install pip && \
sudo pip install -r extras/requirements.txt

