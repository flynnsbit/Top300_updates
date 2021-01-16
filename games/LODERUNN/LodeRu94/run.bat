:menu
@echo off
cls
echo.
echo Press 1 for LodeRunner: The Legend Returns w/ SoundBlaster
echo Press 2 for LodeRunner: The Legend Returns w/ MT32
echo Press 3 for LodeRunner: The Legend Returns w/ Sound Canvas
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
del SOUNDRV.COM
xcopy .\sb16\*.*
@LODERUNN
goto quit
cls

:MT32
mt32-pi -m -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SOUNDRV.COM
xcopy .\mt32\*.*
@LODERUNN
goto quit
cls

:SC55
mt32-pi -g -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SOUNDRV.COM
xcopy .\sc55\*.*
@LODERUNN
goto quit
cls

:quit
exit