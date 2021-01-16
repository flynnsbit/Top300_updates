:menu
echo off
cls
echo.
echo Press 1 for Wing Commander: Armada w/ SoundBlaster
echo Press 2 for Wing Commander: Armada w/ Sound Canvas
echo Press 3 to play Network Multiplayer (Proving Grounds)
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
xcopy .\sb16\*.*
cls
ARMADA
goto quit

:SC55
mt32-pi -g -v
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
xcopy .\sc55\*.*
cls
ARMADA
goto quit

:network
REM CONFIG -set"mididevice=default"
cd ARMADA
del INSTALL.CFG
del ARMADA.CFG
xcopy .\sb16\*.*
cd ..
cls
network
goto quit

:quit
exit