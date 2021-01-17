:menu
@echo off
cls
echo.
echo Press 1 for Ultima Underworld 2: Labyrinth of Worlds w/ SoundBlaster
echo Press 2 for Ultima Underworld 2: Labyrinth of Worlds w/ MT32
echo Press 3 for Ultima Underworld 2: Labyrinth of Worlds w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd DATA
del UW.CFG
xcopy .\sb16\*.*
cd ..
cd SOUND
del uwa01.xmi
del uwa02.xmi
del uwa03.xmi
del uwa04.xmi
del uwa05.xmi
del uwa06.xmi
del uwa07.xmi
del uwa10.xmi
del uwa11.xmi
del uwa12.xmi
del uwa13.xmi
del uwa14.xmi
del uwa15.xmi
del uwa16.xmi
del uwa17.xmi
del uwa30.xmi
del uwa31.xmi
del uwr01.xmi
del uwr02.xmi
del uwr03.xmi
del uwr04.xmi
del uwr05.xmi
del uwr06.xmi
del uwr07.xmi
del uwr10.xmi
del uwr11.xmi
del uwr12.xmi
del uwr13.xmi
del uwr14.xmi
del uwr15.xmi
del uwr16.xmi
del uwr17.xmi
del uwr30.xmi
del uwr31.xmi
xcopy .\orig\*.*
cd ..
cls
@UW2
goto quit
cls

:MT32
mt32-pi -m -v
cd DATA
del UW.CFG
xcopy .\mt32\*.*
cd ..
cd SOUND
del uwa01.xmi
del uwa02.xmi
del uwa03.xmi
del uwa04.xmi
del uwa05.xmi
del uwa06.xmi
del uwa07.xmi
del uwa10.xmi
del uwa11.xmi
del uwa12.xmi
del uwa13.xmi
del uwa14.xmi
del uwa15.xmi
del uwa16.xmi
del uwa17.xmi
del uwa30.xmi
del uwa31.xmi
del uwr01.xmi
del uwr02.xmi
del uwr03.xmi
del uwr04.xmi
del uwr05.xmi
del uwr06.xmi
del uwr07.xmi
del uwr10.xmi
del uwr11.xmi
del uwr12.xmi
del uwr13.xmi
del uwr14.xmi
del uwr15.xmi
del uwr16.xmi
del uwr17.xmi
del uwr30.xmi
del uwr31.xmi
xcopy .\orig\*.*
cd ..
cls
@UW2
goto quit
cls

:SC55
mt32-pi -g -v
cd DATA
del UW.CFG
xcopy .\sc55\*.*
cd ..
cd SOUND
del uwa01.xmi
del uwa02.xmi
del uwa03.xmi
del uwa04.xmi
del uwa05.xmi
del uwa06.xmi
del uwa07.xmi
del uwa10.xmi
del uwa11.xmi
del uwa12.xmi
del uwa13.xmi
del uwa14.xmi
del uwa15.xmi
del uwa16.xmi
del uwa17.xmi
del uwa30.xmi
del uwa31.xmi
del uwr01.xmi
del uwr02.xmi
del uwr03.xmi
del uwr04.xmi
del uwr05.xmi
del uwr06.xmi
del uwr07.xmi
del uwr10.xmi
del uwr11.xmi
del uwr12.xmi
del uwr13.xmi
del uwr14.xmi
del uwr15.xmi
del uwr16.xmi
del uwr17.xmi
del uwr30.xmi
del uwr31.xmi
xcopy .\sc55\*.*
cd ..
cls
@UW2
goto quit
cls

:quit
exit