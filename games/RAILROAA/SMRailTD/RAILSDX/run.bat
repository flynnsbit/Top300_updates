:menu
@echo off
cls
echo.
echo Press 1 for Sid Meier's Railroad Tycoon Deluxe w/ SoundBlaster
echo Press 2 for Sid Meier's Railroad Tycoon Deluxe w/ MT-32
echo Press 3 for Sid Meier's Railroad Tycoon Deluxe w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del CONFIG.RRD
xcopy .\sb16\*.*
cls
@call RDX
goto quit

:MT32
mt32-pi -m -v
del CONFIG.RRD
xcopy .\mt32\*.*
cls
@call RDX
goto quit

:SC55
mt32-pi -g -v
del CONFIG.RRD
xcopy .\sc55\*.*
cls
@call RDX
goto quit

:quit
exit