@echo off
if %1. == . goto ERR
if %2. == . goto ERR

REM Header
cls
echo  -= XcomUtil %xcuVer% setup =-
echo.

goto %1

:Beta
echo     :: BETA Message ::
echo.
echo  This version of XcomUtil is a beta release. The package is NOT to be
echo  posted to any website. If you downloaded this from a site other
echo  than the Official XcomUtil site, Please report it to
echo  BladeFireLight@gmail.com
echo.
if %2 == 00 goto EOF
echo  This is a Private beta. Do not post it on-line, or email it to anyone
echo  else with out prior permission from Blade FireLight.
echo.
goto EOF

:EnvErr
echo     :: Environment Space Error ::
echo.
echo  XcuSetup was unable use enough Environment Space it will need to
echo  store all the settings.
echo  To run XcuSetup you will need to run it from a command window or DOS
echo  Command.com with sufficient Environment Space.
echo.
echo  For many versions of DOS this can be done by running
echo  c:\command.com /e:2048
echo.
goto EOF


:DosBox
echo     :: DosBox Speed Issues ::
echo.
echo  DosBox's Read/Write emulation is slow, this will result in the Backup
rem '
echo  and Restore steps to take a long time. To speed up the process XcuSetup
echo  will set the CPU Core to Dynamic and the CPU Cycles to MAX.
echo  They will be restored to your setting upon exit of XcuSetup.
echo.
goto EOF

:oldVer
echo     :: Pre 9.7 Version of XcomUtil ::
echo.
echo  Older versions of XcuSetup don't come with an uninstall option.
REM '
echo  XcuSetup will attempt to reverse all changes before continuing
echo  While no issues are expected it is recommended to use a clean
echo  install of the game.
echo.
goto EOF

:DB73
echo     :: DosBox 0.73 Issues ::
echo.
echo  DosBox version 0.73 has a buggy command interpreter and it not supported.
echo  XcuSetup may crash and command line options will not work.
echo  Please use 0.72.
echo.
goto EOF

:DBOld
echo     :: DosBox Older Version ::
echo.
echo  This version of DOSBox is old. XcuSetup can not continue.
echo  Please update to 0.70 or newer. (Excluding 0.73)
echo.
goto EOF

:SysChks
echo     ::Running System Checks::
if %2. == 00. goto EOF
echo  Environment Space ................. %EnvSp%
if %2. == 01. goto EOF
echo  Game Directory writable ........... %GDirW%
if %2. == 02. goto EOF
echo  XcomUtil %OSArch%bit Files Copied ....... %osArF%
if %2. == 03. goto EOF
echo  Operating System .................. %xOS%
if %2. == 04. goto EOF
echo  Game found in Current Directory ... %GDirF%
if %2. == 05. goto EOF
echo  Save Folders Exist ................ %SDirEx%
if %2. == 06. goto EOF
echo  Xcom Version ...................... %xcver%
if %2. == 07. goto EOF
echo  Missdat Folder .................... %MdatOK%
if %2. == 08. goto EOF
echo  Hybrid Game ....................... %Hyb%
if %Hyb%. == No. goto skpHbPa
if %Hyb%. == %clChk%Checking.%clOff%. goto skpHbPa
echo  Hybrid Path ....................... %HybPath%
:skpHbPa
if %2. == 09. goto EOF
echo  =============================================
echo  Results ........................... %ChkRes%
if %2. == 10. goto EOF
if NOT "%sysCkMsg%" == "" echo  %sysCkMsg%
if NOT "%sysCkMsg2%" == "" echo  %sysCkMsg2%
if %2. == 11. goto EOF
echo.
echo  XcuSetup will now restore all files from backup if they exist. The
echo  first time running XcuSetup there will be nothing to restore. Any mods
echo  installed after XcomUtil will need to be reinstalled.
echo.
goto EOF


:RestDef
echo     ::Resetting Game to Defaults::
echo.
if %2. == 00. goto EOF
echo  Geoscape Restore .................. %GeoRes%
if %2. == 01. goto EOF
echo  Tactical Restore .................. %TacRes%
if %2. == 02. goto EOF
echo  Maps Directory Restore ............ %MapRes%
if %2. == 03. goto EOF
echo  Routes Directory Restore .......... %RoutRes%
if %2. == 04. goto EOF
echo  Terrain MCD Restore ............... %MCDRes%
if %2. == 05. goto EOF
echo  Terrain PCK Restore ............... %PCKRes%
if %2. == 06. goto EOF
echo  Terrain TAB Restore ............... %TABRes%
if %2. == 07. goto EOF
echo  Geodata Directory Restore ......... %GDatRes%
if %2. == 08. goto EOF
echo  Geograph Directory Restore ........ %GGrRes%
if %2. == 09. goto EOF
echo  Sound Directory Restore ........... %SndRes%
if %2. == 10. goto EOF
echo  UFOGraph Directory Restore ........ %UFOGRes%
if %2. == 11. goto EOF
echo  Units Directory Restore ........... %UniRes%
if %2. == 12. goto EOF

echo  Resetting XcomUtil Configuration .. %ResConfig%
if %2. == 13. goto EOF
REM Uninstall Exit Point
if %2. == 98. goto EOF
echo.
if %ResFlag%. == 1. echo  %xcver% Restored Successfully.
if %ResFlag%. == 0. echo  No Backups to restore from.
echo.
goto EOF

