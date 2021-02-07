# MiSTer eXoDOS Top_300_updates
AO486 Update scripts for the flynnsbit eXoDOS V5.0 Top 300 Pack.  This is not the actual pack and only provides updatse to the scripts, ini files, and launcher fixes.  There is no copywrite material here.

## How to Install and Update
1. ssh to your MiSTer

2. cd /media/fat/Scripts

3. wget https://raw.githubusercontent.com/flynnsbit/Top300_updates/main/_mister/AO486_Update_Top300_Pack.sh or 

4. _(Optional Install Process)_ Download this [ZIP file](https://github.com/flynnsbit/Top300_updates/raw/main/_mister/AO486_Update_Top300_Pack.zip) and extract `AO486_Update_Top300_Pack.sh` to your `/Scripts` folder on your primary SD card.

5. Turn on your __MiSTer__, go to the _Scripts_ menu and run this script from there. This will download the latest Top 300 Pack (updates only, base VHD required before updating) release with any fixes to games, new features, and updated programs from this github.  It will auto mount your VHD pack, update it, and clean up any temp folders.

6. Launch the AO486 core as you normally do with the Top 300 pack VHDs mounted.

-------------------------------------------------------------------------------------------------------

## More info:
Initial pack generated using ExoDOSConverter MiSTer option:  https://github.com/Voljega/ExoDOSConverter

Future updates to the pack are contained in the flynnsbit repo: https://github.com/flynnsbit/Top300_updates

## Version History

v.0.7.2
Updater AO486 Top 300 pack update script for Mister:
One step process to pull down the latest release changes from github and push the changes to the VHDs.


Updates to the AO486 DOS Launcher:
Full mouse support
Joystick Support (analog and digital)
Joystick support for pause, Coverart/Game Description/About
Joystick and mouse support for Choice allowing for selection of the sound choice using joystick, mouse, or arrowing up and down to select. Great for living room setups.
Icon changes to change the way we are using favorites in this specific pack (changed flag to ! icon instead of a ♥) to signify that there is an issue with the game that was found. These will be removed as we fix issues with games.
Launcher persists User Selection and place (config file option)
General fixes:
Changes to order of boot menu and add defaults
Memory swapper scripts
move from using copy to xcopy
Game index update
Add new MPUCTL for MT32-pi support


Fixed the following games:
Lots of changes for Dune/Dune CD including our initial automatic memory swapper working.
PGA Golf 486
Star Control
Bioforge
Warcraft 2
Xwing
Descent (and general MIDI fix), added one time update to pull correct files from mounted CD
Lemmings
Lemmings 2
1830
Dune 2 SB and MIDI fix
2400AD
Kyrandia 1+2
Star Wars TIE CD


v.0.7.1 Fixes for Lemmings Floppy+others, Descent MIDI should finally be fixed, Dune 2 SB+MIDI options, 1830 sound fix, Lemmings 2 problem solved by turning off L1 cache, TDL updated to use ! for favorites in the pack, favicon option in the tdl.ini. Changed AO486 Updater script to push all files for now.

v.6 update all scripts to use jchoice for pause and choice commands.

v.5 jchoice changes

v.4 Changes to update script to allow for updates at root level of VHD.

v.3 updates for auto updater script for future releases, Descent General MIDI Fix, Launcher Joystick support, Choice and Pause Joystick support, and full pack updater script for the Mister to auto mount the vhd and update it in one step.

v.2 Game fixes for Dune and Dune CD, PGA Golf 486, Star Control 2, BioForge, Warcraft 2, and Xwing.

v.1 Initial pack which matches the full download from Archive or other sources
