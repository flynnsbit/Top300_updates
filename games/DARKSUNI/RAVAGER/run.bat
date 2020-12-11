:menu
echo off
cls
echo.
echo Press 1 for Dark Sun II: Wake of the Ravager
echo Press 2 to Transfer Characters from Dark Sun: Shattered Lands 
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto TRAN
if errorlevel = 1 goto GAME

:GAME
cls
call RAVAGER
goto quit

:TRAN
cls
echo.
echo Ensure Dark Sun: Shattered Lands is installed, or this will not work.
echo.
echo Once the transfer program begins use the default directories and simply
echo hit ENTER to start the transfer. Once this is completed you need to add
echo your characters into a party from the "create character" menu inside
echo Dark Sun 2.
echo.
@jchoice
CHARTRAN
echo.
@jchoice
goto menu

:quit
exit