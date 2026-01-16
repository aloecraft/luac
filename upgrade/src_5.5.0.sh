#! /bin/bash
rm -rf .temp .build

mkdir -p .temp

wget -P ./.temp https://www.lua.org/ftp/lua-5.5.0.tar.gz
tar -xf .temp/lua-5.5.0.tar.gz -C .temp
cp .temp/lua-5.5.0/src/luac.c .