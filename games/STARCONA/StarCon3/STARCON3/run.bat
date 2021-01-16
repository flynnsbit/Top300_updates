:menu
@echo off
cls
echo.
echo Press 1 for Star Control 3 w/ SoundBlaster
echo Press 2 for Star Control 3 w/ MT32
echo Press 3 for Star Control 3 w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del MDI.INI
xcopy .\sb16\*.*
cls
@SC3
goto quit

:MT32
mt32-pi -m -v
del MDI.INI
xcopy .\mt32\*.*
cls
@SC3
goto quit

:SC55
mt32-pi -g -v
del MDI.INI
xcopy .\sc55\*.*
cls
@SC3
goto quit

:quit
exit