@echo off
REM if exist debug.txt del debug.txt
REM if exist XcomUtil\debug.txt echo. >XcomUtil\debug.txt
call XcomUtil\Batch\envclean.bat

REM ##### Check enviroment Space #####
cls
echo  -= XcomUtil %xcuVer% setup =-
echo.
echo     ::Runing System Checks::
set xcuEnviroTest1=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest2=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest3=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest4=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest5=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest6=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest7=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
set xcuEnviroTest8=abcdefghijklmnopqurtuvwxyz1234567890abcdefghijklmnopqurtuvwxyz1234567890abcdefghijkl
if NOT %xcuEnviroTest8%. == . goto envOK
call XcomUtil\Batch\Display EnvErr 99
goto ErrOut
:envOK
set xcuEnviroTest1=
set xcuEnviroTest2=
set xcuEnviroTest3=
set xcuEnviroTest4=
set xcuEnviroTest5=
set xcuEnviroTest6=
set xcuEnviroTest7=
set xcuEnviroTest8=

REM ##### Initialize Vars #####
set xcuVer=9.7
REM set beta=Private
REM set beta=Public
set beta=N

set OLDPath=%PATH%
set PATH=.\XcomUtil\Bin;%PATH%
set redir=XcomUtil\debug.txt
REM set redir=nul
set debug=N
set default=N


if %beta%. == N. goto release
if %beta%. == Public. call XcomUtil\Batch\display.bat Beta 00
if %beta%. == Private. call XcomUtil\Batch\display.bat Beta 99
jchoice
:release
set beta=

REM ###### check for older or broken DosBox
if NOT %COMSPEC%. == Z:\COMMAND.COM. goto notDosBox
call XcomUtil\Batch\DBCheck.bat
if %ErrOut%. == Y. goto ErrOut
REM 0.73 SHIFT does not work. No command line args.
set shftchk=bad
call XcomUtil\Batch\shiftchk.bat
if %shftchk%. == ok. goto not73
call XcomUtil\Batch\display.bat DB73 99
set redir=XcomUtil\debug.txt
jchoice
set shftchk=
goto endVars
:not73
set shftchk=
:notDosBox

REM #########################################
REM ###### Set vars from command line  ######
set CmdLn=%0 %1 %2 %3 %4 %5 %6 %7 %8 %9
:startVars
if %1. == . goto endVars
if exist %1\maps\ATLAN00.map goto setHyb
if exist %1\maps\URBAN00.map goto setHyb
REM if exist %1\geodata\obdata.dat goto setHyb
if %1. == uninstall. goto setUnst
if %1. == Uninstall. goto setUnst
if %1. == debug. goto setDebug
if %1. == skip. goto setSkip
if %1. == nobackup. goto setNoBak
if exist %1 goto setCfgF
if exist %1.bat goto setCfgF2
if exist XcomUtil\Batch\%1.bat goto setCfgF3
if exist XcomUtil\%1.bat goto setCfgF4
REM No Match. try next one.
shift
goto startVars
:setCfgF
set CLConF=%1
shift
goto startVars
:setCfgF2
set CLConF=%1.bat
shift
goto startVars
:setCfgF3
set CLConF=XcomUtil\Batch\%1.bat
shift
goto startVars
:setCfgF4
set CLConF=XcomUtil\%1.bat
shift
goto startVars
:setUnst
set CLUn=Y
shift
goto startVars
:setHyb
set CLHyb=%1
shift
goto startVars
:setDebug
set debug=Y
set redir=XcomUtil\debug.txt
shift
goto startVars
:setSkip
set Skip=Y
shift
goto startVars
:setNoBak
set skpBackup=Y
shift
goto startVars
:endVars
echo Command Line:  %CmdLn%>>%redir%
set CmdLn=

