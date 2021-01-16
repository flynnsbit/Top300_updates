@ECHO OFF

IF EXIST E:\LAUNCH.BAT GOTO DELETEBAT
GOTO WRITELAUNCH

:DELETEBAT
DEL E:\LAUNCH.BAT

:WRITELAUNCH
ECHO %1 >> E:\LAUNCH.BAT
ECHO CD %2 >> E:\LAUNCH.BAT
ECHO CALL %3 %4 %5 %6 %7 %8 %9 >> E:\LAUNCH.BAT
REM ECHO PAUSE >> E:\LAUNCH.BAT
ECHO E:\TDLRESET.BAT >> E:\LAUNCH.BAT

copy e:\utils\configs\config16.emm c:\config.sys >> NUL
copy e:\utils\configs\loading.sys c:\logo.sys >> NUL
imgset r
