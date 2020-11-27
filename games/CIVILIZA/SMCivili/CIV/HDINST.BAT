@echo off
cls
if %1"==" goto drive
md %1\civ
copy *.* %1\civ
%1
cd\civ
civ
cls
echo.
echo.
echo.
echo To play now, type CIV
echo To play later type CD\CIV
echo type CIV
echo.
goto END
:drive
cls
echo.
echo.
echo.
echo Enter HDINST followed by DRIVE letter and colon
echo.
echo e.g. HDINST C:
echo.
goto end
:end
