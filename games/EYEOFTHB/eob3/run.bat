:menu
echo off
cls
echo.
echo Press 1 for Eye of the Beholder III w/ SoundBlaster
echo Press 2 for Eye of the Beholder III w/ MT32
echo Press 3 for Eye of the Beholder III w/ Sound Canvas
echo Press 4 to Transfer Characters from Eye of the Beholder 2
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto TRAN
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SOUND.CFG
xcopy .\sb16\*.*
cls
call eye
goto quit

:MT32
CONFIG -set "mididevice=mt32"
del SOUND.CFG
xcopy .\mt32\*.*
cls
call eye
goto quit

:SC55
CONFIG -set "mididevice=fluidsynth"
del SOUND.CFG
xcopy .\sc55\*.*
cls
call eye
goto quit

:TRAN
cls
echo.
echo This requires that you have Eye of the Beholder II installed.
echo Once the transfer program begins, simply click start. If you
echo have more than one party, you may choose the one you would like
echo to transfer at this point. Now inside Eye of the Beholder III
echo you can select "Transfer Heroes from Dark Moon".
echo.
@jchoice
cls
cd..
md darkmoon
xcopy .\eob2\*.* .\darkmoon\
cd eob3
CHARCOPY
cd ..
cd darkmoon
del *.*
cd..
rd darkmoon
cd eob3
cls
goto menu

:quit
exit