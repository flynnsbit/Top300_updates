:menu
echo off
cls
echo.
echo Press 1 for The Lemmings Chronicles w/ SB16 (Floppy Version)
echo Press 2 for The Lemmings Chronicles w/ Gravis (Floppy Version)
echo Press 3 for The Lemmings Chronicles w/ CD Audio
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto CD
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
cls
cd floppy
call l3
cd ..
goto menu

:epi2
cls
cd l3gus
call l3
cd ..
goto menu

:CD
imgset ide10 "/cd/lemm3/lemming.cue"


@jchoice
cls
cd l3
call l3
cd ..
goto menu

:quit
exit
