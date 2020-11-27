:menu
@echo off
cls
echo.
echo Press 1 for The 7th Guest w/ SoundBlaster
echo Press 2 for The 7th Guest w/ MT32
echo Press 3 for The 7th Guest w/ Sound Canvas
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del GROOVIE.INI
copy .\sb16\*.*
cls
call T7G
goto quit
cls

:MT32
CONFIG -set "mididevice=mt32"
del GROOVIE.INI
copy .\mt32\*.*
cls
call T7G
goto quit
cls

:SC55
CONFIG -set "mididevice=fluidsynth"
del GROOVIE.INI
copy .\sc55\*.*
cls
call T7G
goto quit
cls

:quit
exit