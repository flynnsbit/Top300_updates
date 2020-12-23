:menu
echo off
cls
echo.
echo Press 1 for Wizardry VII w/ SB16
echo Press 2 for Wizardry VII w/ MT32
echo Press 3 To Transfer Characters from Wizardry 6
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto tran
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
del SCENARIO.HDR
xcopy .\sb16\SCENARIO.HDR .\
cls
call PLAY
goto menu

:epi2
del SCENARIO.HDR
xcopy .\mt32\SCENARIO.HDR .\
cls
call PLAY
goto menu

:tran
cls
e:
echo.
echo Wizardry 7 can import your characters from Wizardry 6.
echo As Wizardry 6 has multiple endings, this will impact how
echo Wizardry 7 begins for your party. Wizardy 7 supports two types
echo of imports. Savegames from before the ending and savegames
echo from after the ending. Currently, this is only designed
echo to import post-ending game saves.
echo.
echo In order to bring your character in please do the following:
echo "Import (Bane)"
echo Enter the game name under Filename
echo Click "Load"
echo.
if exist .\wizar6\SAVEGAME.DBS echo A Post-Ending save game has been found. 
if not exist .\wizar6\SAVEGAME.DBS echo A Post-Ending save game has *NOT* been found. 
rem if exist .\wizar6\*.dbs echo A Pre-Ending save game has been found. Press 2 to Import it.
rem echo Press R to Return to the Previous Menu
echo.
@jchoice
rem jchoice /C:12R /N Please Choose:

rem if errorlevel = 3 goto menu
rem if errorlevel = 2 goto pre
rem if errorlevel = 1 goto post

rem :post
xcopy .\wizar6\SAVEGAME.DBS .\wizar7\SAVEGAME.BCF
cls
echo.
if exist .\wizar7\SAVEGAME.BCF echo Copy Successful
if not exist .\wizar7\SAVEGAME.BCF echo Copy unsuccessful
echo.
@jchoice
goto menu

:pre
goto menu

:quit
exit