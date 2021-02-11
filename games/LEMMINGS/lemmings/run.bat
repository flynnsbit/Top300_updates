:menu
echo off
cls
echo.
echo Press 1 for Lemmings w/ Adlib Music
echo Press 2 for Lemmings w/ CD Music
echo Press 3 for Oh No More Lemmings w/ CD Music
echo Press 4 for Lemmings Official Companion Bonus Disk Levels
echo Press 5 to quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto bonus
if errorlevel = 3 goto CdOhNo
if errorlevel = 2 goto CD
if errorlevel = 1 goto ADLIB

:ADLIB
attrib -h -r russell.dat
del russell.dat
copy e:\games\lemmings\lemmings\russell\*.* e:\games\lemmings\lemmings
attrib -H +R russell.dat
sysctl sys L1-
cls
VGALEMMI /v
sysctl menu
goto quit

:CdOhNo
CALL imgtry ide10 D "/cd/lemmings/az_2246.chd" "/cd/lemmings/az_2246.cue"
run_emm E: \games\lemmings\lemmings\cdlemm ohno vga
goto quit

:CD
CALL imgtry ide10 D "/cd/lemmings/az_2246.chd" "/cd/lemmings/az_2246.cue"
run_emm E: \games\lemmings\lemmings\cdlemm lemmings vga
goto quit

:bonus
CALL imgtry fdd0 A "/floppy/lemmings/lemming.chd" "/floppy/lemmings/lemming.img"
a:
sysctl sys L1-
cls
call lemmings vga
e:
imgset fdd0 ""
sysctl menu
goto quit

:quit
exit