:HybCpy
echo     ::Importing Hybrid Files::
echo.
if %2. == 00. goto EOF
echo  Backup terrain\plane.* ............ %PlaneBak%
if %2. == 01. goto EOF
echo  Copy Hybrid Maps .................. %CpHybM%
if %2. == 02. goto EOF
echo  Copy Hybrid Routes ................ %CpHybR%
if %2. == 03. goto EOF
echo  Copy Hybrid Terrain ............... %CpHybTer%
if %2. == 04. goto EOF
if %XCOM%. == UFO. echo  Copy Sunken Plane ................. %CpSubPlane%
if %2. == 05. goto EOF
echo  Restore terrain\Plane.* ........... %PlaneRes%
if %2. == 06. goto EOF
echo.
echo  Import of Hybrid Files complete.
echo.
echo  XcuSetup Now has to re-run Restore and Backup.
echo.
goto EOF

:HybBad
echo     ::Importing Hybrid Files::
echo.
echo   Source Path:
echo  %HybPath%
echo  Contains both UFO and TFTD files. Hybrid can only use a clean
echo  copy of UFO or TFTD.
echo.
echo  Skiping Hybrid Import.
echo.
goto EOF

:Backup
echo     ::Creating Backup Files::
echo.
if %2. == 00. goto EOF
echo  Geoscape Backup ................... %GeoBak%
if %2. == 01. goto EOF
echo  Tactical Backup ................... %TacBak%
if %2. == 02. goto EOF
echo  Maps Directory Backup ............. %MapBak%
if %2. == 03. goto EOF
echo  Routes Directory Backup ........... %RoutBak%
if %2. == 04. goto EOF
echo  Terrain MCD Backup ................ %TerrMCDBak%
if %2. == 05. goto EOF
echo  Terrain PCK Backup ................ %TerrPCKBak%
if %2. == 06. goto EOF
echo  Terrain TAB Backup ................ %TerrTABBak%
if %2. == 07. goto EOF
echo  Geodata Directory Backup .......... %GeoDatBak%
if %2. == 08. goto EOF
echo  Geograph Directory Backup ......... %GGrBak%
if %2. == 09. goto EOF
echo  Sound Directory Backup ............ %SndBak%
if %2. == 10. goto EOF
echo  UFOGraph Directory Backup ......... %UFOGrBak%
if %2. == 11. goto EOF
echo  Units Directory Backup ............ %UniBak%
if %2. == 12. goto EOF
echo.
echo  Backup complete. 
goto EOF


:UACFix
echo     :: Read Only Fix for XP, Vista, Windows 7 ::
echo.
echo  XcomUtil has detected you game directory is read only. It will now
echo  attempt to fix this issue. If you are using Vista or Windows 7
echo  and have UAC on you should get a UAC Prompt. This fix only works if
echo  it can run as and administrator.
echo.
echo  In Vista and Windows 7 move any saved games from the VirtualStore
echo  to %CD%
echo.
echo  [NOTE: This will give the "Users" group modify permissions to]
echo  [%CD%]
goto EOF

:VisGpx
echo     :: %XCOM%:CE - %xcuWinV% Graphics Issues: Blank Screen ::
echo.
echo  %xcuWinV% has Issues displaying %xcver%. On start up you get a blank Screen.
echo  This issue can be resolved by disabling DirectX for the X-com Executable.
echo  The patch also forces 640x480 resolution, 256 colors, and Single Processor
echo  Affinity.
echo.
if NOT %XCOM%. == UFO. goto VisGpT
if NOT %xOS%. == Vista. goto VisGpT
echo  %xcver% has issues with this patch on %xcuWinV%. All interceptions are
echo  auto aborted. Some players have reported using Turbo resolves this.
echo  Turbo can be found in the file section of www.strategycore.co.uk
echo.
:VisGpT
echo  [NOTE: Once this is installed it does not have to be installed again]
echo  [NOTE: to remove select Yes to this prompt and No when the patch runs]
echo  [NOTE: No changes made to any game files]
echo.
echo  Run Patch Program? (%default%)
goto EOF

:FodLdr
echo     :: %XCOM%:CE - %xcuWinV% Graphics Issues: Corrupted Colors ::
echo.
echo  Special loaders have been created by f0dder (real name unknown) to correct
echo  video problems encountered when running the Windows versions of XCOM and
echo  TFTD on systems with GeForce4 and Radeon video cards.  You should only
echo  reply Yes to this question if you are having video problems.  The loaders
echo  are documented in XcomUtil\Bin\README.TXT.
echo.
echo  NOTE: These special loaders have been known to hang on exit.  If this
echo  happens you can usually switch to the command window that has the loader
echo  in the title bar and press Ctrl-C.  The game should then continue without
echo  any problems.
echo.
echo  [NOTE: No changes made to any game files]
echo.
echo  Do you want to enable f0dder's loader? (%default%)
rem '
goto EOF

:SplEXE
echo     :: %XCOM%:CE - Split EXE ::
echo.
echo  To fully utilize XcomUtil, the EXE file used to run %xcver%
echo  must be split into two separate files, Geoscape and Tactical.
echo  Choosing NO will disable most of the setup options.
echo  After the EXE is split you will have to use RunXcom.bat in
echo  the game Directory to play X-Com: %XCOM%.
echo.
echo  [NOTE: This creates Geoscape.exe and Tactial.exe in the game folder]
echo.
echo  Do you want to Split the EXE? (%default%)
goto EOF

