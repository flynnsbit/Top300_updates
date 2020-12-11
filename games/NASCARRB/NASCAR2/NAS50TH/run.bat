:menu
@echo off
cls
echo.
echo Press 1 for NASCAR Racing 2 
echo Press 2 for NASCAR Racing 2 3DFX
rem echo Press 2 for Grand National Series Pack 3DFX
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto gns
rem if errorlevel = 2 goto 3dfx
if errorlevel = 1 goto nascar

:nascar
cls
@call N50
goto quit

:3dfx
cls
@call NAS3DFX.bat
goto quit

:gns
cls
@call GNS3DFX.bat
goto quit

:quit
exit