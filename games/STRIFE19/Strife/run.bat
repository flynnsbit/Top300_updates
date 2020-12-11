:menu
echo off
cls
echo.
echo Press 1 for Strife: Quest for the Sigil w/ SoundBlaster
echo Press 2 for Strife: Quest for the Sigil w/ Sound Canvas
echo Press 3 to play Network Multiplayer
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd STRIFE
del STRIFE.CFG
copy .\sb16\*.*
cls
call STRIFE
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd STRIFE
del STRIFE.CFG
copy .\sc55\*.*
cls
call STRIFE
goto quit

:network
CONFIG -set "mididevice=default"
cd STRIFE
del STRIFE.CFG
copy .\sb16\*.*
cd ..
cls
call network
goto quit

:quit
exit