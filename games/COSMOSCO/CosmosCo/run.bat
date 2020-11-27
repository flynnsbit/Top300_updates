:menu
echo off
cls
echo.
echo Welcome to Cosmo's Cosmic Adventure: Forbidden Planet
echo.
echo Press 1 to play Episode 1 - Adventure 1 of 3
echo Press 2 to play Episode 2 - Adventure 2 of 3
echo Press 3 to play Episode 3 - Adventure 3 of 3
echo Press 4 to Quit
echo.
choice /c:1234 /N Please Choose

if errorlevel = 4 goto quit
if errorlevel = 3 goto cca3
if errorlevel = 2 goto cca2
if errorlevel = 1 goto cca1

:cca1
cls
cosmo1
goto menu

:cca2
cls
cosmo2
goto menu

:cca3
cls
cosmo3
goto menu

:quit