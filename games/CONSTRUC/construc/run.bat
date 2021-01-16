:menu
echo off
cls
echo.
echo Press 1 for Constructor w/ SoundBlaster
echo Press 2 for Constructor w/ MT-32
echo Press 3 for Constructor w/ Sound Canvas
echo Press 4 for Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd SETTINGS
del SETSND.CFG
xcopy .\sb16\*.*
cd ..
cls
game
rem @MOUSEX 20 10 GAME.EXE
goto quit

:MT32
mt32-pi -m -v
cd SETTINGS
del SETSND.CFG
xcopy .\mt32\*.*
cd ..
cls
game
rem @MOUSEX 20 10 GAME.EXE
goto quit

:SC55
mt32-pi -g -v
cd SETTINGS
del SETSND.CFG
xcopy .\sc55\*.*
cd ..
cls
game
rem @MOUSEX 20 10 GAME.EXE
goto quit

:network
CONFIG -set "mididevice=default"
cd SETTINGS
del SETSND.CFG
xcopy .\sb16\*.*
cd ..
cls
network

:quit
exit