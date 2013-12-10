#!/bin/sh

# install rgbds
git clone git://github.com/bentley/rgbds.git && \
cd rgbds && \
make && \
sudo make install && \
cd .. && \
rm -rf rgbds

# set up the submodule (extras/)
git submodule init && \
git submodule update && \
sudo easy_install pip && \
pip install -r extras/requirements.txt

