:menu
@echo off
cls
echo.
echo Press 1 for Ultima VIII: Pagan w/ SoundBlaster
echo Press 2 for Ultima VIII: Pagan w/ MT32
echo Press 3 for Ultima VIII: Pagan w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del AILXMI.DLL
del U8.INI
xcopy .\sb16\*.*
cls
@U8
goto quit
cls

:MT32
mt32-pi -m -v
del AILXMI.DLL
del U8.INI
xcopy .\mt32\*.*
cls
@U8
goto quit
cls

:SC55
mt32-pi -g -v
del AILXMI.DLL
del U8.INI
xcopy .\sc55\*.*
cls
@U8
goto quit
cls

:quit
exit