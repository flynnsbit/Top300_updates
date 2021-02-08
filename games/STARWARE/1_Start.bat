CALL imgtry ide10 D "/cd/SWXWCD/swxwcd.chd" "/cd/SWXWCD/swxwcd.cue"
@echo off
echo.
echo This game requires EMM386 or QEM.  Please reboot and select the correct memory manager and relaunch the game.
@jchoice
cd SWXWCD
cd XWINGCD
call run