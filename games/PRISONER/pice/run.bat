:menu
echo off
cls
echo.
echo Press 1 for Prisoner of Ice (US) 320x240
echo Press 2 for Prisoner of Ice (US) 640x480
echo Press 3 for Prisoner of Ice (EU) 320x240
echo Press 4 for Prisoner of Ice (EU) 640x480
echo Press 5 to Quit
echo.
echo The US and Euro releases have different voice acting,
echo different accents, and even different scripts in areas.
echo.
echo In addition, the 320 resolution version has additional
echo animation that is not present in the 640 version.
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto EU640
if errorlevel = 3 goto EU320
if errorlevel = 2 goto US640
if errorlevel = 1 goto US320

:US320
mount d .\eXoDOS\pice\cd-us -t cdrom
d:
cls
ice320
goto quit

:US640
mount d .\eXoDOS\pice\cd-us -t cdrom
d:
cls
ice640
goto quit

:EU320
mount d .\eXoDOS\pice\cd-eur -t cdrom
d:
cls
ice320
goto quit

:EU640
mount d .\eXoDOS\pice\cd-eur -t cdrom
d:
cls
ice640
goto quit

:quit
exit