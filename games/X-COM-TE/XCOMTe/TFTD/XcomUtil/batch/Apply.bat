REM #########################
REM ##### Apply Options #####
REM #########################
call XcomUtil\Batch\display.bat Apply 99

REM --------------------------
REM == XcomUtil Config File ==

REM ##### Build Cfg File #####
if exist xcomutil.cfg del xcomutil.cfg
if exist XcomUtil\cfg\addon.txt type XcomUtil\cfg\addon.txt >>xcomutil.cfg
if exist addon.txt type addon.txt >>xcomutil.cfg
type XcomUtil\cfg\sec1.txt     >>xcomutil.cfg
type XcomUtil\cfg\CrewPosU.txt >>xcomutil.cfg
type XcomUtil\cfg\CrewPosT.txt >>xcomutil.cfg
type XcomUtil\cfg\sec2.txt     >>xcomutil.cfg
if %XCOM%. == TFTD. goto TFTDCfg
if %FasT%. == Y. if %THP%. == Y. type XcomUtil\cfg\ShpITHU.txt   >>xcomutil.cfg
if %FasT%. == N.  if %THP%. == Y. type XcomUtil\cfg\ShpnITHU.txt  >>xcomutil.cfg
if %FasT%. == Y. if %THP%. == N.  type XcomUtil\cfg\ShpITnHU.txt  >>xcomutil.cfg
if %FasT%. == N.  if %THP%. == N.  type XcomUtil\cfg\ShipDefU.txt  >>xcomutil.cfg
if %BFG%. == Y. type XcomUtil\cfg\ShpTBfgU.txt >>xcomutil.cfg
if %BFG%. == N. type XcomUtil\cfg\ShpTDefU.txt >>xcomutil.cfg 
type XcomUtil\cfg\ShipDefT.txt  >>xcomutil.cfg
type XcomUtil\cfg\ShpTDefT.txt  >>xcomutil.cfg
goto EndShpCf
:TFTDCfg
type XcomUtil\cfg\ShipDefU.txt  >>xcomutil.cfg
type XcomUtil\cfg\ShpTDefU.txt  >>xcomutil.cfg
if %FasT%. == Y. if %THP%. == Y. type XcomUtil\cfg\ShpITHT.txt   >>xcomutil.cfg
if %FasT%. == N.  if %THP%. == Y. type XcomUtil\cfg\ShpnITHT.txt  >>xcomutil.cfg
if %FasT%. == Y. if %THP%. == N.  type XcomUtil\cfg\ShpITnHT.txt  >>xcomutil.cfg
if %FasT%. == N.  if %THP%. == N.  type XcomUtil\cfg\ShipDefT.txt  >>xcomutil.cfg
if %BFG%. == Y. type XcomUtil\cfg\ShpTBfgT.txt >>xcomutil.cfg
if %BFG%. == N. type XcomUtil\cfg\ShpTDefT.txt >>xcomutil.cfg 
:EndShpCf
type XcomUtil\cfg\SbfgIniU.txt  >>xcomutil.cfg
type XcomUtil\cfg\SbfgIniT.txt >>xcomutil.cfg
type XcomUtil\cfg\sec3.txt     >>xcomutil.cfg
if %XCOM%. == TFTD. goto TCfg2
if %ImpBas%. == N. if %DefBas%. == N. type XcomUtil\cfg\MapDefU.txt  >>xcomutil.cfg
if %ImpBas%. == N. if %DefBas%. == N. goto EnBasCfU
type XcomUtil\cfg\MapArTiU.txt >>xcomutil.cfg
if %DefBas%. == Y. type XcomUtil\cfg\BasDeU.txt  >>xcomutil.cfg
if %DefBas%. == N.  type XcomUtil\cfg\BasOrU.txt  >>xcomutil.cfg
:EnBasCfU
type XcomUtil\cfg\MapDefT.txt  >>xcomutil.cfg
goto EnBasCfg
:TCfg2

type XcomUtil\cfg\MapDefU.txt  >>xcomutil.cfg
if %ImpBas%. == N. if %DefBas%. == N. type XcomUtil\cfg\MapDefT.txt  >>xcomutil.cfg
if %ImpBas%. == N. if %DefBas%. == N. goto EnBasCfg
type XcomUtil\cfg\MapArTiT.txt >>xcomutil.cfg
if %DefBas%. == Y. type XcomUtil\cfg\BasDeT.txt  >>xcomutil.cfg
if %DefBas%. == N.  type XcomUtil\cfg\BasOrT.txt  >>xcomutil.cfg
:EnBasCfg

type XcomUtil\cfg\sec4.txt     >>xcomutil.cfg
type XcomUtil\cfg\NameStat.txt >>xcomutil.cfg
type XcomUtil\cfg\SortStat.txt >>xcomutil.cfg
type XcomUtil\cfg\sec5.txt     >>xcomutil.cfg
type XcomUtil\cfg\AutCombt.txt >>xcomutil.cfg
type XcomUtil\cfg\sec6.txt     >>xcomutil.cfg
type XcomUtil\cfg\AlStatU.txt  >>xcomutil.cfg
type XcomUtil\cfg\AlStatT.txt  >>xcomutil.cfg
type XcomUtil\cfg\sec7.txt     >>xcomutil.cfg
type XcomUtil\cfg\ResHlpU.txt  >>xcomutil.cfg
type XcomUtil\cfg\ResHlpT.txt  >>xcomutil.cfg
type XcomUtil\cfg\sec8.txt     >>xcomutil.cfg
type XcomUtil\cfg\ImpPsU.txt   >>xcomutil.cfg
type XcomUtil\cfg\ImpPsT.txt   >>xcomutil.cfg
type XcomUtil\cfg\ImpHEU.txt   >>xcomutil.cfg
type XcomUtil\cfg\ImpHET.txt   >>xcomutil.cfg
type XcomUtil\cfg\ImpHL.txt    >>xcomutil.cfg
type XcomUtil\cfg\ImpGau.txt   >>xcomutil.cfg
type XcomUtil\cfg\ImpGauNC.txt >>xcomutil.cfg
type XcomUtil\cfg\NewLasr.txt  >>xcomutil.cfg
type XcomUtil\cfg\SpltGeoT.txt  >>xcomutil.cfg
type XcomUtil\cfg\SpltGeoU.txt  >>xcomutil.cfg

