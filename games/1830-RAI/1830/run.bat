:menu
echo off
cls
echo.
echo Press 1 for 1830: Railroads & Robber Barons w/ SoundBlaster
echo Press 2 for 1830: Railroads & Robber Barons w/ MT-32
echo Press 3 for 1830: Railroads & Robber Barons w/ Sound Canvas
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
1830
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SOUND.CFG
copy .\mt32\*.*
cls
1830
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SOUND.CFG
copy .\sc55\*.*
cls
1830
goto quit

:quit
exit