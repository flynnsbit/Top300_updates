:menu
echo off
cls
echo.
echo Press 1 for Wizardry V: Heart of the Maelstrom
echo Press 2 to Transfer a Character from a Previous Game
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto TRAN
if errorlevel = 1 goto game

:game
cls
wiz5
goto quit

:tran
cd..
cls
echo.
echo Wizardry 5 can import your characters from games 1-3.
echo Imported characters are reset to level 1.
echo This launch file will automatically grab your
echo save from those games and copy them to the Wizardry 5 folder.
echo.
echo In order to bring your character in please do the following:
echo select:
echo "E)dge of town"
echo "U)tilities".
echo "M)ove characters"
echo.
echo To transfer you need to make sure your previous Wizardry characters are
echo not on an adventure in the maze.
echo.
if not exist .\wizar1\save1.dsk echo No Wizardry 1 Save Detected
if not exist .\wizar2\save2.dsk echo No Wizardry 2 Save Detected
if not exist .\wizar3\save3.dsk echo No Wizardry 3 Save Detected
if not exist .\wizar4\save4.dsk echo No Wizardry 4 Save Detected
echo.
pause
cls
if exist .\wizar1\save1.dsk copy .\wizar1\save1.dsk .\wizar5\save1.dsk
if exist .\wizar2\save2.dsk copy .\wizar2\save2.dsk .\wizar5\save2.dsk
if exist .\wizar3\save3.dsk copy .\wizar3\save3.dsk .\wizar5\save3.dsk
if exist .\wizar4\save4.dsk copy .\wizar4\save4.dsk .\wizar5\save4.dsk
echo.
if exist .\wizar5\save1.dsk echo Wizardry 1 Copy Successful
if exist .\wizar5\save2.dsk echo Wizardry 2 Copy Successful
if exist .\wizar5\save3.dsk echo Wizardry 3 Copy Successful
if exist .\wizar5\save4.dsk echo Wizardry 4 Copy Successful
echo.
pause
cd wizar5
goto menu

:quit
