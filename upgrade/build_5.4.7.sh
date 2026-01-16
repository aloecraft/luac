#! /bin/bash
rm -rf .temp .build

mkdir -p .temp
mkdir -p .build
mkdir -p .dist
mkdir -p .dist/v5.4.7

wget -P ./.temp https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar -xf .temp/lua-5.4.7.tar.gz -C .temp

(cd .temp/ && git clone https://github.com/lua/lua.git)
(cd .temp/lua && git checkout v5.4.7)

cp .temp/lua/*.c .build
cp .temp/lua/*.h .build
cp .temp/lua-5.4.7/src/luac.c .build

(cd .build && gcc -O2 -std=c99 -DMAKE_LUAC -o ../.dist/v5.4.7/luac onelua.c -lm)
(cd .build && gcc -O2 -std=c99 -o ../.dist/v5.4.7/lua onelua.c -lm)

chmod +x .dist/v5.4.7/luac
chmod +x .dist/v5.4.7/lua