REM #############################
REM #####  Setup Questions  #####
REM #############################

REM ###################################
REM Split EXE
if %xOS%. == DosBox. if NOT %Steam%. == Y. goto skpGpxLd
if %Steam%. == Y. goto ySplit
if %xcuWin%. == N. goto skpSplit
if %SplEXE%. == N. goto seDNo
if %SplEXE%. == N/A. goto seDNo
:seDYes
set default=Y
goto SE
:seDNo
set default=N
:SE
call XcomUtil\Batch\display.bat SplEXE 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto QNoSplit
:ySplit
set SplEXE=Y
goto skpSplit
:QNoSplit
set SplEXE=N
echo %SplEXE% >XcomUtil\flags\NOSplitEX.xcf
:skpSplit

REM --------------------------
REM == Graphics and Loaders ==
if %xOS%. == DOXBox. if NOT %Steam%. == Y. goto skpGpxLd
if %xcuWin%. == N. goto skpGpxLd

REM ###################################
REM Vista / Windows 7 Patch
if NOT %xOS%. == Vista. if NOT %xOS%. == Win7. goto noV7P
if %VsW7P%. == N. goto vpDNo
set default=Y
goto vp
:vpDNo
set default=N
:vp
call XcomUtil\Batch\display.bat VisGpx 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto vpNo
set VsW7P=Y
goto noV7P
:vpNo
set VsW7P=N
:noV7P

REM seb76 Loaders
if NOT %SplEXE%. == Y. goto noSeb
if %XCOM%. == TFTD. goto noSeb
if NOT exist UFOLoader.exe goto noSeb
if %EnUFOEx%. == N. goto sebDNo
set default=Y
goto seb
:sebDNo
set default=N
:seb
call XcomUtil\Batch\display.bat UFOLoad 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto sebNo
set EnUFOEx=Y
goto noFodLdr
:sebNo
set EnUFOEx=N
:noSeb

REM f0dder's Loader
REM if %xOS%. == Vista. goto noFodLdr
REM if %xOS%. == Win7. goto noFodLdr
if NOT %SplEXE%. == Y. goto noFodLdr
if %EnUFOEx%. == Y. goto noFodLdr
if %Enf0dder%. == N. goto FLDNo
set default=Y
goto FL
:FLDNo
set default=N
:FL
call XcomUtil\Batch\display.bat FodLdr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto FLNo
set Enf0dder=Y
goto skpGpxLd
:FLNo
set Enf0dder=N
:noFodLdr
:skpGpxLd

REM ----------------
REM == Game Fixes ==

REM ###################################
REM UFO Dos patches That are Forced on Users

if %XCOM%. == TFTD. goto noPre
if %xcuWin%. == Y. if NOT %Steam%. == Y. goto noPre
call XcomUtil\Batch\display.bat ForsPat 01
REM check if 1.4.
XcomUtil QueryInfo XcomVersion
if errorlevel 37 goto incCodes
if errorlevel 36 goto skpCodes
:incCodes
call XcomUtil\Batch\display.bat ForsPat 99
:skpCodes
if NOT %Skip%. == Y. pause
:noPre

REM ###################################
REM To apply Fixes or Not

if %FAll%. == N. goto fixDNo
if %FAll%. == Y. goto fixDYes
set default=P
goto fix
:fixDNo
set default=N
goto fix
:fixDYes
set default=Y
:fix
call XcomUtil\Batch\display.bat PatchOp 99
XcomUtil\Bin\sdump.exe * getresp yYnNpP %default%
if errorlevel 5 goto fixProm
if errorlevel 3 goto fixNo
set FAll=Y
set FURou=Y
set FDesM=Y
set FXRou=Y
set FATer=Y
set FMTer=Y
set FUTer=Y
set FExTer=Y
set FLitn=Y
set FTMSwp=Y
set FTURou=Y
set FTIntDis=Y
goto fixDone
:fixNo
set FAll=N
set FURou=N
set FDesM=N
set FXRou=N
set FATer=N
set FMTer=N
set FUTer=N
set FExTer=N
set FLitn=N
set FTMSwp=N
set FTURou=N
set FTIntDis=N
goto fixDone
:fixProm
set FAll=P


