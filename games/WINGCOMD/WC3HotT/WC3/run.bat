:menu
@echo off
cls
echo.
echo Press 1 for Wing Commander III: Heart of the Tiger w/ SoundBlaster
echo Press 2 for Wing Commander III: Heart of the Tiger w/ MT-32
echo Press 3 for Wing Commander III: Heart of the Tiger w/ Sound Canvas
echo Press 4 to Quit
echo.
echo Note: To switch CD's press CTRL-F4
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del WC3.CFG
xcopy .\sb16\*.*
D:
cls
@WC3
goto quit

:MT32
mt32-pi -m -v
del WC3.CFG
xcopy .\mt32\*.*
D:
cls
@WC3
goto quit

:SC55
mt32-pi -g -v
del WC3.CFG
xcopy .\sc55\*.*
D:
cls
@WC3
goto quit

:quit
exit