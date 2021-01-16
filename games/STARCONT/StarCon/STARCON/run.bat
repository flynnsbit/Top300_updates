:menu
@echo off
cls
echo.
echo Press 1 for Star Control w/ Game Blaster
echo Press 2 for Star Control w/ SoundBlaster
echo Press 3 for Star Control w/ MT-32
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto CMS

:CMS
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
cls
@STARCON /s:cms
goto quit

:SB16
REM CONFIG -set"mididevice=default"
cls
@STARCON /s:adlib
goto quit

:MT32
mt32-pi -m -v
cls
@STARCON /s:MT32
goto quit

:quit
exit