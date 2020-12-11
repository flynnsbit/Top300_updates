:menu
echo off
cls
echo.
echo Press 1 for Hexen: Beyond Heretic w/ SoundBlaster
echo Press 2 for Hexen: Beyond Heretic w/ Sound Canvas
echo Press 3 for Hexen: Beyond Heretic w/ CD Audio
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto CDA
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del HEXEN.CFG
copy .\sb16\*.*
cls
HEXEN
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del HEXEN.CFG
copy .\sc55\*.*
cls
HEXEN
goto quit

:CDA
CONFIG -set "mididevice=default"
del HEXEN.CFG
copy .\CDA\*.*
cls
HEXEN
goto quit

:network
CONFIG -set "mididevice=default"
del HEXEN.CFG
copy .\CDA\*.*
cls
network
goto quit

:quit
exit