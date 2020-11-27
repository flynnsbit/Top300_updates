:menu
echo off
cls
echo.
echo Press 1 for Battle Isle
echo Press 2 for Battle Isle Data Disk I
echo Press 3 for Battle Isle Data Disk II: The Moon of Chromos
echo Press 4 for History Line: 1914-1918
echo Press 5 to Quit
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto HL1418
if errorlevel = 3 goto BIDD2
if errorlevel = 2 goto BIDD1
if errorlevel = 1 goto BI

:BI
cls
BI
goto quit

:BIDD1
cls
cd b1d1
DESERT
goto quit

:BIDD2
cls
cd b1d2
MOON
goto quit

:HL1418
cls
cd BI1HL
HL14-18
goto quit

:quit
exit