echo.>>%redir%
echo --------------XcomUtil.cfg------------------>>%redir%
type xcomutil.cfg>>%redir%
echo -------------------------------------------->>%redir%

REM ----------------------
REM == XcomUtil Patches ==


REM Unique name for sunken plane terrain.
if %XCOM%. == UFO. goto skpnamfx
if %Hyb%. == Yes. goto hybplfx
echo ---TFTD Name Fix--->>%redir%
if not exist terrain\planes.mcd copy terrain\plane.mcd terrain\planes.mcd >>%redir%
if not exist terrain\planes.tab copy terrain\plane.tab terrain\planes.tab >>%redir%
if not exist terrain\planes.pck copy terrain\plane.pck terrain\planes.pck >>%redir%
goto skpnamfx
:hybplfx
echo ---TFTD Hybrid Plane Fix--->>%redir%
if not exist terrain\planes.mcd copy terrain\planebak.mcd terrain\planes.mcd >>%redir%
if not exist terrain\planes.tab copy terrain\planebak.tab terrain\planes.tab >>%redir%
if not exist terrain\planes.pck copy terrain\planebak.pck terrain\planes.pck >>%redir%
:skpnamfx

REM ##### Vista Patch ######
if %VsW7P%. == N. goto NoVsPa
echo  This patch may take a few minuets to exit on slower computers.
echo ---Vista Patch--->>%redir%
"XcomUtil\Patches\Xcom Vista Patch.exe"
:NoVsPa

REM ##### seb76 UFOLoader ####
dir *.exe >>%redir%
if %EnUFOEx%. == N. goto NoSeb
if exist UFOLoader.exe goto SebOk
if exist UFOLOA~1.exe goto SebOk
goto NoSeb
:SebOk
echo ---seb76 UFO Extender--->>%redir%
echo Use seb76 UFO Extender>XcomUtil\flags\sebLoader.xcf
:NoSeb

REM ##### f0ders Loader #####
if %Enf0dder%. == N. goto NoFL
echo ---f0der Loader--->>%redir%
if %XCOM%. == UFO.  copy /y XcomUtil\Bin\patchxc1.dll patch.dll >>%redir%
if %XCOM%. == TFTD. copy /y XcomUtil\Bin\patchxc2.dll patch.dll >>%redir%
copy /y XcomUtil\Bin\xcloader.exe xcloader.exe >>%redir%
:NoFL

REM ##### Split EXE ######
if %SplEXE%. == N. goto NoPlitEX
if %SplEXE%. == N/A. goto NoPlitEX
echo ---Split EXE--->>%redir%
if exist "ufo defense.exe"          copy /y "ufo defense.exe"          geoscape.exe >>%redir%
if exist ufo.exe                    copy /y ufo.exe                    geoscape.exe >>%redir%
if NOT exist "ufo defense.exe" if exist ufodef~1.exe               copy /y ufodef~1.exe               geoscape.exe >>%redir%
if exist "terror from the deep.exe" copy /y "terror from the deep.exe" geoscape.exe >>%redir%
if exist terror.exe                 copy /y terror.exe                 geoscape.exe >>%redir%
if NOT exist "terror from the deep.exe" if exist terror~1.exe               copy /y terror~1.exe               geoscape.exe >>%redir%
if exist geoscape.exe               copy /y geoscape.exe               tactical.exe >>%redir%
if not exist tactical.exe           goto errspl
if %XCOM%. == TFTD. XcomUtil\Bin\sdump.exe geoscape.exe patch:SplitGeoT XcomUtil.cfg >>%redir%
if %XCOM%. == TFTD. XcomUtil\Bin\sdump.exe geoscape.exe verify:SplitGeoT XcomUtil.cfg >>%redir%
if %XCOM%. == TFTD. if ERRORLEVEL 1 goto errspl
if %XCOM%. == TFTD. XcomUtil\Bin\sdump.exe tactical.exe patch:SplitTacT XcomUtil.cfg >>%redir%
if %XCOM%. == TFTD. XcomUtil\Bin\sdump.exe tactical.exe verify:SplitTacT XcomUtil.cfg >>%redir%
if %XCOM%. == TFTD. if ERRORLEVEL 1 goto errspl
if %XCOM%. == UFO.  XcomUtil\Bin\sdump.exe geoscape.exe patch:SplitGeo XcomUtil.cfg >>%redir%
if %XCOM%. == UFO.  XcomUtil\Bin\sdump.exe geoscape.exe verify:SplitGeo XcomUtil.cfg >>%redir%
if %XCOM%. == UFO. if ERRORLEVEL 1 goto errspl
if %XCOM%. == UFO.  XcomUtil\Bin\sdump.exe tactical.exe patch:SplitTac XcomUtil.cfg >>%redir%
if %XCOM%. == UFO.  XcomUtil\Bin\sdump.exe tactical.exe verify:SplitTac XcomUtil.cfg >>%redir%
if %XCOM%. == UFO. if ERRORLEVEL 1 goto errspl
goto SplitOk

