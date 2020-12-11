:menu
echo off
cls
echo.
echo Press 1 to play Amberstar
echo Press 2 to launch the Character Maker
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto bio2
if errorlevel = 1 goto bio1

:bio1
cls
amber
goto menu

:bio2
cls
MAKECHAR
goto menu

:quit
exit