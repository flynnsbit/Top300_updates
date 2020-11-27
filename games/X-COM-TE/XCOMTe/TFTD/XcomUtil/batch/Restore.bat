REM ####################################
REM ##### Restore All Files #####
REM ####################################
call XcomUtil\Batch\display.bat RestDef 00

set ResFlag=0
REM Geoscape
echo Restore Geoscape>>%redir%
set GeoRes=%clOK%None%clOff%
if NOT %xcuWin%. == Y. goto ExReDos
if NOT exist XcomUtil\ufo.xcu goto ExReT
if exist "ufo defense.exe" copy /y XcomUtil\ufo.xcu "ufo defense.exe" >>%redir%
if exist ufo.exe copy /y XcomUtil\ufo.xcu ufo.exe >>%redir%
if NOT exist "ufo defense.exe" if exist ufodef~1.exe copy /y XcomUtil\ufo.xcu ufodef~1.exe >>%redir%
set GeoRes=%clOK%OK%clOff%
echo GeoRes=%GeoRes%>>%redir%
goto ExReDos
:ExReT
if NOT exist XcomUtil\terror.xcu goto ExReDos
if exist "terror from the deep.exe" copy /y XcomUtil\terror.xcu "terror from the deep.exe" >>%redir%
if exist terror.exe copy /y XcomUtil\terror.xcu terror.exe >>%redir%
if NOT exist "terror from the deep.exe"if exist terror~1.exe copy /y XcomUtil\terror.xcu terror~1.exe >>%redir%
set GeoRes=%clOK%OK%clOff%
echo GeoRes=%GeoRes%>>%redir%
goto ExReDos
:ExReDos
if NOT exist ufoexe\geoscape.xcu goto NoExBak
set GeoRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 01
%restore% ufoexe\*.xcu ufoexe\*.exe >>%redir%
if ERRORLEVEL 1 goto ExReFal
goto ExReOk
:ExReFal
set GeoRes=%clErr%Failed!%clOff%
echo GeoRes=%GeoRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 01
goto ErrOut
:ExReOk
set ResFlag=1
set GeoRes=%clOK%OK%clOff%
echo GeoRes=%GeoRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 01
:NoExBak

REM Tactical
echo Restore Tactical>>%redir%
set TacRes=%clOK%None%clOff%
:TaReDos
if NOT exist ufo2exe\tactical.xcu goto NoEx2Bak
set TacRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 02
%restore% ufo2exe\*.xcu ufo2exe\*.exe >>%redir%
if ERRORLEVEL 1 goto TaReFal
goto TaReOk
:TaReFal
set TacRes=%clErr%Failed!%clOff%
echo TacRes=%TacRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 02
goto ErrOut
:TaReOk
set ResFlag=1
set TacRes=%clOK%OK%clOff%
echo TacRes=%TacRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 02
:NoEx2Bak

REM Maps
echo Restore Maps>>%redir%
set MapRes=%clOK%None%clOff%
dir maps\*.* >scrap.txt
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto NoMapBak
set MapRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 03
call XcomUtil\Batch\RunRes maps xcu maps map MapRes RestDef 03
if %ErrOut%. == Y. goto MapReFal
goto MapReOk
:MapReFal
set MapRes=%clErr%Failed!%clOff%
echo MapRes=%MapRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 03
goto ErrOut
:MapReOk
set ResFlag=1
set MapRes=%clOK%OK%clOff%
echo MapRes=%MapRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 03
:NoMapBak

REM Routes
echo Restore Routes>>%redir%
set RoutRes=%clOK%None%clOff%
dir routes\*.* >scrap.txt
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto NoRouBak
set RoutRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 04
call XcomUtil\Batch\RunRes routes xcu routes rmp RoutRes RestDef 04
if %ErrOut%. == Y. goto RtReFal
goto RtReOK
:RtReFal
set RoutRes=%clErr%Failed!%clOff%
echo RoutRes=%RoutRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 04
goto ErrOut
:RtReOK
set ResFlag=1
set RoutRes=%clOK%OK%clOff%
echo RoutRes=%RoutRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 04
:NoRouBak