:UFOLoad
echo     :: %XCOM%:CE - Seb76 UFO Extender Detected ::
echo.
echo  RunXcom can be setup to use UFO Extender to start %XCOM%
echo.
echo  [NOTE: This is not compatible with f0dders loader. If you have graphics]
echo  [issues please consult the UFO Extender documentation.]
echo.
echo  Do you want to enable the use of UFO Extender? (%default%)
goto EOF


:ForsPat
echo     :: UFO Patches ::
echo.
echo  The version of X-Com your running will be have the following patches applied
echo.
echo  Difficulty bug fix: This bug makes all games revert to Beginner when
echo  reload.
echo.
if %2. == 01. goto EOF
echo  Copy Protection: All answers set to 00000000.
echo.
echo  [NOTE: This modifies ufoexe\geoscape.exe]
goto EOF

:PatchOp
echo     :: Game Fixes ::
echo.
echo  XcomUtil can apply various fixed for bugs in %XCOM%
echo.
echo  (Fixes created by Zombie, Bomb Bloke and Inteck)
echo  Bugs include units spawning inside of walls.
echo  Graphics glitches.
echo  Falling Through Floors
echo  And Various other things.
echo.
echo  [NOTE: This modifies various files in Geodata, Maps, Routes, Terrain]
echo  [NOTE: "Yes All" only applys to the Game Fixes]
echo.
echo  Y = Yes All, N = None, P = Prompt
echo.
echo  Do you want to apply the fixes? (%default%)
echo.
goto EOF

:FixURmp
echo     :: Game Fixes - Alien Craft Spawn Points and Routes ::
echo.
echo  For Medium Scout, Large Scout, Harvester, Abductor: Fixes a bunch of
echo  nodes within the craft which could potentially spawn large units.
echo.
echo  Terror Ship: Fixes a node on the East side of the ship to prevent a
echo  spawning issue. Node 30 has been changed to only allow small units to
echo  spawn there (large units get stuck in the wall). Also fixes a whole
echo  raft of other spawning issues throughout the ship.
echo.
echo  Battle Ship: Fixes a node on L1 of the Battleship where large units
echo  spawn inside a wall. Also fixes a whole host of other spawning issues
echo  throughout the ship.
echo.
echo  Supply Ship: Fixes the routes of the Supply Ship so that aliens exit
echo  from both doors instead of just the one from the SW.
echo.
echo  [NOTE: modifies routes\UFO_1x0.map]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixDesert
echo     :: Game Fixes - Desert Map ::
echo.
echo  Fixes the "artifact" in the DESERT09.map module where there is
echo  a small patch of sand floating in thin air on Level 2.
echo.
echo  [NOTE: modifies maps\Desert09.map]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixXBas
echo     :: Game Fixes - X-Com Base Spawn Points ::
echo.
echo  Fixes the node in the General Stores module near the stairs so that
echo  large alien terrorists do not spawn partially inside the dirt.
echo  Specifically, it disallows aliens from showing up in the module and
echo  changes the node so that only small X-COM units show up there.
echo  It also moves the node closer to the stairs and away from the door.
echo.
echo  Fixes a node on L1 of the Access Lift where large units could
echo  potentially spawn partially within dirt. It now only allows small
echo  units to be placed there.
echo.
echo  [NOTE: modifies routes\XBase_00.rmp and routes\XBase_07.rmp]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixUBas
echo     :: Game Fixes - Alien Base Terrain ::
echo.
echo  Fixes a number of issues with objects in an alien base.
echo  First, a small display vat is set to burn for the correct number
echo  of turns. Second, a quarter of the large 2x2 green vat has been
echo  changed to have the correct armor and HE block. Third, a quarter
echo  of the large 2x2 yellow and brown vat now points to the proper
echo  death tile.
echo.
echo  [NOTE: modifies terrain\U_Base.mcd]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixMt
echo     :: Game Fixes - Mountain Terrain ::
echo.
echo  Fixes the "Mile-High Madness" bug in the mountainous terrain where
echo  shots turn the ground into stumps and explosions can destroy the
echo  landing ramp of your drop ship and UFO hulls. It also changes the death
echo  Terrain of the stumps into their respective damaged counterparts.
echo.
echo  [NOTE: modifies terrain\mount.mcd]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixAc
echo     :: Game Fixes - Alien Craft Terrain ::
echo.
echo  Fixes two UFO Terrain so that they take 4 TU to cross instead of none.
echo.
echo  [NOTE: modifies terrain\U_Bits.mcd]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixEx
echo     :: Game Fixes - Explosive Terrain ::
echo.
echo  Fixes objects which explode and produce only smoke damage now are
echo  truly explosive.
echo.
echo  [NOTE: modifies terrain\U_Pods.MCD, terrain\U_Wall02.MCD]
echo  [and terrain\Urban.MCD]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:TMapFix
echo     :: Game Fixes - Swap Survey Ship and Escort ::
echo.
echo  This fixes the problem where the Survey Ship and the Escort USOs are
echo  swapped.
echo.
echo  [NOTE: swaps maps\ufo01.map and maps\ufo02.map]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixUFOt
echo     :: Game Fixes - Survey Ship Routes ::
echo.
echo  Fixes the routes of the Survey Ship so there are no orphaned nodes
echo  which may prevent an alien from leaving the craft.
echo.
echo  [NOTE: modifies routes\ufo02.rmp OR routes\ufo01.rmp]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FixLight
echo     :: Game Fixes - Lightning MCD and LOF ::
echo.
echo  The Lightning has been buggy since day 1. This fixes the "hole" in
echo  the LOF (Line Of Fire) templates for the center North wall segment
echo  in the Lightning. This also fixes all the "wall" objects in this ship
echo  so that your troops cant exit from the diagonals. To prevent the
echo  aliens from shooting/seeing in and X-COM units from shooting/seeing
echo  out, it introduces "invisible" pillars (like in a UFO) to seal the
echo  joints in the diagonal walls and extends the LOF templates on the
echo  floor tiles to plug the gap between the floor and wall as well.
echo.
echo  [NOTE: modifies terrain\lightnin.mcd, terrain\lightnin.pck]
echo  [and  terrain\lightnin.tab]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF

