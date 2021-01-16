:menu
echo off
cls
echo.
echo Press 1 for Space Quest I: The Sarien Encounter VGA w/ Game Blaster
echo Press 2 for Space Quest I: The Sarien Encounter VGA w/ SoundBlaster
echo Press 3 for Space Quest I: The Sarien Encounter VGA w/ MT32
echo Press 4 for Space Quest I: The Sarien Encounter VGA w/ Sound Canvas
echo Press 5 for Space Quest I: The Sarien Encounter EGA w/ Game Blaster
echo Press 6 for Space Quest I: The Sarien Encounter EGA w/ SoundBlaster
echo Press 7 for Space Quest I: The Sarien Encounter EGA w/ MT32
echo Press 8 for Space Quest I: The Sarien Encounter EGA w/ Sound Canvas
echo Press 9 to Quit
echo.
jchoice /C:123456789 /N Please Choose:

if errorlevel = 9 goto quit
if errorlevel = 8 goto SC55EGA
if errorlevel = 7 goto MT32EGA
if errorlevel = 6 goto SBEGA
if errorlevel = 5 goto CMSEGA
if errorlevel = 4 goto SC55
if errorlevel = 3 goto MT32
if errorlevel = 2 goto SB
if errorlevel = 1 goto CMS

:CMS
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
SCIDHUV cms.cfg
cls
goto quit

:SB
REM CONFIG -set"mididevice=default"
SCIDHUV sesource.cfg
cls
goto quit

:MT32
mt32-pi -m -v
SCIDHUV mesource.cfg
cls
goto quit

:SC55
mt32-pi -g -v
SCIDHUV gesource.cfg
cls
goto quit

:CMSEGA
REM CONFIG -set"mididevice=default"
REM CONFIG -set"sbtype=gb"
CD EGA
SCIDUV cms.cfg
cls
goto quit

:SBEGA
REM CONFIG -set"mididevice=default"
CD EGA
SCIDUV sesource.cfg
cls
goto quit

:MT32EGA
mt32-pi -m -v
CD EGA
SCIDUV mesource.cfg
cls
goto quit

:SC55EGA
mt32-pi -g -v
CD EGA
SCIDUV gesource.cfg
cls
goto quit

:quit
exit