:menu
echo off
cls
echo.
echo Press 1 for fdoom w/ Gravis Ultrasound
echo Press 2 for fdoom w/ SoundBlaster
echo Press 3 for fdoom w/ Sound Canvas
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto SB16
if errorlevel = 1 goto GUS

:GUS
REM CONFIG -set"mididevice=default"
del DEFAULT.CFG
xcopy .\gus\*.*
cd ultrasnd
ultramid
cd ..
cls
fdoom
goto quit

:SB16
REM CONFIG -set"mididevice=default"
del DEFAULT.CFG
xcopy .\sb16\*.*
cls
fdoom
goto quit

:SC55
mt32-pi -g -v
del DEFAULT.CFG
xcopy .\sc55\*.*
cls
fdoom
goto quit

:network
REM CONFIG -set"mididevice=default"
del DEFAULT.CFG
xcopy .\sb16\*.*
cls
network

:quit
exit