:FxIntDis
echo     :: Game Fixes - Interception Screen ::
echo.
echo  This replaces the interception screen which shows the wrong images
echo  of the "Battleship" (UFO Terror Ship) and the "Fleet Supply Ship".
echo  The interception screen images that comes with the the game are
echo  reversed as opposed to the ones in the Usopaedia.
echo.
echo  [NOTE: modifies geodata\interwin.dat]
echo.
echo  Do you want to apply this fix? (%default%)
echo.
goto EOF


:SfxGeo
echo     :: Sound - Original Sound Effects: Geoscape ::
echo.
echo  UFO 1.4 and CE use a completely new sound format. The original sound
echo  effects were replaced. Many players of the early version of UFO prefer
echo  the original sounds. This replaces the Geoscape sound effects with 
echo  re-sampled originals. 
echo.
echo  [NOTE: replaces sound\sample.cat]
echo.
echo  Use Original Geoscape Sound Effects? (%default%)
echo.
goto EOF

:SfxTac
echo     :: Sound - Original Sound Effects: Tactical ::
echo.
echo  UFO 1.4 and CE use a completely new sound format. The original sound
echo  effects were replaced. Many players of the early version of UFO prefer
echo  the original sounds. This replaces the Tactial sound effects with 
echo  re-sampled originals. 
echo.
echo  [NOTE: replaces sound\sample2.cat]
echo.
echo  Use Original Tactical Sound Effects? (%default%)
echo.
goto EOF


:IntTras
echo     :: X-Com Craft - Fighters / Transport ::
echo.
if %XCOM%. == TFTD. goto itrT1
goto itrU1
:itrT1
set IName=Barracuda
set I2Nam=Manta
set UNam=Aquanauts
goto itrtftd
:itrU1
set IName=Interceptor
set I2Nam=Firestorm
set UNam=Soldiers
echo  Change the %IName% and %I2Nam% to carry %UNam%'s
rem '
goto itrcon
:itrtftd
echo  Change the %IName% to carry %UNam%'s
rem '
:itrcon
echo.
echo  [NOTE: modifies Tactical and adds additional map, route and terrain
echo   files.]
echo.
echo  Do you want to enable %IName% and %I2Nam% as Fighter Transports? (%default%)
goto EOFC

:TransHp
if %XCOM%. == TFTD. goto thpT1
set TrNam=Skyranger
goto thpDis
:thpT1
set TrNam=Triton
:thpDis
echo     :: X-Com Craft - %TrNam% Hard Point ::
echo.
echo  Add one gun mount to the %TrNam%.
echo.
echo  [NOTE: This Modifies Geoscape]
echo.
echo  Do you want to add one Hard Point to the %TrNam%? (%default%)
goto EOFC

:ImpBas
if %XCOM%. == TFTD goto ibT1
set SDec=Small Radar
set LDec=Large Radar
goto ibDis
:ibT1
set SDec=Standard Sonar
set LDec=Wide Array Sonar
:ibDis
echo     :: X-Com Base - Improved Starting Base ::
echo.
echo  The improved base is designed to get you into the game faster.
echo  The %SDec% has been upgraded to a %LDec% and a
echo  Alien Containment has already been built.  The living quarters
echo  have been increased and the number of scientists and engineers
echo  have been increased from 10 and 10 to 50 and 20, respectively.
echo  This option only effects new games.
echo.
echo  [NOTE: This Modifies Geoscape]
echo.
echo  Do you want to use the improved starting base? (%default%)
goto EOFC

:DefLayo
if %XCOM%. == TFTD goto dlT1
set BEnt=Access Lift
set CPrk=Hanger
goto dlDis
:dlT1
set BEnt=Airlock
set CPrk=Sub Pen
:dlDis
echo     :: X-Com Base - Defensive Starting Base Layout  ::
echo.
echo  This alternate base layout is designed for defense by isolating
echo  the %BEnt% and %CPrk% from the rest of the base.
echo  This option only effects new games.
echo.
echo  [NOTE: This Modifies Geoscape. Changes effect standard and improved
echo   starting base]
echo.
echo  Do you want to use the defensive starting base? (%default%)
goto EOFC

