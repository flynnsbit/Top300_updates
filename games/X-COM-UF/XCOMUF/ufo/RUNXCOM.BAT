@echo off
REM ### Preserve Path ###
set OLDPath=%PATH%
set PATH=.\xcomutil\bin;%PATH%

REM ### Copy and verify files for x86 or x64 OS architecture
call XcomUtil\Batch\ArchFile.Bat
if exist xcomutil.exe if exist XcomUtil\Bin\xcomutrt.exe if exist XcomUtil\Bin\sdump.exe if exist XcomUtil\Bin\ResFix.exe if exist XcomUtil\Bin\ResInfo.exe if exist XcomUtil\Bin\BatRun.exe goto FileTst2
goto archErr
:FileTst2
if %OSArch%. == 64. goto archFOK
if %OSArch%. == 32. goto archFOK
if %OSArch%. == 16. if exist XcomUtil\Bin\find.com if exist XcomUtil\Bin\xcopy.exe goto archFOK
:archErr
echo  Unable to find %OSArch%bit Files.
@jchoice
goto finis
:archFOK

REM ### Check for Steam and if NOT DosBox force windows EXE.
if exist ufoexe\geoscape.exe if exist geoscape.exe goto Steam
goto notStm
:Steam
ver >scrap.txt
find /c /i "DOSBox" scrap.txt >nul
if ERRORLEVEL 1 goto StmWin
if exist XcomUtil\flags\forceWin.xcf del XcomUtil\flags\forceWin.xcf
goto notStm
:StmWin
echo Force Windows EXE >XcomUtil\flags\forceWin.xcf
:notStm
if exist scrap.txt del scrap.txt

REM ### Verify not trying to run DOS on x64
if exist XcomUtil\flags\forceWin.xcf goto archOK
if %OSArch%. == 16. goto archOK
if %OSArch%. == 34. goto archOK
XcomUtil QueryInfo XcomVersion
if errorlevel 72 goto archOK
if errorlevel 64 goto incArch
if errorlevel 40 goto archOK
:incArch
echo  DOS X-Com can't run on 64bit Windows. Use DOSBox.
REM '
@jchoice
goto finis
:archOK
set OSArch=
set backup=
set restore=

REM ### Verify XcuSetup has been run.
xcomutil QueryInfo CheckSetup >nul
if errorlevel 1 goto abort
goto noabort
:abort
echo XCUSETUP has not been executed for this version of XCOMUTIL
@jchoice
goto finis
:noabort

REM ### Create Before and Ater folders.
if not exist xcubef\saveinfo.dat md xcubef
if not exist xcuaft\saveinfo.dat md xcuaft

REM ### Start Sound TSR for DosGames.
if NOT exist XcomUtil\flags\forceWin.xcf if exist sound\sndstart.exe sound\sndstart
cls
echo. >>xcomutil.log
echo ==============================Start New Session========================= >>xcomutil.log

REM ### Jump to Before or After Combat
if .%1.==.before. goto xcubef
if .%1.==.after.  goto xcuaft

REM ### Before Game Starts Addon Hook.
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook0
XcomUtil\Bin\BatRun XcomUtil\Addon GameInit
:noHook0

REM #### Play Intro and Start Appropriate Geoscape for the First Time 
if exist XcomUtil\flags\forceWin.xcf goto noexe1
if not exist ufoexe\geoscape.exe goto noexe1
ufoexe\black
if exist intro.exe intro.exe
ufoexe\black
ufoexe\geoscape "0"
if errorlevel 2 goto nonewer
goto end

:noexe1
echo Xcom Windows>XcomUtil\flags\XCOM4WIN.XCF
if not exist patch.dll goto noFLdr1
start /w xcloader geoscape.exe "0"
goto chklvl1
:noFLdr1
if NOT exist XcomUtil\flags\sebLoader.xcf goto noSLdr1
start /w UFOLoader geoscape.exe "0"
goto chklvl1
:noSLdr1
start /w geoscape "0"
:chklvl1

REM Split EXE dosent set Error Code like DOS.
:begin
XcomUtil\bin\sdump QuietMode missdat\mission2.dat newer missdat\saveinfo.dat
if errorlevel 1 goto end
:nonewer
cls

REM ### Reset Text Size and Color for Display
if %COMSPEC%. == Z:\COMMAND.COM. xcomutil\bin\mode 80

REM ### Addon Hook for Between Geoscape and XcomUtil.
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook1
XcomUtil\Bin\BatRun XcomUtil\Addon PreTacticalPreXcomUtil
:noHook1


echo. >>xcomutil.log
echo ----------------------------Entering Combat XcomUtRt---------------------- >>xcomutil.log

REM ### PreCombat Modifications
XcomUtil\Bin\xcomutrt.exe missdat

if not exist XcomUtil\flags\chgufo1a.xcf goto endchg1a
copy /y maps\ufo1a.xcu   maps\ufo1a.map   >nul
copy /y routes\ufo1a.xcu routes\ufo1a.rmp >nul
copy /y terrain\ufo1.xcu terrain\ufo1.mcd >nul
:endchg1a

if not exist chgufo02.xcf goto endchg02
copy /y maps\ufo01.xcu   maps\ufo02.map   >nul
copy /y routes\ufo01.xcu routes\ufo02.rmp >nul
:endchg02

echo. >>xcomutil.log
echo ----------------------------Entering Combat XcomUtil---------------------- >>xcomutil.log

xcomutil missdat DIS:2 DEBUG:2 wrt >>xcomutil.log

