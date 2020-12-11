@echo off
CLS
echo   ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                    On The Ball  BootDisk-Generator                  บ
echo   บ                                                                     บ
echo   บ                     (C) 1994  ASCON Software-GmbH                   บ
echo   ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo.
IF "%1"=="a:" GOTO flag1
IF "%1"=="A:" GOTO flag1
IF "%1"=="b:" GOTO flag1
IF "%1"=="B:" GOTO flag1
:error
echo       Drive-Letter after MAKEBOOT is wrong or missing !
echo       Possible destination drives are:   A: B:ÿ
goto end
:flag1
echo       A "On The Ball" Boot-Configuration will be created onto your disk.
echo.
echo       We assume that your system files and your mouse driver exists
echo       in C:\DOS and that "On The Ball" is installed in C:\OTB.
echo       If not, please change config.sys/autoexec.bat adequately.
echo       If you use compressed drives (DoubleSpace etc.) you must also
echo       load the appropriate drivers.
echo.
echo       To Abort please enter CTRL/BREAK
echo.
echo.
echo       Please insert an unformatted disk in drive %1 !
echo.
jchoice
echo.
echo       MakeBoot is working........
echo.
format %1 /s /u
copy autoexec.boo %1autoexec.bat
copy config.boo %1config.sys

echo.
echo       Your Boot-Disk should be ready.
echo       To play please insert the disk in your Boot-drive  
echo       and restart your system !
:end
echo.
