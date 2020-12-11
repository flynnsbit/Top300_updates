:menu
@echo off
cls
echo.
echo Press 1 for Blackthorne w/ SoundBlaster
echo Press 2 for Blackthorne w/ Gravis Ultrasound
echo Press 3 for Blackthorne w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
@BTHORNE
goto quit

:GUS
CONFIG -set "mididevice=default"
copy .\gus\*.* .\
cls
@call BTHORNEG
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
copy .\sc55\*.* .\
cls
@BTHORNE
goto quit

:quit
exit