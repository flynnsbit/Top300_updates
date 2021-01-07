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
del c:\tiecd\IMUSE.INI
xcopy .\sb16\*.* c:\tiecd\
cls
@TIE
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del c:\tiecd\IMUSE.INI
xcopy .\mt32\*.* c:\tiecd\
cls
@TIE
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del c:\tiecd\IMUSE.INI
xcopy .\sc55\*.* c:\tiecd\
cls
@TIE
goto quit

:quit
exit
