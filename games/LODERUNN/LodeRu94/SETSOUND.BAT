@echo off
cd audio

setd
IF ERRORLEVEL 1 GOTO ABORTED1

setm
IF ERRORLEVEL 1 GOTO ABORTED2
GOTO END

:ABORTED1
echo Digital Sound Driver configuration was not completed.
cd..
GOTO FINI

:ABORTED2
echo Midi Music Driver configuration was not completed.
cd..
GOTO FINI

:END
echo Sound Configuration Complete!

cd..
copy audio\soundrv.com 
copy audio\midpak.com
copy audio\midpak.adv
copy audio\midpak.ad

:FINI
