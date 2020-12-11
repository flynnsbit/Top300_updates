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
echo Press a key to launch DOOMATIC. Then choose the following:
echo Press ENTER to start Server
echo Press N to set player Name
echo Press L to select Color
echo Press S to start once all clients have joined
echo.
echo Note: Custom WADS can be used by hitting TAB, scrolling to a WAD
echo file, and pressing ENTER. Or a WAD set can be created as well, to
echo string together multiple WAD files.
echo.
@jchoice
doomatic
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
echo wityh 192.168.XXX.XXX. If playing over the internet, it will not
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
cls
echo.
echo Press a key to launch DOOMATIC. Then choose the following:
echo Press N to set player Name
echo Press L to select Color
echo Press J to Join server (once it appears in the game window)
echo.
@jchoice
doomatic
echo.
echo Thanks for playing.
echo.
@jchoice
:later
exit