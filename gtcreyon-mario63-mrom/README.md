# MushROM
## Overview
MushROM is a mod for Super Mario 63 that implements a range of cheats to facilitate experimentation and research. It is a spiritual successor to the [SM63 Practice Hack](https://github.com/KevinKib/SM63PracticeHack).

## Build
### Requirements
- An internet connection, or a copy of Riley's SWF Patcher
- A Linux terminal; Windows is currently not supported
- The contents of this repository
- A copy of the 2009 version of Super Mario 63; 2012 is currently not supported.

### First build
To patch MROM into an existing SWF for the first time, run this command:

```build.sh -i <path-to-2009-swf>```

Replace `<path-to-2009-swf>` with the file path of your copy of the SWF file for the game. This will build and patch MROM and place it in the `output` folder.

### Subsequent builds
If you have already built MROM once, some permanent data is cached. This means you no longer need your original copy of the game to compile changes to MROM's source code. Simply run the `build.sh` script without the `-i` option.

## Credits
- [Riley's SWF Patcher](https://github.com/rayyaw/flash-patcher), downloaded during the patching process, was written by [RileyTech](https://github.com/rayyaw).
- Original Practice Hack written by [Sekanor](https://github.com/KevinKib). Code and ideas were carried over in places.