:menu
echo off
cls
echo.
echo Press 1 for Master of Orion w/ SoundBlaster
echo Press 2 for Master of Orion w/ MT32
echo Press 3 for Master of Orion w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del CONFIG.MOO
copy .\sb16\*.*
cls
ORION
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del CONFIG.MOO
copy .\mt32\*.*
cls
ORION
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del CONFIG.MOO
copy .\sc55\*.*
cls
ORION
goto quit

:quit
exit