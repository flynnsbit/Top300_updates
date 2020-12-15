# MiSTer eXoDOS Top_300_updates
AO486 Update scripts for the flynnsbit eXoDOS V5.0 Top 300 Pack

## How to Install and Update
1. ssh to your MiSTer
2. cd /media/fat/Scripts
3a. wget https://raw.githubusercontent.com/flynnsbit/Top300_updates/main/_mister/AO486_Update_Top300_Pack.sh or 
3b._(Optional Install Process)_ Download this [ZIP file](https://github.com/flynnsbit/Top300_updates/raw/main/_mister/AO486_Update_Top300_Pack.zip) and extract `AO486_Update_Top300_Pack.sh` to your `/Scripts` folder on your primary SD card.

4. Turn on your __MiSTer__, go to the _Scripts_ menu and run this script from there. This will download the latest Top 300 Pack release with any fixes to games, new features, and updated programs from this github.  It will auto mount your VHD pack, update it, and clean up any temp folders.

5. Launch the AO486 core as you normally do with the Top 300 pack VHDs mounted.

-------------------------------------------------------------------------------------------------------

## More info:
Initial pack generated using ExoDOSConverter MiSTer option:  https://github.com/Voljega/ExoDOSConverter

Future updates to the pack are contained in the flynnsbit repo: https://github.com/flynnsbit/Top300_updates

## Version History
v.0.7.1 Fixes for Lemmings Floppy+others, Descent MIDI should finally be fixed, Dune 2 SB+MIDI options, 1830 sound fix, Lemmings 2 problem solved by turning off L1 cache, TDL updated to use ! for favorites in the pack, favicon option in the tdl.ini. Changed AO486 Updater script to push all files for now.

v.6 update all scripts to use jchoice for pause and choice commands.

v.5 jchoice changes

v.4 Changes to update script to allow for updates at root level of VHD.

v.3 updates for auto updater script for future releases, Descent General MIDI Fix, Launcher Joystick support, Choice and Pause Joystick support, and full pack updater script for the Mister to auto mount the vhd and update it in one step.

v.2 Game fixes for Dune and Dune CD, PGA Golf 486, Star Control 2, BioForge, Warcraft 2, and Xwing.

v.1 Initial pack which matches the full download from Archive or other sources
