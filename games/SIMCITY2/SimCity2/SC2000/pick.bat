@echo off
cls
echo.
echo Press 1 for SimCity 2000
echo Press 2 for Urban Renewal Kit
echo Press 3 to Quit
echo.
choice /c:123 /N

if errorlevel = 3 goto end
if errorlevel = 2 goto urk
if errorlevel = 1 goto sc2

:sc2
cls
@call sc2vesa
goto end

:urk
cls
@scurk
goto end

:end