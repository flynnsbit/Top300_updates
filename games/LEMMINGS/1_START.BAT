imgset fdd0 "/floppy/lemmings/lemming.img"
@echo off
echo.
echo This game requires EMM386, please reboot and select it and then run the game.
echo.

@jchoice
imgset ide10 "/cd/lemmings/az_2246.cue"

@jchoice
cd lemmings
call run
