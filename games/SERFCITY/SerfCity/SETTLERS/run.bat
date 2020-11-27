:menu
@echo off
cls
echo.
echo Press 1 for Serf City: Life is Feudal w/ SoundBlaster
echo Press 2 for Serf City: Life is Feudal w/ MT32
echo Press 3 for Serf City: Life is Feudal w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SNDSTUP.DAT
copy .\sb16\*.*
cls
@call SETTLERS
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SNDSTUP.DAT
copy .\mt32\*.*
cls
@call SETTLERS
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SNDSTUP.DAT
copy .\sc55\*.*
cls
@call SETTLERS
goto quit

:quit
exit