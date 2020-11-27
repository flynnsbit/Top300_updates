REM ###################################################################
REM ##### create Backup Files, Do Not Over Write Original Backups #####
REM ###################################################################
REM  Xcopy really slow on DosBox. even with skip existing targets.

call XcomUtil\Batch\display.bat Backup 00

REM Geoscape
set GeoBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 01
if NOT %xcuWin%. == Y. goto GeBakDos
if exist "ufo defense.exe" copy /y "ufo defense.exe" XcomUtil\ufo.xcu >>%redir%
if exist ufo.exe copy /y ufo.exe XcomUtil\ufo.xcu >>%redir%
if NOT exist "ufo defense.exe"if exist ufodef~1.exe copy /y ufodef~1.exe XcomUtil\ufo.xcu >>%redir%
if exist XcomUtil\ufo.xcu if NOT %Steam%. == Y. goto GeBakOk
if exist XcomUtil\ufo.xcu if %Steam%. == Y. goto GeBakDos
if exist "terror from the deep.exe" copy /y "terror from the deep.exe" XcomUtil\terror.xcu >>%redir%
if exist terror.exe copy /y terror.exe XcomUtil\terror.xcu >>%redir%
if NOT exist "terror from the deep.exe" if exist terror~1.exe copy /y terror~1.exe XcomUtil\terror.xcu >>%redir%
if exist XcomUtil\terror.xcu if NOT %Steam%. == Y. goto GeBakOk
if exist XcomUtil\terror.xcu if %Steam%. == Y. goto GeBakDos
goto GeBakFal
:GeBakDos
%backup% ufoexe\*.exe ufoexe\*.xcu >>%redir%
if ERRORLEVEL 1 goto GeBakFal
goto GeBakOk
:GeBakFal
set GeoBak=%clErr%Failed!%clOff%
echo GeoBak=%GeoBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 01
goto ErrOut
:GeBakOk
set GeoBak=%clOK%OK%clOff%
echo GeoBak=%GeoBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 01

REM Tactical
set TacBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 02
if %Steam%. == Y. goto TaBakDos
if NOT %xcuWin%. == Y. goto TaBakDos
set TacBak=%clOK%None%clOff%
goto TaBakEn
:TaBakDos
%backup% ufo2exe\*.exe ufo2exe\*.xcu >>%redir%
if ERRORLEVEL 1 goto TaBakFal
goto TaBakOk
:TaBakFal
set TacBak=%clErr%Failed!%clOff%
echo TacBak=%TacBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 02
goto ErrOut
:TaBakOk
set TacBak=%clOK%OK%clOff%
echo TacBak=%TacBak%>>%redir%
:TaBakEn
call XcomUtil\Batch\display.bat Backup 02

REM Maps
set MapBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 03
call XcomUtil\Batch\RunBak maps map maps xcu MapBak Backup 03
if %ErrOut%. == Y. goto MapBkFal
call XcomUtil\Batch\display.bat Backup 03
%backup% maps\b*.map maps\b*.xcu >>%redir%
goto MapBkOk
:MapBkFal
set MapBak=%clErr%Failed!%clOff%
echo MapBak=%MapBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 03
goto ErrOut
:MapBkOk
set MapBak=%clOK%OK%clOff%
echo MapBak=%MapBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 03

REM Routes
set RoutBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 04
call XcomUtil\Batch\RunBak routes rmp routes xcu RoutBak Backup 04
if %ErrOut%. == Y. goto RouBkFal
goto RouBkOk
:RouBkFal
set RoutBak=%clErr%Failed!%clOff%
echo RoutBak=%RoutBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 04
goto ErrOut
:RouBkOk
set RoutBak=%clOK%OK%clOff%
echo RoutBak=%RoutBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 04

REM Terrain MCD
set TerrMCDBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 05
call XcomUtil\Batch\RunBak terrain MCD terrain xcm TerrMCDBak Backup 05
if %ErrOut%. == Y. goto MCDBkFal
goto MCDBkOk
:MCDBkFal
set TerrMCDBak=%clErr%Failed!%clOff%
echo TerrMCDBak=%TerrMCDBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 05
goto ErrOut
:MCDBkOk
set TerrMCDBak=%clOK%OK%clOff%
echo TerrMCDBak=%TerrMCDBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 05

REM Terrain PCK
set TerrPCKBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 06
call XcomUtil\Batch\RunBak terrain PCK terrain xcp TerrPCKBak Backup 06
if %ErrOut%. == Y. goto PCKBkFal
goto PCKBkOk
:PCKBkFal
set TerrPCKBak=%clErr%Failed!%clOff%
echo TerrPCKBak=%TerrPCKBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 06
goto ErrOut
:PCKBkOk
set TerrPCKBak=%clOK%OK%clOff%
echo TerrPCKBak=%TerrPCKBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 06

REM Terrain TAB
set TerrTABBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 07
call XcomUtil\Batch\RunBak terrain TAB terrain xct TerrTABBak Backup 07
if %ErrOut%. == Y. goto TABBkFal
goto TABBkOk
:TABBkFal
set TerrTABBak=%clErr%Failed!%clOff%
echo TerrTABBak=%TerrTABBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 07
goto ErrOut
:TABBkOk
set TerrTABBak=%clOK%OK%clOff%
echo TerrTABBak=%TerrTABBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 07

