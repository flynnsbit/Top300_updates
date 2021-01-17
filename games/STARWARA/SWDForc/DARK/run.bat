:menu
@echo off
cls
echo.
echo Press 1 for Star Wars: Dark Forces w/ SoundBlaster
echo Press 2 for Star Wars: Dark Forces w/ MT-32
echo Press 3 for Star Wars: Dark Forces w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del IMUSE.INI
xcopy .\sb16\*.*
cls
@DARK
goto quit

:MT32
mt32-pi -m -v
del IMUSE.INI
xcopy .\mt32\*.*
cls
@DARK
goto quit

:SC55
mt32-pi -g -v
del IMUSE.INI
xcopy .\sc55\*.*
cls
@DARK
goto quit

:quit
exit