:menu
@echo off
cls
echo.
echo Press 1 for Super Street Fighter II w/ SoundBlaster
echo Press 2 for Super Street Fighter II w/ MT-32
echo Press 3 for Super Street Fighter II w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd drv
copy .\sb16\*.* .\
cd ..
cls
@SSF
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd drv
copy .\mt32\*.* .\
cd ..
cls
@SSF
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
cd drv
copy .\sc55\*.* .\
cd ..
cls
@SSF
goto quit

:quit
exit