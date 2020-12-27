#!/usr/bin/env bash


rm -fr /tmp/luascripts
./tools/quickbms -e ./luap-xbox360.bms ./LuaScripts.luap ./luascripts

echo "Decompression started"
for f in $(find ./luascripts -name '*.lua' ! -iname 'BelleInteriorSceneManager.lua' ! -iname 'AggroSpawner.lua' ! -iname 'CoDSpawner.lua'); do
    java -jar ./tools/unluac.jar $f > $f.clean
    rm $f
    mv $f.clean $f
done
echo "Decompression finished"
