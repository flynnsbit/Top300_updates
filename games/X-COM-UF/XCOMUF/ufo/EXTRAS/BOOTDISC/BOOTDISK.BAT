@echo off
cls
echo The bootdisk maker is about to copy files to the current floppy.
echo This will be your boot disk.
jchoice
bootall4.exe
c:
sys a:
echo Bootdisk created successfully

