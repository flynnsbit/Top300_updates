:menu
echo off
cls
echo.
echo Press 1 for Loom Floppy w/ Tandy Sound
echo Press 2 for Loom Floppy w/ GameBlaster
echo Press 3 for Loom Floppy w/ SoundBlaster
echo Press 4 for Loom Floppy w/ MT-32
REM echo Press 5 for Loom Floppy w/ Sound Canvas
echo Press 5 for Loom CD
echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto CD
REM if errorlevel = 5 goto SC55
if errorlevel = 4 goto MT32
if errorlevel = 3 goto SB16
if errorlevel = 2 goto GB
if errorlevel = 1 goto TANDY

:TANDY
CONFIG -set "mididevice=default"
cd floppy
cls
loom v ts
goto quit

:GB
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=gb"
cd floppy
cls
loom v g
goto quit

:SB16
CONFIG -set "mididevice=default"
cd floppy
cls
loom v a
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd floppy
cls
loom v r
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd floppy
cls
loom v r
goto quit

:CD
CONFIG -set "mididevice=fluidsynth"
d:
cls
loom
goto quit

:quit
exit