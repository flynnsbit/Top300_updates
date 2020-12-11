:menu
echo off
cls
echo.
echo Press 1 for Single Player
echo Press 2 for Network Multiplayer
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto network
if errorlevel = 1 goto single

:single
cd FLTSIM5
cls
call FS
goto menu

:network
cls
network

:quit
exit