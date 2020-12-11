:menu
echo off
cls
echo.
echo Press 1 for Zork I
echo Press 2 for Zork I w/ Amiga Text
echo Press 3 for Zork I Solid Gold Edition
echo Press 4 to Quit
echo.
echo The Solid Gold re-release included a built in hint
echo system. Typing HINT will activiate it.
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto GOLD
if errorlevel = 2 goto AMIGA
if errorlevel = 1 goto FROTZ

:FROTZ
cls
frotz -d 0 zork1.dat
goto quit

:AMIGA
cls
frotz -d 5 zork1.dat
goto quit

:GOLD
cd zork
cls
ZORK1
goto quit

:quit
exit
