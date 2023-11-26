#!/usr/bin/env bash
set -e

input="sm63.swf"

echo "Patching base SWF..."
flash-patcher --inputswf $input --folder patches --stagefile base.stage --output output/base.swf --xml

echo "Patching in MROM code..."
flash-patcher --inputswf output/base.swf --folder patches --stagefile inject.stage --output output/MushROM.swf

echo "Build complete! SWF saved to output/MushROM.swf"
