:menu
echo off
cls
echo.
echo Press 1 for Al-Qadim: The Genie's Curse w/ SoundBlaster
echo Press 2 for Al-Qadim: The Genie's Curse w/ Sound Canvas
echo Press 3 for Al-Qadim: The Genie's Curse w/ Gravis Ultrasound
echo Press 4 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto GUS
if errorlevel = 2 goto SC55
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
cls
call GENIE
goto quit

:SC55
mt32-pi -g -v
xcopy .\sc55\*.* .\
cls
call GENIE
goto quit

:GUS
REM CONFIG -set"mididevice=default"
xcopy .\GUS\*.* .\
cls
call GENIE
goto quit

:quit
exit