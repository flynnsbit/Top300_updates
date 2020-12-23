:menu
echo off
cls
echo.
echo Press 1 for Wizardry II: The Knight of Diamonds
echo Press 2 to Transfer a Character from a Previous Game
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto TRAN
if errorlevel = 1 goto game

:game
cls
wiz2
goto quit

:tran
cd..
cls
echo.
echo Wizardry 2 can import your character from the first game if you
echo have created one there. This launch file will automatically grab your
echo save from that game and copy it to the Wizardry 2 folder.
echo.
echo In order to bring your character in please do the following:
echo select:
echo "E)dge of town"
echo "U)tilities".
echo "M)ove characters"
echo.
echo To transfer you need to make sure your Wizardry 1 characters are
echo not on an adventure in the maze.
echo.
if exist .\wizar1\save1.dsk xcopy .\wizar1\save1.dsk .\wizar2\save1.dsk
if not exist .\wizar1\save1.dsk echo No Wizardry 1 Save Detected
echo.
if exist .\wizar2\save1.dsk echo Copy Successful
echo.
@jchoice
cd wizar2
goto menu

:quit