if %XCOM%. == TFTD. goto fixTFTD
REM ###################################
REM UFO: Alien Craft Spawn Points and Routes
if %FURou%. == N. goto fURDNo
set default=Y
goto fUR
:fURDNo
set default=N
:fUR
call XcomUtil\Batch\display.bat FixURmp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fURNo
set FURou=Y
goto SkpfUR
:fURNo
set FURou=N
:SkpfUR

REM ###################################
REM UFO: X-Com Base Spawn Points
if %FXRou%. == N. goto fXBRDNo
set default=Y
goto fXBR
:fXBRDNo
set default=N
:fXBR
call XcomUtil\Batch\display.bat FixXBas 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fXBRNo
set FXRou=Y
goto SkpfXBR
:fXBRNo
set FXRou=N
:SkpfXBR

REM ###################################
REM UFO: Alien Base Terrain
if %FATer%. == N. goto fABRDNo
set default=Y
goto fABR
:fABRDNo
set default=N
:fABR
call XcomUtil\Batch\display.bat FixUBas 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fABRNo
set FATer=Y
goto SkpfABR
:fABRNo
set FATer=N
:SkpfABR

REM ###################################
REM UFO: Alien Craft Terrain
if %FUTer%. == N. goto fACTDNo
set default=Y
goto fACT
:fACTDNo
set default=N
:fACT
call XcomUtil\Batch\display.bat FixAc 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fACTNo
set FUTer=Y
goto SkpfACT
:fACTNo
set FUTer=N
:SkpfACT

REM ###################################
REM UFO: Explosive Terrain
if %FExTer%. == N. goto fETDNo
set default=Y
goto fET
:fETDNo
set default=N
:fET
call XcomUtil\Batch\display.bat FixEx 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fETNo
set FExTer=Y
goto SkpfET
:fETNo
set FExTer=N
:SkpfET

REM ###################################
REM UFO: Desert Map
if %FDesM%. == N. goto fDMDNo
set default=Y
goto fDM
:fDMDNo
set default=N
:fDM
call XcomUtil\Batch\display.bat FixDesert 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fDMNo
set FDesM=Y
goto SkpfDM
:fDMNo
set FDesM=N
:SkpfDM

REM ###################################
REM UFO: Mountain Terrain
if %FMTer%. == N. goto fMTDNo
set default=Y
goto fMT
:fMTDNo
set default=N
:fMT
call XcomUtil\Batch\display.bat FixMt 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fMTNo
set FMTer=Y
goto SkpfMT
:fMTNo
set FMTer=N
:SkpfMT

REM ###################################
REM UFO: Lightning MCD and LOF
if %FLitn%. == N. goto fLMLDNo
set default=Y
goto fLML
:fLMLDNo
set default=N
:fLML
call XcomUtil\Batch\display.bat FixLight 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fLMLNo
set FLitn=Y
goto SkpfLML
:fLMLNo
set FLitn=N
:SkpfLML

goto fixDone
:fixTFTD
REM ###################################
REM TFTD: Interception Screen
if %FTIntDis%. == N. goto fIDDNo
set default=Y
goto fID
:fIDDNo
set default=N
:fID
call XcomUtil\Batch\display.bat FxIntDis 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fIDNo
set FTIntDis=Y
goto SkpfID
:fIDNo
set FTIntDis=N
:SkpfID

REM ###################################
REM TFTD: Swap Survey Ship and Escort
if %FTMSwp%. == N. goto fTMSDNo
set default=Y
goto fTMS
:fTMSDNo
set default=N
:fTMS
call XcomUtil\Batch\display.bat TMapFix 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fTMSNo
set FTMSwp=Y
goto SkpfTMS
:fTMSNo
set FTMSwp=N
:SkpfTMS


REM ###################################
REM TFTD: Survey Ship Rotues
if %FTURou%. == N. goto fTURDNo
set default=Y
goto fTUR
:fTURDNo
set default=N
:fTUR
call XcomUtil\Batch\display.bat FixUFOt 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fTURNo
set FTURou=Y
goto SkpfTUR
:fTURNo
set FTURou=N
:SkpfTUR


:fixDone

