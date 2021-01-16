:menu
@echo off
cls
echo.
echo Press 1 for SoundBlaster
echo Press 2 for MT32
echo Press 3 for Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del U5.CFG
xcopy .\sb16\*.*
cls
@ULTIMA5.COM
goto quit
cls

:MT32
mt32-pi -m -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del U5.CFG
xcopy .\mt32\*.*
cls
@ULTIMA5.COM
goto quit
cls

:SC55
mt32-pi -g -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del U5.CFG
xcopy .\sc55\*.*
cls
@ULTIMA5.COM
goto quit
cls

:quit
exit