:menu
echo off
cls
echo.
echo Press 1 for Spear of Destiny
echo Press 2 for Mission 2: Return to Danger
echo Press 3 for Mission 3: Ultimate Challenge
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto epi3
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
cls
cd M1
SPEAR
cd ..
goto menu

:epi2
cls
cd M2
SPEAR
cd ..
goto menu

:epi3
cls
cd M3
SPEAR
cd ..
goto menu

:quit
exit