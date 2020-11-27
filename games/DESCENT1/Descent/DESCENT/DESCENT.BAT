@echo off
rem Batch file to run registered version of Descent.
if exist *.swp del *.swp
descentr.exe %1 %2 %3 %4 %5 %6 %7 %8 %9
if exist *.swp del *.swp