:DisjBas
echo     :: X-Com Base - Disjointed Base Bug ::
echo.
echo  This solves the disjointed base bug by removing the adjoining walls in
echo  various maps. This will result in some hallways ending in solid rock.
echo  Some players actualy use this bug as a stratigic advantage. 
echo.
echo  [NOTE: This modifies Alien and Xcom base map files in the maps folder]
echo  [NOTE: Use of the Battle Field Generator (BFG) will forse this to yes]
echo.
echo  Do you want fix the Disjointed base bug? (%default%)
REM This option requires that some maps get restored if Scott's BFG is not being used.
goto EOF


:impTank
if %XCOM%. == TFTD goto itT1
set TNam=HWP
goto itDis
:itT1
set TNam=SWS
:itDis
echo     :: Equipment - Improved %TNam% ::
echo.
echo  This option improves the %TNam% breathing new life into a unit
echo  that quickly becomes useless.
echo.
echo  Time Units    from 70 to 100
echo  Reactions     from 20 to  30
echo  Front Armor   from 90 to 130
echo  Left Armor    from 75 to 130
echo  Right Armor   from 75 to 130
echo  Rear Armor    from 60 to 130
echo  Under Armor   from 60 to 100
echo.
echo  [NOTE: This Modifies Geoscape.]
echo.
echo  Do you want to use the improved %TNam% armor? (%default%)
goto EOFC

:incTank
if %XCOM%. == TFTD goto itrT1
set Arm1=Personal Armour
set Arm2=Power Suit
set UNav=UFO Navigation
set TNam=HWP
goto itrDis
:itrT1
set Arm1=Plastic Aqua Armour
set Arm2=Ion Armour
set UNav=Magnetic Navigation
set TNam=SWS
:itrDis
echo     :: Equipment - Improved %TNam% by Research ::
echo.
echo  This option improves the %TNam% based on what your research.
echo  breathing new life into a unit that quickly becomes useless.
echo.
echo   %Arm1%                            %Arm2%
echo  Front Armor   from 90 to 110          Front Armor   from 110 to 130
echo  Left Armor    from 75 to 100          Left Armor    from 100 to 130
echo  Right Armor   from 75 to 100          Right Armor   from 100 to 130
echo  Rear Armor    from 60 to  95          Rear Armor    from  95 to 130
echo  Under Armor   from 60 to  80          Under Armor   from  80 to 100
echo.
echo   %UNav%
echo  Time Units    from 70 to 100
echo  Reactions     from 20 to  30
echo.
echo  [NOTE: This Modifies missdat\uniref.dat before starting tactical.]
echo.
echo  Do you want to use the improved %TNam% armor? (%default%)
goto EOFC

:inpPistol
if %XCOM%. == TFTD goto ipT1
set PNam=Pistol
goto ipDis
:ipT1
set PNam=Dart Gun
:ipDis
echo     :: Equipment - Improved Weapons: %PNam% ::
echo.
echo  Add auto-fire to the %PNam%. Auto-fire will have
echo  the same accuracy and use as many Time Unit as 3 snap shots.
echo.
echo  [NOTE: This modifies geodata\obdata.dat]
echo.
echo  Do you want to use Improved %PNam%? (%default%)
goto EOFC

:inpHvLsr
echo     :: Equipment - Improved Weapons: Heavy Laser ::
echo.
echo  Improve accuracy of the Heavy Laser.
echo.
echo  [NOTE: This modifies geodata\obdata.dat]
echo.
echo  Do you want to use Improved Heavy Laser? (%default%)
goto EOF

:inpHiExp
if %XCOM%. == TFTD goto iheT1
set Expl=High Explosive
goto iheDis
:iheT1
set Expl=Magna-Pack Explosive
:iheDis
echo     :: Equipment - Improved Weapons: %Expl% ::
echo.
echo  Increase the power of the %Expl% to make it possible to
echo  blow holes in the side of the alien's craft.
REM '
echo.
echo  [NOTE: This modifies geodata\obdata.dat]
echo.
echo  Do you want to use Improved %Expl%? (%default%)
set Expl=
goto EOFC

:DieGre
echo     :: Equipment - Improved Weapons: Dye Grenade ::
echo.
echo  The Dye Grenade in Terror From The Deep has been totally ineffective
echo  since the game first came out. The damage of 10 offers basically no
echo  concealment. This sets the damage to 40.
echo.
echo  [NOTE: modifies geodata\obdata.dat]
echo.
echo  Increase the damage of the Dye Grenade? (%default%)
echo.
goto EOF


:inpGaus
echo     :: Equipment - Improved Weapons: Gauss ::
echo.
echo  Double the clip size of Gauss Rifle and Heavy Gauss, plus increase
echo  the damage of the Heavy Gauss from 75 to 80.
echo.
echo  [NOTE: This modifies geodata\obdata.dat]
echo.
echo  Do you want to use Improved Gauss Weapons? (%default%)
goto EOF

:inpGaNC
echo     :: Equipment - Improved Weapons: Remove Gauss Clips ::
echo.
echo  Remove the need for clips from Gauss weapons, and increase the damage of the
echo  Heavy Gauss from 75 to 80. This has the effect of making Gauss the
echo  equivalent of Laser Tech from UFO.
echo.
echo  [NOTE: This modifies geodata\obdata.dat]
echo.
echo  Do you want to Remove Gauss Weapon Clips? (%default%)
goto EOF

