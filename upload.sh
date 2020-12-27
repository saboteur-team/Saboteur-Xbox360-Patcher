#!/usr/bin/env bash 

HOST="192.168.178.28"
USER="xboxftp"
PASS="xboxftp"
# \ is require because it is a space
REMOTEPATH="/Hdd1/Games/The\ Saboteur"

cd /tmp
ftp -z nossl -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASS
cd $REMOTEPATH
rename LuaScripts.luap LuaScripts.luap.orig
put LuaScripts.luap 
quit
END_SCRIPT
