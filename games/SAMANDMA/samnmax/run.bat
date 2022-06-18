:menu
echo off
cls
echo.
echo Press 1 for Sam & Max w/ SoundBlaster
echo Press 2 for Sam & Max w/ MT-32
echo Press 3 for Sam & Max w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd SAMNMAX.CD
copy SETMUSE.SB c:\samnmax.cd\SETMUSE.INI
cd ..
cls
D:
CD SAMNMAX
SAMNMAX
goto quit

:MT32
mt32-pi -m -v
cd SAMNMAX.CD
copy SETMUSE.M32 c:\samnmax.cd\SETMUSE.INI
cd ..
cls
D:
CD SAMNMAX
SAMNMAX
goto quit

:SC55
mt32-pi -g -v
cd SAMNMAX.CD
copy SETMUSE.SC c:\samnmax.cd\SETMUSE.INI
cd ..
cls
D:
CD SAMNMAX
SAMNMAX
goto quit

:quit
exit
