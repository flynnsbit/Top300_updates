:menu
echo off

cls
echo.
echo Press 1 to play Dune Floppy using DOSBox w/ Soundblaster
echo Press 2 to play Dune Floppy using DOSBox w/ MT-32
echo Press 3 to play Dune Floppy using DOSBox w/ Adlib Gold
echo Press 4 to play Dune CD using DOSBox w/ Soundblaster
echo Press 5 to play Dune CD using DOSBox w/ MT-32
echo Press 6 to play Dune CD using DOSBox w/ Adlib Gold
echo Press 7 to Quit
echo.
jchoice /C:1234567 /N Please Choose:

if errorlevel = 7 goto quit
if errorlevel = 6 goto CDGOLD
if errorlevel = 5 goto CDMT32
if errorlevel = 4 goto CDSB16
if errorlevel = 3 goto GOLD
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
cls
logo
duneprg ENG VGA SDB2207 HIM 386
goto quit

:GOLD
cls
logo
duneprg ENG VGA AGD388 HIM 386
goto quit

:MT32
cls
logo
duneprg ENG VGA MID330 HIM 386
goto quit

:CDSB16
RUN_EMM D: \ DNCDPRG AMR ADP220 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\
goto quit

:CDMT32
RUN_EMM D: \ DNCDPRG MID330 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\
goto quit

:CDGOLD
CONFIG -set "mididevice=default"
CONFIG -set "oplmode=opl3gold"
d:
cls
DNCDPRG ADG388 SBP2227 EMS 386 SAF WRIE:\GAMES\dune\DUNECD\
goto quit

:quit
