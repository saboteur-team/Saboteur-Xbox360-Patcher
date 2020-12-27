#!/usr/bin/env bash

echo "Folder created"
mkdir -p tools

echo "Downloading Quickbms"
wget https://aluigi.altervista.org/papers/quickbms_linux.zip > /dev/null
unzip quickbms_linux.zip -d ./tools
chmod +x ./tools/quickbms
rm quickbms_linux.zip

echo "Downloading unluac.jar"
wget https://kumisystems.dl.sourceforge.net/project/unluac/unluacv1.2.2.zip
unzip unluacv1.2.2.zip -d ./tools
rm unluacv1.2.2.zip

echo "Downloading luac5.1.exe"
wget https://netcologne.dl.sourceforge.net/project/luabinaries/5.1.5/Tools%20Executables/lua-5.1.5_Win32_bin.zip
unzip lua-5.1.5_Win32_bin.zip -d ./tools
rm lua-5.1.5_Win32_bin.zip
