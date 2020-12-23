:menu
echo off
cls
echo.
echo Press 1 for Panzer General w/ SoundBlaster
echo Press 2 for Panzer General w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd PG
cd EXE
del SOUND.CFG
xcopy .\sb16\*.*
cls
PANZER
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd PG
cd EXE
del SOUND.CFG
xcopy .\sc55\*.*
cls
PANZER
goto quit

:quit
exit