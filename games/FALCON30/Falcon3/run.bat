:menu
echo off
cls
echo.
echo Press 1 for Falcon 3.0 w/ SoundBlaster
echo Press 2 for Falcon 3.0 w/ MT-32
echo Press 3 to play Network Multiplayer
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
falcon3
goto quit

:MT32
CONFIG -set "mididevice=mt32"
copy .\mt32\*.* .\
cls
falcon3
goto quit

:network
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
network
goto quit

:quit
exit