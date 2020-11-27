:menu
echo off
cls
echo.
echo Press 1 NASCAR Racing
echo Press 2 NASCAR Racing w/ Hires SVGA
echo Press 3 to play Network Multiplayer
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto hires
if errorlevel = 1 goto sound

:hires
set SVGA=-h
goto sound

:sound
cls
echo.
echo Press 1 NASCAR Racing for w/ SoundBlaster
echo Press 2 NASCAR Racing for w/ Sound Canvas
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd NASCAR
del SOUND.CFG
copy .\sb16\*.*
cls
NASCAR %SVGA%
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd NASCAR
del SOUND.CFG
copy .\sc55\*.*
cls
NASCAR %SVGA%
goto quit

:network
CONFIG -set "mididevice=default"
cd NASCAR
del SOUND.CFG
copy .\sb16\*.*
cd ..
cls
network
goto quit

:quit
exit