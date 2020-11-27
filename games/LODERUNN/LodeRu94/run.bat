:menu
@echo off
cls
echo.
echo Press 1 for LodeRunner: The Legend Returns w/ SoundBlaster
echo Press 2 for LodeRunner: The Legend Returns w/ MT32
echo Press 3 for LodeRunner: The Legend Returns w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

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
copy .\sb16\*.*
@LODERUNN
goto quit
cls

:MT32
CONFIG -set "mididevice=mt32"
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SOUNDRV.COM
copy .\mt32\*.*
@LODERUNN
goto quit
cls

:SC55
CONFIG -set "mididevice=fluidsynth"
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SOUNDRV.COM
copy .\sc55\*.*
@LODERUNN
goto quit
cls

:quit
exit