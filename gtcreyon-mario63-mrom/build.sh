#!/usr/bin/env bash
set -e

input="sm63.swf"

mkdir -p .mrom-cache # No error if folder exists
mkdir -p ./output

echo "Patching base SWF..."
flash-patcher --inputswf $input --folder patches --stagefile base.stage --output .mrom-cache/base.swf --xml

echo "Building core script..."
python build_core.py -o .mrom-cache/core.as -d output/help.md

echo "Patching in MROM code..."
flash-patcher --inputswf output/base.swf --folder patches --stagefile inject.stage --output output/MushROM.swf

echo "Build complete! SWF saved to output/MushROM.swf"
