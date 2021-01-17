:menu
echo off
cls
echo.
echo Press 1 for Space Quest IV: Roger Wilco and the Time Rippers EGA w/ GameBlaster
echo Press 2 for Space Quest IV: Roger Wilco and the Time Rippers EGA w/ SB16
echo Press 3 for Space Quest IV: Roger Wilco and the Time Rippers EGA w/ MT32
echo Press 4 for Space Quest IV: Roger Wilco and the Time Rippers w/ SB16
echo Press 5 for Space Quest IV: Roger Wilco and the Time Rippers w/ MT32
echo Press 6 for Space Quest IV: Roger Wilco and the Time Rippers w/ Sound Canvas
echo Press 7 for Space Quest IV: Roger Wilco and the Time Rippers Hacked*
echo Press 8 to Quit
echo.
echo *The hacked version takes assets from both the CD and Floppy and
echo. combines them to create an "ultimate" version. 
echo. It also fixes many bugs.
echo.
jchoice /C:12345678 /N Please Choose:

if errorlevel = 8 goto quit
if errorlevel = 7 goto HACK
if errorlevel = 6 goto SC55
if errorlevel = 5 goto MT32
if errorlevel = 4 goto SB16
if errorlevel = 3 goto EGAMT32
if errorlevel = 2 goto EGASB
if errorlevel = 1 goto EGACMS

:EGACMS
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
CD EGA
cls
SCIDUV CMS.CFG
cls
goto quit

:EGASB
REM CONFIG -set"mididevice=default"
CD EGA
cls
SCIDUV SESOURCE.CFG
cls
goto quit

:EGAMT32
mt32-pi -m -v
CD EGA
cls
SCIDUV MESOURCE.CFG
cls
goto quit

:SB16
REM CONFIG -set"mididevice=default"
CD SQ4
cls
sierra SESOURCE.CFG
cls
goto quit

:MT32
mt32-pi -m -v
CD SQ4
cls
sierra MESOURCE.CFG 
cls
goto quit

:SC55
mt32-pi -g -v
CD SQ4
cls
sierra GESOURCE.CFG 
cls
goto quit

:HACK
mt32-pi -m -v
echo off
cd patch
cls
sierra
cd ..
cls
goto quit

:quit
exit