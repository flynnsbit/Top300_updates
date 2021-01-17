:menu
@echo off
cls
echo.
echo Press 1 for Demon Gate: 666 New Levels for Doom & Doom II w/ SoundBlaster
echo Press 2 for Demon Gate: 666 New Levels for Doom & Doom II w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del DEFAULT.CFG
xcopy .\sb16\*.*
cls
@call ew2
goto quit

:SC55
mt32-pi -g -v
del DEFAULT.CFG
xcopy .\sc55\*.*
cls
@call ew2
goto quit

:quit
exit