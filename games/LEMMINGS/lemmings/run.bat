:menu
@echo off
cls
echo.
echo Press 1 for Lemmings w/ Adlib Music
echo Press 2 for Lemmings w/ CD Music (EMM386 Required)
echo Press 3 for Oh No More Lemmings w/ CD Musc (EMM386 Required)
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
del russell.dat
copy .\russell\russell.dat .\
attrib +R russell.dat
sysctl sys L1-
cls
VGALEMMI /v
sysctl menu
goto quit

:CdOhNo
imgset ide10 "/cd/lemmings/az_2246.cue"
cd CDLEMM
cls
ohno vga
cd ..
goto quit

:CD
imgset ide10 "/cd/lemmings/az_2246.cue"
cd CDLEMM
cls
lemmings vga
cd ..
goto quit

:bonus
imgset fdd0 "/floppy/lemmings/lemming.img"
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
