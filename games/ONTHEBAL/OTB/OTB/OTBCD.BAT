@echo off
playintr 200    0  5  1 1 0 0 0
memtest.exe
if errorlevel 100 goto end
:kickagain
kecd c >errork.txt
if errorlevel 2 goto edi
if errorlevel 1 goto kickagain
goto end
:edi
editor
goto kickagain
:end
:echo.
:echo Deliver me!
:echo.
