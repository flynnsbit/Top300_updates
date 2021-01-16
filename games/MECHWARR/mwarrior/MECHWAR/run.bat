:menu
@echo off
cls
echo.
echo Press 1 for MechWarrior w/ Tandy
echo Press 2 for MechWarrior w/ SoundBlaster
echo Press 3 for MechWarrior w/ MT-32
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto TANDY

:SB16
CONFIG -set "mididevice=default"
MRESET
cls
@MW 1 A
goto quit

:MT32
mt32-pi -m -v
MRESET
cls
@MW 1 R
goto quit

:TANDY
CONFIG -set "mididevice=default"
MRESET
cls
@MW 1 T
goto quit

:quit
exit