:menu
echo off
cls
echo.
echo Press 1 for Gabriel Knight: Sins of the Fathers w/ SoundBlaster
echo Press 2 for Gabriel Knight: Sins of the Fathers w/ MT32
echo Press 3 for Gabriel Knight: Sins of the Fathers w/ Sound Canvas
echo Press 4 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 5 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 6 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 7 to Quit
echo.
choice /C:1234567 /N Please Choose:

if errorlevel = 7 goto quit
if errorlevel = 6 goto SC55
if errorlevel = 5 goto MT32
if errorlevel = 4 goto SB16
if errorlevel = 3 goto flSC55
if errorlevel = 2 goto flMT32
if errorlevel = 1 goto flSB16

:SB16
CONFIG -set "mididevice=default"
cd GKCD
del RESOURCE.CFG
copy .\sb16\*.*
cls
SIERRA
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd GKCD
del RESOURCE.CFG
copy .\mt32\*.*
cls
SIERRA
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd GKCD
del RESOURCE.CFG
copy .\sc55\*.*
cls
SIERRA
goto quit

:flSB16
CONFIG -set "mididevice=default"
cd GK
del RESOURCE.CFG
copy .\sb16\*.*
cls
SIERRA
goto quit

:flMT32
CONFIG -set "mididevice=mt32"
cd GK
del RESOURCE.CFG
copy .\mt32\*.*
cls
SIERRA
goto quit

:flSC55
CONFIG -set "mididevice=fluidsynth"
cd GK
del RESOURCE.CFG
copy .\sc55\*.*
cls
SIERRA
goto quit

:quit
exit