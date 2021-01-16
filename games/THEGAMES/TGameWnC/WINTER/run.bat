:menu
@echo off
cls
echo.
echo Press 1 for The Games: Winter Challenge w/ Tandy
echo Press 2 for The Games: Winter Challenge w/ SoundBlaster
echo Press 3 for The Games: Winter Challenge w/ MT-32
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
@WINTER.COM
goto quit

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
cls
@WINTER.COM
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
@WINTER.COM
goto quit

:quit
exit