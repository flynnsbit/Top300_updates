:menu
echo off
cls
echo.
echo Press 1 for The Ultimate Doom w/ SoundBlaster
echo Press 2 for The Ultimate Doom w/ Sound Canvas
echo Press 3 for Network Multiplayer
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del DEFAULT.CFG
xcopy .\sb16\*.*
cls
DOOM
goto quit

:SC55
mt32-pi -g -v
del DEFAULT.CFG
xcopy .\sc55\*.*
cls
DOOM
goto quit

:network
CONFIG -set "mididevice=default"
del DEFAULT.CFG
xcopy .\sb16\*.*
cls
network

:quit
exit