:errspl
echo Failed Split EXE>>%redir%
echo !! Failed Split EXE !!
goto ErrOut

:NoPlitEX
if exist tactical.exe del tactical.exe
if exist geoscape.exe del geoscape.exe

:SplitOK
if %SplEXE%. == N/A. copy /y XcomUtil\Batch\RunXcom.bat RunXcom.bat >>%redir%
if %SplEXE%. == Y. copy /y XcomUtil\Batch\RunXcom.bat RunXcom.bat >>%redir%


REM ##### Ship Maps (used for Int-Trans and BFG Prompt and TFTD Unique names Hybrid.)
if %XCOM%. == TFTD. goto IntMapT
copy /y XcomUtil\Patches\interc.map maps\interc.map   >>%redir%
copy /y XcomUtil\Patches\interc.map maps\interc.xcu   >>%redir%
copy /y routes\plane.rmp    routes\interc.rmp >>%redir%
copy /y routes\plane.rmp    routes\interc.xcu >>%redir%
xcopy /y terrain\plane.*    terrain\interc.*  >>%redir%
copy /y XcomUtil\Patches\fires.map  maps\fires.map    >>%redir%
copy /y XcomUtil\Patches\fires.map  maps\fires.xcu    >>%redir%
copy /y routes\lightnin.rmp routes\fires.rmp  >>%redir%
copy /y routes\lightnin.rmp routes\fires.xcu  >>%redir%
xcopy /y terrain\lightnin.* terrain\fires.*  >>%redir%
goto IntMapD
:IntMapT
copy  /y XcomUtil\Patches\barracud.map maps\barracud.map  >>%redir%
copy  /y XcomUtil\Patches\barracud.map maps\barracud.xcu  >>%redir%
xcopy /y routes\triton.*       routes\barracud.*  >>%redir%
xcopy /y terrain\triton.*      terrain\barracud.* >>%redir%
copy  /y XcomUtil\Patches\manta.map    maps\manta.map     >>%redir%
copy  /y XcomUtil\Patches\manta.map    maps\manta.xcu     >>%redir%
xcopy /y routes\hammer.*       routes\manta.*     >>%redir%
xcopy /y terrain\hammer.*      terrain\manta.*    >>%redir%
:IntMapD

REM ##### Transport Hard Point ######
if %THP%. == N. goto NoTHP
echo ---Transport Hardpoint--->>%redir%
REM set ShpStats=shp:cfg
:NoTHP

REM ##### Interceptors as Transport ######
if %FasT%. == N. goto NoFiTr
echo ---Interceptor as Transport--->>%redir%
REM set ShpStats=shp:cfg
:NoFiTr

REM ##### Starting Base Layout #####
if %DefBas%. == Y. set BaseLayout=bas:alt
if %ImpBas%. == Y.  set BaseLayout=bas

REM ##### Improved Tank #####
if %ITank%. == Y. set ImpTank=tnk

REM ##### Resaerch Help #####
if %CapARes%. == N. goto noAlRes
set AlRes=rsh
echo Research Help from Captured Aliens >XcomUtil\flags\rsrchhlp.xcf
:noAlRes

REM ##### No mc #####
if %RemMC%. == Y. set NoMC=nmc

REM ########################
REM ##### Hybrid Games #####
REM Reenable if done before. 
if exist XcomUtil\flags\hybrdpth.xcu copy /y XcomUtil\flags\hybrdpth.xcu XcomUtil\flags\hybrdpth.xcf >>%redir%


REM ############################################
REM ##### Apply settings that use xcomutil #####
if %xcuWin%. == Y. if %SplEXE%. == N. goto SkpAply
REM if %xcuWin%. == Y. if %SplEXE%. == N/A. goto SkpAply
echo ---XcomUtil Apply Patches--->>%redir%
echo xcomutil ufoexe %NoMc% %BaseLayout% %AlRes% %ImpTank% shp:cfg map:cfg wrt XcuSetup>>%redir%
xcomutil ufoexe %NoMc% %BaseLayout% %AlRes% %ImpTank% shp:cfg map:cfg wrt XcuSetup >scrap.txt
type scrap.txt >>%redir%
type scrap.txt
if NOT %Steam%. == Y. goto SkpAply
if exist ufoexe\geoscape.tmp del ufoexe\geoscape.tmp
cd ufoexe
rename geoscape.exe geoscape.tmp
cd ..
echo  !! Steam Versions. Apply settings to both DOS/Win EXEs !!
xcomutil ufoexe %NoMc% %BaseLayout% %AlRes% %ImpTank% shp:cfg map:cfg wrt XcuSetup >scrap.txt
type scrap.txt >>%redir%
type scrap.txt
cd ufoexe
rename geoscape.tmp geoscape.exe
cd ..
if exist ufoexe\geoscape.exe goto SkpAply
echo  ERROR: applying settings to both DOS/WIN EXEs
set ErrOut=Y
goto ErrOut
:SkpAply