REM -----------------------
REM == Game Play Options ==

REM ##################################
REM Original sound in 1.4 and CE
if %XCOM%. == TFTD. goto skpSnd
XcomUtil QueryInfo XcomVersion
if errorlevel 36 goto snd
goto skpSnd
:snd
if %SG%. == N. goto sgDNo
set default=Y
goto sg
:sgDNo
set default=N
:sg
call XcomUtil\Batch\display.bat SfxGeo 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto sgNo
set SG=Y
goto skpSG
:sgNo
set SG=N
:skpSG

if %ST%. == N. goto stDNo
set default=Y
goto st
:stDNo
set default=N
:st
call XcomUtil\Batch\display.bat SfxTac 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto stNo
set ST=Y
goto skpST
:stNo
set ST=N
:skpST

:skpSnd

REM ###################################
REM Interceptor as transport
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpTrans
if %FasT%. == N. goto itDNo
set default=Y
goto it
:itDNo
set default=N
:it
call XcomUtil\Batch\display.bat IntTras 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto itNo
set FasT=Y
goto SkpTrans
:itNo
set FasT=N
:SkpTrans

REM ###################################
REM Transport with Hardpoint
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpHp
if %THP%. == N. goto thDNo
set default=Y
goto th
:thDNo
set default=N
:th
call XcomUtil\Batch\display.bat TransHp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto thNo
set THP=Y
goto SkpHp
:thNo
set THP=N
:SkpHp

REM ###################################
REM Defensive Base
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpDefBa
if %DefBas%. == N. goto dbDNo
set default=Y
goto db
:dbDNo
set default=N
:db
call XcomUtil\Batch\display.bat DefLayo 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto dbNo
set DefBas=Y
goto SkpDefBa
:dbNo
set DefBas=N
:SkpDefBa

REM ###################################
REM Improved Base
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpImpBa
if %ImpBas%. == N. goto ibDNo
set default=Y
goto ib
:ibDNo
set default=N
:ib
call XcomUtil\Batch\display.bat ImpBas 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto ibNo
set ImpBas=Y
goto SkpImpBa
:ibNo
set ImpBas=N
:SkpImpBa

REM ###################################
REM Disjointed Base Bug
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpDisBa
if %DisBas%. == N. goto dbbDNo
:dbbDYes
set default=Y
goto dbb
:dbbDNo
set default=N
:dbb
call XcomUtil\Batch\display.bat DisjBas 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto dbbNo
set DisBas=Y
goto SkpDisBa
:dbbNo
set DisBas=N
:SkpDisBa

REM ###################################
REM Improved Tank
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpImpTa
if %ITank%. == N. goto imtDNo
set default=Y
goto imt
:imtDNo
set default=N
:imt
call XcomUtil\Batch\display.bat impTank 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto imtNo
set ITank=Y
goto SkpImpTa
:imtNo
set ITank=N
:SkpImpTa

REM ###################################
REM Improved Pistol
if %IPst%. == N. goto impDNo
set default=Y
goto imp
:impDNo
set default=N
:imp
call XcomUtil\Batch\display.bat inpPistol 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto impNo
set IPst=Y
goto SkpImpPst
:impNo
set IPst=N
:SkpImpPst

REM ###################################
REM Improved Weapons: Heavy Laser
if NOT %XCOM%. == UFO. goto SkpImpHL
if %IHLsr%. == N. goto hlDNo
set default=Y
goto hl
:hlDNo
set default=N
:hl
call XcomUtil\Batch\display.bat inpHvLsr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto hlNo
set IHLsr=Y
goto SkpImpHL
:hlNo
set IHLsr=N
:SkpImpHL

REM ###################################
REM Improved Weapons: Dye Grenade
if %XCOM%. == UFO. goto SkpImpDG
if %IDyeG%. == N. goto DGDNo
set default=Y
goto DG
:DGDNo
set default=N
:DG
call XcomUtil\Batch\display.bat DieGre 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto DGNo
set IDyeG=Y
goto SkpImpDG
:DGNo
set IDyeG=N
:SkpImpDG


