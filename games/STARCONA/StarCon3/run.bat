:menu
echo off
cls
echo.
echo Press 1 for Star Control 3 w/ SoundBlaster
echo Press 2 for Star Control 3 w/ MT32
echo Press 3 for Star Control 3 w/ Sound Canvas
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
cd STARCON3
del MDI.INI
xcopy .\sb16\*.*
cls
SC3
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd STARCON3
del MDI.INI
xcopy .\mt32\*.*
cls
SC3
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd STARCON3
del MDI.INI
xcopy .\sc55\*.*
cls
SC3
goto quit

:network
CONFIG -set "mididevice=default"
cd STARCON3
del MDI.INI
xcopy .\sb16\*.*
cd ..
cls
call network
goto quit

:quit
exit