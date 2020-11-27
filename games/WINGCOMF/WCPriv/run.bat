:menu
echo off
cls
echo.
echo Press 1 for Wing Commander: Privateer
echo Press 2 for Wing Commander: Privateer - Righteous Fire
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto RF
if errorlevel = 1 goto WCP

:WCP
cd priv
cls
priv
goto menu

:RF
cd priv
cls
priv r
goto menu

:QUIT