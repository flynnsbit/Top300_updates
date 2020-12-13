:menu
echo off
cls
echo.
echo Press 1 for Lemmings w/ Adlib Music
echo Press 2 for Lemmings w/ CD Music
echo Press 3 for Lemmings Official Companion Bonus Disk Levels
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto bonus
if errorlevel = 2 goto CD
if errorlevel = 1 goto ADLIB

:ADLIB
del russell.dat
copy .\russell\russell.dat .\
cls
a:
call lemmings vga
goto menu

:CD
cd CDLEMM
cls
lemmings
cd ..
goto menu

:bonus
a:
cls
lemmings vga
goto menu

:quit
exit
