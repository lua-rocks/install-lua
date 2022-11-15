#!/bin/bash

# Download link: https://github.com/luarocks/luarocks/wiki/Download

cd luarocks-3.9.1

./configure --force-config --lua-version=5.4
make
sudo make install

./configure --force-config
make
sudo make install
