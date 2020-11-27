@echo off
cls
mode co80

cd install

@echo The Sierra Install Program attempts to detect the
@echo hardware attached to your machine.  On some systems
@echo this may lock-up your machine.
@echo.
@echo If you are running the install program for the 
@echo first time, you should select Y.
@echo.
@echo This test may lock your computer system.
@echo Select N if you have experienced a lock-up 
@echo previously when performing this test.  
@echo.
.\what C "Do you want to perform hardware tests? (Y/N) " yn
cls

if not %what%.==Y. goto skipAuto

call install.exe -f
goto doneInstall

:skipAuto
call install.exe -f -m

:doneInstall

cd ..

:end

