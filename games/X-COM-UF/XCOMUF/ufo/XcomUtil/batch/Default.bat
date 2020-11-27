REM ###############################
REM ##### Set Default Config ######
REM ###############################

REM Unless listed, valid options(case sensitive): Yes, No
REM Options are Case Sensitive

REM #### Windows Executable ####

REM SplEXE = Split Windows EXE. Required for most options.
REM VsW7P = Patch for Vista / Windows 7 to fix blank screen
REM Enf0dder = Enable f0dder loader to fix corrupted video. 
REM EnUFOEx = Enable UFO Extender

REM SplEXE: N/A, Yes, No
set SplEXE=Y
set VsW7P=N
set Enf0dder=N
set EnUFOEx=N

REM ##### Game Fixes #####

REM FAll = Apply all Fixes
REM FURou = Fix UFO Routes
REM FDesM = Fix Desert Map
REM FXRou = Fix X-Com Base Routes / Spawn points.
REM FATer = Fix Alien Base Terrain
REM FMTer = Fix Mountain Terrain
REM FUTerain = Fix UFO Terrain
REM FExTer = Fix Explosive Terrain
REM FLitn = Fix Lightning Terrain
REM FTMSwp = Fix TFTD Swaped Maps
REM FixTUout = Fix TFTD USO Routes
REM FTIntDis = Fix TFTD Interception Images

REM FAll: Yes, No, Prompt
set FAll=P
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

REM ##### Game Modifications #####

REM ### Sound ###
REM SG = Original Geoscape Sound Effects
REM ST = Original Tactical Sound Effects

set SG=N
set ST=N

REM ### Craft ###
REM FasT = Fighter as Transport
REM THP = Transport Hard Point

set FasT=N
set THP=N

REM ### Base ###
REM DefBas = Defensive Base Layout
REM ImpBas = Improved Starting Base.
REM DisBas = Fix Disjointed Base Bug

set DefBas=N
set ImpBas=N
set DisBas=N

REM ### Equipment ###
REM ITank = Improved Tank
REM IPst = Improved Pistol
REM IHLsr = Improved Heavy Laser
REM IHiEx = Improved High Explosive
REM IDyeG = Improved Dye Granada
REM IGuass = Improved Gauss Damage
REM ReGCl = Remove Gauss Clip
REM NewLT = Scott's Alternate Laser and Plasma Mod

set ITank=N
set IPst=N
set IHLsr=N
set IHiEx=N
set IDyeG=N
set IGau=N
set ReGCl=N
set NewLT=N

REM ### Research ###
REM ResFix = TFTD Research Fix
REM CapARes = Captures Alien Research

set ResFix=N
set CapARes=N

REM ### Units ###
REM UNStat = Unit Name Stats
REM UNR = Unit Name Ranks
REM UNK = Unit Name Kills
REM pCSrt = Pre-CombatSort
REM ReEqp = Re-Equp Units
REM EqpFRes = Equipment File Reset
REM RemMC = Remove PSI/MC from Game
REM MCScr = PSI/MC Screening
REM ScrTyp = PSI/MC Screening Type

set UNStat=N
set UNR=N
set UNK=N
set pCSrt=N
set ReEqp=N
set EqpFRes=N
set RemMC=N
set MCScr=N
REM ScrTyp: Lab, Alwase
set ScrTyp=Lab

REM ### Battlefield ###
REM fDay = Force Daylight
REM fNight = Force Night
REM BFGorWRnd = BFG or World Map Randomization
REM BFG = BattleField Generator
REM BFGProm = BFG Prompting for each CombatSort
REM BFGRTer = BFG Random Terrain Selection
REM RndWorld = Randomize World map Textures

set FDay=N
set FNight=N

set BFGorWRnd=N
set BFG=N
set BFGProm=N
set BFGRTer=N
set RndWorld=N

REM ### Alien Craft Maps ###
REM RndAC = Randomize Alien Craft
REM RndACFr = Freqency of Randomization
REM RndACSap = Randome Alien Craft Shapes
REM KepRndAC = Keep Random Craft Files

set RndAC=N
REM RndACFr: Once, Every
set RndACFr=Once
set RndACSap=N
set KepRndAC=N

REM ### Misc ###
REM XcUMes = Display Autocombat and Research Messages
REM Ad= Use Addon's 

set XcUMes=N
set Ad=N