@echo off
rem Serpent Isle batch file
rem Created by Myque Ouellette
rem 11/24/97

cd serpent

@echo off
if not exist test.cfg goto sound
goto main

:sound
install
copy serpent.cfg test.cfg
goto main

:main
serpent.com
goto end


:end
