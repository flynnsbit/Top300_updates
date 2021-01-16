:menu
@echo off
cls
echo.
echo Press 1 for Strife: Quest for the Sigil w/ SoundBlaster
echo Press 2 for Strife: Quest for the Sigil w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del STRIFE.CFG
xcopy .\sb16\*.*
cls
@call STRIFE
goto quit

:SC55
mt32-pi -g -v
del STRIFE.CFG
xcopy .\sc55\*.*
cls
@call STRIFE
goto quit

:quit
exit