:menu
echo off
cls
echo.
echo Press 1 for Dune 2: The Building of a Dynasty w/ SoundBlaster
echo Press 2 for Dune 2: The Building of a Dynasty w/ MT-32
echo Press 3 for Dune 2: The Building of a Dynasty w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del DUNE.CFG
copy .\sb16\*.*
cls
DUNE2
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del DUNE.CFG
copy .\mt32\*.*
cls
DUNE2
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del DUNE.CFG
copy .\sc55\*.*
cls
DUNE2
goto quit

:quit
exit