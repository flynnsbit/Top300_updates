:menu
echo off
cls
echo.
echo Press 1 for Descent II w/ Gravis Ultrasound
echo Press 2 for Descent II w/ SoundBlaster
echo Press 3 for Descent II w/ Sound Canvas
echo Press 4 for Descent II w/ CD Music
echo Press 5 to play Network Multiplayer
echo Press 6 to Quit
echo.
echo When creating a new pilot, the settings will revert to a low resolution.
echo If you would like 640x480, you will need to select this again in the
echo options after creating your pilot.
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto network
if errorlevel = 4 goto CDA
if errorlevel = 3 goto SC55
if errorlevel = 2 goto SB16
if errorlevel = 1 goto GUS

:SB16
CONFIG -set "mididevice=default"
copy .\descent2\sb16\*.* .\descent2\
cls
goto menu2

:GUS
CONFIG -set "mididevice=default"
copy .\descent2\gus\*.* .\descent2\
cls
goto menu2

:SC55
CONFIG -set "mididevice=fluidsynth"
copy .\descent2\sc55\*.* .\descent2\
cls
goto menu2

:CDA
CONFIG -set "mididevice=default"
copy .\descent2\CD\*.* .\descent2\
cls
goto menu2

:network
CONFIG -set "mididevice=default"
copy .\descent2\CD\*.* .\descent2\
cls
network
goto quit

:menu2
echo off
cls
echo.
echo Press 1 for Descent II
echo Press 2 for Descent II 3DFX
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto bio2
if errorlevel = 1 goto bio1

:bio1
cls
cd descent2
call D2
cd ..
goto quit

:bio2
cls
cd descent2
cycles auto limit 90000
d2_3dfx
cd ..
goto quit

:quit
exit