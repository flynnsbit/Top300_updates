@echo off
echo                     !!!!!!REMINDER!!!!!!
echo If you are experiencing trouble with any adventure game while running
echo within the Windows environment, we recommend that you exit Windows and
echo instead access it from MS-DOS.
pause

%1

cd \

:getDisk1
if exist disk1 goto run
echo Please Insert Disk 1
pause
goto getDisk1

:run

%1
cd \kq3
install
