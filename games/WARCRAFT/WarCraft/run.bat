:menu
echo off
cls
echo.
echo Press 1 for WarCraft: Orcs & Humans w/ SoundBlaster
echo Press 2 for WarCraft: Orcs & Humans w/ Sound Canvas
echo Press 3 for Network Multiplayer
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del CONFIG.WAR
copy .\sb16\*.*
cls
WAR
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del CONFIG.WAR
copy .\sc55\*.*
cls
WAR
goto quit

:network
CONFIG -set "mididevice=default"
del CONFIG.WAR
copy .\sb16\*.*
cls
network
goto quit

:quit
exit