REM ###################################
REM Improved Weapons: Expl
if %IHiEx%. == N. goto imleDNo
set default=Y
goto imle
:imleDNo
set default=N
:imle
call XcomUtil\Batch\display.bat inpHiExp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto imleNo
set IHiEx=Y
goto SkpImpLEx
:imleNo
set IHiEx=N
:SkpImpLEx

REM ###################################
REM Improved Weapons: Gauss
if NOT %XCOM%. == TFTD. goto SkpImpGau
if %IGau%. == N. goto imgaDNo
set default=Y
goto imga
:imgaDNo
set default=N
:imga
call XcomUtil\Batch\display.bat inpGaus 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto imgaNo
set IGau=Y
goto SkpImpGau
:imgaNo
set IGau=N
:SkpImpGau

REM ###################################
REM Improved Weapons: Remove Gauss Clips
if NOT %XCOM%. == TFTD. goto SkpGauClp
if %ReGCl%. == N. goto garcDNo
set default=Y
goto garc
:garcDNo
set default=N
:garc
call XcomUtil\Batch\display.bat inpGaNC 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto garcNo
set ReGCl=Y
goto SkpGauClp
:garcNo
set ReGCl=N
:SkpGauClp

REM ###################################
REM Improved Weapons: Lasor Laser Tech
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpNuLsr
if NOT %XCOM%. == UFO. goto SkpNuLsr
if %NewLT%. == N. goto nltDNo
set default=Y
goto nlt
:nltDNo
set default=N
:nlt
call XcomUtil\Batch\display.bat inpNuLsr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto nltNo
set NewLT=Y
goto SkpNuLsr
:nltNo
set NewLT=N
:SkpNuLsr

REM ###################################
REM Research Tree Fix for TFTD
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpResFx
if NOT %XCOM%. == TFTD. goto SkpResFx
if %ResFix%. == N. goto rfDNo
set default=Y
goto rf
:rfDNo
set default=N
:rf
call XcomUtil\Batch\display.bat ResFix 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto rfNo
set ResFix=Y
goto SkpResFx
:rfNo
set ResFix=N
:SkpResFx

REM ###################################
REM Research Help from Captured Aliens
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpAlRes
if %CapARes%. == N. goto alrDNo
set default=Y
goto alr
:alrDNo
set default=N
:alr
call XcomUtil\Batch\display.bat AlResHlp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto alrNo
set CapARes=Y
goto SkpAlRes
:alrNo
set CapARes=N
:SkpAlRes

REM ###################################
REM XcomUtil messages after combat
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpXCMsg
if %XcUMes%. == N. goto exumDNo
set default=Y
goto exum
:exumDNo
set default=N
:exum
call XcomUtil\Batch\display.bat XCUMsg 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto exumNo
set XcUMes=Y
goto SkpXCMsg
:exumNo
set XcUMes=N
:SkpXCMsg

REM ###################################
REM Name Stat Strings
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpStStr
if %UNStat%. == N. goto nssDNo
set default=Y
goto nss
:nssDNo
set default=N
:nss
call XcomUtil\Batch\display.bat StatStr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto nssNo
set UNStat=Y
goto SkpStStr
:nssNo
set UNStat=N
:SkpStStr

REM ###################################
REM Name Rank
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpRnkSt
if %UNR%. == N. goto nrDNo
set default=Y
goto nr
:nrDNo
set default=N
:nr
call XcomUtil\Batch\display.bat RankStr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto nrNo
set UNR=Y
goto SkpRnkSt
:nrNo
set UNR=N
:SkpRnkSt

REM ###################################
REM Kill Number
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpKilNo
if %UNK%. == N. goto knDNo
set default=Y
goto kn
:knDNo
set default=N
:kn
call XcomUtil\Batch\display.bat KillStr 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto knNo
set UNK=Y
goto SkpKilNo
:knNo
set UNK=N
:SkpKilNo

