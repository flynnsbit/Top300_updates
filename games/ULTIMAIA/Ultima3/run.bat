:menu
echo off
cls
echo.
echo Press 1 for Ultima III: Exodus (Original)
echo Press 2 for Ultima III: Exodus (Upgrade)
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto upgrade
if errorlevel = 1 goto original

:original
REM CONFIG -set"cycles=300"
cls
ultima.com
goto quit
cls

:upgrade
REM CONFIG -set"cycles=5000"
cd .\upgrade
cls
call run.bat
goto quit
cls

:quit
exit