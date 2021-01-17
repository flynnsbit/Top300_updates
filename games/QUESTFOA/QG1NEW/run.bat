:menu
@echo off
cls
echo.
echo Press 1 for Quest for Glory I: So You Want to Be a Hero VGA w/ SoundBlaster
echo Press 2 for Quest for Glory I: So You Want to Be a Hero VGA w/ MT32
echo Press 3 for Quest for Glory I: So You Want to Be a Hero VGA w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del RESOURCE.CFG
xcopy .\sb16\*.*
cls
@SCIDHUV
goto quit
cls

:MT32
mt32-pi -m -v
del RESOURCE.CFG
xcopy .\mt32\*.*
cls
@SCIDHUV
goto quit
cls

:SC55
mt32-pi -g -v
del RESOURCE.CFG
xcopy .\sc55\*.*
cls
@SCIDHUV
goto quit
cls

:quit
exit