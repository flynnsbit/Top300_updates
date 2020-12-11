:menu
echo off
cls
echo.
echo Press 1 for Command & Conquer GDI Campaign
echo Press 2 for Command & Conquer NOD Campaign
echo Press 3 for Command & Conquer Covert Operations
echo Press 4 for Command & Conquer Hidden Campaign
echo Press 5 for Network Multiplayer
echo Press 6 to Quit
echo.
echo This game contains 3 discs. The choice above loads the required
echo disc for that campaign. If you attempt to start a different
echo campaign than the one you select here, you will have to hit
echo ctrl-f4 to switch through the mounted CD's until you find the
echo right one.
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto network
if errorlevel = 4 goto FUNPARK
if errorlevel = 3 goto COVERT
if errorlevel = 2 goto NOD
if errorlevel = 1 goto GDI

:GDI
imgset ide10 "/cd/comcon/comma1.iso"


@jchoice
cls
C&C
goto menu

:NOD
imgset ide10 "/cd/comcon/comma2.iso"
@jchoice
cls
C&C
goto menu

:COVERT
imgset ide10 "/cd/comcon/cover3.cue"
@jchoice
cls
C&C
goto menu

:FUNPARK
imgset ide10 "/cd/comcon/comma1.iso"


@jchoice
cls
C&C funpark
goto menu

:network
imgset ide10 "/cd/comcon/comma1.iso"


@jchoice
cls
network

:quit
exit