REM ###################################
REM Pre-Combat Sort
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpSort
if %pCSrt%. == N. goto srtDNo
set default=Y
goto srt
:srtDNo
set default=N
:srt
call XcomUtil\Batch\display.bat uniSort 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto srtNo
set pCSrt=Y
goto SkpSort
:srtNo
set pCSrt=N
:SkpSort
REM Pre-Combat Sort: Auto or File
REM if exist XcomUtil\flags\NOSplitEX.xcf goto SkpAorF
REM if %pCSrt%. == File. goto srtDFi
REM set default=A
REM goto srtt
REM :srtDFi
REM set default=F
REM :srtt
REM call XcomUtil\Batch\display.bat uniSortO 99
REM XcomUtil\Bin\sdump.exe * getresp fFaA %default%
REM if errorlevel 3 goto SrtA
REM set pCSrt=File
REM goto SkpAorF
REM :SrtA
REM set pCSrt=Auto
REM :SkpAorF


REM ###################################
REM Re-equip before combat
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpREq
if %ReEqp%. == N. goto eqpDNo
set default=Y
goto eqp
:eqpDNo
set default=N
:eqp
call XcomUtil\Batch\display.bat autoEqui 00
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto eqpNo
set ReEqp=Y
goto delf
:eqpNo
set ReEqp=N
if exist XcomUtil\flags\equiploc.xcu goto delFiYes
goto SkpREq
:delf
if NOT exist XcomUtil\flags\equiploc.xcu goto SkpREq
if %EqpFRes%. == N. goto delfiDNo
set default2=Y
goto delfi
:delfiDNo
set default2=N
:delfi
call XcomUtil\Batch\display.bat autoEqui 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default2%
if errorlevel 3 goto delfiNo
:delFiYes
set EqpFRes=Y
goto SkpREq
:delfiNo
set EqpFRes=N
:SkpREq

REM ###################################
REM Remove MC
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpNoMC
if %RemMC%. == N. goto rmcDNo
set default=Y
goto rmc
:rmcDNo
set default=N
:rmc
call XcomUtil\Batch\display.bat RemMC 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto rmcNo
set RemMC=Y
goto SkpNoMC
:rmcNo
set RemMC=N
:SkpNoMC

REM ###################################
REM MC Screening
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpMcSc
if %RemMC%. == Y. goto SkpMcSc
if %MCScr%. == N. goto mcsDNo
set default=Y
goto mcs
:mcsDNo
set default=N
:mcs
call XcomUtil\Batch\display.bat MCScan 00
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto SkpMcSc
set MCScr=Y
if %ScrTyp%. == Alwase. goto mcsoDNo
set default2=L
goto mcso
:mcsoDNo
set default2=A
:mcso
call XcomUtil\Batch\display.bat MCScan 99
XcomUtil\Bin\sdump.exe * getresp aAlL %default2%
if errorlevel 3 goto SkpMcScL
set ScrTyp=Alwase
goto SkpMcSc
:SkpMcScL
set ScrTyp=Lab
:SkpMcSc

REM ###################################
REM Force Day
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpDay
if %FDay%. == N. goto fdaDNo
set default=Y
goto fda
:fdaDNo
set default=N
:fda
call XcomUtil\Batch\display.bat DayLight 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fdaNo
set FDay=Y
goto SkpDay
:fdaNo
set FDay=N
:SkpDay

REM ###################################
REM Force Night
if %FDay%. == Y. goto SkpNight
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpNight
if %FNight%. == N. goto fniDNo
set default=Y
goto fni
:fniDNo
set default=N
:fni
call XcomUtil\Batch\display.bat MidNight 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto fniNo
set FNight=Y
goto SkpNight
:fniNo
set FNight=N
:SkpNight

REM ###################################
REM Battle Field and Terrain
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpTerOp
if %BFGorWRnd%. == N. goto troDNo
set default=Y
goto tro
:troDNo
set default=N
:tro
call XcomUtil\Batch\display.bat TerOp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto troNo
set BFGorWRnd=Y
goto TerOp
:troNo
set BFGorWRnd=N
goto SkpTerOp

