:menu
echo off
cls
echo.
echo Press 1 for Jazz Jackrabbit w/ SoundBlaster
echo Press 2 for Jazz Jackrabbit w/ Gravis Ultrasound
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
JAZZ
goto quit

:GUS
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=none"
copy .\GUS\*.* .\
cls
JAZZ
goto quit

:quit
exit