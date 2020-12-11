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
choice /C:123 /N Please Choose:

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
echo Set up a modem conquest
echo Change Link Open to Yes
echo When text states "Link Now Open" click OK
echo Tell the client you are ready
echo Once the main menu appears again, Start a new Conquest
echo Set options and click OK.
echo Client will now be asked to choose their shield
echo When complete, you may choose yours and the game will begin.
echo.
jchoice
cd LORDS
LORDS
echo.
echo Thanks for playing.
echo.
jchoice
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
echo Set up a modem conquest
echo Change Link Open to Yes
echo Wait until the hosts says they are ready
echo Click cancel, then click Set Up a Modem Conquest Again
echo Set Link Open to Yes again. It should state "Link Established"
echo Host will now set up the Game
echo.
jchoice
cd LORDS
LORDS
echo.
echo Thanks for playing.
echo.
jchoice
:later
exit