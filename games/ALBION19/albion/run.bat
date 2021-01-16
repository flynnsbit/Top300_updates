:menu
echo off
cls
echo.
echo Press 1 for Albion w/ SoundBlaster
echo Press 2 for Albion w/ MT-32
echo Press 3 for Albion w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd DRIVERS
del MDI.INI
xcopy .\sb16\*.*
cd ..
cls
ALBION
goto quit

:MT32
mt32-pi -m -v
cd DRIVERS
del MDI.INI
xcopy .\mt32\*.*
cd ..
cls
ALBION
goto quit

:SC55
mt32-pi -g -v
cd DRIVERS
del MDI.INI
xcopy .\sc55\*.*
cd ..
cls
ALBION
goto quit

:quit
exit