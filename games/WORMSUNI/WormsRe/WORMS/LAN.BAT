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

:end
@cls
@exit
