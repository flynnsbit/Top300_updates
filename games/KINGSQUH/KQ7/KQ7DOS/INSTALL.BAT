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

echo �To play King's Quest 7 now:
echo � At the DOS prompt, type kq7dos and press [ENTER].
echo.
echo �To play King's Quest 7 later:
echo � From the game directory,
echo   type kq7dos and press [ENTER].
echo.
@jchoice
goto end

:end

