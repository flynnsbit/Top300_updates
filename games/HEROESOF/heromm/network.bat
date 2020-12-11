echo off
cls
echo.
echo Press 1 to Host a game
echo Press 2 to Join a game
echo Press 3 to Quit
echo.
echo Note: To host a game you need port 213 forwarded
echo to the host machine. 
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto join
if errorlevel = 1 goto host

:host
cls
echo.
ipxnet startserver
netbios
cls
echo.
echo An IPX Server has been started with the default port (213). 
echo.
echo Other players will need your IP address to join you.
echo.
echo Use this IP for internet play:
type ExtIP.txt
echo Use this IP for LAN play:
type ExtIP2.txt
echo.
echo Press a key to launch the game. Then choose the following:
echo New Game
echo Multiplayer Game
echo Network
echo Host
echo Set Game Options Once Connected
echo.
echo Note: This game is turn based, and you must wait while
echo the other player takes their turn.
echo.
@jchoice
cd HEROES
loadfix -4 heroes.exe
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
IPXNET CONNECT %IP%
echo.
echo Press 1 if the connection succeeded 
echo Press 2 if it failed and you want to try again
echo Press 3 to give up
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto later
if errorlevel = 2 goto join
if errorlevel = 1 goto connected

:connected
netbios
cls
echo.
echo Press a key to launch the game. Then choose the following:
echo New Game
echo Multiplayer Game
echo Network
echo Guest         
echo.
echo Note: This game is turn based, and you must wait while
echo the other player takes their turn.                                                      
echo.
@jchoice
cd HEROES
loadfix -4 heroes.exe
echo.
echo Thanks for playing.
echo.
@jchoice
:later
exit