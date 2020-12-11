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
choice /C:123 /N Please Choose:

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
echo Press a key to launch the game. Then choose the following:
echo Click Form in the button right to choose a Squadron
echo Click Theater to choose a location
echo Click the COMMS screen
echo Choose a Pilot
echo Click COMMS button
echo Ensure CALL and NETWORK are selected
echo Choose Game Type
echo Click Accept. Once other players join, you will see them on the list
echo.
jchoice
falcon3
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
choice /C:123 /N Please Choose:

if errorlevel = 3 goto later
if errorlevel = 2 goto join
if errorlevel = 1 goto connected

:connected
cls
echo.
echo Press a key to launch the game. Then choose the following:
echo Click Form in the button right to choose a Squadron
echo Click Theater to choose a location
echo Click the COMMS screen
echo Choose a Pilot
echo Click COMMS button
echo Ensure ANSWER and Network are selected
echo Click Accept and then click Y when prompted to connect
echo.
jchoice
falcon3
echo.
echo Thanks for playing.
echo.
jchoice
:later
exit