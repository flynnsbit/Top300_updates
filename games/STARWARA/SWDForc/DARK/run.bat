:menu
@echo off
cls
echo.
echo Press 1 for Star Wars: Dark Forces w/ SoundBlaster
echo Press 2 for Star Wars: Dark Forces w/ MT-32
echo Press 3 for Star Wars: Dark Forces w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del IMUSE.INI
copy .\sb16\*.*
cls
@DARK
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del IMUSE.INI
copy .\mt32\*.*
cls
@DARK
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del IMUSE.INI
copy .\sc55\*.*
cls
@DARK
goto quit

:quit
exit