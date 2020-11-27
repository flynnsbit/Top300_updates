:menu
echo off
cls
echo.
echo Press 1 for Al-Qadim: The Genie's Curse w/ SoundBlaster
echo Press 2 for Al-Qadim: The Genie's Curse w/ Sound Canvas
echo Press 3 for Al-Qadim: The Genie's Curse w/ Gravis Ultrasound
echo Press 4 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto GUS
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
call GENIE
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
copy .\sc55\*.* .\
cls
call GENIE
goto quit

:GUS
CONFIG -set "mididevice=default"
copy .\GUS\*.* .\
cls
call GENIE
goto quit

:quit
exit