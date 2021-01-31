#!/usr/bin/env bash

echo "Folder created"
mkdir -p tools

echo "Downloading Quickbms"
wget https://aluigi.altervista.org/papers/quickbms_linux.zip > /dev/null
unzip -o quickbms_linux.zip -d ./tools
chmod +x ./tools/quickbms
rm quickbms_linux.zip

echo "Downloading unluac.jar"
wget https://kumisystems.dl.sourceforge.net/project/unluac/unluacv1.2.2.zip
unzip -o unluacv1.2.2.zip -d ./tools
rm unluacv1.2.2.zip

echo "Downloading luac 5.1 modded"
wget https://github.com/saboteur-team/Saboteur-Xbox360-Patcher/releases/download/luaplus-51/luaplus.zip
unzip -o luaplus.zip -d ./tools
rm luaplus.zip

echo "Downloading Chunkspy"
wget http://files.luaforge.net/releases/chunkspy/chunkspy/ChunkSpy-0.9.8/ChunkSpy-0.9.8.zip
unzip -o ChunkSpy-0.9.8.zip -d ./tools
patch -u ./tools/ChunkSpy-0.9.8/5.1/ChunkSpy.lua -i chunkspy.diff
rm ChunkSpy-0.9.8.zip
