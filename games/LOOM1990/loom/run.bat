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
REM CONFIG -set"mididevice=default"
cd floppy
cls
loom v ts
goto quit

:GB
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
cd floppy
cls
loom v g
goto quit

:SB16
REM CONFIG -set"mididevice=default"
cd floppy
cls
loom v a
goto quit

:MT32
mt32-pi -m -v
cd floppy
cls
loom v r
goto quit

:SC55
mt32-pi -g -v
cd floppy
cls
loom v r
goto quit

:CD
mt32-pi -g -v
d:
cls
loom
goto quit

:quit
exit