:menu
echo off
cls
echo.
echo Press 1 for Star Control II
echo Press 2 for Super Melee
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
cls
cd starcon2
STARCON2 /g:BIOS
cd ..
goto menu

:epi2
cls
cd starcon2
MELEE.COM /g:BIOS
cd ..
goto menu

:quit
exit