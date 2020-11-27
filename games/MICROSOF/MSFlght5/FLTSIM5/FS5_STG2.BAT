@echo off
if exist fs5_go.com goto hdboot
rb1
if errorlevel 1 goto done
fs5
goto done
:hdboot
copy c:\config.fss c:\config.sys
copy c:\autoexec.fss c:\autoexec.bat
fs5_go
smartdrv /c
reboot
:done
