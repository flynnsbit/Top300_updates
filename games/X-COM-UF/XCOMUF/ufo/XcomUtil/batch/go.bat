@echo off
set xcuErr=
if NOT exist XCOMUTIL.CFG goto RunSetup
:menu
cls
echo  -= XcomUtil Game Start Menu =-
echo.
echo  1. Run XcomUtil Setup
echo  2. Play X-Com
echo  3. X-Com Sound Setup
REM echo  4. Command Prompt
echo  U. Uninstall XcomUtil
echo  X. Exit to Windows
echo.
echo  Choose an option? (2)
XcomUtil\bin\sdump16.exe * getresp 1234uUxX 2
if ERRORLEVEL 7 goto EOF
if ERRORLEVEL 5 goto UnInst
REM if ERRORLEVEL 4 goto cmdp
if ERRORLEVEL 3 goto SoundSet
if ERRORLEVEL 2 goto GameOn
:RunSetup
call XcuSetup
if NOT %xcuErr%. == . goto xcuErr
goto Menu
:GameOn
call RunXcom
goto EOF
:cmdp
z:\command.com
goto menu
:SoundSet
setup
goto Menu
:UnInst
XcuSetup uninstall
goto EOF
:xcuErr
echo Error runing XcomUtil Setup.
echo.
echo Disabeling This Menu.
pause
call XcuSetup uninstall
call OldBatch.bat
:EOF
set xcuErr=