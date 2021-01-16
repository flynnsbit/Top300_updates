:menu
echo off

cls
echo.
echo Press 1 to play Dune Floppy using DOSBox w/ Soundblaster
echo Press 2 to play Dune Floppy using DOSBox w/ MT-32
echo Press 3 to play Dune Floppy using DOSBox w/ Adlib Gold
echo Press 4 to play Dune CD using DOSBox w/ Soundblaster
echo Press 5 to play Dune CD using DOSBox w/ MT-32
echo Press 6 to play Dune CD using DOSBox w/ Adlib Gold
echo Press 7 to Quit
echo.
jchoice /C:1234567 /N Please Choose:

if errorlevel = 7 goto quit
if errorlevel = 6 goto CDGOLD
if errorlevel = 5 goto CDMT32
if errorlevel = 4 goto CDSB16
if errorlevel = 3 goto GOLD
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cls
logo
duneprg ENG VGA SDB2207 HIM 386
goto quit

:GOLD
CONFIG -set "mididevice=default"
CONFIG -set "oplmode=opl3gold"
cls
logo
duneprg ENG VGA AGD388 HIM 386
goto quit

:MT32
mt32-pi -m -v
cls
logo
duneprg ENG VGA MID330 HIM 386
goto quit

:CDSB16
echo off
cls
echo.
echo This game option requires EMM386. Press any key to reboot into the game...
jchoice s 
REM CONFIG -set "mididevice=default"
echo d: >> e:\launch.bat
echo cls >> e:\launch.bat
echo call DNCDPRG AMR ADP220 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\ >> e:\launch.bat
echo e: >> e:\launch.bat
echo tdlreset.bat >> e:\launch.bat
copy e:\utils\configs\config.emm c:\config.sys
copy e:\utils\configs\loading.sys c:\logo.sys
imgset r
goto quit

:CDMT32
mt32-pi -m -v
d:
cls
DNCDPRG MID330 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\
goto quit

:CDGOLD
CONFIG -set "mididevice=default"
CONFIG -set "oplmode=opl3gold"
d:
cls
DNCDPRG ADG388 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\
goto quit

:quit
