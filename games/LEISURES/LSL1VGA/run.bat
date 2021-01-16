:menu
echo off
cls
echo.
echo Press 1 for Leisure Suit Larry 1 EGA w/ Game Blaster
echo Press 2 for Leisure Suit Larry 1 EGA w/ SoundBlaster
echo Press 3 for Leisure Suit Larry 1 EGA w/ MT32
echo Press 4 for Leisure Suit Larry 1 EGA w/ Sound Canvas
echo Press 5 for Leisure Suit Larry 1 VGA w/ SoundBlaster
echo Press 6 for Leisure Suit Larry 1 VGA w/ MT32
echo Press 7 for Leisure Suit Larry 1 VGA w/ Sound Canvas
echo Press 8 to Quit
echo.
jchoice /C:12345678 /N Please Choose:

if errorlevel = 8 goto quit
if errorlevel = 7 goto SC55
if errorlevel = 6 goto MT32
if errorlevel = 5 goto SB16
if errorlevel = 4 goto EGASC55
if errorlevel = 3 goto EGAMT32
if errorlevel = 2 goto EGASB
if errorlevel = 1 goto EGACMS

:EGACMS
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
CD EGA
cls
SCIDUV cms.cfg
@jchoice
goto quit

:EGASB
REM CONFIG -set"mididevice=default"
CD EGA
cls
SCIDUV SESOURCE.cfg
goto quit

:EGAMT32
mt32-pi -m -v
CD EGA
cls
SCIDUV MESOURCE.cfg
@jchoice
goto quit

:EGASC55
mt32-pi -g -v
CD EGA
cls
SCIDUV GESOURCE.cfg
goto quit

:SB16
REM CONFIG -set"mididevice=default"
cls
SCIDHUV sesource.cfg
goto quit

:MT32
mt32-pi -m -v
cls
SCIDHUV mesource.cfg
goto quit

:SC55
mt32-pi -g -v
cls
SCIDHUV gesource.cfg
goto quit

:quit
exit