:menu
echo off
cls
echo.
echo Press 1 for Rayman Forever
echo Press 2 for Rayman By His Fans
echo Press 3 for Rayman Designer
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto epi3
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
cls
rayman
goto menu

:epi2
cls
cd rayfan
rayfan ver=usa
jchoice
cd ..
goto menu

:epi3
cls
cd raykit
raykit ver=usa
cd ..
goto menu

:quit
exit