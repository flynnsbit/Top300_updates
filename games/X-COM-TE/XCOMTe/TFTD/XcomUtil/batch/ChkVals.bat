REM ##################################
REM ##### Reset Invalid Options ######
REM ##################################
if %xOS%. == Vista. goto Vis
if %xOS%. == Win7. goto Vis
set VsW7P=N
:Vis

if %xcuWin%. == Y. goto Win
set Enf0dder=N
set EnUFOEx=N
set SplEXE=N/A
set VsW7P=N
:Win

if %Enf0dder%. == Y. if %EnUFOEx%. == Y. goto oneLdr
goto ldrOK
:oneLdr
if exist UFOLoader.exe disF0d
goto disSeb
:disF0d
set Enf0dder=N
goto oneLdr
:disSeb
set EnUFOEx=N
:oneLdr
:ldrOK

if %xcuWin%. == Y. if %SplEXE%. == N/A. goto SpNo
goto SpUn
:SpNo
set SplEXE=N
:SpUn
if %xcuWin%. == N. if %SplEXE%. == Y. goto SpNA
goto SpChk
:SpNA
set SplEXE=N/A

if NOT %FAll%. == Y. goto NoFAll
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
:NoFAll
if NOT %FAll%. == N. goto FixProm
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
:FixProm


:SpChk
if %xcuWin%. == N. goto SplEXE
if %xcuWin%. == Y. if %SplEXE%. == Y. goto SplEXE
set FasT=N
set THP=N
set ImpBas=N
set DefBas=N
set NewLT=N
set CapARes=N
set XcUMes=N
set UNStat=N
set UNR=N
set UNK=N
set pCSrt=N
set pCSrtAuto=N
set pCSrtFile=N
set ReEqp=N
if exist XcomUtil\flags\equiploc.xcu goto EqpRes
set EqpFRes=N
goto SkpEqpRe
:EqpRes
set EqpFRes=Y
:SkpEqpRe
set RemMC=N
set MCScr=N
set FDay=N
set FNight=N
set BFGorWRnd=N
set BFG=N
set BFGProm=N
set BFGRTer=N
if %RndAC%. == Every. goto FixRAC
goto NoFixRAC
:FixRAC
set RndAC=Y
:NoFixRAC
set DisBas=N
:SplEXE

if %XCOM%. == TFTD. goto TFTD
set IGau=N
set ReGCl=N
set ResFix=N
set FTMSwp=N
set FTURou=N
set FTIntDis=N
goto UFO
:TFTD
set SG=N
set ST=N
set FURou=N
set FDesM=N
set FXRou=N
set FATer=N
set FMTer=N
set FUTer=N
set FExTer=N
set FLitn=N
set IHLsr=N
set NewLT=N
:UFO

if %BFG%. == Y. goto BFG
set BFGProm=N
set BFGRTer=N
set RndACFr=Once
goto NoBFG
:BFG
set RndWorld=N
set DisBas=Y
:NoBFG

if %RndAC%. == Y. goto RandAC
set RndACSap=N
set KepRndAC=N
:RandAC

if %RemMC% == N goto MC
set MCScr=N
:MC

