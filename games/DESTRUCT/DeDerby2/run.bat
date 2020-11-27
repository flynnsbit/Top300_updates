echo off
cls
echo.
echo Press 1 to run Destruction Derby 2
echo Press 2 to run Hi-Res Destruction Derby 2
echo Press 3 to Quit
echo.
choice /c:123 /n Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto hires
if errorlevel = 1 goto norm

:norm
cd dd2
cls
DD2
goto quit

:hires
cd dd2
cls
DD2HIRES
goto quit

:quit