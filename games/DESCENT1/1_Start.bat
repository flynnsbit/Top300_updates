
CLS
@Echo Automounting CD image to F: and D: drives
imgset ide10 "/cd/Descent/descent.iso"
@jchoice
@echo off
IF NOT EXIST E:\GAMES\DESCENT1\DESCENT\DESCENT\FIXED.TXT GOTO FIXGAME

:GAME
e:
cd Descent
call run
GOTO END

:FIXGAME
CLS
echo Fixing an issue from the original pack. You should only see this once
echo Press any key...
jchoice s
f:
cd\
cd descent
for %%i in (descent.hog descent.pig hmimdrv.386) do xcopy %%i e:\games\descent1\descent\descent
echo v2 >E:\games\descent1\descent\descent\FIXED.TXT
GOTO GAME

:END
