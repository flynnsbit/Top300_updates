:menu
@echo off
cls
echo.
echo Press 1 for Sid Meier's Railroad Tycoon Deluxe w/ SoundBlaster
echo Press 2 for Sid Meier's Railroad Tycoon Deluxe w/ MT-32
echo Press 3 for Sid Meier's Railroad Tycoon Deluxe w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del CONFIG.RRD
copy .\sb16\*.*
cls
@call RDX
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del CONFIG.RRD
copy .\mt32\*.*
cls
@call RDX
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del CONFIG.RRD
copy .\sc55\*.*
cls
@call RDX
goto quit

:quit
exit