REM GeoData
set GeoDatBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 08
call XcomUtil\Batch\RunBak geodata dat geodata xcu GeoDatBak Backup 08
if %ErrOut%. == Y. goto GedBkFal
goto GedBkOk
:GedBkFal
set GeoDatBak=%clErr%Failed!%clOff%
echo GeoDatBak=%GeoDatBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 08
goto ErrOut
:GedBkOk
set GeoDatBak=%clOK%OK%clOff%
echo GeoDatBak=%GeoDatBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 08

REM Geograph
if %xOS%. == DosBox. goto GGredok
if %xOS%. == Unknown. goto GGredok
if %xOS%. == 4DOS. goto GGredok
set output=2^>^&1
:GGredok
set GGrBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\*.scr geograph\*.xsr >>%redir% %output%
%backup% geograph\*.lbm geograph\*.xlb >>%redir% %output%
%backup% geograph\*.pck geograph\*.xpc >>%redir% %output%
%backup% geograph\*.tab geograph\*.xta >>%redir% %output%
%backup% geograph\*.dat geograph\*.xcu >>%redir% %output%
set GGrBak=%clChk%Processing..%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\g*.bdy geograph\*.xbd >>%redir% %output%
%backup% geograph\UP00*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing...%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP01*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing....%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP02*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing.....%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP03*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing......%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP04*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing.......%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP05*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing........%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP06*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing.........%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP07*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing..........%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP08*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing...........%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP09*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing............%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP1*.bdy geograph\*.xbd >>%redir% %output%
set GGrBak=%clChk%Processing.............%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\G*.spk geograph\*.xsp >>%redir% %output%
%backup% geograph\UP00*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing..............%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP01*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing...............%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP02*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP03*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing.................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP04*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing..................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP05*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing...................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP06*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing....................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP07*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing.....................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP08*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing......................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP09*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing.......................%clOff%
call XcomUtil\Batch\display.bat Backup 09
%backup% geograph\UP1*.spk geograph\*.xsp >>%redir% %output%
set GGrBak=%clChk%Processing........................%clOff%
call XcomUtil\Batch\display.bat Backup 09
if %ErrOut%. == Y. goto GegBkFal
goto GegBkOk
:GegBkFal
set GGrBak=%clErr%Failed!%clOff%
echo GGrBak=%GGrBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 09
goto ErrOut
:GegBkOk
set GGrBak=%clOK%OK%clOff%
echo GGrBak=%GGrBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 09
set output=

REM Sound
set SndBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 10
call XcomUtil\Batch\RunBak sound cat sound xcu SndBak Backup 10
if %ErrOut%. == Y. goto SndBkFal
goto SndBkOk
:SndBkFal
set SndBak=%clErr%Failed!%clOff%
echo SndBak=%SndBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 10
goto ErrOut
:SndBkOk
set SndBak=%clOK%OK%clOff%
echo SndBak=%SndBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 10

REM UFOGraph
set UFOGrBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.bdy ufograph\*.xbd >>%redir% %output%
set UFOGrBak=%clChk%Processing..%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.dat ufograph\*.xcu >>%redir% %output%
set UFOGrBak=%clChk%Processing...%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.lbm ufograph\*.xlb >>%redir% %output%
set UFOGrBak=%clChk%Processing....%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.pck ufograph\*.xpc >>%redir% %output%
set UFOGrBak=%clChk%Processing.....%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.tab ufograph\*.xta >>%redir% %output%
set UFOGrBak=%clChk%Processing......%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.scr ufograph\*.xsr >>%redir% %output%
set UFOGrBak=%clChk%Processing.......%clOff%
call XcomUtil\Batch\display.bat Backup 11
%backup% ufograph\*.spk ufograph\*.xsp >>%redir% %output%
set UFOGrBak=%clChk%Processing........%clOff%
call XcomUtil\Batch\display.bat Backup 11
if %ErrOut%. == Y. goto UGrBkFal
goto UGrBkOk
:UGrBkFal
set UFOGrBak=%clErr%Failed!%clOff%
echo UFOGrBak=%UFOGrBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 11
goto ErrOut
:UGrBkOk
set UFOGrBak=%clOK%OK%clOff%
echo UFOGrBak=%UFOGrBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 11

REM Units
set UniBak=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat Backup 12
call XcomUtil\Batch\RunBak units pck units xpc UniBak Backup 12
call XcomUtil\Batch\RunBak units tab units xta UniBak Backup 12
if %ErrOut%. == Y. goto UniBkFal
goto UniBkOk
:UniBkFal
set UniBak=%clErr%Failed!%clOff%
echo UniBak=%UniBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 12
goto ErrOut
:UniBkOk
set UniBak=%clOK%OK%clOff%
echo UniBak=%UniBak%>>%redir%
call XcomUtil\Batch\display.bat Backup 12

goto EOF
:ErrOut
set ErrOut=Y
:EOF
call XcomUtil\Batch\display.bat Backup 99
set GeoBak=
set TacBak=
set MapBak=
set TerrMCDBak=
set TerrPCKBak=
set RoutBak=
set TerrTABBak=
set GeoDatBak=
set GGrBak=
set SndBak=
set UFOGrBak=
set UniBak=