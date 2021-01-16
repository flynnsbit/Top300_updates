:menu
@echo off
cls
echo.
echo Press 1 for Transport Tycoon Deluxe w/ SoundBlaster
echo Press 2 for Transport Tycoon Deluxe w/ MT32
echo Press 3 for Transport Tycoon Deluxe w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del MUSIC.COM
del SOUND.CFG
del SOUND.COM
del SOUNDRV.COM
xcopy .\sb16\*.*
cls
@TYCOON
goto quit

:MT32
mt32-pi -m -v
del MUSIC.COM
del SOUND.CFG
del SOUND.COM
del SOUNDRV.COM
xcopy .\mt32\*.*
cls
@TYCOON
goto quit

:SC55
mt32-pi -g -v
del MUSIC.COM
del SOUND.CFG
del SOUND.COM
del SOUNDRV.COM
xcopy .\sc55\*.*
cls
@TYCOON
goto quit

:quit
exit