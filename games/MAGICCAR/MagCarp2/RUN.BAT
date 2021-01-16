:menu
echo off
cls
echo.
echo Press 1 for Magic Carpet 2: The Netherworlds w/ SoundBlaster
echo Press 2 for Magic Carpet 2: The Netherworlds w/ MT32
echo Press 3 for Magic Carpet 2: The Netherworlds w/ Sound Canvas
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd NETHERW
cd SOUND
del MDI.INI
xcopy .\sb16\*.*
cd ..
cd ..
cls
echo.
echo Pressing "r" during gameplay will turn on Hi-Res mode, however the game will run
echo incredibly slow unless you increase the speed of DOSBox by pressing CTRL-F12.
echo.
@jchoice
D:
dos32a NETHERW
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd NETHERW
cd SOUND
del MDI.INI
xcopy .\mt32\*.*
cd ..
cd ..
cls
echo.
echo Pressing "r" during gameplay will turn on Hi-Res mode, however the game will run
echo incredibly slow unless you increase the speed of DOSBox by pressing CTRL-F12.
echo.
@jchoice
D:
dos32a NETHERW
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd NETHERW
cd SOUND
del MDI.INI
xcopy .\sc55\*.*
cd ..
cd ..
cls
echo.
echo Pressing "r" during gameplay will turn on Hi-Res mode, however the game will run
echo incredibly slow unless you increase the speed of DOSBox by pressing CTRL-F12.
echo.
@jchoice
D:
NETHERW
goto quit

:network
CONFIG -set "mididevice=default"
cd NETHERW
cd SOUND
del MDI.INI
xcopy .\sb16\*.*
cd ..
cd ..
cls
call network
goto quit

:quit
exit
