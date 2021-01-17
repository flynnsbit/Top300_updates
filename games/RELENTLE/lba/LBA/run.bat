:menu
@echo off
cls
echo.
echo Press 1 for Little Big Adventure w/ SoundBlaster
echo Press 2 for Little Big Adventure w/ Gravis Ultrasound
echo Press 3 for Little Big Adventure w/ MT-32
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
cls
@LBA
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
@LBA
goto quit

:GUS
REM CONFIG -set"mididevice=default"
xcopy .\gus\*.* .\
cls
@LBA
goto quit

:quit
exit