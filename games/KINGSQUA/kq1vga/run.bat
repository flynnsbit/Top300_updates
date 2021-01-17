:menu
echo off
cls
echo.
echo Press 1 for King's Quest I: Quest for the Crown VGA w/ SoundBlaster
echo Press 2 for King's Quest I: Quest for the Crown VGA w/ MT32
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB

:SB
REM CONFIG -set"mididevice=default"
sierra sesource.cfg
cls
goto quit

:MT32
mt32-pi -m -v
sierra mesource.cfg
cls
goto quit

:quit
exit