:menu
echo off
cls
echo.
echo Press 1 for Prince of Persia 2: The Shadow & The Flame w/ SoundBlaster
echo Press 2 for Prince of Persia 2: The Shadow & The Flame w/ MT-32
echo Press 3 for Prince of Persia 2: The Shadow & The Flame w/ Sound Canvas
echo Press 4 to Quit
echo.
echo Note: Sound Canvas does not provide background music during gameplay.
echo Just cutscenes.
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
prince
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
cls
prince
goto quit

:SC55
mt32-pi -g -v
xcopy .\sc55\*.* .\
cls
prince
goto quit

:quit
exit