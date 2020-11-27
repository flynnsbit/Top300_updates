:menu
@echo off
cls
echo.
echo Press 1 for Star Control w/ Game Blaster
echo Press 2 for Star Control w/ SoundBlaster
echo Press 3 for Star Control w/ MT-32
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB16
if errorlevel = 1 goto CMS

:CMS
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=gb"
cls
@STARCON /s:cms
goto quit

:SB16
CONFIG -set "mididevice=default"
cls
@STARCON /s:adlib
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cls
@STARCON /s:MT32
goto quit

:quit
exit