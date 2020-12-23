:menu
@echo off
cls
echo.
echo Press 1 for Wing Commander: Armada w/ SoundBlaster
echo Press 2 for Wing Commander: Armada w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del INSTALL.CFG
del ARMADA.CFG
xcopy .\sb16\*.*
cls
@ARMADA
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del INSTALL.CFG
del ARMADA.CFG
xcopy .\sc55\*.*
cls
@ARMADA
goto quit

:quit
exit