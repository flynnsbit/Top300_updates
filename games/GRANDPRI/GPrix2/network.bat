echo off
cls
echo.
echo Press 1 to Host a game
echo Press 2 to Join a game
echo Press 3 to Quit
echo.
echo Note: To host a game you need port 5000 forwarded
echo to the host machine. 
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto join
if errorlevel = 1 goto host

:host
cls
echo.
serial1 nullmodem port:5000
cls
echo.
echo An null modem connection has been opened on COM 1, port 5000.
echo.
echo Other players will need your IP address to join you.
echo.
echo Use this IP for internet play:
type ExtIP.txt
echo Use this IP for LAN play:
type ExtIP2.txt
echo.
echo Press a key to launch the game. Then choose the following:
echo Main Menu
echo Options
echo Linkup Menu
echo Choose "Lead" under Direct Link
echo Click Connect
echo.
@jchoice
cd GP2
GP2
echo.
echo Thanks for playing.
echo.
@jchoice
exit

:join
cls
echo.
echo You will need the host's IP address in order to connect to them.
echo.
echo When playing within the same network, this will typically start
echo with 192.168.XXX.XXX. If playing over the internet, it will not
echo start with 192.
echo.
askecho /N "set IP=" "+Host's IP Address? " > SetIP.bat
call setip
serial1 nullmodem server:%IP% port:5000
echo.
echo Press a key to launch the game. Then choose the following:
echo Main Menu
echo Options
echo Linkup Menu
echo Choose "Follow" under Direct Link
echo Click Connect
echo.
@jchoice
cd GP2
GP2
echo.
echo Thanks for playing.
echo.
@jchoice
:later
exit