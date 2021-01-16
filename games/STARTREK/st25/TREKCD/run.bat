:menu
@echo off
cls
echo.
echo Press 1 for Star Trek: 25th Anniversary w/ SoundBlaster EGA
echo Press 2 for Star Trek: 25th Anniversary w/ SoundBlaster VGA
echo Press 3 for Star Trek: 25th Anniversary w/ MT-32 EGA
echo Press 4 for Star Trek: 25th Anniversary w/ MT-32 VGA
echo Press 5 to Quit
echo.
echo VGA is 256 Colors in 320x200
echo EGA is 16 Colors in 640x480
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto MT32v
if errorlevel = 3 goto MT32e
if errorlevel = 2 goto SB16v
if errorlevel = 1 goto SB16e

:SB16e
CONFIG -set "mididevice=default"
xcopy .\sb16_e\*.* .\
cls
@STARTREK
goto quit

:SB16v
CONFIG -set "mididevice=default"
xcopy .\sb16_v\*.* .\
cls
@STARTREK
goto quit

:MT32e
CONFIG -set "mididevice=mt32"
xcopy .\mt32_e\*.* .\
cls
@STARTREK
goto quit

:MT32v
CONFIG -set "mididevice=mt32"
xcopy .\mt32_v\*.* .\
cls
@STARTREK
goto quit

:quit
exit