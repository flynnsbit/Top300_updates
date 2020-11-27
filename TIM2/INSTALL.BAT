@echo off

cls
echo 
echo 
echo 
echo If you want to run the program in English, press 'E'.
echo 
echo Pour utiliser le programme Franáais, pressez 'F'.
echo 
echo Para juego en espa§ol, pulsa 'S'.
echo 
echo Um das Spiel in Deutsch zu spielen, 'D' eingeben.
echo 
getkey

rem 's'
if errorlevel 116 goto error
if errorlevel 115 goto spanish
rem 'f'
if errorlevel 103 goto error
if errorlevel 102 goto french
rem 'e'
if errorlevel 102 goto error
if errorlevel 101 goto english
rem 'd'
if errorlevel 101 goto error
if errorlevel 100 goto german
rem 'S'
if errorlevel 84 goto error
if errorlevel 83 goto spanish
rem 'F'
if errorlevel 71 goto error
if errorlevel 70 goto french
rem 'E'
if errorlevel 70 goto error
if errorlevel 69 goto english
rem 'D'
if errorlevel 69 goto error
if errorlevel 68 goto german


:error
cls
echo 
echo 
echo 
echo Relancez INSTALL s'il vous plaåt.
echo 
echo INSTALL noch einmal laufen lassen.
echo 
echo Por favor, ejecuta INSTALL de nuevo.
echo 
echo Run INSTALL again please.
goto end

:french
echo Attendez s'il vous plaåt . . .
set language=french
goto install

:german
echo Bitte warten . . .
set language=german
goto install

:spanish
echo Espera, por favor . . .
set language=spanish
goto install

:english
echo Please wait . . .
set language=english
goto install


:install
~~~inst %1 %2 %3

:end
set language=

