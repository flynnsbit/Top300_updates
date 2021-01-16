:menu
echo off
cls
echo.
echo Press 1 for Super Star Wars w/ SoundBlaster
echo Press 2 for Super Star Wars w/ MT-32
echo Press 3 for Super Star Wars w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
cls
SSW
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
SSW
goto quit

:SC55
mt32-pi -g -v
xcopy .\sc55\*.* .\
cls
SSW
goto quit

:quit
exit