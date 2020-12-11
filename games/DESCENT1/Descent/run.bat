:menu
echo off
cls
echo.
echo Press 1 for Descent w/ SoundBlaster
echo Press 2 for Descent w/ SoundBlaster Hi-res
echo Press 3 for Descent w/ Sound Canvas
echo Press 4 for Descent w/ Sound Canvas Hi-res
echo Press 5 to play Network Multiplayer
echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto network
if errorlevel = 4 goto SC55hi
if errorlevel = 3 goto SC55
if errorlevel = 2 goto SB16hi
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd DESCENT
del descent.cfg
copy .\sb16\*.*
cls
descent
goto quit

:SB16hi
CONFIG -set "mididevice=default"
cd DESCENT
del descent.cfg
copy .\sb16\*.*
cls
descent -640x480
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd DESCENT
del descent.cfg
copy .\sc55\*.*
cls
descent
goto quit

:SC55hi
CONFIG -set "mididevice=fluidsynth"
cd DESCENT
del descent.cfg
copy .\sc55\*.*
cls
descent -640x480
goto quit

:network
CONFIG -set "mididevice=default"
cd DESCENT
del descent.cfg
copy .\sb16\*.*
cd ..
cls
network
goto quit

:quit
exit