REM Terrain MCD
echo Restore MCD>>%redir%
set MCDRes=%clOK%None%clOff%
dir terrain\*.* >scrap.txt
find /c /i "xcm" scrap.txt >>%redir%
if errorlevel 1 goto NoMCDBak
set MCDRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 05
call XcomUtil\Batch\RunRes terrain xcm terrain MCD MCDRes RestDef 05
if %ErrOut%. == Y. goto MCDReFal
goto MCDReOk
:MCDReFal
set MCDRes=%clErr%Failed!%clOff%
echo MCDRes=%MCDRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 05
goto ErrOut
:MCDReOk
set ResFlag=1
set MCDRes=%clOK%OK%clOff%
echo MCDRes=%MCDRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 05
:NoMCDBak

REM Terrain PCK
echo Restore PCK>>%redir%
set PCKRes=%clOK%None%clOff%
dir terrain\*.* >scrap.txt
find /c /i "xcp" scrap.txt >>%redir%
if errorlevel 1 goto NoPCKBak
set PCKRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 06
call XcomUtil\Batch\RunRes terrain xcp terrain PCK PCKRes RestDef 06
if %ErrOut%. == Y. goto PCKReFal
goto PCKReOk
:PCKReFal
set PCKRes=%clErr%Failed!%clOff%
echo PCKRes=%PCKRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 06
goto ErrOut
:PCKReOk
set ResFlag=1
set PCKRes=%clOK%OK%clOff%
echo PCKRes=%PCKRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 06
:NoPCKBak

REM Terrain TAB
echo Restore TAB>>%redir%
set TABRes=%clOK%None%clOff%
dir terrain\*.* >scrap.txt
find /c /i "xct" scrap.txt >>%redir%
if errorlevel 1 goto NoTABBak
set TABRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 07
call XcomUtil\Batch\RunRes terrain xct terrain TAB TABRes RestDef 07
if %ErrOut%. == Y. goto TABReFal
goto TABReOK
:TABReFal
set TABRes=%clErr%Failed!%clOff%
echo TABRes=%TABRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 07
goto ErrOut
:TABReOK
set ResFlag=1
set TABRes=%clOK%OK%clOff%
echo TABRes=%TABRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 07
:NoTABBak

REM GeoData
echo Restore GeoData>>%redir%
set GDatRes=%clOK%None%clOff%
dir geodata\*.* >scrap.txt
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto NGDatBak
set GDatRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 08
call XcomUtil\Batch\RunRes geodata xcu geodata dat GDatRes RestDef 08
if %ErrOut%. == Y. goto GDaReFal
goto GDaReOK
:GDaReFal
set GDatRes=%clErr%Failed!%clOff%
echo GDatRes=%GDatRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 08
goto ErrOut
:GDaReOK
set ResFlag=1
set GDatRes=%clOK%OK%clOff%
echo GDatRes=%GDatRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 08
:NGDatBak

