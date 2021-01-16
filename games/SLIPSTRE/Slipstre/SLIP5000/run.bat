:menu
@echo off
cls
echo.
echo Press 1 for Slipstream 5000 w/ SoundBlaster
echo Press 2 for Slipstream 5000 w/ MT-32
echo Press 3 for Slipstream 5000 w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
del CONFIG.INI
CONFIG -set "mididevice=default"
xcopy .\sb16\*.*
cls
@call SLIP
goto quit

:MT32
del CONFIG.INI
mt32-pi -m -v
xcopy .\mt32\*.*
cls
@call SLIP
goto quit

:SC55
del CONFIG.INI
mt32-pi -g -v
xcopy .\sc55\*.*
cls
@call SLIP
goto quit

:quit
exit