:inpNuLsr
echo     :: Equipment - Improved Weapons: Alternate Laser Tech ::
echo.
echo  This option changes the manufacturing costs of all of the laser and plasma
echo  weapons in UFO.  The basic idea is that simple laser weapons are
echo  underpowered, but plasma weapons are too complicated for human engineers
echo  to duplicate.  Pay close attention to the updated UFOpedia information
echo  about these weapons.  All of the new UFOpedia entries have been translated
echo  into German, French, and Spanish.
echo.
echo  [NOTE: This modifies geoscape, geodata\obdata.dat, geodata\spanish.dat
echo   geodata\english.dat, geodata\german.dat, geodata\french.dat and
echo   game_[n]\product.dat]
echo.
echo  Do you want to use the Alternate Laser Tech? (%default%)
goto EOF

:ResFix
echo     :: Research - Recover TFTD Bugs ::
echo.
echo  This applies fixes to Terror From the Deeps Research tree after combat.
echo.
echo  MC Reader Bug Fix:
echo  If MC Lab has been researched but MC Reader has not and MC Reader
echo  is unavailable to research, make available for research.
echo.
echo  Sub Construction Bug Fix:
echo  If Transmission Resolver and Zerbit have been researched and
echo  Alien Sub Construction has not, but is still unavailable, make
echo  available for research
echo.
echo  Aqua Plastics Bug Fix:
echo  If Deep One Corps has been researched but Aquaplasics has not and
echo  is still unavailable for research, make available for research.
echo.
echo  [NOTE: This modifies missdat\research.dat when exiting tactical]
echo.
echo  Do you want XcomUtil to attempt to fix TFTD Research Bugs? (%default%)
goto EOF

:AlResHlp
echo     :: Research - Help from Captured Aliens ::
echo.
echo  This option greatly changes the way alien research is performed.  First,
echo  the amount of time required to complete all alien research projects is
echo  greatly increased.  To compensate for this, the amount of time remaining
echo  on your active research projects will be reduced by a percentage based on
echo  the rank of each alien captured.  The net effect is to make captures VERY
echo  important, unlike it is today.  This option only effects new games.  For
echo  more information, see the Research Help from Captured Aliens section
echo  in XcomUtil.txt.
echo.
echo  [NOTE: This modifies geoscape and missdat\project.dat when exiting tactical]
echo.
echo  Do you want to get research help from captured aliens? (%default%)
goto EOF

:XCUMsg
echo     :: XcomUtil messages after combat ::
echo.
echo  This enables the display of messages between the tactical and world views
echo  to report AutoCombat results and any research help acquired by capturing
echo  aliens.
echo.
echo  [NOTE: No modifications]
echo.
echo  Do you want to see XcomUtil messages after combat? (%default%)
goto EOF

:StatStr
if %XCOM%. == TFTD goto ssT1
set UNam=Soldiers
goto ssDis
:ssT1
set UNam=Aquanauts
:ssDis
echo     :: Units - %UNam% Name Stat Strings ::
echo.
echo  Stat strings in the names of your troops make it much easier to view the
echo  attributes of your troops when equipping your ships and in combat.
echo.
echo  [NOTE: This modifies missdat\soldier.dat when exiting tactical]
echo.
echo  Do you want stat strings added to the names of your troops? (%default%)
goto EOFC

:RankStr
if %XCOM%. == TFTD goto rsT1
set UNam=Soldiers
set r1=Rookie
set r2=Squaddie
goto rsDis
:rsT1
set UNam=Aquanauts
set r1=Seaman
set r2=Able Seaman
:rsDis
echo     :: Units - %UNam% Name Rank ::
echo.
echo  This adds :a through :f after the name, to be used as a rank indicator, where
echo  a=%r1%, b=%r2%, etc.  This was chosen over
echo  traditional rank abbreviations both to save space and to create unique
echo  indicators.
echo.
echo  [NOTE: This modifies missdat\soldier.dat when exiting tactical]
echo.
echo  Do you want rank indicators added to the names of your troops? (%default%)
goto EOFC

:KillStr
if %XCOM%. == TFTD goto ksT1
set UNam=Soldiers
goto ksDis
:ksT1
set UNam=Aquanauts
:ksDis
echo     :: Units - %UNam% Kill Number ::
echo.
echo  This adds the number of kills after the rank indicator at the end of the
echo  name of your soldier.
echo.
echo  [NOTE: This modifies missdat\soldier.dat when exiting tactical]
echo.
echo  Do you want their number of kills added to the names of your troops? (%default%)
goto EOFC

:uniSort
if %XCOM%. == TFTD goto usT1
set UNam=Soldiers
goto usDis
:usT1
set UNam=Aquanauts
:usDis
echo     :: Units - Pre-Combat Sort ::
echo.
echo  This option sorts your troops on board the ship at the beginning of
echo  combat. It does not permanently change the order of your troops
echo  automatically based on stats as defined in XcomUtil\cfg\SortStat.txt
echo  (see XcomUtil.txt)
echo.
echo  [NOTE: This modifies missdat\unipos.dat before entering tactical]
echo.
echo  Do you want your %UNam% sorted before combat? (%default%)
goto EOFC

REM :uniSorta
REM echo     :: Units - Pre-Combat Sort ::
REM echo.
REM echo  This option sorts your troops on board the ship at the beginning of combat.
REM echo  It does not permanently change the order of your troops. There are two options
REM echo  for sorting. Automatic based on stats, and using %SortFileName%
REM echo.
REM echo  [NOTE: This modifies missdat\unipos.dat before entering tactical]
REM echo.
REM echo  Do you want your %UNam% sorted before combat? (%default%)
REM goto EOF


