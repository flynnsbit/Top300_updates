:menu
echo off
cls
echo.
echo Press 1 for Lands of Lore: Guardians of Destiny
echo Press 2 for Lands of Lore: Guardians of Destiny 3DFX
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto bio2
if errorlevel = 1 goto bio1

:bio1
cls
cd westwood\lolg
call run.bat
goto quit

:bio2
cls
cd westwood\lolg3d
call run.bat
goto quit

:quit
exit