REM ##### Undo Unwanted Changes done by xcomutil
if %BFG%. == Y. goto BFGOk
echo ---Restore Verry Small UFO--->>%redir%
if exist maps\ufo1a.xcu   copy /y maps\ufo1a.xcu   maps\ufo1a.map   >>%redir%
if exist routes\ufo1a.xcu copy /y routes\ufo1a.xcu routes\ufo1a.rmp >>%redir%
if exist maps\ufo01.xcu   copy /y maps\ufo01.xcu   maps\ufo01.map   >>%redir%
if exist routes\ufo01.xcu copy /y routes\ufo01.xcu routes\ufo01.rmp >>%redir%
:BFGOk
if %DisBas%. == Y. goto BasMpOK
echo ---Restore Disjointed Base--->>%redir%
if %XCOM%. == TFTD. goto UndDisBT
xcopy /y maps\xbase_*.xcu maps\xbase_*.map >>%redir%
xcopy /y maps\ubase_*.xcu maps\ubase_*.map >>%redir%
if exist XcomUtil\flags\mapfixed.xcf del XcomUtil\flags\mapfixed.xcf
echo Patch Removed:  Disjoint Base Fix
goto BasMpOk
:UndDisBT
xcopy /y maps\a_base*.xcu  maps\a_base*.map >>%redir%
xcopy /y maps\Alship*.xcu  maps\Alship*.map >>%redir%
xcopy /y maps\crypt*.xcu   maps\crypt*.map  >>%redir%
xcopy /y maps\level*.xcu   maps\level*.map  >>%redir%
xcopy /y maps\grunge*.xcu  maps\grunge*.map >>%redir%
if exist XcomUtil\flags\mapfixed.xcf del XcomUtil\flags\mapfixed.xcf
echo Patch Removed:  Disjoint Base Fix
:BasMpOK

REM ----------------
REM == Game Fixes ==

REM #########################
REM ##### Sound Effects #####
if %XCOM%. == TFTD. goto noSFX
if %SG%. == N. goto noSG
echo ---Original Geoscape SFX>>%redir%
copy /y xcomutil\patches\sample.cat sound\SAMPLE.CAT >>%redir%
echo Patch Applied:  Original Geoscape Sound Effects
:noSG
if %ST%. == N. goto noST
echo ---Original Tactical SFX>>%redir%
copy /y xcomutil\patches\sample2.cat sound\SAMPLE2.CAT >>%redir%
echo Patch Applied:  Original Tactical Sound Effects
:noST
:noSFX

REM ###############################################
REM ##### Fixing Survey Ship and Escort Mixup #####
if %XCOM%. == UFO. goto noShpSwp
if %FTMSwp%. == N. goto noShpSwp
echo ---Fixing Survey Ship and Escort Mixup--->>%redir%
copy /y maps\ufo01.xcu   maps\ufo02.map   >>%redir%
copy /y routes\ufo01.xcu routes\ufo02.rmp >>%redir%
if %BFG%. == Y. goto noVSFix
copy /y maps\ufo02.xcu   maps\ufo01.map   >>%redir%
copy /y routes\ufo02.xcu routes\ufo01.rmp >>%redir%
:noVSFix
echo Fix Applied:    Fixing Survey Ship and Escort Mixup
:noShpSwp

REM #########################################
REM #### Fixing Survey Ship Route Issues ####
if %XCOM%. == UFO. goto noSurShp
if %FTURou%. == N. goto noSurShp
set TargF=routes\ufo02.rmp
if %FTMSwp%. == N. goto noSwp
set TargF=routes\ufo01.rmp
:noSwp
echo ---Fixing Survey Ship Routes--->>%redir%
XcomUtil\Bin\sdump.exe %TargF% PATCH:T-routes-ufo01 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe %TargF% VERIFY:T-routes-ufo01 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto SurRtFal
echo Fix Applied:    Survey Ship Routes
goto noSurShp
:SurRtFal
echo ---FAIL:  Fixing Survey Ship Routes--->>%redir%
echo FAILED:  Fixing Survey Ship Routes
set ErrOut=Y
goto ErrOut
:noSurShp
set TargF=

REM #########################################
REM #### Game Fixes: Interception Screen ####
if %XCOM%. == UFO. goto nofIS
if %FTIntDis%. == N. goto nofIS
echo ---Game Fixes: Interception Screen--->>%redir%
copy /y XcomUtil\Patches\interwin.dat geodata\interwin.dat >>%redir%
echo Fix Applied:    Interception Screen Images
:nofIS

REM #########################################
REM #### Game Fixes: Alien Craft Spawn Points and Routes ####
if %XCOM%. == TFTD. goto nofACR
if %FURou%. == N. goto nofACR
echo ---Alien Craft Spawn Points and Routes--->>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_110.rmp PATCH:routes-UFO_110 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_110.rmp VERIFY:routes-UFO_110 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_120.rmp PATCH:routes-UFO_120 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_120.rmp VERIFY:routes-UFO_120 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_130.rmp PATCH:routes-UFO_130 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_130.rmp VERIFY:routes-UFO_130 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_140.rmp PATCH:routes-UFO_140 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_140.rmp VERIFY:routes-UFO_140 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_150.rmp PATCH:routes-UFO_150 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_150.rmp VERIFY:routes-UFO_150 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_160.rmp PATCH:routes-UFO_160 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_160.rmp VERIFY:routes-UFO_160 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
XcomUtil\Bin\sdump.exe routes\UFO_170.rmp PATCH:routes-UFO_170 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\UFO_170.rmp VERIFY:routes-UFO_170 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACRFal
echo Fix Applied:    Alien Craft Spawn Points and Routes
goto nofACR
:fACRFal
echo ---FAIL:  Alien Craft Spawn Points and Routes--->>%redir%
echo FAILED:  Alien Craft Spawn Points and Routes
set ErrOut=Y
goto ErrOut
:nofACR

