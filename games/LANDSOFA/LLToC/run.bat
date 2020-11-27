:menu
@echo off
cls
echo.
echo Press 1 for Lands of Lore: The Throne of Chaos w/ SoundBlaster
echo Press 2 for Lands of Lore: The Throne of Chaos w/ MT32
echo Press 3 for Lands of Lore: The Throne of Chaos w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del LANDS.CFG
copy .\sb16\*.*
cls
@call LOLCD.BAT
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del LANDS.CFG
copy .\mt32\*.*
cls
@call LOLCD.BAT
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del LANDS.CFG
copy .\sc55\*.*
cls
@call LOLCD.BAT
goto quit

:quit
exit