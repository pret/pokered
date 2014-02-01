#!/bin/sh

# install rgbds
git clone git://github.com/bentley/rgbds.git && \
cd rgbds && \
make && \
mkdir -p /usr/local/man/man{1,7} && \
make install && \
cd .. && \
rm -rf rgbds

# set up the submodule (extras/)
git submodule init && \
git submodule update && \
easy_install pip && \
pip install -r extras/requirements.txt

