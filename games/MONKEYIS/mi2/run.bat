:menu
echo off
cls
echo.
echo Press 1 to play Monkey Island 2: LeChuck's Revenge w/ Soundblaster
echo Press 2 to play Monkey Island 2: LeChuck's Revenge w/ MT32 & SB16 SFX
echo Press 3 to play Monkey Island 2: LeChuck's Revenge Ultimate Talkie Edition
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto talkie
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
cd sb16
cls
monkey2 s
goto quit

:MT32
CONFIG -set "mididevice=mt32"
cd mt32
cls
monkey2 s
goto quit

:talkie
CONFIG -set "mididevice=mt32"
cd talkie
cls
monkey2 s
goto quit

:quit
exit