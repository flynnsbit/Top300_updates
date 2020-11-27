:menu
@echo off
cls
echo.
echo Press 1 for Star Wars: X-Wing w/ SoundBlaster
echo Press 2 for Star Wars: X-Wing w/ MT-32
echo Press 3 for Star Wars: X-Wing w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SETMUSE.INI
copy .\sb16\*.*
cls
@call XWINGCD
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SETMUSE.INI
copy .\mt32\*.*
cls
@call XWINGCD
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SETMUSE.INI
copy .\sc55\*.*
cls
@call XWINGCD
goto quit

:quit
exit