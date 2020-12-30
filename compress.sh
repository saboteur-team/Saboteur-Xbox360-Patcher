#!/usr/bin/env bash

echo "Compress started"

rm -fr /tmp/luascripts
cp -r ./luascripts /tmp/luascripts

rm -fr /tmp/run.bat

echo "Generate batch file"
for f in $(find /tmp/luascripts -name '*.lua' ! -iname 'BelleInteriorSceneManager.lua' ! -iname 'AggroSpawner.lua' ! -iname 'CoDSpawner.lua'); do
    windowspath=$(sed 's/\/tmp\/luascripts/D\:/' <<< $f)
    windowspath=$(sed "s/\//\\\/g" <<< $windowspath)
    echo 'D:\luac5.1.exe -o' "\"$windowspath\"" "\"$windowspath\"" >> /tmp/run.bat
done

echo "Execute batch file to generate lua bytecode"
cp ./tools/luac5.1.exe /tmp/luascripts/luac5.1.exe
wine64 cmd < /tmp/run.bat >> /dev/null
rm /tmp/luascripts/luac5.1.exe

echo "Change the bytecode to Xbox360 system"
for f in $(find /tmp/luascripts -name '*.lua' ! -iname 'BelleInteriorSceneManager.lua' ! -iname 'AggroSpawner.lua' ! -iname 'CoDSpawner.lua'); do
    lua5.1 ./tools/ChunkSpy-0.9.8/5.1/ChunkSpy.lua --auto "$f" --rewrite "saboteur" -o "$f.final"
    mv "$f.final" "$f"
done

echo "Repackage luap"
cp LuaScripts.luap /tmp/LuaScripts.luap
./tools/quickbms -w -r ./luap-xbox360.bms /tmp/LuaScripts.luap /tmp/luascripts