REM #########################################
REM #### Game Fixes: X-Com Base Spawn Points ####
if %XCOM%. == TFTD. goto nofXBR
if %FXRou%. == N. goto nofXBR
echo ---X-Com Base Spawn Points--->>%redir%
XcomUtil\Bin\sdump.exe routes\XBase_00.rmp PATCH:routes-XBase_00 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\XBase_00.rmp VERIFY:routes-XBase_00 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fXBRFal
XcomUtil\Bin\sdump.exe routes\XBase_07.rmp PATCH:routes-XBase_07 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe routes\XBase_07.rmp VERIFY:routes-XBase_07 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fXBRFal
echo Fix Applied:    X-Com Base Spawn Points
goto nofXBR
:fXBRFal
echo ---FAIL:  X-Com Base Spawn Points--->>%redir%
echo FAILED:  X-Com Base Spawn Points
set ErrOut=Y
goto ErrOut
:nofXBR

REM #########################################
REM #### Game Fixes: Alien Base Terrain ####
if %XCOM%. == TFTD. goto nofABR
if %FATer%. == N. goto nofABR
echo ---Alien Base Terrain--->>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Base.MCD PATCH:terrain-U_Base-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Base.MCD VERIFY:terrain-U_Base-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fABRFal
echo Fix Applied:    Alien Base Terrain
goto nofABR
:fABRFal
echo ---FAIL:  Alien Base Terrain--->>%redir%
echo FAILED:  Alien Base Terrain
set ErrOut=Y
goto ErrOut
:nofABR

REM #########################################
REM #### Game Fixes: Alien Craft Terrain ####
if %XCOM%. == TFTD. goto nofACT
if %FUTer%. == N. goto nofACT
echo ---Alien Craft Terrain--->>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Bits.MCD PATCH:terrain-U_Bits-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Bits.MCD VERIFY:terrain-U_Bits-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fACTFal
echo Fix Applied:    Alien Craft Terrain
goto nofACT
:fACTFal
echo ---FAIL:  Alien Craft Terrain--->>%redir%
echo FAILED:  Alien Craft Terrain
set ErrOut=Y
goto ErrOut
:nofACT

REM #########################################
REM #### Game Fixes: Explosive Terrain ####
if %XCOM%. == TFTD. goto nofET
if %FExTer%. == N. goto nofET
echo ---Explosive Terrain--->>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Pods.MCD PATCH:terrain-U_Pods-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Pods.MCD VERIFY:terrain-U_Pods-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fETFal
XcomUtil\Bin\sdump.exe terrain\U_Wall02.MCD PATCH:terrain-U_Wall02-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\U_Wall02.MCD VERIFY:terrain-U_Wall02-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fETFal
XcomUtil\Bin\sdump.exe terrain\Urban.MCD PATCH:terrain-Urban-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\Urban.MCD VERIFY:terrain-Urban-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fETFal
echo Fix Applied:    Explosive Terrain
goto nofET
:fETFal
echo ---FAIL:  Explosive Terrain--->>%redir%
echo FAILED:  Explosive Terrain
set ErrOut=Y
goto ErrOut
:nofET

REM #########################################
REM #### Game Fixes: Desert Map ####
if %XCOM%. == TFTD. goto nofDT
if %FDesM%. == N. goto nofDT
echo ---Desert Terrain--->>%redir%
XcomUtil\Bin\sdump.exe maps\Desert09.map PATCH:maps-Desert09 XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe maps\Desert09.map VERIFY:maps-Desert09 XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fDTFal
echo Fix Applied:    Desert Terrain
goto nofDT
:fDTFal
echo ---FAIL:  Desert Terrain--->>%redir%
echo FAILED:  Desert Terrain
set ErrOut=Y
goto ErrOut
:nofDT

REM #########################################
REM #### Game Fixes: Mountain Terrain ####
if %XCOM%. == TFTD. goto nofMT
if %FMTer%. == N. goto nofMT
echo ---Mountain Terrain--->>%redir%
XcomUtil\Bin\sdump.exe terrain\mount.MCD PATCH:terrain-mount-MCD XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe terrain\mount.MCD VERIFY:terrain-mount-MCD XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto fMTFal
echo Fix Applied:    Mountain Terrain
goto nofMT
:fMTFal
echo ---FAIL:  Mountain Terrain--->>%redir%
echo FAILED:  Mountain Terrain
set ErrOut=Y
goto ErrOut
:nofMT

REM #########################################
REM #### Game Fixes: Lightning MCD and LOF ####
if %XCOM%. == TFTD. goto nofLML
if %FLitn%. == N. goto nofLML
echo ---Lightning MCD and LOF--->>%redir%
copy /y XcomUtil\Patches\lightnin.mcd terrain\lightnin.mcd>>%redir%
copy /y XcomUtil\Patches\lightnin.pck terrain\lightnin.pck>>%redir%
copy /y XcomUtil\Patches\lightnin.tab terrain\lightnin.tab>>%redir%
echo Fix Applied:    Lightning MCD and LOF
:nofLML


REM -----------------------
REM == Game Play Options ==

REM ########################
REM ##### Hybrid Games #####
if exist XcomUtil\flags\hybrdpth.xcf echo Setting Enabled: Hybrid Maps Enabled

REM ############################
REM ##### Improved Weapons #####

REM ##### Pistol #####
if %IPst%. == N. goto NoPistol
echo ---Improved Pistol--->>%redir%
if %XCOM%. == TFTD. goto PistolT
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpPsU:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpPsU:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
goto psCpy
:PistolT
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpPsT:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpPsT:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
:psCpy
copy /y  xcomutil.tmp geodata\obdata.dat >>%redir%
if exist xcomutil.tmp erase xcomutil.tmp
if %XCOM% == UFO echo Patch Applied:  Improved Pistol
if %XCOM% == TFTD echo Patch Applied:  Improved Dart Gun
:NoPistol