REM ### Addon Hook for Between XcomUtil and Tactical
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook2
XcomUtil\Bin\BatRun XcomUtil\Addon PreTacticalAfterXcomUtil
:noHook2

REM ### Backup Modified Pre-Combat Dat
xcopy /y missdat xcubef >nul
goto notbef

REM ### Entry Point replay last Combat
:xcubef
if not exist xcubef\saveinfo.dat goto notbef

xcopy /y xcubef missdat >nul
:notbef

REM ### Start Appropriate Tactical
if exist XcomUtil\flags\forceWin.xcf goto noexe2
if not exist ufoexe\geoscape.exe goto noexe2
ufoexe\black
ufo2exe\tactical "1"
goto chklvl2

:noexe2
if not exist patch.dll goto noFLdr2
start /w xcloader tactical.exe "1"
goto chklvl2
:noFLdr2
if NOT exist XcomUtil\flags\sebLoader.xcf goto noSLdr2
start /w UFOLoader tactical.exe "1"
goto chklvl2
:noSLdr2
start /w tactical "1"
:chklvl2

REM ### Reset Text Size and Color for Display
if %COMSPEC%. == Z:\COMMAND.COM. xcomutil\bin\mode 80

REM ### Modd Hook for between Tactical and XcomUtil
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook3
XcomUtil\Bin\BatRun XcomUtil\Addon AfterTacticalPreXcomUtil
:noHook3

echo. >>xcomutil.log
echo --------------------------Leaving Combat XcomUtRt---------------------- >>xcomutil.log

REM ### Check for and Run Autocombat
XcomUtil\Bin\xcomutrt.exe missdat DEBUG:2 autocombat verbose >>xcomutil.log

REM ### If PSI Screen with Lab Turn on Screening.
if NOT exist XcomUtil\flags\labscrn.xcf goto skpScrn 
XcomUtil\bin\ResInfo missdat 40 >>xcomutil.log
if errorlevel 2 goto skpScrn
if errorlevel 1 goto Scren 
goto skpScrn
:Scren
echo Automatic Screening for PSI/MC >XcomUtil\flags\autoscrn.xcf
:skpScrn

echo. >>xcomutil.log
echo ----------------------------Leaving Combat XcomUtil---------------------- >>xcomutil.log

REM ### Xcomutil After Combat Adjustments.
xcomutil missdat DIS:2 DEBUG:2 aft wrt verbose    >>xcomutil.log

REM ### Reset LabScreen changes.
if exist XcomUtil\flags\labscrn.xcf if exist XcomUtil\flags\autoscrn.xcf del XcomUtil\flags\autoscrn.xcf

REM ### Adjust Small Scoute maps if toggled by BFG
if not exist XcomUtil\flags\chgufo1a.xcf goto enrst1a
copy /y  maps\noship.map    maps\ufo1a.map   >nul
copy /y  routes\noship.rmp  routes\ufo1a.rmp >nul
copy /y  terrain\blanks.mcd terrain\ufo1.mcd >nul
del XcomUtil\flags\chgufo1a.xcf
:enrst1a

if not exist XcomUtil\flags\chgufo02.xcf goto enrst02
copy /y  maps\ufo02.xcu   maps\ufo02.map   >nul
copy /y  routes\ufo02.xcu routes\ufo02.rmp >nul
del XcomUtil\flags\chgufo02.xcf
:enrst02

REM ### Fix Research Bugs
if exist XcomUtil\flags\resfix.xcf xcomutil\bin\resfix

REM ### Addon Hook After XcomUtil before Geoscape.
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook4
XcomUtil\Bin\BatRun XcomUtil\Addon AfterTacticalAfterXcomUtil
:noHook4


REM #### If Post Combat Display on @jchoice.
if not exist XcomUtil\flags\pauserun.xcf goto nopause
echo.
@jchoice
del XcomUtil\flags\pauserun.xcf
:nopause

REM ### Backup Post-Combat Dat
xcopy /y missdat xcuaft >nul
goto notaft

REM ### Entry Point for Post-Combat
:xcuaft
if not exist xcuaft\saveinfo.dat goto notaft

xcopy /y xcuaft missdat >nul

:notaft

REM ### Start Appropriate Geoscape for Second Time.
if exist XcomUtil\flags\forceWin.xcf goto noexe3
if not exist ufoexe\geoscape.exe goto noexe3
ufoexe\black
ufoexe\geoscape "1"
if errorlevel 2 goto nonewer
goto end

:noexe3
if not exist patch.dll goto noFLdr3
start /w xcloader geoscape.exe "1"
goto chklvl3
:noFLdr3
if NOT exist XcomUtil\flags\sebLoader.xcf goto noSLdr3
start /w UFOLoader geoscape.exe "1"
goto chklvl3
:noSLdr3
start /w geoscape "1"
:chklvl3
goto begin

:end
REM ### Addon Hook Exit.
if NOT exist XcomUtil\flags\RunAddon.xcf goto noHook5
XcomUtil\Bin\BatRun XcomUtil\Addon ExitGame
:noHook5

REM ### Unload Sound TSR for DOS
if NOT exist XcomUtil\flags\forceWin.xcf if exist sound\sndend.exe sound\sndend
:finis
REM ### Cleanup
if exist XcomUtil\flags\XCOM4WIN.XCF del XcomUtil\flags\XCOM4WIN.XCF
if exist XcomUtil\flags\forceWin.xcf del XcomUtil\flags\forceWin.xcf
set OSArch=
set backup=
set restore=
if "%OLDPath%". == . goto EOF
set PATH=%OLDPath%
:EOF
