#!/bin/bash

sudo luarocks install luasec
sudo luarocks install luasocket
sudo luarocks --lua-version=5.4 install luasec
sudo luarocks --lua-version=5.4 install luasocket

luarocks list
luarocks --lua-version=5.4 list