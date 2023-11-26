#!/usr/bin/env bash
set -e

echo "Usage: ./patch-all.sh [build number]"

export PATCHER="flash-patcher"
export SWF_FILE_PATH="."

# Dynamically update the build number
rm -rf noncheat/add-build-number.patch

touch noncheat/add-build-number.patch
echo "# Add the build number to the hack. Required for speedrun timer and input display." >> noncheat/add-build-number.patch
echo "add frame_1/DoAction.as end" >> noncheat/add-build-number.patch
echo "begin-patch" >> noncheat/add-build-number.patch
echo "_root.build_number = $1;" >> noncheat/add-build-number.patch
echo "end-patch" >> noncheat/add-build-number.patch

# Patch all hacks
$PATCHER --inputswf $SWF_FILE_PATH/SMF_Base_Hack.swf --folder . --stagefile fullgame.stage --outputswf SMF-Fullgame-Build-$1.swf --invalidateCache

echo "Patched SMF Fullgame hack"
