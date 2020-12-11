REM #################################
REM ### Check System for issues #####
REM #################################


REM verify debug can be done
set oldredir=
if %redir%. == nul. goto skipDBF
echo. >%redir%
if exist %redir% goto skipDBF
set oldredir=%redir%
set redir=nul
:skipDBF

REM ############################################
REM ##### Check if Game Directory Writable #####
set GDirW=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 02
if exist test.xcu del test.xcu
if exist test.xcu goto readonly
if NOT exist test.xcu echo dummy >test.xcu
if NOT exist test.xcu goto readonly
if exist test.xcu del test.xcu
set GDirW=%clOK%OK%clOff%
echo GDirW:%GDirW%>>%redir%
call XcomUtil\Batch\display.bat SysChks 02
goto readwrite
:readonly
REM GAME FOLDER READONLY attempt to fix.
REM if NOT %xOS%. == XP. if NOT %xOS%. == Vista. if NOT %xOS%. == Win7. goto writeErr
if %USERNAME%. == . goto writeErr
call XcomUtil\Batch\display.bat UACFix 02
if NOT %Skip%. == Y. jchoice
"XcomUtil\Patches\XcomUtil UAC Fix.exe"
if exist fixUAC.bat del fixUAC.bat
if exist test.xcu del test.xcu
if exist test.xcu goto writeErr
if NOT exist test.xcu echo dummy >test.xcu
if NOT exist test.xcu goto writeErr
if exist test.xcu del test.xcu
set GDirW=%clOK%OK%clOff%
echo GDirW:%GDirF%>>%redir%
call XcomUtil\Batch\display.bat SysChks 02
goto readwrite
:writeErr
set GDirW=%clErr%NO%clOff%
echo GDirW:%GDirW%>>%redir%
call XcomUtil\Batch\display.bat SysChks 02
goto ErrOut
:readwrite

REM Reset Redirector if needed.
if %oldredir%. == . goto noOldRed
set redir=%oldredir%
set oldredir=
ver >>%redir%
echo XCUV:%xcuVer%>>%redir%

:noOldRed
REM ##############################################
REM #### Is old ver of XcomUtil still present ####
if NOT exist avenger.map goto oldverok
echo Pre 9.7 detected >>%redir%
call XcomUtil\Batch\display.bat oldVer 99
if NOT %Skip%. == Y. jchoice
call XcomUtil\Batch\OldVer.bat
:oldverok

REM ############################################################
REM ##### Copy 16bit or 32 bit exe's based on detected CPU #####
REM ############################################################
call XcomUtil\Batch\ArchFile.bat
:arFTst1
if exist xcomutil.exe if exist XcomUtil\Bin\xcomutrt.exe if exist XcomUtil\Bin\sdump.exe if exist XcomUtil\Bin\ResFix.exe if exist XcomUtil\Bin\ResInfo.exe if exist XcomUtil\Bin\BatRun.exe goto arFTst2
goto archErr
:arFTst2
if %OSArch%. == 64. goto archOK
if %OSArch%. == 32. goto archOK
if %OSArch%. == 16. if exist XcomUtil\Bin\find.com if exist XcomUtil\Bin\xcopy.exe goto archOK
:archErr
set osArF=%clErr%NO%clOff%
echo osArF:%osArF%>>%redir%
call XcomUtil\Batch\display.bat SysChks 03
goto ErrOut
:archOK
set osArF=%clOK%OK%clOff%
echo osArF:%osArF%>>%redir%
call XcomUtil\Batch\display.bat SysChks 03
echo Arch:%OSArch%>>%redir%

