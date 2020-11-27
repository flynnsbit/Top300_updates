:menu
@echo off
cls
echo.
echo Press 1 for SimCity 2000: CD Collection w/ SoundBlaster
echo Press 2 for SimCity 2000: CD Collection w/ MT32
echo Press 3 for SimCity 2000: CD Collection w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SC2000.CFG
copy .\sb16\*.*
cls
@call pick
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SC2000.CFG
copy .\mt32\*.*
cls
@call pick
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SC2000.CFG
copy .\sc55\*.*
cls
@call pick
goto quit

:quit
exit