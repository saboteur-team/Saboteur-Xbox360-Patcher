# Suite to patch the LuaScripts.luap of The Saboteur for Xbox360

To more information check the article on [my website](https://daniele.tech/2020/12/reverse-engineering-the-saboteur-game-for-xbox360-with-linux/).

## Requirements

* Linux
* quickbms - Unpacker/packer with custom scripting language
* unluac.jar - Generate Lua code from Luac bytecode
* luac5.1.exe - generate Lua Bytecode from Lua scripts
* wine - Run windows tools on Linux

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