REM GeoGraph
echo Restore GeoGraph>>%redir%
set GGrRes=%clOK%None%clOff%
dir geograph\*.* >scrap.txt
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto GGTst2
goto stGGRes
:GGTst2
find /c /i "xsr" scrap.txt >>%redir%
if errorlevel 1 goto GGTst3
goto stGGRes
:GGTst3
find /c /i "xlb" scrap.txt >>%redir%
if errorlevel 1 goto GGTst4
goto stGGRes
:GGTst4
find /c /i "xpc" scrap.txt >>%redir%
if errorlevel 1 goto GGTst5
goto stGGRes
:GGTst5
find /c /i "xta" scrap.txt >>%redir%
if errorlevel 1 goto GGTst6
goto stGGRes
:GGTst6
find /c /i "xbd" scrap.txt >>%redir%
if errorlevel 1 goto GGTst7
goto stGGRes
:GGTst7
find /c /i "xsp" scrap.txt >>%redir%
if errorlevel 1 goto NGGRe
goto stGGRes
:stGGRes
if %xOS%. == DosBox. goto GGredok
if %xOS%. == Unknown. goto GGredok
if %xOS%. == 4DOS. goto GGredok
set output=2^>^&1
:GGredok
set GGrRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\*.xsr geograph\*.scr >>%redir% %output%
%restore% geograph\*.xlb geograph\*.lbm >>%redir% %output%
%restore% geograph\*.xpc geograph\*.pck >>%redir% %output%
%restore% geograph\*.xta geograph\*.tab >>%redir% %output%
%restore% geograph\*.xcu geograph\*.dat >>%redir% %output%
set GGrRes=%clChk%Processing..%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\G*.xbd geograph\*.bdy >>%redir% %output%
%restore% geograph\UP00*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing...%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP01*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing....%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP02*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing.....%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP03*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing......%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP04*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing.......%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP05*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing........%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP06*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing.........%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP07*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing..........%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP08*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing...........%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP09*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing............%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP1*.xbd geograph\*.bdy >>%redir% %output%
set GGrRes=%clChk%Processing.............%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\G*.xsp geograph\*.spk >>%redir% %output%
%restore% geograph\UP00*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing..............%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP01*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing...............%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP02*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP03*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing.................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP04*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing..................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP05*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing...................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP06*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing....................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP07*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing.....................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP08*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing......................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP09*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing.......................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
%restore% geograph\UP1*.xsp geograph\*.spk >>%redir% %output%
set GGrRes=%clChk%Processing........................%clOff%
call XcomUtil\Batch\display.bat RestDef 09
if %ErrOut%. == Y. goto GGReFal
goto GGReOK
:GGReFal
set GGrRes=%clErr%Failed!%clOff%
echo GGrRes=%GGrRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 09
goto ErrOut
:GGReOK
set ResFlag=1
set GGrRes=%clOK%OK%clOff%
echo GGrRes=%GGrRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 09
:NGGRe
set output=

REM Sound
echo Restore Sound>>%redir%
set SndRes=%clOK%None%clOff%
dir sound\*.* >scrap.txt
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto NoSndBak
set SndRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 10
call XcomUtil\Batch\RunRes sound xcu sound cat SndRes RestDef 10
if %ErrOut%. == Y. goto SndReFal
goto SndReOK
:SndReFal
set SndRes=%clErr%Failed!%clOff%
echo SndRes=%SndRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 10
goto ErrOut
:SndReOK
set ResFlag=1
set SndRes=%clOK%OK%clOff%
echo SndRes=%SndRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 10
:NoSndBak