REM ##### High Explosive #####
if %IHiEx%. == N. goto NoHiExp
echo ---Improved High Explosive--->>%redir%
if %XCOM%. == TFTD. goto HiExpT
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHiExU:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHiExU:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
goto heCpy
:HiExpT
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHiExT:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHiExT:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
:heCpy
copy /y  xcomutil.tmp geodata\obdata.dat >>%redir%
if exist xcomutil.tmp erase xcomutil.tmp
if %XCOM% == UFO echo Patch Applied:  Improved High Explosive
if %XCOM% == TFTD echo Patch Applied:  Improved Magna-Pack Explosive
:NoHiExp

REM ##### Heavy Laser #####
if %IHLsr%. == N. goto NoHL
if %XCOM%. == TFTD. goto NoHL
echo ---Heavy Laser--->>%redir%
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHvLsr:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:IHvLsr:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
copy /y  xcomutil.tmp geodata\obdata.dat >>%redir%
if exist xcomutil.tmp erase xcomutil.tmp
echo Patch Applied:  Improved Heavy Laser
:noHL

REM ##### Gauss Weapons #####
if %XCOM%. == UFO. goto NoImpGau
echo ---Gauss Weapons--->>%redir%
if %IGau%. == N. if %ReGCl%. == N. goto NoImpGau
if %ReGCl%. == Y. goto ImpGauNc
if %IGau%. == Y. goto ImpGau
goto NoImpGau

:ImpGau
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpGau:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpGau:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
copy /y  xcomutil.tmp geodata\obdata.dat >>%redir%
if exist xcomutil.tmp erase xcomutil.tmp
echo Patch Applied:  Improved Gauss
goto NoImpGau

:ImpGauNc
echo XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpGauNoCl:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
XcomUtil\Bin\sdump.exe xcomutil.tmp replace:ImpGauNoCl:54 xcomutil.cfg geodata\obdata.dat geodata\obdata.xcu >>%redir%
copy /y  xcomutil.tmp geodata\obdata.dat >>%redir%
if exist xcomutil.tmp erase xcomutil.tmp
echo Patch Applied:  Improved Gauss
echo Patch Applied:  Remove Gauss Clip
:NoImpGau

REM #### Dye Granade ####
if %XCOM%. == UFO. goto NoDG
if %IDyeG%. == N. goto NoDG
echo ---Dye Granade--->>%redir%
XcomUtil\Bin\sdump.exe geodata\obdata.dat PATCH:T-geodata-obdata XcomUtil\Patches\patch.cfg>>%redir%
XcomUtil\Bin\sdump.exe geodata\obdata.dat VERIFY:T-geodata-obdata XcomUtil\Patches\patch.cfg>>%redir%
if ERRORLEVEL 1 goto DGFal
echo Patch Applied:  Dye Grenade
goto noDG
:SurRtFal
echo ---FAIL:  Dye Grenade--->>%redir%
echo FAILED:  Dye Grenade
set ErrOut=Y
goto ErrOut
:NoDG

REM ################################
REM ##### Alternate Laser Tech #####
if %XCOM%. == TFTD. goto NoNewLsr
if %NewLT%. == N. goto NoNewLsr
echo ---Alternate Laser Tech--->>%redir%
set XCUGEO=ufoexe\geoscape.exe
if exist geoscape.exe goto nltGeo
goto nltNGeo
:nltGeo
set XCUGEO=geoscape.exe
:nltNGeo

echo XcomUtil\Bin\sdump.exe %XCUGEO% verify:NewLaser xcomutil.cfg >>%redir%
XcomUtil\Bin\sdump.exe %XCUGEO% verify:NewLaser xcomutil.cfg >>%redir%
if errorlevel 1 XcomUtil\Bin\sdump.exe %XCUGEO% verify:NLsrUndo xcomutil.cfg >>%redir%
if errorlevel 1 goto nlsrbad

if not exist geodata\spanish.dat goto nonspan
if not exist geodata\spanish.xcl copy /y geodata\spanish.dat geodata\spanish.xcl >>%redir%
echo XcomUtil\Bin\sdump.exe geodata\spanish.dat replace:NLsrTxSp xcomutil.cfg geodata\spanish.xcl geodata\spanish.xcu >>%redir%
XcomUtil\Bin\sdump.exe geodata\spanish.dat replace:NLsrTxSp xcomutil.cfg geodata\spanish.xcl geodata\spanish.xcu >>%redir%
if errorlevel 1 goto nlsrbts
goto spantoo
:nlsrbts
copy /y  geodata\spanish.xcl geodata\spanish.dat >>%redir%
del geodata\spanish.xcl
goto nlsrbad

:nonspan
if not exist geodata\english.xcl if exist geodata\english.dat copy /y geodata\english.dat geodata\english.xcl >>%redir%
if not exist geodata\german.xcl  if exist geodata\german.dat  copy /y geodata\german.dat  geodata\german.xcl  >>%redir%
if not exist geodata\french.xcl  if exist geodata\french.dat  copy /y geodata\french.dat  geodata\french.xcl  >>%redir%
XcomUtil\Bin\sdump.exe geodata\english.dat replace:NLsrText xcomutil.cfg geodata\english.xcl geodata\english.xcu >>%redir%
if errorlevel 1 goto nlsrbtx
echo XcomUtil\Bin\sdump.exe geodata\german.dat  replace:NLsrTxDe xcomutil.cfg geodata\german.xcl  geodata\german.xcu  >>%redir%
XcomUtil\Bin\sdump.exe geodata\german.dat  replace:NLsrTxDe xcomutil.cfg geodata\german.xcl  geodata\german.xcu  >>%redir%
echo XcomUtil\Bin\sdump.exe geodata\french.dat  replace:NLsrTxFr xcomutil.cfg geodata\french.xcl  geodata\french.xcu  >>%redir%
XcomUtil\Bin\sdump.exe geodata\french.dat  replace:NLsrTxFr xcomutil.cfg geodata\french.xcl  geodata\french.xcu  >>%redir%

