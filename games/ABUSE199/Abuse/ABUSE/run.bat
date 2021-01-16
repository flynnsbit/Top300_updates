:menu
@echo off
cls
echo.
echo Press 1 for Abuse w/ SoundBlaster (No music)
echo Press 2 for Abuse w/ MT-32
echo Press 3 for Abuse w/ Sound Canvas
echo Press 4 to play Network Multiplayer
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto network
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del SNDCARD.CFG
xcopy .\sb16\*.*
cls
@ABUSE
goto quit

:MT32
mt32-pi -m -v
del SNDCARD.CFG
xcopy .\mt32\*.*
cls
@ABUSE
goto quit

:SC55
mt32-pi -g -v
del SNDCARD.CFG
xcopy .\sc55\*.*
cls
@ABUSE
goto quit

:network
cd ..
copy extip*.* .\abuse\
cd abuse
mt32-pi -g -v
del SNDCARD.CFG
xcopy .\sc55\*.*
cls
network

:quit
exit