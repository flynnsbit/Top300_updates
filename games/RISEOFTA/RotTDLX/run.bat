:menu
echo off
cls
echo.
echo Press 1 for Rise of the Triad w/ SoundBlaster
echo Press 2 for Rise of the Triad w/ Gravis Ultrasound
echo Press 3 for Rise of the Triad w/ Sound Canvas
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
cd rott
copy .\sb16\*.* .\
CONFIG -set "mididevice=default"
cls
ROTT
goto quit

:GUS
cd rott
copy .\gus\*.* .\
CONFIG -set "mididevice=default"
cls
ROTT
goto quit

:SC55
cd rott
copy .\sc55\*.* .\
CONFIG -set "mididevice=fluidsynth"
cls
ROTT
goto quit

:network
cd rott
copy .\sb16\*.* .\
cd ..
CONFIG -set "mididevice=default"
cls
network
goto quit

:quit
exit