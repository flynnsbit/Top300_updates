:menu
echo off
cls
echo.
echo Press 1 for Dune 2: The Building of a Dynasty w/ SoundBlaster
echo Press 2 for Dune 2: The Building of a Dynasty w/ MT-32
echo Press 3 for Dune 2: The Building of a Dynasty w/ Sound Canvas
echo Press 4 for Dune 2: The Building of a Dynasty w/ MT-32 + SB
echo Press 5 for Dune 2: The Building of a Dynasty w/ Sound Canvas + SB

echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto SBSC
if errorlevel = 4 goto SBMT
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16
if errorlevel = 0 goto quit

:SB16
CONFIG -set "mididevice=default"
del DUNE.CFG
copy .\sb16\*.*
cls
DUNE2
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del DUNE.CFG
copy .\mt32\*.*
cls
DUNE2
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del DUNE.CFG
copy .\sc55\*.*
cls
DUNE2
goto quit

:SBMT
CONFIG -set "mididevice=mt32"
del DUNE.CFG
copy .\SBMT\*.*
cls
DUNE2
goto quit

:SBSC
CONFIG -set "mididevice=fluidsynth"
del DUNE.CFG
copy .\SBSC\*.*
cls
DUNE2
goto quit

:quit
exit
