imgset fdd0 "/floppy/lemmings/lemming.img"
@echo off
echo.
echo This game requires EMM386, please reboot and select it and then run the game.
echo.

pause
imgset ide10 "/cd/lemmings/az_2246.cue"

pause
cd lemmings
call run
