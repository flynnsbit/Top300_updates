:menu
@echo off
cls
echo.
echo Press 1 for Lands of Lore: Guardians of Destiny w/ SoundBlaster
echo Press 2 for Lands of Lore: Guardians of Destiny w/ MPU-401
echo Press 3 for Lands of Lore: Guardians of Destiny w/ Sound Canvas
echo Press 4 for Lands of Lore: Guardians of Destiny w/ CD Audio
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto CDA
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MPU401
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del LOLSETUP.INI
xcopy .\sb16\*.*
cls
@LOLG
goto quit

:CDA
CONFIG -set "mididevice=default"
del LOLSETUP.INI
xcopy .\CDA\*.*
cls
@LOLG
goto quit

:MPU401
mt32-pi -m -v
del LOLSETUP.INI
xcopy .\mpu401\*.*
cls
@LOLG
goto quit

:SC55
mt32-pi -g -v
del LOLSETUP.INI
xcopy .\sc55\*.*
cls
@LOLG
goto quit

:quit
exit