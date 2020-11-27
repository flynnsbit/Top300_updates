:menu
echo off
cls
echo.
echo Press 1 for Wizardry III: Legacy of Llylgamyn
echo Press 2 to Transfer a Character from a Previous Game
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto TRAN
if errorlevel = 1 goto game

:game
cls
wiz3
goto quit

:tran
cd..
cls
echo.
echo Wizardry 3 can import your characters "spirit" from either of
echo the first two games. This launch file will automatically grab your
echo save from those games and copy them to the Wizardry 3 folder.
echo.
echo In order to bring your character in please do the following:
echo select:
echo "E)dge of town"
echo "U)tilities".
echo "M)ove characters"
echo "E)dge of town"
echo "T)raining"
echo "I)nspect a character"
echo "L)egate"
echo.
echo To transfer you need to make sure your previous Wizardry characters are
echo not on an adventure in the maze.
echo.
if not exist .\wizar1\save1.dsk echo No Wizardry 1 Save Detected
echo.
if not exist .\wizar2\save2.dsk echo No Wizardry 2 Save Detected
echo.
pause
cls
if exist .\wizar1\save1.dsk copy .\wizar1\save1.dsk .\wizar3\save1.dsk
if exist .\wizar2\save2.dsk copy .\wizar2\save2.dsk .\wizar3\save2.dsk
echo.
if exist .\wizar3\save1.dsk echo Wizardry 1 Copy Successful
if exist .\wizar3\save2.dsk echo Wizardry 2 Copy Successful
echo.
pause
cd wizar3
goto menu

:quit
