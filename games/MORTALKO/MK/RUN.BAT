:menu
echo off
cls
echo.
echo Press 1 for Mortal Kombat w/ SoundBlaster
echo Press 2 for Mortal Kombat w/ MT-32
echo Press 3 for Mortal Kombat CD
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd mk1
xcopy .\sb16\*.* .\
cls
call mk1
goto quit

:MT32
mt32-pi -m -v
cd kombat
xcopy .\mt32\*.* .\
cls
call play
goto quit

:SC55
CONFIG -set "mididevice=default"
cd MK1
cls
mk1
goto quit

:quit
exit
