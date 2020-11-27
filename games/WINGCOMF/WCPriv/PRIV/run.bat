:menu
@echo off
cls
echo.
echo Press 1 for Wing Commander: Privateer w/ SoundBlaster
echo Press 2 for Wing Commander: Privateer w/ Sound Canvas
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SOUND.CFG
copy .\sb16\*.*
cls
goto game

:SC55
CONFIG -set "mididevice=fluidsynth"
del SOUND.CFG
copy .\sc55\*.*
cls
goto game

:game
@echo off
cls
echo.
echo Press 1 for Wing Commander: Privateer
echo Press 2 for Wing Commander: Privateer Righteous Fire
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto RF
if errorlevel = 1 goto WCP

:WCP
cls
priv
goto menu

:RF
cls
priv r
goto menu

:QUIT