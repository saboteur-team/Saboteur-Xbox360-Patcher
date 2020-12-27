#!/usr/bin/env bash

if [ ! -d "./luascripts" ]; then
    ./tools/quickbms -e ./luap-xbox360.bms ./LuaScripts.luap ./luascripts
fi

echo "Decompression started"
for f in $(find ./luascripts -name '*.lua' ! -iname 'BelleInteriorSceneManager.lua' ! -iname 'AggroSpawner.lua' ! -iname 'CoDSpawner.lua'); do
    java -jar ./tools/unluac.jar $f > $f.clean
    rm $f
    mv $f.clean $f
done
echo "Decompression finished"
