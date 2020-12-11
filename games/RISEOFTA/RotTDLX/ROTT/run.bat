:menu
@echo off
cls
echo.
echo Press 1 for Rise of the Triad w/ SoundBlaster
echo Press 2 for Rise of the Triad w/ Gravis Ultrasound
echo Press 3 for Rise of the Triad w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
copy .\sb16\*.* .\
CONFIG -set "mididevice=default"
cls
@ROTT
goto quit

:GUS
copy .\gus\*.* .\
CONFIG -set "mididevice=default"
cls
@ROTT
goto quit

:SC55
copy .\sc55\*.* .\
CONFIG -set "mididevice=fluidsynth"
cls
@ROTT
goto quit

:quit
exit