REM :uniSortO
REM echo     :: Units - Pre-Combat Sort: Auto or File ::
REM echo.
REM echo  Auto Sort basically sorts %UNam% to protect the most valuable and place
REM echo  expendable or those with the best reactions as those first off the craft.
REM echo.
REM echo  File Sort uses %SortFileName% to place those with specific strings in the name
REM echo  in the order found in the file. Top of the file is closes to the craft exit.
REM echo.
REM echo  [NOTE: This modifies missdat\unipos.dat before entering tactical]
REM echo.
REM echo  Do you want your %UNam% sorted Automatically or by File? [A,F] (%default%)
REM goto EOF

:autoEqui
if %XCOM%. == TFTD goto aeT1
set UNam=Soldiers
goto aeDis
:aeT1
set UNam=Aquanauts
:aeDis
echo     :: Units - Re-equip %UNam% before combat ::
echo.
echo  This option re-equips your troops on board the ship before combat.  It
echo  does this by saving the equipment for each soldier after combat and
echo  attempting to restore the same equipment before the next combat.
echo.
echo  [NOTE: This modifies missdat\obposref.dat before entering tactical]
echo.
echo  Do you want to automatically re-equip your troops before combat? (%default%)
if %2. == 00. goto EOFC
echo.
echo  Do you want to reset your saved equipment? (%default2%)
goto EOFC


:RemMC
if %XCOM%. == TFTD goto rmcT1
set MC=Psionics
goto rmcDis
:rmcT1
set MC=Molecular Control
:rmcDis
echo     :: Units - Remove %MC% ::
echo.
echo  This option completely removes %MC% from the game for both
echo  you and the aliens.
echo.
echo  [NOTE: This modifies Geoscape]
echo.
echo  Do you want to eliminate %MC%? (%default%)
goto EOFC

:MCScan
if %XCOM%. == TFTD goto mcsT1
set MC=Psionics
set MCL=Psionics Lab
goto mcsDis
:mcsT1
set MC=Molecular Control
set MCL=M.C. Lab
:mcsDis
echo     :: Units - %MC% Screening  ::
echo.
echo  This option automatically raises the %MC% skill of all of your
echo  troops to a minimum of 1 after each combat.  This makes it possible to
echo  view the %MC% strength of all of your troops without building
echo  a %MCL%. In this way, you will know who is most resistant to
echo  mind control and who are the best candidates for training without
echo  spending a month of game time training them.  There are two options for
echo  enabling screening. Always on and only after the %MCL% has
echo  been researched.
echo.
echo  [NOTE: This modifies missdat\solder.dat]
echo.
echo  Do you want automatic screening for %MC% ability? (%default%)
if %2. == 00. goto EOFC
echo.
echo  Do you want to Always screen or just after the %MCL%
echo  is researched [A,L]? (%default2%)
goto EOFC

:DayLight
echo     :: Battlefield - Combat: Day Light Only ::
echo.
echo  This option eliminates the effects of darkness in the game.
echo.
echo  [NOTE: This modifies missdat\mission.dat before entering tactical]
echo.
echo  Do you want to fight all battles in daylight? (%default%)
goto EOF

:MidNight
echo     :: Battlefield - Combat: Night Only ::
echo.
echo  This option forces all battles to be fought in darkness.  Since the aliens
echo  have a tremendous advantage in darkness, this makes the game much harder.
echo.
echo  [NOTE: This modifies missdat\mission.dat before entering tactical]
echo.
echo  Do you want to fight all battles in darkness? (%default%)
goto EOF

:TerOp
echo     :: Battlefield - Battle Field and Terrain ::
echo.
echo  In %XCOM% some terrain is seen frequently while others you may never see
echo  in the course of a campaign. Custom map packs also have to replace existing
echo  terrain files to use the built in Battle Field Generator (BFG).
echo.
echo  XcomUtil has a few options to address this. The randomization of the world map
echo  textures to increase the likely hood of any one being used. Or the use of
echo  XcomUtils BFG to randomize or prompt for the terrain and use additional maps.
echo.
echo  Do you want want to use one of these options? (%default%)
goto EOF

:BFGOp
echo     :: Battlefield - Battle Field Generator (BFG) ::
echo.
echo  XcomUtil can generate the battlefield instead of letting the game do it.
echo  This gives the designers of add-on map packs the ability to add new map tiles
echo  to the battlefield.  This option may produce potentially ugly maps with
echo  mismatched streets and shorelines
echo  The XcomUtil BFG has options to randomly pick a terrain, use the one supplied
echo  by geoscape or Prompt for terrain and alien craft.
echo.
echo  [NOTE: This modifies missdat\mission.dat before entering tactical and removes
echo   the very small alien craft graphics from the game.]
echo.
echo  [NOTE: This forces the use of the disjointed Base Bug Fix. ]
echo  Do you want to use the XcomUtil BFG? (%default%)
REM  Scots BFG requires the disjointed base patch, must revers is not asked for.
if %2. == 00. goto EOF
echo.
echo  Do you want to Prompt for terrain and alien craft? (%default2%)
if %2. == 01. goto EOF
echo.
echo  Do you want to Randomly choose a terrain? (%default3%)
goto EOF

