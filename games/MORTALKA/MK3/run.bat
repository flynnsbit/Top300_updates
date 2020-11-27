:menu
echo off
cls
echo.
echo Press 1 for Singleplayer
echo Press 2 for Network Multiplayer
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto network
if errorlevel = 1 goto single

:single
cd mk3
cls
mk3
goto quit

:network
cls
network

:quit
exit