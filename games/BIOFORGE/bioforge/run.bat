:menu
echo off
cls
echo.
echo Press 1 for w/ SoundBlaster
echo Press 2 for w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del AILXMI.DLL
del INSTALL.OPT
xcopy .\sb16\*.*
cls
RUN_EMM E: \GAMES\BIOFORGE\BIOFORGE BIOFORGE
goto quit

:SC55
mt32-pi -g -v
del AILXMI.DLL
del INSTALL.OPT
xcopy .\sc55\*.*
cls
RUN_EMM E: \GAMES\BIOFORGE\BIOFORGE BIOFORGE
goto quit

:quit
exit
