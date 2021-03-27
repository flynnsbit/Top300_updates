:menu
@echo off
cls
echo.
echo Press 1 for Ultima Underworld: The Stygian Abyss w/ SoundBlaster
echo Press 2 for Ultima Underworld: The Stygian Abyss w/ MT32
echo Press 3 for Ultima Underworld: The Stygian Abyss w/ Sound Canvas
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
cls
cd ..
cd SOUND
del aw01.xmi
del aw02.xmi
del aw03.xmi
del aw04.xmi
del aw05.xmi
del aw06.xmi
del aw07.xmi
del aw10.xmi
del aw11.xmi
del aw12.xmi
del aw13.xmi
del aw15.xmi
del uw01.xmi
del uw02.xmi
del uw03.xmi
del uw04.xmi
del uw05.xmi
del uw06.xmi
del uw07.xmi
del uw10.xmi
del uw11.xmi
del uw12.xmi
del uw13.xmi
del uw15.xmi
xcopy .\orig\*.*
cd ..
cls
RUN_EMM E: \GAMES\ULTIMAUN\ULTIMAU1 UW
goto quit
cls

:MT32
mt32-pi.exe -m -b cm32l
cd DATA
del UW.CFG
xcopy .\mt32\*.*
cd ..
cd SOUND
del aw01.xmi
del aw02.xmi
del aw03.xmi
del aw04.xmi
del aw05.xmi
del aw06.xmi
del aw07.xmi
del aw10.xmi
del aw11.xmi
del aw12.xmi
del aw13.xmi
del aw15.xmi
del uw01.xmi
del uw02.xmi
del uw03.xmi
del uw04.xmi
del uw05.xmi
del uw06.xmi
del uw07.xmi
del uw10.xmi
del uw11.xmi
del uw12.xmi
del uw13.xmi
del uw15.xmi
xcopy .\orig\*.*
cd ..
cls
RUN_EMM E: \GAMES\ULTIMAUN\ULTIMAU1 UW
goto quit
cls

:SC55
mt32-pi -g -v
cd DATA
del UW.CFG
xcopy .\sc55\*.*
cd ..
cd SOUND
del aw01.xmi
del aw02.xmi
del aw03.xmi
del aw04.xmi
del aw05.xmi
del aw06.xmi
del aw07.xmi
del aw10.xmi
del aw11.xmi
del aw12.xmi
del aw13.xmi
del aw15.xmi
del uw01.xmi
del uw02.xmi
del uw03.xmi
del uw04.xmi
del uw05.xmi
del uw06.xmi
del uw07.xmi
del uw10.xmi
del uw11.xmi
del uw12.xmi
del uw13.xmi
del uw15.xmi
xcopy .\sc55\*.*
cd ..
cls
RUN_EMM E: \GAMES\ULTIMAUN\ULTIMAU1 UW
goto quit
cls

:quit
exit
