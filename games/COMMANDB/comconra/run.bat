:menu
echo off
cls
echo.
echo Press 1 for Command & Conquer: Red Alert Allied Campaign
echo Press 2 for Command & Conquer: Red Alert Soviet Campaign
echo Press 3 for Command & Conquer: Red Alert Aftermath
echo Press 4 for Command & Conquer: Red Alert Counter Strike
echo Press 5 for Network Multiplayer
echo Press 6 to Quit
echo.
echo This game contains 4 discs. The choice above loads the required
echo disc for that campaign. If you attempt to start a different
echo campaign than the one you select here, you will have to hit
echo ctrl-f4 to switch through the mounted CD's until you find the
echo right one.
echo.
echo To play the hidden campaign, choose Counterstrike and hold
echo SHIFT while clicking on the speaker on the main menu.
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto network
if errorlevel = 4 goto CS
if errorlevel = 3 goto AM
if errorlevel = 2 goto RAS
if errorlevel = 1 goto RAA

:RAA
CALL imgtry ide10 D "/cd/comconra/redal1.chd" "/cd/comconra/redal1.iso"


@jchoice
cd redalert
cls
ra
goto quit

:RAS
CALL imgtry ide10 D "/cd/comconra/redal2.chd" "/cd/comconra/redal2.iso"
@jchoice
cd redalert
cls
ra
goto quit

:AM
CALL imgtry ide10 D "/cd/comconra/redal4.chd" "/cd/comconra/redal4.cue"
@jchoice
cd redalert
cls
ra
goto quit

:CS
CALL imgtry ide10 D "/cd/comconra/redal3.chd" "/cd/comconra/redal3.cue"
@jchoice
cd redalert
cls
ra
goto quit

:network
CALL imgtry ide10 D "/cd/comconra/redal4.chd" "/cd/comconra/redal4.cue"
@jchoice
cls
network

:quit
exit