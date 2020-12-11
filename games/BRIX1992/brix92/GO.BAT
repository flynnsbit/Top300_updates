@echo off
brix.com   %1 %2  /Normal_PC /Internal /TF0
if errorlevel 1 goto error_exit
if errorlevel 0 goto ok_exit
goto error_exit
:error_exit
jchoice
:ok_exit
@echo on