:spantoo
XcomUtil\Bin\sdump.exe %XCUGEO% patch:NewLaser xcomutil.cfg >nul
if exist game_1\product.dat XcomUtil\Bin\sdump.exe game_1\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_2\product.dat XcomUtil\Bin\sdump.exe game_2\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_3\product.dat XcomUtil\Bin\sdump.exe game_3\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_4\product.dat XcomUtil\Bin\sdump.exe game_4\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_5\product.dat XcomUtil\Bin\sdump.exe game_5\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_6\product.dat XcomUtil\Bin\sdump.exe game_6\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_7\product.dat XcomUtil\Bin\sdump.exe game_7\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_8\product.dat XcomUtil\Bin\sdump.exe game_8\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_9\product.dat XcomUtil\Bin\sdump.exe game_9\product.dat patch:NewLaser xcomutil.cfg >>%redir%
if exist game_10\product.dat XcomUtil\Bin\sdump.exe game_10\product.dat patch:NewLaser xcomutil.cfg >>%redir%
echo Patch Applied:  Alternate Laser Tech
goto NoNewLsr

:nlsrbtx
copy /y  geodata\english.xcl geodata\english.dat >>%redir%
del geodata\english.xcl
:nlsrbad
echo !! Patch Failed !!>>%redir%
echo Patch Failed:
echo Weapons have already been changed by some other program.  You must
echo uninstall those changes if you want to use the new laser weapons.
:NoNewLsr
if exist geodata\english.xcl del geodata\*.xcl

echo ---Create XCF Files--->>%redir%
REM ##### TFTD Research Fix #####
if %ResFix%. == N. goto NoResFix
echo TFTD Rresearch Fix >XcomUtil\flags\resfix.xcf
echo Setting Enabled:  Research Fix after combat
:NoResFix


REM ##### XcomUtil Messages
if %XcUMes%. == N. goto NoCmbMsg
echo Display Combat Messages >XcomUtil\flags\cmbtmsgs.xcf
echo Setting Enabled:  XcomUtil Messages After Combat
:NoCmbMsg

REM ##### Stat Strings
if %UNStat%. == N. goto NoStatSt
echo Add Stat Strings to Troops >XcomUtil\flags\renamall.xcf
echo Setting Enabled:  Stat Strings
:NoStatSt

REM ##### Rank Indicators
if %UNR%. == N. goto NoRnkInd
echo Add Rank Indicators to Troops >XcomUtil\flags\renamrnk.xcf
echo Setting Enabled:  Rank Indicators
:NoRnkInd

REM ##### Kill Count
if %UNK%. == N. goto NoKilCnt
echo Add Kill Counts to Troops >XcomUtil\flags\renamkil.xcf
echo Setting Enabled:  Kill Count
:NoKilCnt

REM ##### Automatically Sort Combat Troops
if NOT %pCSrt%. == Y. goto NoAutSrt
echo Automatically Sort Combat Troops >XcomUtil\flags\autosort.xcf
echo Setting Enabled:  Automatically Sort Combat Troops
:NoAutSrt

REM ##### Automatically Sort Combat Troops
REM if NOT %pCSrt%. == Auto. goto NoAutSrt
REM echo Automatically Sort Combat Troops ;XcomUtil\flags\autosort.xcf
REM echo Setting Enabled:  Automatically Sort Combat Troops
REM :NoAutSrt

REM ##### File Sort Combat Troops
REM if NOT %pCSrt%. == File. goto NoFileSrt
REM echo File Sort Combat Troops ;XcomUtil\flags\filesort.xcf
REM echo Setting Enabled:  Sort Combat Troops by File
REM :NoFileSrt

REM ##### Automatically Re-Euip Combat Troops
if %ReEqp%. == N. goto NoReEq
echo Automatically Re-Euip Combat Troops >XcomUtil\flags\autoeqip.xcf
echo Setting Enabled:  Automatically Re-Euip Combat Troops
:NoReEq

REM ##### Delete Re-Euip File
if %EqpFRes%. == N. goto NoEqpDel
if exist XcomUtil\flags\equiploc.xcu del XcomUtil\flags\equiploc.xcu
echo Setting Enabled:  Reset Re-Euip File
:NoEqpDel

REM ##### Screen for MC
if %MCScr%. == N. goto NoMCScrn
if %ScrTyp%. == Alwase. goto MCScrOn
if %ScrTyp%. == Lab. goto MCScrLab
goto NoMCScrn
:MCScrOn
echo Automatic Screening for MC >XcomUtil\flags\autoscrn.xcf
if %XCOM% == UFO echo Setting Enabled:  PSI Screening Alwase
if %XCOM% == TFTD echo Setting Enabled:  M.C. Screening Alwase
goto NoMCScrn
:MCScrLab
echo Screening for MC with Lab >XcomUtil\flags\labscrn.xcf
if %XCOM% == UFO echo Setting Enabled:  PSI Screening With Lab
if %XCOM% == TFTD echo Setting Enabled:  M.C. Screening With Lab
:NoMCScrn

REM ##### Time of Day
if %FDay%. == N. if %FNight%. == N goto NoTimeCh
if %FDay%. == Y. goto FDay
if %FNight%. == Y. goto FNight
goto NoTimeCh
:FDay
echo All Battles in Daylight >XcomUtil\flags\daylight.xcf
echo Setting Enabled:  Combat only in Day
goto NoTimeCh
:FNight
echo All Battles in Darkness >XcomUtil\flags\darkness.xcf
echo Setting Enabled:  Combat only at Night
:NoTimeCh

