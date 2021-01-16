:menu
echo off
cls
echo.
echo Press 1 for Star Trek: Judgement Rites w/ SoundBlaster
echo Press 2 for Star Trek: Judgement Rites w/ MT-32
echo Press 3 for Star Trek: Judgement Rites w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
xcopy .\sb16\*.* .\
cls
rites
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
rites
goto quit

:SC55
mt32-pi -g -v
xcopy .\sc55\*.* .\
cls
rites
goto quit

:quit
exit