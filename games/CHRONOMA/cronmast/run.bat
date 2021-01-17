:menu
echo off
cls
echo.
echo Press 1 for Chronomaster w/ SoundBlaster
echo Press 2 for Chronomaster w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del HMISET.CFG
xcopy .\sb16\*.*
cls
CMASTER
goto quit

:SC55
mt32-pi -g -v
del HMISET.CFG
xcopy .\sc55\*.*
cls
CMASTER
goto quit

:quit
exit