:menu
echo off
cls
echo.
echo Press 1 for Out of This World Floppy w/ SoundBlaster
echo Press 2 for Out of This World Floppy w/ MT-32
echo Press 3 for Out of This World CD w/ SoundBlaster
echo Press 4 for Out of This World CD w/ MT-32
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto MT32
if errorlevel = 3 goto SB16
if errorlevel = 2 goto FMT32
if errorlevel = 1 goto FSB16

:FSB16
CD Floppy
CONFIG -set "mididevice=default"
xcopy .\sb16\*.* .\
cls
World
goto quit

:FMT32
CD Floppy
CONFIG -set "mididevice=mt32"
xcopy .\mt32\*.* .\
cls
World
goto quit

:SB16
CD WORLD
CONFIG -set "mididevice=default"
xcopy .\sb16\*.* .\
cls
World
goto quit

:MT32
CD WORLD
CONFIG -set "mididevice=mt32"
xcopy .\mt32\*.* .\
cls
World
goto quit

:quit
exit