:menu
@echo off
cls
echo.
echo Press 1 for Super Street Fighter II Turbo w/ SoundBlaster
echo Press 2 for Super Street Fighter II Turbo w/ MT-32
echo Press 3 for Super Street Fighter II Turbo w/ Sound Canvas
echo Press 4 for Super Street Fighter II Turbo w/ CD Audio
echo Press 5 to Quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto CDA
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:CDA
CONFIG -set "mididevice=default"
cls
@call SSF2T
goto quit

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
@call SSF2T MIDI
goto quit

:MT32
CONFIG -set "mididevice=mt32"
copy .\mt32\*.* .\
cls
@call SSF2T MIDI
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
copy .\sc55\*.* .\
cls
@call SSF2T MIDI
goto quit

:quit
exit