:TerOp
REM ###################################
REM Battle Field Generator (BFG)
if %BFGorWRnd%. == N. goto SkpBFGOp
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpBFGOp
if %BFG%. == N. goto bfgDNo
set default=Y
goto bfg
:bfgDNo
set default=N
:bfg
call XcomUtil\Batch\display.bat BFGOp 00
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto bfgNo
set BFG=Y
set default=Y
goto bfgp
:bfgNo
set BFG=N
set default=N
goto SkpBFGOp
:bfgp
if %BFGProm%. == N. goto bfpDNo
set default2=Y
goto bfp
:bfpDNo
set default2=N
:bfp
call XcomUtil\Batch\display.bat BFGOp 01
XcomUtil\Bin\sdump.exe * getresp yYnN %default2%
if errorlevel 3 goto bfpNo
set BFGProm=Y
set default2=Y
goto SkpBFGOp
:bfpNo
set BFGProm=N
set default2=N
goto bfgrt
:bfgrt
if %BFGRTer%. == N. goto brtDNo
set default3=Y
goto brt
:brtDNo
set default3=N
:brt
call XcomUtil\Batch\display.bat BFGOp 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default3%
if errorlevel 3 goto brtNo
set BFGRTer=Y
goto SkpBFGOp
:brtNo
set BFGRTer=N
:SkpBFGOp

REM ###################################
REM Random World Terrain
if %BFG%. == Y. goto SkpRnWT
if %RndWorld%. == N. goto rwtDNo
set default=Y
goto rwt
:rwtDNo
set default=N
:rwt
call XcomUtil\Batch\display.bat Rnd 99
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto rwtNo
set RndWorld=Y
goto SkpRnWT
:rwtNo
set RndWorld=N
:SkpRnWT
:SkpTerOp


REM ###################################
REM Randomize Alien Craft Floor Plan
if exist XcomUtil\flags\NOSplitEX.xcf goto SkpRndSp
if %RndAC%. == N. goto rafDNo
set default=Y
goto raf
:rafDNo
set default=N
:raf
call XcomUtil\Batch\display.bat RndShip 00
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto rafNo
set RndAC=Y
set default=Y
goto RndShap
:rafNo
set RndAC=N
set default=N
goto SkpRndSp
:RndShap
if %RndACSap%. == Y. goto rafsDNo
set default3=N
goto rafs
:rafsDNo
set default3=Y
:rafs
call XcomUtil\Batch\display.bat RndShip 01
XcomUtil\Bin\sdump.exe * getresp yYnN %default3%
if errorlevel 3 goto rafsNo
set RndACSap=Y
set default3=Y
goto SkpRndSa
:rafsNo
set RndACSap=N
set default3=N
:SkpRndSa
if %KepRndAC%. == N. goto kfpDNo
set default4=Y
goto kfp
:kfpDNo
set default4=N
:kfp
call XcomUtil\Batch\display.bat RndShip 02
XcomUtil\Bin\sdump.exe * getresp yYnN %default4%
if errorlevel 3 goto kfpNo
set KepRndAC=Y
set default4=Y
goto eo
:kfpNo
set KepRndAC=N
set default4=N
:eo
if %BFG%. == N. goto RSOnce
if %RndACFr%. == Every. goto rafoDNo
set default2=O
goto rafo
:rafoDNo
set default2=E
:rafo
call XcomUtil\Batch\display.bat RndShip 99
XcomUtil\Bin\sdump.exe * getresp eEoO %default2%
if errorlevel 3 goto RSOnce
set RndACFr=Every
goto SkpRndSp
:RSOnce
set RndACFr=Once
:SkpRndSp


REM ###################################
REM Force Disjointed Base Bug
if exist XcomUtil\flags\NOSplitEX.xcf goto dbbAsIs
if %BFG%. == Y. goto dbbFYes
goto dbbAsIs
:dbbFYes
set DisBas=Y
:dbbAsIs

REM #########################
REM Use Addons 
dir XcomUtil\Addon\ >scrap.txt
find /c /i "bat" scrap.txt >>%redir%
if errorlevel 1 goto adNo
if %Ad%. == N. goto adDNo
set default=Y
goto ad
:adDNo
set default=N
:ad
call XcomUtil\Batch\Display Addon 00
XcomUtil\Bin\sdump.exe * getresp yYnN %default%
if errorlevel 3 goto adNo
set Ad=Y
echo RunAddon>XcomUtil\flags\RunAddon.xcf
goto adDn
:adNo
set Ad=N
if exist XcomUtil\flags\RunAddon.xcf del XcomUtil\flags\RunAddon.xcf
:adDn