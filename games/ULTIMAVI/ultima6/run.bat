:menu
@echo off
cls
echo.
echo Press 1 for Ultima VI: The False Prophet w/ SoundBlaster
echo Press 2 for Ultima VI: The False Prophet w/ MT32
echo Press 3 for Ultima VI: The False Prophet w/ Sound Canvas
echo Press 4 to Erase the Current Character So You Can Create a New One
echo Press 5 to Transfer a Character from a Previous Game
echo Press 6 to Quit
echo.
choice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto TRAN
if errorlevel = 4 goto BLANK
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
CONFIG -set "mixer=49716"
CONFIG -set "oplemu=nuked"
CONFIG -set "oplrate=49716"
CONFIG -set "oplmode=opl2"
del CONFIG.U6
copy .\sb16\*.*
cls
@ULTIMA6
goto quit
cls

:MT32
CONFIG -set "mididevice=mt32"
del CONFIG.U6
copy .\mt32\*.*
cls
@ULTIMA6
goto quit
cls

:SC55
CONFIG -set "mididevice=fluidsynth"
del CONFIG.U6
copy .\sc55\*.*
cls
@ULTIMA6
goto quit
cls

:BLANK
cls
cd savegame
del *.*
cd..
copy .\blank\savegame\*.* .\savegame\
copy .\blank\*.*
cls
echo.
echo Character Cleared
echo.
jchoice
goto menu

:tran
cls
echo.
echo eXoDOS contains two base versions of Ultima IV & V. 
echo Please choose the one you created a save in. 
echo.
echo Once you start Ultima 6, select Transfer a Character.
echo When asked select drive A: to complete import.
echo.
echo Press 1 to Transfer from Ultima IV
echo Press 2 to Transfer from Ultima IV Upgrade
echo Press 3 to Transfer from Ultima V
echo Press 4 to Transfer from Ultima V Upgrade
echo Press 5 to Return to the Previous Menu
echo.
choice /C:12345 /N Please Choose:

if errorlevel = 5 goto menu
if errorlevel = 4 goto 5upg
if errorlevel = 3 goto 4reg
if errorlevel = 2 goto 4upg
if errorlevel = 1 goto 4reg

:4reg
mount a .\eXoDOS\ultima4\ -t floppy
goto menu

:4upg
mount a .\eXoDOS\ultima4\upgrade\ -t floppy
goto menu

:5reg
mount a .\eXoDOS\ultima5\ -t floppy
goto menu

:5upg
mount a .\eXoDOS\ultima5\upgrade\ -t floppy
goto menu

:quit
exit