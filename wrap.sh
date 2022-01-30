#!/bin/bash

# Be careful with this - run it ONCE!

cd wrapped

sudo mv /usr/local/bin/lua /usr/local/bin/_lua
sudo mv /usr/local/bin/luajit /usr/local/bin/_luajit
sudo cp ./lua /usr/local/bin/lua
sudo cp ./luajit /usr/local/bin/luajit