REM ##### If DOSBOX turn on color #####
if NOT %COMSPEC%. == Z:\COMMAND.COM. goto noANSI
set clOK=[1;32m
rem ;
set clErr=[1;31m
rem ;
set clChk=[1;33m
rem ;
set clOff=[0m
:noANSI


REM With Enviorment Space OK Use Display Batch for output
set EnvSp=%clOK%OK%clOff%
call XcomUtil\Batch\display.bat SysChks 01

REM #################################
REM ### Check System for issues #####
REM #################################

call XcomUtil\Batch\SysCheck.Bat

REM Uninstall only Option
if %CLUn%. == Y. goto unint01

REM Exit if error set by system Check.
if %ErrOut%. == Y. goto ErrOut

REM ##### Checks Completed #####
set EnvSp=
if NOT %Skip%. == Y. jchoice

REM if older ver of XcuSetup has been used, delete ver file.
xcomutil QueryInfo CheckSetup >>%redir%
if errorlevel 1 if exist XcomUtil\flags\xcomutil.xcf del XcomUtil\flags\xcomutil.xcf

:unint01
REM ##### if DosBox Set speed to Max #####
if %xOS%. == DosBox. goto SetSpeed
goto skipSpeed
:SetSpeed
call XcomUtil\Batch\display.bat DosBox 99
if NOT %CLUn%. == Y. if NOT %Skip%. == Y. jchoice
config -get "cpu core" >>%redir%
set DBCPU=%CONFIG%
config -get "cpu cycles" >>%redir%
set DBCyc=%CONFIG%
set CONFIG=
config -set "cpu core=dynamic"
config -set "cpu cycles=max"
:skipSpeed


REM ####################################
REM ##### Restore All Backup Files #####
REM ####################################
:restore
call XcomUtil\Batch\Restore.bat

REM Uninstall Only
if %CLUn%. == Y. goto UninDel

REM Exit if error set by Restore.
if %ErrOut%. == Y. goto ErrOut
if NOT %Skip%. == Y. jchoice




REM ###################################################################
REM ##### create Backup Files, Do Not Over Write Original Backups #####
REM ###################################################################
if exist ufo2exe\tactical.xcu if %skpBackup%. == Y. if %Hyb%. == No. goto skpBack
if exist XcomUtil\ufo.xcu if %skpBackup%. == Y. if %Hyb%. == No. goto skpBack
if exist XcomUtil\terror.xcu if %skpBackup%. == Y. if %Hyb%. == No. goto skpBack
call XcomUtil\Batch\Backup.bat
if %ErrOut%. == Y. goto ErrOut
if NOT %Skip%. == Y. jchoice
:skpBack

:stHybChk
REM ########################################
REM ##### Copy files for Hybrid Games  #####
REM ########################################
REM  Done before backup to streamline backup
REM If already installed skip copy
if exist XcomUtil\flags\hybrdpth.xcu goto NoHyCpy
if %Hyb%. == No. goto NoHyCpy
call XcomUtil\Batch\Hybrid.bat
REM Exit if error set by Hybrid.
if %ErrOut%. == Y. goto ErrOut
call XcomUtil\Batch\display.bat HybCpy 99
if NOT %Skip%. == Y. jchoice
goto restore
:NoHyCpy
set restore=
set backup=

REM ###############################
REM ##### Set Default Config ######
REM ###############################
cls
echo. ########Environment Before########>>%redir%
echo. >>%redir%
set >>%redir%
echo. ##################################>>%redir%
call XcomUtil\Batch\Default.bat

REM Validate Defaults (incase edited by user)
call XcomUtil\Batch\ChkVals.bat

REM Use LastOp to remember options. (Default still loaded above for Upgrade situations.)
if exist LastOp.bat if NOT exist XcomUtil\LastOp.bat copy /y LastOp.bat XcomUtil\LastOp.bat
if exist XcomUtil\LastOp.bat if exist LastOp.bat del LastOp.bat
if exist XcomUtil\lastop.bat call XcomUtil\lastop.bat
REM Validate for Upgrad or User editing.
call XcomUtil\Batch\ChkVals.bat

echo. ########Environment After########>>%redir%
echo. >>%redir%
set >>%redir%
echo. ##################################>>%redir%

REM If requested load custom config options and skip questions
if NOT %CLConF%. == . call %CLConF%
if NOT %CLConF%. == . goto endOpt

REM #############################
REM #####  Setup Questions  #####
REM #############################
call XcomUtil\Batch\Options.bat

:endOpt
REM Validate Options
call XcomUtil\Batch\ChkVals.bat

REM #########################
REM ##### Addon Pre-Apply####
REM #########################
if NOT exist XcomUtil\flags\RunAddon.xcf goto noAdd1
call XcomUtil\Batch\Display Addon 99
if NOT %Skip%. == Y. jchoice
XcomUtil\Bin\BatRun.exe Xcomutil\Addon Setup
REM Validate Options if changed by Addon
call XcomUtil\Batch\ChkVals.bat
:noAdd1

REM ###############################
REM ##### Create Last Options #####
REM ###############################
call XcomUtil\Batch\CrLastOp.bat
echo -------------Last Options----------->>%redir%
type XcomUtil\LastOp.bat >>%redir%
if NOT %CLConF%. == . echo -------------Command Line Option File------------>>%redir%
if NOT %CLConF%. == . type %CLConF% >>%redir%
echo ------------------------------------>>%redir%
set CLConF=

REM ##### Debug Options #####
if NOT %debug%. == Y. goto SkpQDebug
call XcomUtil\Batch\display.bat debugDis 99
:SkpQDebug

echo. ########Environment Applied########>>%redir%
echo. >>%redir%
set >>%redir%
echo. ##################################>>%redir%


REM #########################
REM ##### Apply Options #####
REM #########################
call XcomUtil\Batch\Apply.bat
REM Exit if error set by Apply.
if %ErrOut%. == Y. goto ErrOut

REM #########################
REM ##### Addon Post-Apply###
REM #########################
if NOT exist XcomUtil\flags\RunAddon.xcf goto noAdd2
XcomUtil\Bin\BatRun.exe Xcomutil\Addon Apply
REM Validate Options if changed by Addon
call XcomUtil\Batch\ChkVals.bat
:noAdd2


REM ####################
REM ##### Finished #####
echo.
if NOT %Skip%. == Y. jchoice
if NOT %SplEXE%. == N. call XcomUtil\Batch\display.bat EndSplit 99
if     %SplEXE%. == N. call XcomUtil\Batch\display.bat EndNoSpl 99




goto skUninst
REM #######################################
REM ##### Uninstall Cleanup Files #########
REM #######################################
:UninDel
REM call XcomUtil\Batch\display.bat RestDef 98
call XcomUtil\Batch\UninstCL.bat

echo. Game File Restored.
echo  Backup Files Removed.
echo.
echo  Uninstall of XcomUtil %xcuver% Complete.
echo  Thankyou for using XcomUtil.
goto EOF
:skUninst

goto EOF
REM #### Error Message Footer #####
:ErrOut
echo  Unable to continue!
set xcuErr=Error
jchoice

:EOF
REM Restore Path
if "%OLDPATH%." == "." goto skpPaRst
set PATH=%OLDPATH%
:skpPaRst

REM ##### reset DosBoxSpeed #####
if %xOS%. == DosBox. goto ReSetSpd
goto skpReSet
:ReSetSpd
if %DBCPU%. == . goto skpReSet
config -set "cpu core=%DBCPU%"
config -set "cpu cycles=%DBCyc%"
:skpReSet

REM ##### Clean up Enviorment Space #####
call XcomUtil\Batch\envclean.bat