cd zork2
@echo off
echo.
echo This game requires QEMM, please reboot, select QEMM and restart the game
jchoice
 
REM cwsdpmi
frotz -d 5 .\data\zork2.dat
