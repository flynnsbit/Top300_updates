:menu
echo off
cls
echo.
echo Press 1 for Sid Meier's Civilization w/ Tandy
echo Press 2 for Sid Meier's Civilization w/ SoundBlaster
echo Press 3 for Sid Meier's Civilization w/ MT-32
echo Press 4 for Sid Meier's Civilization w/ General MIDI
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto SC55
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto tandy

:SB16
cls
echo.
echo During setup, when prompted to select a sound mode
echo choose: 6) Custom sound driver
echo.
echo Do not choose: 4) Adlib\Sound Blaster 
echo as this sounds much worse
echo. 
@jchoice
cls
REM CONFIG -set"mididevice=default"
CD CIV
xcopy .\sb16\*.* .\
cls
civ
goto quit

:MT32
cls
echo.
echo During setup, when prompted to select a sound mode
echo choose: 5) Roland MT-32 MIDI Board
echo. 
@jchoice
cls
mt32-pi -m -v
CD CIV
cls
civ
goto quit

:SC55
cls
echo.
echo During setup, when prompted to select a sound mode
echo choose: 6) Custom sound driver
echo. 
@jchoice
cls
mt32-pi -g -v
CD CIV
xcopy .\sc55\*.* .\
cls
civ
goto quit

:tandy
cls
echo.
echo During setup, when prompted to select a sound mode
echo choose: 3) Tandy sounds
echo. 
@jchoice
cls
REM CONFIG -set"mididevice=default"
CD CIV
cls
civ
goto quit

:quit
exit