@ECHO off
cls
:start
cls
echo.
ECHO 1.  Set TDL to Green Screen
ECHO 2.  Set TDL to Amber Screen
ECHO 3.  Set TDL to Orange Screen
ECHO 4.  Set TDL to Teal Screen
ECHO 5.  Set TDL to Gray Screen
ECHO 6.  Set TDL to Black Screen
ECHO 7.  Set TDL to Light Blue
ECHO 8.  Backup my TDL.INI
ECHO 9.  Restore my TDL.INI
ECHO X. Exit
jchoice /N /C:123456789X "Select:"%1
IF ERRORLEVEL ==10 GOTO exit
IF ERRORLEVEL ==9 GOTO restore
IF ERRORLEVEL ==8 GOTO backup
IF ERRORLEVEL ==7 GOTO ltblue
IF ERRORLEVEL ==6 GOTO black
IF ERRORLEVEL ==5 GOTO gray
IF ERRORLEVEL ==4 GOTO teal
IF ERRORLEVEL ==3 GOTO orange
IF ERRORLEVEL ==2 GOTO amber
IF ERRORLEVEL ==1 GOTO green
IF ERRORLEVEL ==0 GOTO exit

:green
copy e:\utils\configs\tdl.grn e:\tdl.ini /Y
cls
goto start

:amber
copy e:\utils\configs\tdl.yel e:\tdl.ini /Y
cls
goto start

:orange
copy e:\utils\configs\tdl.ora e:\tdl.ini /Y
cls
goto start

:teal
copy e:\utils\configs\tdl.tea e:\tdl.ini /Y
cls
goto start

:gray
copy e:\utils\configs\tdl.gra e:\tdl.ini /Y
cls
goto start

:black
copy e:\utils\configs\tdl.blk e:\tdl.ini /Y
cls
goto start

:ltblue
copy e:\utils\configs\tdl.ltb e:\tdl.ini /Y
cls
goto start

:backup
cls
copy e:\tdl.ini e:\utils\configs\tdl.USR /-Y
cls
goto start

:restore
copy e:\utils\configs\tdl.USR e:\tdl.ini  /Y
cls
goto start

:exit
ECHO Exiting...
cls
goto end

:end
CLS
imgset r

