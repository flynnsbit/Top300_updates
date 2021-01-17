:menu
echo off
cls
echo.
echo Press 1 for Jurassic Park (Floppy) w/ SoundBlaster
echo Press 2 for Jurassic Park (Floppy) w/ MT-32
echo Press 3 for Jurassic Park (Floppy) w/ Sound Canvas
echo Press 4 for Jurassic Park CD Version
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto CD
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd jp
xcopy .\sb16\*.* .\
cls
call jp
goto quit

:MT32
mt32-pi -m -v
cd jp
xcopy .\mt32\*.* .\
cls
call jp
goto quit

:SC55
mt32-pi -g -v
cd jp
xcopy .\sc55\*.* .\
cls
call jp
goto quit

:CD
REM CONFIG -set"mididevice=default"
d:
cls
call jp
goto quit

:quit
exit