:menu
echo off
cls
echo.
echo Press 1 for Dangerous Dave in the Haunted Mansion (Softdisk Release)
echo Press 2 for Rooms of Doom (Froggman release)
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cls
call start
goto quit

:MT32
REM CONFIG -set"mididevice=default"
cd roomdoom
cls
call start
goto quit

:quit
exit