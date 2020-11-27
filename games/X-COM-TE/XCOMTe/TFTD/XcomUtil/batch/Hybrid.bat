REM ########################################
REM ##### Copy files for Hybrid Games  #####
REM ########################################
REM  Done before backup to streamline backup


call XcomUtil\Batch\display.bat HybCpy 00
REM Both games contain thease files, backup and restore before copying.
set PlaneBak=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 01
if not exist terrain\planebak.mcd copy /y terrain\plane.mcd terrain\planebak.mcd >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\planebak.tab copy /y terrain\plane.tab terrain\planebak.tab >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\planebak.pck copy /y terrain\plane.pck terrain\planebak.pck >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\blankbak.pck copy /y terrain\blanks.pck terrain\blankbak.pck >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\blankbak.mcd copy /y terrain\blanks.mcd terrain\blankbak.mcd >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\xba1bak.mcd copy /y terrain\xbase1.mcd terrain\xba1bak.mcd >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\xba2bak.mcd copy /y terrain\xbase2.mcd terrain\xba2bak.mcd >>%redir%
if ERRORLEVEL 1 goto PlBkFal
if not exist terrain\urbbak.pck copy /y terrain\urbits.pck terrain\urbbak.pck >>%redir%
if ERRORLEVEL 1 goto PlBkFal
goto PlBkOk
:PlBkFal
set PlaneBak=%clErr%Failed!%clOff%
echo PlaneBak=%PlaneBak%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 01
goto ErrOut
:PlBkOk
set PlaneBak=%clOK%OK%clOff%
echo PlaneBak=%PlaneBak%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 01

echo off
REM Copy in files
REM Maps
set CpHybM=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 02
call XcomUtil\Batch\RunRes %HybPath%\maps map maps map CpHybM HybCpy 02
if %ErrOut%. == Y. goto HyMpFal
goto HyMpOK
:HyMpFal
set CpHybM=%clErr%Failed!%clOff%
echo CpHybM=%CpHybM%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 02
goto ErrOut
:HyMpOK
set CpHybM=%clOK%OK%clOff%
echo CpHybM=%CpHybM%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 02
REM Routes
set CpHybR=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 03
call XcomUtil\Batch\RunRes %HybPath%\routes rmp routes rmp CpHybR HybCpy 03
if %ErrOut%. == Y. goto HyRtFal
goto HyRtOK
:HyRtFal
set CpHybR=%clErr%Failed!%clOff%
echo CpHybR=%CpHybR%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 03
goto ErrOut
:HyRtOK
set CpHybR=%clOK%OK%clOff%
echo CpHybR=%CpHybR%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 03
REM TERRAIN
set CpHybTer=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 04
xcopy /y %HybPath%\terrain\*.* terrain\*.* >>%redir%
call XcomUtil\Batch\RunRes %HybPath%\terrain * terrain * CpHybTer HybCpy 04
if %ErrOut%. == Y. goto HyTrFal
goto HyTrOK
:HyTrFal
set CpHybTer=%clErr%Failed!%clOff%
echo CpHybTer=%CpHybTer%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 04
goto ErrOut
:HyTrOK
set CpHybTer=%clOK%OK%clOff%
echo CpHybTer=%CpHybTer%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 04

REM Unique Names for TFTD
if %XCOM%. == TFTD. goto NoHyPla
set CpSubPlane=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 05
if not exist terrain\planes.mcd copy /y terrain\plane.mcd terrain\planes.mcd >>%redir%
if ERRORLEVEL 1 goto HySpFal
if not exist terrain\planes.tab copy /y terrain\plane.tab terrain\planes.tab >>%redir%
if ERRORLEVEL 1 goto HySpFal
if not exist terrain\planes.pck copy /y terrain\plane.pck terrain\planes.pck >>%redir%
if ERRORLEVEL 1 goto HySpFal
goto HySpOK
:HySpFal
set CpSubPlane=%clErr%Failed!%clOff%
echo CpSubPlane=%CpSubPlane%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 05
goto ErrOut
:HySpOK
set CpSubPlane=%clOK%OK%clOff%
echo CpSubPlane=%CpSubPlane%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 05

:NoHyPla
set PlaneRes=%clChk%Copying.%clOff%
call XcomUtil\Batch\display.bat HybCpy 06
if exist terrain\planebak.tab xcopy /y terrain\planebak.* terrain\plane.* >>%redir%
if exist terrain\planebak.tab del terrain\planebak.*
if exist terrain\blankbak.MCD xcopy /y terrain\blankbak.mcd terrain\blanks.mcd >>%redir%
if exist terrain\blankbak.MCD del terrain\blankbak.mcd
if exist terrain\blankbak.pck xcopy /y terrain\blankbak.pck terrain\blanks.pck >>%redir%
if exist terrain\blankbak.pck del terrain\blankbak.pck
if exist terrain\xba1bak.mcd xcopy /y terrain\xba1bak.MCD terrain\XBASE1.MCD >>%redir%
if exist terrain\xba1bak.mcd del terrain\xba1bak.mcd
if exist terrain\xba2bak.mcd xcopy /y terrain\xba2bak.MCD terrain\XBASE2.MCD >>%redir%
if exist terrain\xba2bak.mcd del terrain\xba2bak.mcd
if exist terrain\urbbak.pck copy /y terrain\urbbak.pck terrain\urbits.pck >>%redir%
if exist terrain\urbbak.pck del terrain\urbbak.pck
if ERRORLEVEL 1 goto PlRsFal
goto PlRsOK
:PlRsFal
set PlaneRes=%clErr%Failed!%clOff%
echo PlaneRes=%PlaneRes%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 06
goto ErrOut
:PlRsOK
set PlaneRes=%clOK%OK%clOff%
echo PlaneRes=%PlaneRes%>>%redir%
call XcomUtil\Batch\display.bat HybCpy 06

if %XCOM%. == UFO if not exist %HybPath%\routes\seabed00.rmp echo MiniHybrid>>%redir%
if %XCOM%. == UFO if not exist %HybPath%\routes\seabed00.rmp goto minihyb
if not exist routes\grunge17.rmp copy /y routes\seabed00.rmp routes\grunge17.rmp >>%redir%
if not exist routes\a_base16.rmp copy /y routes\seabed00.rmp routes\a_base16.rmp >>%redir%
if not exist routes\alship18.rmp copy /y routes\seabed00.rmp routes\alship18.rmp >>%redir%
if not exist routes\level00.rmp  copy /y routes\seabed00.rmp routes\level00.rmp  >>%redir%
if not exist routes\crypt00.rmp  copy /y routes\seabed00.rmp routes\crypt00.rmp  >>%redir%
:minihyb
if not exist routes\xbase_21.rmp copy routes\urban03.rmp  routes\xbase_21.rmp >>%redir%
if not exist routes\ubase_16.rmp copy routes\urban03.rmp  routes\ubase_16.rmp >>%redir%

:HybDone
REM echo %HybPath% >XcomUtil\flags\hybrdpth.xcf
echo %HybPath% >XcomUtil\flags\hybrdpth.xcu

goto EOF
:ErrOut
set ErrOut=Y
:EOF
set HybPath=