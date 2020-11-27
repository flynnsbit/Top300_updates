:menu
echo off
cls
echo.
echo Press 1 for Jagged Alliance w/ SoundBlaster
echo Press 2 for Jagged Alliance w/ MT32
echo Press 3 for Jagged Alliance w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SOUND.CFG
copy .\sb16\*.*
cls
JA
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SOUND.CFG
copy .\mt32\*.*
cls
JA
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SOUND.CFG
copy .\sc55\*.*
cls
JA
goto quit

:quit
exit