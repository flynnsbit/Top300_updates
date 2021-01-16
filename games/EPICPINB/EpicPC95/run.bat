:menu
echo off
cls
echo.
echo Press 1 for Epic Pinball w/ SoundBlaster
echo Press 2 for Epic Pinball w/ Gravis Ultrasound
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
REM CONFIG -set"gus=false"
cd EPIC
xcopy .\sb16\*.* .\
d:
cd pinball
cls
pinball
goto quit

:GUS
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=none"
cd ULTRASND
ultramid
cd ..
cd EPIC
xcopy .\GUS\*.* .\
d:
cd pinball
cls
pinball
goto quit

:quit
exit