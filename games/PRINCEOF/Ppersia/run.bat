:menu
echo off
cls
echo.
echo Press 1 for Prince of Persia v1.1 w/ Game Blaster
echo Press 2 for Prince of Persia v1.3 w/ Sound Blaster
echo Press 3 for Prince of Persia v1.3 w/ MT32
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto GB

:SB16
CONFIG -set "mididevice=default"
copy .\sb16\*.* .\
cls
prince sblast
goto quit

:MT32
CONFIG -set "mididevice=mt32"
copy .\mt32\*.* .\
cls
prince
goto quit

:GB
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=gb"
cd prince11
cls
PRINCE1 gblast
cd ..
goto quit

:quit
exit