:menu
echo off
cls
echo.
echo Press 1 for Scorched Earth v1.0
echo Press 2 for Scorched Earth v1.1
echo Press 3 for Scorched Earth v1.23
echo Press 4 for Scorched Earth v1.5
echo Press 5 to Quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto epi4
if errorlevel = 3 goto epi3
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
cls
cd Scorch1.0
scorch
cd ..
goto menu

:epi2
cls
cd Scorch1.1
scorch
cd ..
goto menu

:epi3
cls
cd Scorch1.2
scorch
cd ..
goto menu

:epi4
config -set "cycles=30000"
cls
cd Scorch1.50
scorch
cd ..
goto menu

:quit
exit