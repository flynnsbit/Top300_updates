@echo off
spcintro %1
if errorlevel 3 goto run386
goto run286

:run386
spc386 %2 %3 %4 %5 %6 %7 %8 %9
goto allDone

:run286
spc286 %2 %3 %4 %5 %6 %7 %8 %9
goto allDone

:allDone
