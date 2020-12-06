@echo off
:start
cls
echo Ao486 Top 300 Pack Update Script v.01
echo 1.) Update All
echo 2.) Quit
echo.
echo.
echo This update script uses an update.zip pack that is added to your
echo /games/ao486/shared folder.  The script uses misterfs mounted to
echo Z: to pick up the pack and extract to the e:\games folders.
echo.
echo If you setup a custom build that does not match this structure
echo outlined this pack updater will not work for you.
jchoice h 2

if errorlevel = 2 goto quit
if errorlevel = 3 goto games
if errorlevel = 2 goto scripts
if errorlevel = 1 goto all
if errorlevel = 0 goto exit

:all
@echo off
cls
echo.
echo Copying Update pack and Extracting....
z:
cd\
copy update.zip e:\games
e:
cd\
cd games
pkunzip -d -n update.zip
echo.
echo Update complete
jchoice p
e:
cd\
cls
goto start

:scripts

:games

:quit
e:
cd\

:exit
e:
cd\
