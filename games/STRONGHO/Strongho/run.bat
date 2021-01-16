:menu
echo off
cls
echo.
echo Press 1 for Stronghold w/ SoundBlaster
echo Press 2 for Stronghold w/ MT-32
echo Press 3 to Quit
echo.
echo The game launches in a demo mode. Press ESC to
echo exit the demo and go to the actual menu.
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd STRONG.SAV
xcopy .\sb16\*.* .\
cd ..
cls
STRONG
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd STRONG.SAV
xcopy .\mt32\*.* .\
cd ..
cls
STRONG
goto quit

:quit
exit