CALL imgtry ide10 D "/cd/NASCAR/nascar.chd" "/cd/NASCAR/nascar.cue"
@echo off
echo.
echo This game requires QEMM or it will crash. Reboot, select QEMM, and restart the game.
@jchoice
cd NASCAR
call run