:Rnd
echo     :: Battlefield - Random World Terrain ::
echo.
echo  This randomizes the textures used on the world map, allowing any valid
echo  terrain to appear anywhere in the world.  This can make the world map look
echo  very weird, but it evenly distributes the occurrences of the various
echo  terrains without making them totally random.  If you land on the texture
echo  normally associated with mountains, the battle will be fought on mountain
echo  terrain.
echo.
echo  [NOTE: This modifies geodata\world.dat]
echo.
echo  Do you want the world map terrain to be randomized? (%default%)
goto EOF

:RndShip
echo     :: Alien Craft - Randomize Alien Craft Floor Plan ::
echo.
echo  XcomUtil can randomize the floor plan on alien craft. This is done
echo  once during setup, or if using BFG can be done before every combat.
echo  Using Random shapes or filling in the dead spaces with small rooms
echo  to create rectangle exterior shapes.
echo.
echo  [NOTE: This modifies all the alien craft files in the maps and
echo   terrain folders.]
echo.
echo  Do you want to use Random Alien Craft Floor Plans? (%default%)
if %2. == 00. goto EOF
echo.
echo  Do you want the random ships to have random shapes? (%default3%)
if %2. == 01. goto EOF
echo.
echo  Do you want to keep copies of the generated files? (%default4%)
if %2. == 02. goto EOF
echo.
echo  Do you want to Randomize Once or for Every battle [O,E]? (%default2%)
goto EOF


:Addon
echo     :: Addons Detected ::
echo.
echo  Addons Detected in the XcomUtil\Addon Folder. 
echo  Addons are not official parts of XcomUtil, If you have issues contact 
echo  the author of the addon.
echo.
echo  Do you want to allow Addons? (%default%)
if %2. == 00. goto EOF
echo.
echo  XcuSetup will now start the Setup script for each Addon.
echo  Once they are done XcuSetup will continue.
echo. 
goto EOF


:Apply
goto EOF

:EndSplit
echo     :: Setup Complete ::
echo.
echo  Setup has finished configuring XcomUtil.
echo  You can change any settigns by runinx XcuSetup again.
echo. 
echo  For a full explanation of what XcomUtil can do. Please read 
echo  XcomUtil\XcomUtil.txt
echo.
echo  To enable all of the features of XCOMUTIL, you must use RUNXCOM.BAT
echo  to run the game.
echo.
goto EOF

:EndNoSpl
echo     :: Setup Complete ::
echo.
echo  Setup has finished configuring XcomUtil.
echo  You can change any settigns by runinx XcuSetup again.
echo. 
echo  For a full explication of what XcomUtil can do. Please read XcomUtil\XcomUtil.txt
echo.
goto EOF


goto EOF
:debugDis
cls
echo    :: Debug Questions Pg1 ::
echo.
echo VsW7P     = %VsW7P%
echo Enf0dder  = %Enf0dder%
echo SplEXE    = %SplEXE%
echo FURou     = %FURou%
echo FDesM     = %FDesM%
echo FXRou     = %FXRou%
echo FATer     = %FATer%
echo FMTer     = %FMTer%
echo FUTer     = %FUTer%
echo FExTer    = %FExTer%
echo FLitn     = %FLitn%
echo FTMSwp    = %FTMSwp%
echo FTURou    = %FTURou%
echo FTIntDis  = %FTIntDis%
echo FasT      = %FasT%
echo THP       = %THP%
echo ImpBas    = %ImpBas%
echo DefBas    = %DefBas%
echo ITank     = %ITank%
echo IPst      = %IPst%
@jchoice
cls
echo    :: Debug Questions Pg2 ::
echo.
echo IHLsr     = %IHLsr%
echo IHiEx     = %IHiEx%
echo IGau      = %IGau%
echo ReGCl     = %ReGCl%
echo NewLT     = %NewLT%
echo ResFix    = %ResFix%
echo CapARes   = %CapARes%
echo XcUMes    = %XcUMes%
echo UNStat    = %UNStat%
echo UNR       = %UNR%
echo UNK       = %UNK%
echo pCSrt     = %pCSrt%
echo ReEqp     = %ReEqp%
echo EqpFRes   = %EqpFRes%
echo RemMC     = %RemMC%
echo MCScr     = %MCScr%
echo FDay      = %FDay%
echo FNight    = %FNight%
echo BFGorWRnd = %BFGorWRnd%

@jchoice
cls
echo    :: Debug Questions Pg3 ::
echo.
echo BFG       = %BFG%
echo BFGProm   = %BFGProm%
echo BFGRTer   = %BFGRTer%
echo RndWorld  = %RndWorld%
echo RndAC     = %RndAC%
echo RndACSap  = %RndACSap%
echo KepRndAC  = %KepRndAC%
echo RndACFr   = %RndACFr%
echo DisBas    = %DisBas%
@jchoice

goto EOF
:ERR
Echo Error calling Disply.bat
echo .
echo This should only be called from xcusetup.
@jchoice

:EOFC
set MC=
set MCL=
set UNam=
set r1=
set r2=
set Expl=
set PNam=
set Arm1=
set Arm2=
set UNav=
set TNam=
set BEnt=
set CPrk=
set SDec=
set LDec=
set TrNam=
set IName=
set I2Nam=
set Expl=
:EOF