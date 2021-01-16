:menu
@echo off
cls
echo.
echo Press 1 for X-COM: Terror from the Deep w/ SoundBlaster
echo Press 2 for X-COM: Terror from the Deep w/ MT32
echo Press 3 for X-COM: Terror from the Deep w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd SOUND
del MUSIC.COM
del SOUND.CFG
del SOUNDRV.COM
xcopy .\sb16\*.*
cd ..
cls
@call RUNXCOM
goto quit

:MT32
mt32-pi -m -v
cd SOUND
del MUSIC.COM
del SOUND.CFG
del SOUNDRV.COM
xcopy .\mt32\*.*
cd ..
cls
@call RUNXCOM
goto quit

:SC55
mt32-pi -g -v
cd SOUND
del MUSIC.COM
del SOUND.CFG
del SOUNDRV.COM
xcopy .\sc55\*.*
cd ..
cls
@call RUNXCOM
goto quit

:quit
exit