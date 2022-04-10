cd DOOM
:menu
echo off
cls
echo.
echo Press 1 for Fast Doom
echo Press 2 for Original Doom
echo Press 3 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto doom
if errorlevel = 1 goto fdoom


:fdoom

CD\GAMES\DOOM1993
call fastrun

:doom
CD\GAMES\DOOM1993
call run

:quit
