:menu
@echo off
cls
echo.
echo Press 1 for Red Baron w/ SoundBlaster
echo Press 2 for Red Baron w/ MT-32
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
xcopy .\sb16\*.* .\
cls
@call BARONCD
goto quit

:MT32
CONFIG -set "mididevice=mt32"
xcopy .\mt32\*.* .\
cls
@call BARONCD
goto quit

:quit
exit