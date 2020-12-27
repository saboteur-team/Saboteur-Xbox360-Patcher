#!/usr/bin/env bash

echo "Compress started"

rm -fr /tmp/luascripts
cp -r ./luascripts /tmp/luascripts
rm /tmp/run.bat

echo "Generate batch file"
for f in $(find /tmp/luascripts -name '*.lua' ! -iname 'BelleInteriorSceneManager.lua' ! -iname 'AggroSpawner.lua' ! -iname 'CoDSpawner.lua'); do
    windowspath=$(sed 's/\/tmp\/luascripts/d\:/' <<< $f)
    windowspath=$(sed "s/\//\\\/g" <<< $windowspath)
    echo 'D:\luac5.1.exe -o' "\"$windowspath\"" "\"$windowspath\"" >> /tmp/run.bat
done

echo "Execute batch file"
cp ./tools/luac5.1.exe /tmp/luascripts/luac5.1.exe
wine cmd < /tmp/run.bat >> /dev/null
rm /tmp/luascripts/luac5.1.exe

echo "Repackage luap"
cp LuaScripts.luap /tmp/LuaScripts.luap
./tools/quickbms -w -r ./luap-xbox360.bms /tmp/LuaScripts.luap /tmp/luascripts
