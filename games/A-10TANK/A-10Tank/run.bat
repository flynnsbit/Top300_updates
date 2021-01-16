:menu
echo off
cls
echo.
echo Press 1 for A-10 Tank Killer w/ SoundBlaster
echo Press 2 for A-10 Tank Killer w/ MT-32
echo Press 3 for A-10 Tank Killer Extended Re-release w/ SoundBlaster
echo Press 4 for A-10 Tank Killer Extended Re-release w/ MT-32
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto MT32
if errorlevel = 3 goto SB16
if errorlevel = 2 goto MT32old
if errorlevel = 1 goto SB16old

:SB16
CONFIG -set "mididevice=default"
cd 1.5
xcopy .\sb16\*.* .\
cls
A10
goto quit

:MT32
mt32-pi -m -v
cd 1.5
xcopy .\mt32\*.* .\
cls
A10
goto quit

:SB16old
CONFIG -set "mididevice=default"
cd 1.4
xcopy .\sb16\*.* .\
cls
A10
goto quit

:MT32old
mt32-pi -m -v
cd 1.4
xcopy .\mt32\*.* .\
cls
A10
goto quit

:quit
exit