:menu
echo off
cls
echo.
echo Press 1 for King's Quest V: Absence Makes the Heart Go Yonder w/ SB16
echo Press 2 for King's Quest V: Absence Makes the Heart Go Yonder w/ MT32
echo Press 3 for King's Quest V: Absence Makes the Heart Go Yonder Floppy w/ SB16
echo Press 4 for King's Quest V: Absence Makes the Heart Go Yonder Floppy w/ MT32
echo Press 5 for King's Quest V: Absence Makes the Heart Go Yonder EGA w/ CMS
echo Press 6 for King's Quest V: Absence Makes the Heart Go Yonder EGA w/ Adlib
echo Press 7 for King's Quest V: Absence Makes the Heart Go Yonder EGA w/ MT32
echo Press 8 to Quit
echo.
jchoice /C:12345678 /N Please Choose:

if errorlevel = 8 goto quit
if errorlevel = 7 goto EGA32
if errorlevel = 6 goto EGASB
if errorlevel = 5 goto EGAGB
if errorlevel = 4 goto FLOP32
if errorlevel = 3 goto FLOPSB
if errorlevel = 2 goto SCIMT32
if errorlevel = 1 goto SCISB

:SCISB
CONFIG -set "mididevice=default"
sierra SESOURCE.CFG
cls
goto quit

:SCIMT32
mt32-pi -m -v
sierra MESOURCE.CFG
cls
goto quit

:FLOPSB
CONFIG -set "mididevice=default"
cd floppy
cls
sierra SESOURCE.CFG
cd ..
cls
goto quit

:FLOP32
mt32-pi -m -v
cd floppy
cls
sierra MESOURCE.CFG
cd ..
cls
goto quit

:EGA32
mt32-pi -m -v
cd EGA
cls
sierra MT32.CFG
cd ..
cls
goto quit

:EGASB
CONFIG -set "mididevice=default"
cd EGA
cls
sierra SESOURCE.CFG
cd ..
goto quit

:EGAGB
CONFIG -set "mididevice=default"
CONFIG -set "sbtype=gb"
cd EGA
cls
sierra CMS.CFG
cd ..
goto quit

:quit
exit