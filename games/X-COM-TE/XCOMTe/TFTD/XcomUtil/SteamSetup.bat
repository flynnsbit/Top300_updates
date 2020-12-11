@echo off
REM #############################################
REM ### Change the Steam files to trigger XcuSetup ###

REM Not intended for DosBox
if %COMSPEC%. == Z:\COMMAND.COM. echo This file should be run from windows.
if %COMSPEC%. == Z:\COMMAND.COM. goto EOF

REM Is Steam?
REM echo %~pd0 | find /i "steam"
REM if ERRORLEVEL 1 goto EOF

REM what Game?
echo %~pd0 | find /i "ufo" >nul
if ERRORLEVEL 1 goto NotUFO
set xcv=UFO
set subFold=xcom ufo defense\XCOM
set BatchFile=ufocd.bat
goto foundver
:NotUFO
echo %~pd0 | find /i "terror" >nul
if ERRORLEVEL 1 goto NotTFTD
set xcv=TFTD
set BatchFile=terror.bat
set suFold=x-com terror from the deep\TFD
goto foundver
:NotTFTD
echo Current folder not regognized.
got EOF
:foundver

REM #################################
REM ### Find the root of the game.###
REM IF XcomUtil installer
if exist geodata\obdata.dat goto gameok
REM IF dubble clicked on
cd ..
if exist geodata\obdata.dat goto gameok
REM if for some reason it's still lost Asume Steam folders
if NOT "%ProgramFiles(x86)%." == . set progF=%ProgramFiles(x86)%
if "%ProgramFiles(x86)%." == . set progF=%ProgramFiles%
cd %progF%\Steam\steamapps\common\%subFold%
if exist geodata\obdata.dat goto gameok
REM game not found
:ErrorOut
Echo Game Not found. Unable to Configure Steam
jchoice
goto EOF
:gameok
REM echo Found %xcv% in %CD%
REM Check if this has both DOS/Win EXE (Steam)
if NOT exist ufoexe\geoscape.exe goto EOF
if exist "terror from the deep.exe" goto StmFiles
if exist terror.exe goto StmFiles
if exist "ufo defense.exe" goto StmFiles
if exist ufo.exe goto StmFiles
REM NOT Steam
echo STEAM not found. Please use XcuSetup to configure XcomUtil.
jchoice
goto EOF
:StmFiles
if NOT %1. == sfx. echo STEAM Detected

:SkpStmCh
if NOT exist %BatchFile% goto ErrorOut
if NOT exist OldBatch.bat copy /y %BatchFile% OldBatch.bat 
copy /y XcomUtil\batch\go.bat %BatchFile% >nul
echo.
echo Steam configured to start the XcomUtil menu with X-Com.
echo.
if NOT %1. == sfx. echo  Please use XcuSetup or Start X-Com from STEAM to configure XcomUtil.
if NOT %1. == sfx. jchoice

:EOF 
set xcv=
set subFold=
set progF=
set BatchFile=
