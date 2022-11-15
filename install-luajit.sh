#!/bin/bash

# Download link: https://luajit.org/download.html

cd LuaJIT-2.1.0-beta3

make
sudo make install
sudo ln -sf luajit-2.1.0-beta3 /usr/local/bin/luajit