REM ####################
REM ##### CHECK OS #####
set osnf=y
set xOS=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat SysChks 04
ver>>%redir%
ver >scrap.txt
if NOT exist scrap.txt goto writeErr
REM Detect if runing in 9x
find /i "Windows 9" scrap.txt>>%redir%
if errorlevel 1 goto not9x
echo Win95 >>%redir%
set xOS=9x
set osnf=
:not9x
REM Detect if runing in 2k
find /i "2000" scrap.txt>>%redir%
if errorlevel 1 goto not2k
echo Win2k >>%redir%
set xOS=2K
set osnf=
:not2k
REM Detect if runing in XP
find /i "XP" scrap.txt>>%redir%
if errorlevel 1 goto notXP
echo WinXP >>%redir%
set xOS=XP
set osnf=
:notXP
REM Detect if runing in vista
find /i "6.0" scrap.txt>>%redir%
if errorlevel 1 goto notvis
echo Vista >>%redir%
set xOS=Vista
set xcuWinV=Vista
set osnf=
:notvis
REM Detect if runing in Windows 7
find /i "6.1" scrap.txt >>%redir%
if errorlevel 1 goto notwin7
echo Win7 >>%redir%
set xOS=Win7
set xcuWinV=Windows 7
set osnf=
:notwin7
REM Detecting DosBox
REM if NOT %COMSPEC%. == Z:\COMMAND.COM. goto notDosBox
find /c /i "DOSBox" scrap.txt >>%redir%
if errorlevel 1 goto notDosBox
echo DosBox >>%redir%
set xOS=DosBox
set osnf=
:notDosBox
if %_4VER%. == . goto not4DOS
echo 4DOS >>%redir%
set xOS=4DOS
set osnf=
:not4DOS
REM If not detected
if %osnf%. == . goto osOK
echo Unknown OS >>%redir%
set xOS=Unknown
set osnf=
:osOK
call XcomUtil\Batch\display.bat SysChks 04
echo OS:%xOS%>>%redir%
set osnf=

REM ################################################
REM ##### Check if being run in Game Directory #####
set GDirF=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 05
if exist geodata\obdata.dat goto gameok
Set GDirF=%clErr%NO%clOff%
echo GDirF:%GDirF%>>%redir%
call XcomUtil\Batch\display.bat SysChks 05
goto ErrOut
:gameok
set GDirF=%clOK%OK%clOff%
echo GDirF:%GDirF%>>%redir%
call XcomUtil\Batch\display.bat SysChks 05



REM Remove Readonly flag on all files (Does not work in DosBox)
attrib -R /S>>%redir%

REM ################################################
REM ##### Check for or Create Save directories #####
set SDirEx=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 06
if not exist game_1\dum.bin  md game_1>>%redir%
if not exist game_2\dum.bin  md game_2>>%redir%
if not exist game_3\dum.bin  md game_3>>%redir%
if not exist game_4\dum.bin  md game_4>>%redir%
if not exist game_5\dum.bin  md game_5>>%redir%
if not exist game_6\dum.bin  md game_6>>%redir%
if not exist game_7\dum.bin  md game_7>>%redir%
if not exist game_8\dum.bin  md game_8>>%redir%
if not exist game_9\dum.bin  md game_9>>%redir%
if not exist game_10\dum.bin md game_10>>%redir%
if not exist game_1\dum.bin  copy /y XcomUtil\Patches\dum.bin game_1\dum.bin>>%redir%
if not exist game_2\dum.bin  copy /y XcomUtil\Patches\dum.bin game_2\dum.bin>>%redir%
if not exist game_3\dum.bin  copy /y XcomUtil\Patches\dum.bin game_3\dum.bin>>%redir%
if not exist game_4\dum.bin  copy /y XcomUtil\Patches\dum.bin game_4\dum.bin>>%redir%
if not exist game_5\dum.bin  copy /y XcomUtil\Patches\dum.bin game_5\dum.bin>>%redir%
if not exist game_6\dum.bin  copy /y XcomUtil\Patches\dum.bin game_6\dum.bin>>%redir%
if not exist game_7\dum.bin  copy /y XcomUtil\Patches\dum.bin game_7\dum.bin>>%redir%
if not exist game_8\dum.bin  copy /y XcomUtil\Patches\dum.bin game_8\dum.bin>>%redir%
if not exist game_9\dum.bin  copy /y XcomUtil\Patches\dum.bin game_9\dum.bin>>%redir%
if not exist game_10\dum.bin copy /y XcomUtil\Patches\dum.bin game_10\dum.bin>>%redir%
if exist game_1\dum.bin goto folderOK
set SDirEx=%clErr%NO%clOff%
echo SDirEx:%SDirEx%>>%redir%
call XcomUtil\Batch\display.bat SysChks 06
goto ErrOut
:folderOK
set SDirEx=%clOK%OK%clOff%
echo SDirEx:%SDirEx%>>%redir%
call XcomUtil\Batch\display.bat SysChks 06


