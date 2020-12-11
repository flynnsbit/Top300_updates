@echo off
cd RAVAGER

IF EXIST setsound.exe goto :sound1
IF EXIST sound.exe goto :sound2
IF EXIST sound.com goto :sound3
IF EXIST install.exe goto :install1
IF EXIST install.com goto :install2
IF EXIST setup.exe goto :setup1
IF EXIST setup.com goto :setup2

ECHO No setup files were found for this game.  You will need to manually run the appropriate setup in DOS.
@jchoice
goto :END

:sound1
call setsound.exe
goto :END

:sound2
call sound.exe
goto :END

:sound3
call sound.com
gotto :END

:setup1
call setup.exe
goto :END

:setup2
call setup.com
goto :END

:install1
call install.exe
goto :END

:install2
call install.com
goto :END

:END
CLS
