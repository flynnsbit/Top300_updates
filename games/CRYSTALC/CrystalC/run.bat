:menu
echo off
cls
echo.
echo Press 1 for Crystal Caves Vol 1: Troubles with Twibbles
echo Press 2 for Crystal Caves Vol 2: Slugging it Out
echo Press 3 for Crystal Caves Vol 3: Mylo Versus the Supernova
echo Press 4 to Quit
echo.
choice /c:1234 /N Please Choose

if errorlevel = 4 goto quit
if errorlevel = 3 goto cc3
if errorlevel = 2 goto cc2
if errorlevel = 1 goto cc1

:cc1
cls
cd cc1
cc1
cd ..
goto menu

:cc2
cls
cd cc2
cc2
cd ..
goto menu

:cc3
cls
cd cc3
cc3
cd ..
goto menu

:quit