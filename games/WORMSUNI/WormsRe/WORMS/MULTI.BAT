:lastmenu
@cls
@echo MULTIPLAYER WORMS OPTIONS...
@echo.
@echo 1. IPX equipped network
@echo 2. Serial Connection (Null Modem)
@echo 3. Modem Connection
@echo 4. Exit and play single-terminal Worms...
@echo 5. Quit
@echo.
@
@jchoice /C:54321 /N Select mode... 
@cls
if errorlevel 5 goto lan
if errorlevel 4 goto serial
if errorlevel 3 goto modem
if errorlevel 2 goto normal
if errorlevel 1 goto end
@goto end
@jchoice

:normal
@worms.bat

:lan
@cls
@echo PREPARING TO PLAY NET WORMS
@echo Copyright 1995/96 Team17 Ltd.
@echo.
@echo IPX drivers need to be running on your local area network. Wait
@echo until all players have joined then press a key.
@echo.
@echo Players MUST select their own team from the ROSTER list to enable
@echo their own terminal!
@echo.
@echo Don`t forget to MESSAGE other players using 'M' !
@echo.
@echo.
@@jchoice
@bin\black.exe
@call batch\locale.bat
SET NETINFO=1
@cls
@bin\wrms.exe
@goto end

:serial
@cls
@echo PREPARING TO PLAY SERIAL WORMS  Copyright 1995/96 Team17 Software Ltd.
@echo Copyright 1995/96 Team17 Ltd.
@echo.
@echo Players MUST select their own team from the ROSTER list to enable
@echo their own terminal!
@echo.
@echo Don`t forget to MESSAGE other  players using 'M' !
@echo.
@echo Press any key once connection is established!
@echo.
@echo.
@@jchoice
@bin\black.exe
SET NETINFO=-M_B9600
@call batch\locale.bat
@cls
@bin\wrms.exe
@goto end

:modem
@cls
@echo WORMS MODEM OPTIONS... 
@echo.
@echo 1. Send Call
@echo 2. Recieve Call
@echo 3. Configure Modem Settings
@echo 4. Quit
@echo.
@
@jchoice /C:4321 /N Select mode... 
@cls
if errorlevel 4 goto send
if errorlevel 3 goto recieve
if errorlevel 2 goto config
if errorlevel 1 goto lastmenu
goto end

:config
@cls
batch\setmodem.bat

:send
@cls
@echo PREPARING TO PLAY MODEM WORMS
@echo.
@echo THIS MACHINE DIALLING OUT...
@echo.
@echo Players MUST select their own team from the ROSTER list to enable
@echo their own terminal!
@echo.
@echo Don`t forget to MESSAGE other players using 'M' !
@echo.
@echo Press any key once connection is established!
@echo.
@echo.
@@jchoice
@bin\black.exe
@call batch\locale.bat
@batch\modemtx.bat


:recieve
@cls
@echo PREPARING TO PLAY MODEM WORMS 
@echo.
@echo THIS MACHINE SET TO RECIEVE CALL
@echo.
@echo Players MUST select their own team from the ROSTER list to enable
@echo their own terminal!
@echo.
@echo Don`t forget to MESSAGE other players using 'M' !
@echo.
@echo Press any key once connection is established!
@echo.
@echo.
@@jchoice
@bin\black.exe
@call batch\locale.bat
@batch\modemrx.bat

:end
@cls
@exit
