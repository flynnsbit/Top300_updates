:menu
echo off
cls
echo.
echo Press 1 for Hexen: Beyond Heretic w/ SoundBlaster
echo Press 2 for Hexen: Beyond Heretic w/ Sound Canvas
echo Press 3 for Hexen: Beyond Heretic w/ CD Audio
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto CDA
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del HEXEN.CFG
xcopy .\sb16\*.*
cls
HEXEN
goto quit

:SC55
mt32-pi -g -v
del HEXEN.CFG
xcopy .\sc55\*.*
cls
HEXEN
goto quit

:CDA
REM CONFIG -set"mididevice=default"
del HEXEN.CFG
xcopy .\CDA\*.*
cls
HEXEN
goto quit

:network
REM CONFIG -set"mididevice=default"
del HEXEN.CFG
xcopy .\CDA\*.*
cls
network
goto quit

:quit
exit