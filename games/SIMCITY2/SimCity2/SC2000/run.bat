:menu
@echo off
cls
echo.
echo Press 1 for SimCity 2000: CD Collection w/ SoundBlaster
echo Press 2 for SimCity 2000: CD Collection w/ MT32
echo Press 3 for SimCity 2000: CD Collection w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del SC2000.CFG
xcopy .\sb16\*.*
cls
@call pick
goto quit

:MT32
mt32-pi -m -v
del SC2000.CFG
xcopy .\mt32\*.*
cls
@call pick
goto quit

:SC55
mt32-pi -g -v
del SC2000.CFG
xcopy .\sc55\*.*
cls
@call pick
goto quit

:quit
exit