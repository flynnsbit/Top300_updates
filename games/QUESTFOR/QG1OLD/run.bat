:menu
echo off
cls
echo.
echo Press 1 for Quest for Glory I w/ Tandy
echo Press 2 for Quest for Glory I w/ Game Blaster
echo Press 3 for Quest for Glory I w/ SoundBlaster
echo Press 4 for Quest for Glory I w/ MT32
echo Press 5 to Quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto MT32
if errorlevel = 3 goto SB16
if errorlevel = 2 goto GB
if errorlevel = 1 goto TANDY

:TANDY
CONFIG -set "mididevice=default"
cls
SIERRA tesource.cfg
goto quit

:GB
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=gb"
cls
SIERRA gesource.cfg
goto quit

:SB16
CONFIG -set "mididevice=default"
cls
SIERRA sesource.cfg
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cls
SIERRA mesource.cfg
goto quit

:quit
exit