REM ###############################
REM ##### Detect game Version #####
set xcver=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 07
if NOT exist ufoexe\geoscape.exe if NOT exist geoscape.exe goto xcwin
set xcuWin=N
XcomUtil QueryInfo XcomVersion
if errorlevel 72 goto xcver72
if errorlevel 67 goto xcver67
if errorlevel 66 goto xcver66
if errorlevel 65 goto xcver65
if errorlevel 64 goto xcver64
if errorlevel 40 goto xcver40
if errorlevel 39 goto xcver39
if errorlevel 38 goto xcver38
if errorlevel 37 goto xcver37
if errorlevel 36 goto xcver36
if errorlevel 35 goto xcver35
if errorlevel 34 goto xcver34
if errorlevel 33 goto xcver33
if errorlevel 32 goto xcver32

goto xcverUN

:xcver32
set xcver=UFO 1.0
set XCOM=UFO
goto endVerchk

:xcver33
set xcver=UFO 1.2
set XCOM=UFO
goto endVerchk

:xcver34
set xcver=UFO 1.3
set XCOM=UFO
goto endVerchk

:xcver35
set xcver=X-Com 1.0
set XCOM=UFO
goto endVerchk

:xcver36
set xcver=X-Com 1.4
set XCOM=UFO
goto endVerchk

:xcver37
set xcver=UFO 1.2A
set XCOM=UFO
goto endVerchk

:xcver38
set xcver=UFO Spanish
set XCOM=UFO
goto endVerchk

:xcver39
set xcver=X-Com Italian
set XCOM=UFO
goto endVerchk

:xcver40
set xcver=UFO Win
set XCOM=UFO
set xcuWin=Y
goto endVerchk

:xcver64
set xcver=TFTD v1
set XCOM=TFTD
goto endVerchk

:xcver65
set xcver=TFTD v2
set XCOM=TFTD
goto endVerchk

:xcver66
set xcver=TFTD v2.1
set XCOM=TFTD
goto endVerchk

:xcver67
set xcver=TFTD Italian
set XCOM=TFTD
goto endVerchk

:xcver72
set xcver=TFTD Win
set XCOM=TFTD
set xcuWin=Y
goto endVerchk

:xcverUN
set xcver=%clErr%Unknown%clOff%
call XcomUtil\Batch\display.bat SysChks 07
goto ErrOut

:xcwin
if exist "terror from the deep.exe" goto xcver72
if exist terror.exe                 goto xcver72
if exist terror~1.exe               goto xcver72
if exist "ufo defense.exe" goto xcver40
if exist ufo.exe           goto xcver40
if exist ufodef~1.exe      goto xcver40
:endVerchk
echo xcver:%xcver%>>%redir%

REM Check for both DOS/Windows (Steam)
if %xcuWin%. == Y. goto SkpStmCh
if exist "terror from the deep.exe" goto StmFiles
if exist terror~1.exe goto StmFiles
if exist terror.exe goto StmFiles
if exist "ufo defense.exe" goto StmFiles
if exist ufodef~1.exe goto StmFiles
if exist ufo.exe goto StmFiles
goto SkpStmCh
:StmFiles
echo STEAM Detected>>%redir%
set Steam=Y
set xcuWin=Y
set xcverOld=%xcver%
set xcver=%XCOM% Dos/Win
:SkpStmCh
call XcomUtil\Batch\display.bat SysChks 07

REM #############################################
REM ##### Create and Prep Missdat Directory #####
set MdatOK=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 08
if not exist missdat\dum.bin md missdat>>%redir%
if not exist missdat\dum.bin copy /y XcomUtil\Patches\dum.bin missdat\dum.bin
if not exist missdat\saveinfo.dat if %XCOM%. == UFO.  copy /y XcomUtil\Patches\saveinfo.UFO missdat\saveinfo.dat>>%redir%
if not exist missdat\saveinfo.dat if %XCOM%. == TFTD. copy /y XcomUtil\Patches\saveinfo.TFD missdat\saveinfo.dat>>%redir%
if not exist missdat\mission2.dat echo dummy>missdat\mission2.dat
if NOT exist missdat\geodata.dat copy /y XcomUtil\Patches\geodata.dat missdat\geodata.dat
if exist missdat\mission2.dat if exist missdat\saveinfo.dat if exist missdat\geodata.dat goto missdatOK
jchoice
set MdatOK=%clErr%Read Only!%clOff%
echo MdatOK:%MdatOK%>>%redir%
call XcomUtil\Batch\display.bat SysChks 08
goto ErrOut
:missdatOK
set MdatOK=%clOK%OK%clOff%
echo MdatOK:%MdatOK%>>%redir%
call XcomUtil\Batch\display.bat SysChks 08


