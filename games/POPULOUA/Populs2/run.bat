:menu
echo off
cls
echo.
echo Press 1 to play Populous II Low Res with 256 colors
echo Press 2 to play Populous II High Res with 16 Colors
echo Press 3 to play Network Multiplayer
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto hi
if errorlevel = 1 goto lo

:lo
cd POP2_256
cls
call GO
goto quit

:hi
cd POP2_16
cls
call GO
goto quit

:network
cls
network

:quit
exit