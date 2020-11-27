:menu
echo off
cls
echo.
echo Press 1 for Wing Commander: Armada w/ SoundBlaster
echo Press 2 for Wing Commander: Armada w/ Sound Canvas
echo Press 3 to play Network Multiplayer (Proving Grounds)
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
copy .\sb16\*.*
cls
ARMADA
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
copy .\sc55\*.*
cls
ARMADA
goto quit

:network
CONFIG -set "mididevice=default"
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
copy .\sb16\*.*
cd ..
cls
network
goto quit

:quit
exit