REM #############################
REM ##### Hybrid Game Check #####
set Hyb=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 09
if exist XcomUtil\flags\hybrdpth.xcu goto hybExist
if %CLHyb%.==. goto NoHybrid
if %XCOM%. == UFO. if NOT exist %CLHyb%\routes\atlan00.rmp goto NoHybrid
if %XCOM%. == TFTD. if NOT exist %CLHyb%\routes\urban03.rmp goto NoHybrid
set Hyb=Yes
set HybPath=%CLHyb%
echo Hyb:%Hyb%>>%redir%
echo HybPath:%HybPath%>>%redir%
call XcomUtil\Batch\display.bat SysChks 09
goto endHyb
:hybExist
set Hyb=Yes
set HybPath=Already Installed
echo Hyb:%Hyb%>>%redir%
echo HybPath:%HybPath%>>%redir%
call XcomUtil\Batch\display.bat SysChks 09
goto endHyb
:NoHybrid
set Hyb=No
echo Hyb:%Hyb%>>%redir%
call XcomUtil\Batch\display.bat SysChks 09
:endHyb

REM ################################
REM #### Are results playbable? ####
set ChkRes=%clChk%Checking.%clOff%
call XcomUtil\Batch\display.bat SysChks 10
if %steam%. == Y. goto StmRes
if %OSArch%. == 64. if NOT %xcuWin%. == Y. goto dbReq
if %xOS%. == DosBox. if %xcuWin%. == Y. goto  dbNOTReq
if %xOS%. == Unknown. goto osUnkR
goto ResOK

:osUnkR
set ChkRes=Unknown OS
set sysCkMsg=XcuSetup did not recognize the operating system your using.
set sysCkMsg2=Continue at your own risk.
call XcomUtil\Batch\display.bat SysChks 11
goto ResDone

:StmRes
REM Steam detected Issue may Result
set ChkRes=Steam Detected
if %xOS%. == DosBox. goto StmDB
set sysCkMsg=If you are intending to play X-Com %XCOM% from inside STEAM, first run
set sysCkMsg2=XcomUtil\SteamSetup.bat then start X-Com %XCOM% from STEAM
call XcomUtil\Batch\display.bat SysChks 11
goto ResDone
:StmDB
set sysCkMsg=To play %XCOM% directly from Vista or Windows 7 will need to run
set sysCkMsg2=XcomUtil\Patches\Xcom Vista Patch.exe or start XcuSetup in Windows
call XcomUtil\Batch\display.bat SysChks 11
goto ResDone

:dbReq
REM Dos Games cant run on x64
set ChkRes=%clErr%Incompatible!%clOff%
set sysCkMsg=%xcver% will not run on on %xOS% x64. You must start RunXcom
set sysCkMsg2=from inside DosBox.
call XcomUtil\Batch\display.bat SysChks 11
goto ResDone

:dbNOTReq
REM Windows Games dont run in DosBox
set ChkRes=%clErr%Failed!%clOff%
set sysCkMsg=XcuSetup can not detect the host OS need to run %xcver%
set sysCkMsg2=You must start XcuSetup and play %xcver% from windows.
call XcomUtil\Batch\display.bat SysChks 11
goto ErrOut

:ResOK
set ChkRes=%clOK%OK%clOff%
call XcomUtil\Batch\display.bat SysChks 10
:ResDone

goto EOF
:ErrOut
set ErrOut=Y
:EOF
call XcomUtil\Batch\display.bat SysChks 99
set ChkRes=
set xcPa=
set MdatOK=
set osArF=
set SDirEx=
set GDirW=
set GDirF=
set sysCkMsg=
set sysCkMsg2=
set OSArch=