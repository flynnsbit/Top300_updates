:menu
@echo off
cls
echo.
echo Press 1 for Star Wars: TIE Fighter w/ SoundBlaster
echo Press 2 for Star Wars: TIE Fighter w/ MT-32
echo Press 3 for Star Wars: TIE Fighter w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del IMUSE.INI
copy .\sb16\*.*
cls
@TIE
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del IMUSE.INI
copy .\mt32\*.*
cls
@TIE
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del IMUSE.INI
copy .\sc55\*.*
cls
@TIE
goto quit

:quit
exit