@echo off
set dos4g=quiet
.\genpile\flight.exe %1 %2 %3 %4 %5 %6 %7 %8 %9
:wacky
if errorlevel 44 goto done
if errorlevel 43 goto refuel
if errorlevel 42 goto credit
goto done
:credit
D:\cdrom\credits.exe
.\genpile\flight.exe +fromcredits %1 %2 %3 %4 %5 %6 %7 %8 %9
goto wacky
:refuel
.\genpile\flight.exe +refuel %1 %2 %3 %4 %5 %6 %7 %8 %9
goto wacky
:done
