@echo off
cls
mode co80

call inst.exe -f

rem *** make sure install was completed before running vesa.bat ***
IF NOT EXIST RESOURCE.CFG  GOTO end
IF NOT EXIST INSTALL.EXE   GOTO end

call vesa.bat

cd ..
cls

echo ÿTo play King's Quest 7 now:
echo ÿ At the DOS prompt, type kq7dos and press [ENTER].
echo.
echo ÿTo play King's Quest 7 later:
echo ÿ From the game directory,
echo   type kq7dos and press [ENTER].
echo.
pause
goto end

:end

