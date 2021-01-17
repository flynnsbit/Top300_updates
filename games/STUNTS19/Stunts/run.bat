:menu
echo off
cls
echo.
echo Press 1 for Stunts w/ Tandy
echo Press 2 for Stunts w/ SoundBlaster
echo Press 3 for Stunts w/ MT-32
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto TANDY

:TANDY
REM CONFIG -set"mididevice=default"
xcopy .\tandy\*.* .\
cls
ST
goto quit

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
cls
ST
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
ST
goto quit

:quit
exit