:menu
echo off
cls
echo.
echo Press 1 for WarCraft II: Battle Chest w/ SoundBlaster
echo Press 2 for WarCraft II: Battle Chest w/ Sound Canvas
echo Press 3 for WarCraft II: Battle Chest w/ CD Music
echo Press 4 for Network Multiplayer
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
del WAR2.INI
xcopy .\sb16\*.*
cd DRIVERS
del MDI.INI
xcopy .\sb16\*.*
cd ..
cls
WAR2
goto quit

:CDA
CONFIG -set "mididevice=default"
del WAR2.INI
xcopy .\cda\*.*
cd DRIVERS
del MDI.INI
xcopy .\sb16\*.*
cd ..
cls
WAR2
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del WAR2.INI
xcopy .\sc55\*.*
cd DRIVERS
del MDI.INI
xcopy .\sc55\*.*
cd ..
cls
WAR2
goto quit

:network
CONFIG -set "mididevice=default"
del WAR2.INI
xcopy .\cda\*.*
cd DRIVERS
del MDI.INI
xcopy .\sb16\*.*
cd ..
cls
network
goto quit

:quit
exit