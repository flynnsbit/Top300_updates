:menu
@echo off
cls
echo.
echo Press 1 for Wing Commander: Privateer w/ SoundBlaster
echo Press 2 for Wing Commander: Privateer w/ Sound Canvas
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
del SOUND.CFG >> NUL
xcopy .\sb16\*.* >> NUL
goto game

:SC55
mpuctl fluid 0
REM CONFIG -set "mididevice=fluidsynth"
del SOUND.CFG >> NUL
xcopy .\sc55\*.* >> NUL
goto game

:game
@echo off
cls
echo.
echo Press 1 for Wing Commander: Privateer
echo Press 2 for Wing Commander: Privateer Righteous Fire
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto RF
if errorlevel = 1 goto WCP

:WCP
RUN_EM16 E: \GAMES\WINGCOMF\WCPRIV\PRIV PRIV

:RF
RUN_EM16 E: \GAMES\WINGCOMF\WCPRIV\PRIV PRIV r

:quit