REM UFOGraph
echo Restore UFOGraph>>%redir%
set UFOGRes=%clOK%None%clOff%
dir ufograph\*.* >scrap.txt
find /c /i "xbd" scrap.txt >>%redir%
if errorlevel 1 goto UGTst2
goto stUGRes
:UGTst2
find /c /i "xcu" scrap.txt >>%redir%
if errorlevel 1 goto UGTst3
goto stUGRes
:UGTst3
find /c /i "xlb" scrap.txt >>%redir%
if errorlevel 1 goto UGTst4
goto stUGRes
:UGTst4
find /c /i "xpc" scrap.txt >>%redir%
if errorlevel 1 goto UGTst5
goto stUGRes
:UGTst5
find /c /i "xta" scrap.txt >>%redir%
if errorlevel 1 goto UGTst6
goto stUGRes
:UGTst6
find /c /i "xsr" scrap.txt >>%redir%
if errorlevel 1 goto UGTst7
goto stUGRes
:UGTst7
find /c /i "xsp" scrap.txt >>%redir%
if errorlevel 1 goto NoUGBak
:stUGRes
if %xOS%. == DosBox. goto UGredok
if %xOS%. == Unknown. goto UGredok
if %xOS%. == 4DOS. goto UGredok
set output=2^>^&1
:UGredok
set UFOGRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xbd ufograph\*.bdy >>%redir% %output%
set UFOGRes=%clChk%Processing..%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xcu ufograph\*.dat >>%redir% %output%
set UFOGRes=%clChk%Processing...%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xlb ufograph\*.lbm >>%redir% %output%
set UFOGRes=%clChk%Processing....%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xpc ufograph\*.pck >>%redir% %output%
set UFOGRes=%clChk%Processing.....%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xta ufograph\*.tab >>%redir% %output%
set UFOGRes=%clChk%Processing......%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xsr ufograph\*.scr >>%redir% %output%
set UFOGRes=%clChk%Processing.......%clOff%
call XcomUtil\Batch\display.bat RestDef 11
%restore% ufograph\*.xsp ufograph\*.spk >>%redir% %output%
set UFOGRes=%clChk%Processing........%clOff%
call XcomUtil\Batch\display.bat RestDef 11
if %ErrOut%. == Y. goto UfGReFal
goto UfGReOK
:UfGReFal
set UFOGRes=%clErr%Failed!%clOff%
echo UFOGRes=%UFOGRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 11
goto ErrOut
:UfGReOK
set ResFlag=1
set UFOGRes=%clOK%OK%clOff%
echo UFOGRes=%UFOGRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 11
:NoUGBak
set output=

REM Units
echo Restore Units>>%redir%
set UniRes=%clOK%None%clOff%
dir units\*.* >scrap.txt
find /c /i "xpc" scrap.txt >>%redir%
if errorlevel 1 goto uniTst2
goto stUniRes
:uniTst2
find /c /i "xpc" scrap.txt >>%redir%
if errorlevel 1 goto NoUniBak
:stUniRes
set UniRes=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 12
call XcomUtil\Batch\RunRes units xta units tab UniRes RestDef 12
call XcomUtil\Batch\RunRes units xpc units pck UniRes RestDef 12
if %ErrOut%. == Y. goto UniReFal
goto UniReOK
:UniReFal
set UniRes=%clErr%Failed!%clOff%
echo UniRes=%UniRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 12
goto ErrOut
:UniReOK
set ResFlag=1
set UniRes=%clOK%OK%clOff%
echo UniRes=%UniRes%>>%redir%
call XcomUtil\Batch\display.bat RestDef 12
:NoUniBak

REM Undoing Other Settings
set ResConfig=%clChk%Processing.%clOff%
call XcomUtil\Batch\display.bat RestDef 09
set ResConfig=%clOK%None%clOff%
dir XcomUtil\flags\*.* >scrap.txt
dir *.* >>scrap.txt
find /c /i "xcf" scrap.txt >>%redir%
if errorlevel 1 goto UtCfChk2
goto ResUtCf
:UtCfChk2
if exist patch.dll goto ResUtCf
if exist xcomutil.rnd goto ResUtCf
if exist xcomutil.rns goto ResUtCf
goto ReUtCfNo
:ResUtCf
if exist XCLoader.exe del xcloader.exe
if exist patch.dll del patch.dll
del *.xcf
del XcomUtil\flags\*.xcf
if exist xcomutil.rnd erase xcomutil.rnd
if exist xcomutil.rns erase xcomutil.rns

set ResConfig=%clOK%OK%clOff%
:ReUtCfNo
echo ResConfig=%ResConfig%>>%redir%
call XcomUtil\Batch\display.bat RestDef 09

goto EOF
:ErrOut
set ErrOut=Y
:EOF
call XcomUtil\Batch\display.bat RestDef 99
if exist scrap.txt del scrap.txt >>%redir%
set GeoRes=
set TacRes=
set MapRes=
set RoutRes=
set MCDRes=
set PCKRes=
set PCKRes=
set TABRes=
set GDatRes=
set ResConfig=
set GGrRes=
set SndRes=
set UFOGRes=
set UniRes=