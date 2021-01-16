:menu
@echo off
cls
echo.
echo Press 1 for Serf City: Life is Feudal w/ SoundBlaster
echo Press 2 for Serf City: Life is Feudal w/ MT32
echo Press 3 for Serf City: Life is Feudal w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del SNDSTUP.DAT
xcopy .\sb16\*.*
cls
@call SETTLERS
goto quit

:MT32
mt32-pi -m -v
del SNDSTUP.DAT
xcopy .\mt32\*.*
cls
@call SETTLERS
goto quit

:SC55
mt32-pi -g -v
del SNDSTUP.DAT
xcopy .\sc55\*.*
cls
@call SETTLERS
goto quit

:quit
exit