# Suite to patch the LuaScripts.luap of The Saboteur for Xbox360

## Requirements

* Linux
* quickbms
* unluac.jar
* luac5.1.exe
* wine

## How works

Run the `install.sh` to download all the utils except `wine` that need to be installed on your machine.  
Next step is to add a new unit in wine, so `winecfg` in your terminal, go on Units and add `D:\` and as path `/tmp/luascripts`.  
Place your `LuaScripts.luap` file inside this folder.  

### Decompress.sh

This script automatically will extract all the content and generate the original Lua scripts in a `luascripts` folder.

### Compress.sh

This script will repackage everything.

### Upload.sh

This script will automatically upload the file patched to the Xbox360, require changing of path and ftp data.  
It will do also a backup inside the Xbox360.