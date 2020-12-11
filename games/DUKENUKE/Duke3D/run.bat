:menu
echo off
cls
echo.
echo Press 1 for Duke Nukem 3D w/ Gravis Ultrasound
echo Press 2 for Duke Nukem 3D w/ SoundBlaster
echo Press 3 for Duke Nukem 3D w/ Sound Canvas
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto SB16
if errorlevel = 1 goto GUS

:SB16
CONFIG -set "mididevice=default"
cd duke3d
copy .\sb16\*.* .\
cls
DUKE3D
goto quit

:GUS
CONFIG -set "mididevice=default"
cd duke3d
copy .\gus\*.* .\
cls
DUKE3D
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd duke3d
copy .\sc55\*.* .\
cls
DUKE3D
goto quit

:network
CONFIG -set "mididevice=default"
cd duke3d
copy .\network\*.*
cd ..
cls
network

:quit
exit