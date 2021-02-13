# MiSTer eXoDOS Top_300_updates
AO486 Update scripts for the flynnsbit eXoDOS V5.0 Top 300 Pack.  This is not the actual pack and only provides updatse to the scripts, ini files, and launcher fixes.  There are no copywrite materials here.

## How to Install and Update
1. ssh or F9 to get to the consolde of your MiSTer

2. cd /media/fat/Scripts

3. wget https://raw.githubusercontent.com/flynnsbit/Top300_updates/main/_mister/AO486_Top300_update.sh

4. Turn on your __MiSTer__, go to the _Scripts_ menu and run this script from there. This will download the latest Top 300 Pack (updates only, base VHDs required before updating) release with any fixes to games, new features, and updated programs from this github.  It will auto mount your VHD pack, update it, and clean up any temp folders.

**CIFS SHARE WARNING:** If you have your VHDs on a network share and are mounting them remotely and are not confident in your network design, using wifi, etc. then there is a chance of corrupting your VHD.  You will see this when during the update your VHD mount switches to ReadONLY mode or you start getting I/O errors.  You can try the update again if it fails.  As a failsafe, you can just mount your two VHDs on your Windows/Linux/SAN directly and extract the contents of update.zip/C to the primary VHD and update.zip/e to the secondary VHD to update your pack manually.

5. Launch the AO486 core as you normally do with the Top 300 pack VHDs mounted.

-------------------------------------------------------------------------------------------------------

## More info:
Initial pack generated using ExoDOSConverter MiSTer option:  https://github.com/Voljega/ExoDOSConverter

Future updates to the pack are contained in the flynnsbit repo: https://github.com/flynnsbit/Top300_updates

## Version History and Releases
https://github.com/flynnsbit/Top300_updates/releases


