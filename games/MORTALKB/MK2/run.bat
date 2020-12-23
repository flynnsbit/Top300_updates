:menu
echo off
cls
echo.
echo Press 1 for Mortal Kombat II w/ SoundBlaster
echo Press 2 for Mortal Kombat II w/ Gravis Ultrasound
echo Press 3 for Mortal Kombat II w/ Roland
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto MT32
if errorlevel = 2 goto GUS
if errorlevel = 1 goto SB

:SB
cd mk2
del CMOS.MK2
xcopy .\SB16\*.* .\
cls
mk2
cls
goto quit

:GUS
cd ultrasnd
ULTRAMID
cd ..
cd mk2
del CMOS.MK2
xcopy .\GUS\*.* .\
cls
mk2
cls
goto quit

:MT32
cd mk2
del CMOS.MK2
xcopy .\MT32\*.* .\
cls
mk2
cls
goto quit

:quit
exit