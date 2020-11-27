@echo off
if "%1"=="" goto Erreur

:deb

rem --------------------------------------------------------------------------
rem ISHAR 1
rem --------------------------------------------------------------------------

@echo
Cls
echo 
echo ษออออออออออออป
echo บ ISHAR 1    บ
echo ศออออออออออออผ
echo 

MD %1\ISHAR1 >nul

echo 
echo *** Installation finished ***
echo To play, type START from your CD-ROM
goto fin

:Erreur
cls
echo *** Procedure Interrupted - Installation Failed ***
echo Install Destination_Drive
echo ex: INSTALL C:

:fin
