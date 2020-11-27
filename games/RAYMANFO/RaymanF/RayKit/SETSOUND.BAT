@ECHO OFF
if "!%1"=="!" goto end
cd %1
goto end

:end
SETSOUND.EXE VER=USA > nul
