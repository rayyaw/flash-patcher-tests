#!/usr/bin/env bash
set -e

echo "Flash Patcher Integration Test Runner."

# Super Mario 63 - MushROM
echo "Running Super Mario 63 - MushROM integration test."
cd gtcreyon-mario63-mrom
./build.sh

echo "Verifying Super Mario 63 - MushROM files."

b2sum -c B2SUM
cd ..
echo "Super Mario 63 - MushROM patching was successful."

# Super Mario Flash - Fullgame Hack
echo "Running Super Mario Flash - Fullgame Hack integration test."
echo "This test should take about 30 seconds."
cd rayyaw-marioflash-fullgame && ./patch-all.sh 19

echo "Verifying Super Mario Flash - Fullgame Hack files."
diff SMF_Reference_Output.swf SMF-Fullgame-Build-19.swf
cd ..
echo "Super Mario Flash - Fullgame Hack patching was successful."
