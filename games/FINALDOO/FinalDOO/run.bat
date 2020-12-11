:menu
@echo off
cls
echo.
echo Press 1 for Final Doom w/ Gravis Ultrasound
echo Press 2 for Final Doom w/ SoundBlaster
echo Press 3 for Final Doom w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto SB16
if errorlevel = 1 goto GUS

:GUS
CONFIG -set "mididevice=default"
cd TNT
del DEFAULT.CFG
copy .\GUS\*.*
cd ..
cd PLUTONIA
del DEFAULT.CFG
copy .\GUS\*.*
cd ..
cls
goto game

:SB16
CONFIG -set "mididevice=default"
cd TNT
del DEFAULT.CFG
copy .\sb16\*.*
cd ..
cd PLUTONIA
del DEFAULT.CFG
copy .\sb16\*.*
cd ..
cls
goto game

:SC55
CONFIG -set "mididevice=fluidsynth"
cd TNT
del DEFAULT.CFG
copy .\sc55\*.*
cd ..
cd PLUTONIA
del DEFAULT.CFG
copy .\sc55\*.*
cd ..
cls
goto game

:game
@echo off 
cls
echo.
echo Press 1 for Final Doom: Plutonia Experiment
echo Press 2 for Final Doom: TNT: Evilution
echo Press 3 for Final Doom: Plutonia Experiment Network Multiplayer
echo Press 4 for Final Doom: TNT: Evilution Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto tntmulti
if errorlevel = 3 goto plutmulti
if errorlevel = 2 goto tnt
if errorlevel = 1 goto plut

:plut
cd plutonia
cls
@doom2
goto quit

:tnt
cd tnt
cls
@DOOM2
goto quit

:plutmulti
copy extip*.* .\plutonia\
cd plutonia
cls
network
goto quit

:tntmulti
copy extip*.* .\tnt\
cd tnt
cls
network
goto quit

:quit
exit