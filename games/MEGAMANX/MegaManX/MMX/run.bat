:menu
@echo off
cls
echo.
echo Press 1 for Mega Man X w/ SoundBlaster
echo Press 2 for Mega Man X w/ MT-32
echo Press 3 for Mega Man X w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd drv
xcopy .\sb16\*.* .\
cd ..
cls
@call MMX
goto quit

:MT32
mt32-pi -m -v
cd drv
xcopy .\mt32\*.* .\
cd ..
cls
@call MMX
goto quit

:SC55
mt32-pi -g -v
cd drv
xcopy .\sc55\*.* .\
cd ..
cls
@call MMX
goto quit

:quit
exit