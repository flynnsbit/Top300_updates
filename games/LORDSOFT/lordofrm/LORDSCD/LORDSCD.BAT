@echo off
choice.exe
if errorlevel 2 goto lords_ddr
if errorlevel 1 goto lords_uk
goto end
:lords_uk
lords
GOTO loop
:lords_ddr
lordsddr

:loop
choice.exe
if errorlevel 2 goto lord2_ddr
if errorlevel 1 goto lord2_uk
goto end
:lord2_uk
lords x
GOTO loop
:lord2_ddr
lordsddr x
GOTO loop
:end


