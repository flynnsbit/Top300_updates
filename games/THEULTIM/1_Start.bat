cd UltDoom
:menu
echo off
cls
echo.
echo Press 1 for Fast The Ultimate Doom
echo Press 2 for Original The Ultimate Doom
echo Press 3 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto doom
if errorlevel = 1 goto fdoom


:fdoom
call fastrun

:doom
call run

:quit