REM ##################################
REM ##### BFG or Random Texture ######
if %BFGorWRnd%. == N. goto NoMapChg

REM ##### BFG
if %BFG%. == N. goto NoBFG
echo Random Terrain Placement >XcomUtil\flags\rndplace.xcf
REM BFG must have no verry small ship.
echo ---No Verry Small--->>%redir%
if %XCOM%. == UFO. copy /y maps\NOSHIP.map maps\ufo1a.map >>%redir%
if %XCOM%. == UFO. copy /y routes\NOSHIP.rmp routes\ufo1a.rmp >>%redir%
if %XCOM%. == TFTD. copy /y maps\NOSHIP.map maps\ufo01.map >>%redir%
if %XCOM%. == TFTD. copy /y routes\NOSHIP.rmp routes\ufo01.rmp >>%redir%

echo Setting Enabled:  Use XcomUtil Battlefield Generator (BFG)

if %BFGRTer%. == N. goto NoRndSel
echo Randomize Terrain >XcomUtil\flags\mprandom.xcf
if exist XcomUtil\flags\rndplace.xcf del XcomUtil\flags\rndplace.xcf
echo Setting Enabled:  Randomly Choose Terrain
:NoRndSel

if %BFGProm%. == N. goto NoBFGProm
echo Prompt Before Ship Attack >XcomUtil\flags\mpprompt.xcf
echo Setting Enabled:  BFG Prompt for Terrain
:NoBFGProm

:NoBFG
REM ##### Randomize World Map
if %RndWorld%. == N. goto NoRndWrd
XcomUtil\bin\xcomutrt.exe missdat rndworld
echo Randomized World Map Terrain >XcomUtil\flags\rndworld.xcf
echo Patch Applied:  Randomize World Map
:NoRndWrd
:NoMapChg

REM #############################
REM ##### Craft Floor Plans #####
if %RndAC%. == N. goto NoRndCrf

REM ##### Randomize Shape
:RndShap

if %RndACSap%. == N. goto noRnShp
echo Generate Random Shapes >XcomUtil\flags\rndshape.xcf
echo Setting Enabled:  Randomize Alien Craft Floor Plans Random Shape
:noRnShp


REM ##### Randomize Frequency
if %RndACFr%. == Once. goto RndCrOne
if %RndACFr%. == Every. goto RndCrEvr

REM ##### Randomize Once
:RndCrOne
echo ---Random Craft Floor Plans Once--->>%redir%
if %XCOM%. == UFO. goto RnOnU
if %XCOM%. == TFTD. goto RnOnT
:RnOnU
copy /y XcomUtil\cfg\xcomutil.rnx xcomutil.rnd >>%redir%
copy /y XcomUtil\cfg\xcomutil.rmx xcomutil.rms >>%redir%
if NOT exist missdat\geodata.dat copy /y XcomUtil\Patches\geodata.dat missdat\geodata.dat >>%redir%
XcomUtil\bin\xcomutrt.exe missdat allmaps >scrap.txt
type scrap.txt >>%redir%
type scrap.txt
del xcomutil.rnd
del xcomutil.rms
echo Patch Applied:  Randomize Alien Craft Floor Plans Once
goto endRndFr
:RnOnT
copy /y XcomUtil\cfg\xcomutil.rnt xcomutil.rnd >>%redir%
copy /y XcomUtil\cfg\xcomutil.rmt xcomutil.rms >>%redir%
if NOT exist missdat\geodata.dat copy /y XcomUtil\Patches\geodata.dat missdat\geodata.dat>>%redir%
XcomUtil\bin\xcomutrt.exe missdat allmaps>scrap.txt
type scrap.txt >>%redir%
type scrap.txt
del xcomutil.rnd
del xcomutil.rms
echo Patch Applied:  Randomize Alien Craft Floor Plans Once
goto endRndFr

REM ##### Randomize Every Time
:RndCrEvr
if %XCOM%. == UFO. goto RnEvU
if %XCOM%. == TFTD. goto RnEvT
:RnEvU
copy /y XcomUtil\cfg\xcomutil.rnx xcomutil.rnd >>%redir%
copy /y XcomUtil\cfg\xcomutil.rmx xcomutil.rms >>%redir%
echo Setting Enabled:  Randomize Alien Craft Floor Plans Every Time
goto endRndFr
:RnEvT
copy /y XcomUtil\cfg\xcomutil.rnt xcomutil.rnd >>%redir%
copy /y XcomUtil\cfg\xcomutil.rmt xcomutil.rms >>%redir%
echo Setting Enabled:  Randomize Alien Craft Floor Plans Every Time
goto endRndFr

:endRndFr

REM ##### Keep Randomized Alient Craft Files
if %KepRndAC%. == N. goto NoKeepRF
echo Save Random Ship Files >XcomUtil\flags\saverand.xcf
echo Setting Enabled:  Randomize Alien Craft Floor Plans Keep Files
:NoKeepRF
goto RndDone
:NoRndCrf
if exist xcomutil.rnd erase xcomutil.rnd
:RndDone


REM ## List of config files created
if NOT %xOS%. == DosBox. if NOT %xOS%. == 4DOS. if NOT %xOS%. == Unknown. goto reder
dir *.xcf >>%redir%
dir XcomUtil\flags\*.xcf >>%redir%
goto listDn
:reder
dir /b *.xcf 1>>%redir% 2>nul
dir /b XcomUtil\flags\*.xcf 1>>%redir% 2>nul
:listDn

REM ############################################
goto EOF
:ErrOut
set ErrOut=Y
:EOF
if exist scrap.txt del scrap.txt