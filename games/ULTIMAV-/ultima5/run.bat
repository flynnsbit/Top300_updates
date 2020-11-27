:menu
echo off
cls
echo.
echo Press 1 for Ultima V: Warriors of Destiny (Original)
echo Press 2 for Ultima V: Warriors of Destiny (Upgrade)
echo Press 3 to Import a Character from Ultima IV
echo Press 4 to Quit
echo.
echo The upgraded version of the game adds:
echo  * Original Music Score (Apple II / Commodore 128)
echo  * Music during Intro & Finale
echo  * Amiga music during Character Creation
echo.
choice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto tran
if errorlevel = 2 goto upgr1
if errorlevel = 1 goto orig1

:orig1
cls
ULTIMA.EXE
goto quit
cls

:tran
cls
echo.
echo eXoDOS contains two base versions of Ultima IV. 
echo Please choose the one you created a save in. 
echo.
echo Once you start the game and choose Import a Saved Character,
echo If prompted for a drive, type A and it will see your save.
echo.
echo Press 1 to Transfer from Ultima IV
echo Press 2 to Transfer from Ultima IV Upgrade
echo Press 3 to Return to the Previous Menu
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto original
if errorlevel = 2 goto 4upg
if errorlevel = 1 goto 4reg

:4reg
mount a .\eXoDOS\ultima4\ -t floppy
goto menu

:4upg
mount a .\eXoDOS\ultima4\upgrade\ -t floppy
goto menu

:upgr1
cd .\upgrade
call run.bat
goto quit
cls

:quit
exit