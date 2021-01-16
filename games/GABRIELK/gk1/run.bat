:menu
echo off
cls
echo.
echo Press 1 for Gabriel Knight: Sins of the Fathers w/ SoundBlaster
echo Press 2 for Gabriel Knight: Sins of the Fathers w/ MT32
echo Press 3 for Gabriel Knight: Sins of the Fathers w/ Sound Canvas
echo Press 4 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 5 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 6 for Gabriel Knight CD: Sins of the Fathers w/ Sound Canvas
echo Press 7 to Quit
echo.
jchoice /C:1234567 /N Please Choose:

if errorlevel = 7 goto quit
if errorlevel = 6 goto SC55
if errorlevel = 5 goto MT32
if errorlevel = 4 goto SB16
if errorlevel = 3 goto flSC55
if errorlevel = 2 goto flMT32
if errorlevel = 1 goto flSB16

:SB16
CONFIG -set "mididevice=default"
cd GKCD
del RESOURCE.CFG
xcopy .\sb16\*.*
cls
SIERRA
goto quit

:MT32
mt32-pi -m -v
cd GKCD
del RESOURCE.CFG
xcopy .\mt32\*.*
cls
SIERRA
goto quit

:SC55
mt32-pi -g -v
cd GKCD
del RESOURCE.CFG
xcopy .\sc55\*.*
cls
SIERRA
goto quit

:flSB16
CONFIG -set "mididevice=default"
cd GK
del RESOURCE.CFG
xcopy .\sb16\*.*
cls
SIERRA
goto quit

:flMT32
mt32-pi -m -v
cd GK
del RESOURCE.CFG
xcopy .\mt32\*.*
cls
SIERRA
goto quit

:flSC55
mt32-pi -g -v
cd GK
del RESOURCE.CFG
xcopy .\sc55\*.*
cls
SIERRA
goto quit

:quit
exit