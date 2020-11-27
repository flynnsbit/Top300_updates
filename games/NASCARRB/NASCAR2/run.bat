:menu
echo off
cls
echo.
echo Press 1 for NASCAR Racing 2 
echo Press 2 for NASCAR Racing 2 3DFX
echo Press 3 to play Network Multiplayer
rem echo Press 2 for Grand National Series Pack 3DFX
echo Press 4 to Quit
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto gns
rem if errorlevel = 2 goto 3dfx
if errorlevel = 1 goto nascar

:nascar
cd NAS50TH
cls
call N50
goto quit

:3dfx
cd NAS50TH
cls
call NAS3DFX.bat
goto quit

:gns
cd NAS50TH
cls
call GNS3DFX.bat
goto quit

:network
cls
call network
goto quit

:quit
exit