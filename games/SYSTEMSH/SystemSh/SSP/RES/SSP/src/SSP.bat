::	This is the uncompiled version of SSP.exe
::
::	Copyright 2006-2010 by Nicolai Sandow (kolya@systemshock.org). 
::	Distributed under the terms of the GNU General Public License. 
::	The System Shock Portable launcher program is free software: 
::	you can redistribute it and/or modify it under the terms of 
::	the GNU General Public License as published by the Free Software Foundation, 
::	either version 3 of the License, or (at your option) any later version.
::	
::	The System Shock Portable launcher program  is distributed in the hope that 
::	it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
::	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::	GNU General Public License for more details.
::	
::	You should have received a copy of the GNU General Public License
::	along with the System Shock Portable launcher program.  
::	If not, see <http://www.gnu.org/licenses/>.
::
::	Note that the software distribution "System Shock Portable" contains work of several
::	other copyrightholders listed below. These works remain copyright of their respective
::	copyrightholders.
::
::	Data from the 1994 PC game "System Shock" 
::	Copyright by Looking Glass Technologies, Origin and Electronic Arts Entertainment.
::
::	Malba Tahan's mouselook modification
::	http://www.systemshock.org/index.php?topic=1719.0
::
::	Gigaquad's enhanced text modification (true2audio)
::
::	MOK's winXP fix for SS1
::	http://vogons.zetafleet.com
::	
::	Toxic Frog's high resolution patch for SS1
::	You might also be interested in his SS1 modding tools:
::	http://www.ttlg.com/forums/showthread.php?t=100333
::	
::	Dege's emulation of VESA BIOS Extensions 2.0, dgVOODOO
::	http://dege.freeweb.hu
::	
::	Squatina's com port error fix
::	
::	The DOSbox team's DOS emulation software
::	http://dosbox.sourceforge.net
::
::	Gulikoza's custom DOSbox build
::	http://www.si-gamer.net/gulikoza/
::
::	Thanks go to Nameless Voice, Vigil, Voodoo47, The Night Terror 
::	and everyone on www.systemshock.org and www.ttlg.com

::Setting up the window...
@echo off
COLOR 1F
mode con: cols=72 lines=26
::Init vars
SET sspver=1.2
SET showNTVDM=0
::Hey, which game is this?
TITLE SYSTEMSHOCK-Portable %sspver%                                                     %date% %time:~0,5%
::Delete the CYB.CFG clones that cdshock.produces when CYB.CFG is write protected
IF EXIST ./RES/AA????.TMP ( DEL /Q RES\AA????.TMP )

::-----------------------------------------------------------------------
:SPLASH
ECHO.
ECHO   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
ECHO   MP""""""`MMM""MMMM""MMP""""""`MMM""""""""MMM""""""""`MM"""""`'"""`YM
ECHO   M  mmmmm..MM. `MM' .MM  mmmmm..MMmmm  mmmMMM  mmmmmmmMM  mm.  mm.  M
ECHO   M.      `YMMM.    .MMM.      `YMMMMM  MMMMM`      MMMMM  MMM  MMM  M
ECHO   MMMMMMM.  MMMMb  dMMMMMMMMMM.  MMMMM  MMMMMM  MMMMMMMMM  MMM  MMM  M
ECHO   M. .MMM'  MMMMM  MMMMM. .MMM'  MMMMM  MMMMMM  MMMMMMMMM  MMM  MMM  M
ECHO   Mb.     .dMMMMM  MMMMMb.     .dMMMMM  MMMMMM        .MM  MMM  MMM  M
ECHO   MP""""""`MMM""MMMMM""MMMMP"""""YMMMM'""""'YMMM""MMMMM""MMMMMMMMMMMMM
ECHO   M  mmmmm..MM  MMMMM  MMM' .mmm. `MM' .mmm. `MM  MMMM' .MMMMMMMMMMMMM
ECHO   M.      `YMM         `MM  MMMMM  MM  MMMMMooMM       .MMMMMMMMMMMMMM
ECHO   MMMMMMM.  MM  MMMMM  MMM  MMMMM  MM  MMMMMMMMM  MMMb. YMMMMMMMMMMMMM
ECHO   M. .MMM'  MM  MMMMM  MMM. `MMM' .MM. `MMM' .MM  MMMMb  MMMMMMMMMMMMM
ECHO   Mb.     .dMM  MMMMM  MMMMb     dMMMM.     .dMM  MMMMM  MMMMMMMMMMMMM
ECHO   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
ECHO   MM"""""""`YM                    dP           dP       dP          MM
ECHO   MM  mmmmm  M                    88           88       88          MM
ECHO   M'        .M .d8888b. 88d888b.d8888P.d8888b. 88d888b. 88 .d8888b. MM
ECHO   MM  MMMMMMMM 88'  `88 88'  `88  88  88'  `88 88'  `88 88 88ooood8 MM
ECHO   MM  MMMMMMMM 88.  .88 88        88  88.  .88 88.  .88 88 88.  ... MM
ECHO   MM  MMMMMMMM `88888P' dP        dP  `88888P8 88Y8888' dP `88888P' MM
ECHO   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
::-----------------------------------------------------------------------

::Let's check for NTVDM
IF EXIST %windir%/system32/NTVDM.exe ( 
set showNTVDM=1
TITLE SYSTEMSHOCK-Portable %sspver% on NTVDM enabled system
ECHO.
ECHO   Welcome back, %username%. NTVDM was detected on this system. 
ECHO.
) else (
TITLE SYSTEMSHOCK-Portable %sspver% on DOSbox
ECHO.
ECHO   Welcome back, %username%. SHODAN is waiting for you.
ECHO.
)
jchoice
REM SET target=main
REM SET delay=1
REM GOTO WAIT

::-----------------------------------------------------------------------

:MAIN
CLS
COLOR 1F
ECHO.
ECHO          ษอออออออออออออป
ECHO          บ  Main Menu  บ 
ECHO          ศอออออออออออออผ  
ECHO.
IF %showNTVDM% GEQ 1 ( 
ECHO  d: Start SSP with DGVESA 
::Mouselook and Mouse2kv are incompatible
IF NOT EXIST ./RES/SSP/flags/mouselook_enabled (
ECHO  k: Start SSP with Mouse2kv
))
IF EXIST ./RES/SSP/flags/dosbox_enabled ( ECHO  b: Start SSP in the Official DOSbox )
IF EXIST ./RES/SSP/flags/gulikoza_enabled ( ECHO  b: Start SSP in Gulikoza^'s DOSbox build ) 

IF "%username%"=="Kolya" (
::Only for me
ECHO  p: DOS command reference 
) 
ECHO  o: Options
ECHO  i: Information
ECHO  q: Quit
ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="d" GOTO VESA
if "%choice%"=="k" GOTO MOUSE2KV
if "%choice%"=="b" GOTO DOSBOX
if "%choice%"=="p" GOTO DOSCMD
if "%choice%"=="o" GOTO OPTIONS
if "%choice%"=="i" GOTO INFO
if "%choice%"=="q" GOTO EOF
ECHO.
ECHO "%choice%" is not a valid choice. Please try again.
jchoice
GOTO MAIN

:VESA
START "" /d RES vesa.pif
IF EXIST ./RES/SSP/flags/affinity_1 ( START "" /d RES affinity.exe -a ntvdm.exe 01 )
GOTO EOF
::This part below is done in vesa.exe  
REM IF EXIST "%VDMSPath%/dosdrv.exe" (
REM IF EXIST ./RES/SSP/flags/auto_cyb (
REM COPY /A /V /Y RES\CYB.CFG RES\SED\CYB.CFG~TEMP >nul
REM CD RES/SED
REM sed.exe -e "s:digi_list.*:digi_list 3:g" -e "s:digi_card.*:digi_card 3:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
REM CD ../..
REM ATTRIB -R RES\CYB.CFG
REM COPY /A /V /Y RES\SED\CYB.CFG RES\CYB.CFG >nul
REM ATTRIB +R RES\CYB.CFG
REM DEL RES\SED\CYB.CFG~TEMP
REM DEL RES\SED\CYB.CFG
REM )
REM dosdrv.exe "-i:./RES/vdms.ini" >nul
REM ) ELSE (
REM IF EXIST ./RES/SSP/flags/auto_cyb (
REM COPY /A /V /Y RES\CYB.CFG RES\SED\CYB.CFG~TEMP >nul
REM CD RES/SED
REM sed.exe -e "s:digi_list.*:digi_list 10:g" -e "s:digi_card.*:digi_card 1:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
REM CD ../..
REM ATTRIB -R RES\CYB.CFG
REM COPY /A /V /Y RES\SED\CYB.CFG RES\CYB.CFG >nul
REM ATTRIB +R RES\CYB.CFG
REM DEL RES\SED\CYB.CFG~TEMP
REM DEL RES\SED\CYB.CFG
REM ))
REM CD RES
REM REM dgvesa
REM REM cdshock
REM IF EXIST ./RES/SSP/flags/affinity_1 ( START "" /d RES affinity.exe -a ntvdm.exe 01 )
REM GOTO EOF

:MOUSE2KV
::Unfortunately the compiled version of mouse.exe never works...
::So we have to do it here and miss out on setting the memory with a PIF
REM START "" /d RES mouse.pif
REM IF EXIST ./RES/SSP/flags/affinity_1 ( START "" /d RES affinity.exe -a ntvdm.exe 01 )
REM GOTO EOF

::Using SED to set some values in CYB.CFG
IF EXIST "%VDMSPath%/dosdrv.exe" (
IF EXIST ./RES/SSP/flags/auto_cyb (
COPY /A /V /Y RES\CYB.CFG RES\SED\CYB.CFG~TEMP >nul
CD RES/SED
sed.exe -e "s:digi_list.*:digi_list 3:g" -e "s:digi_card.*:digi_card 3:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
CD ../..
ATTRIB -R RES\CYB.CFG
COPY /A /V /Y RES\SED\CYB.CFG RES\CYB.CFG >nul
ATTRIB +R RES\CYB.CFG
DEL RES\SED\CYB.CFG~TEMP
DEL RES\SED\CYB.CFG
)
dosdrv.exe "-i:./RES/vdms.ini" >nul
) ELSE (
IF EXIST ./RES/SSP/flags/auto_cyb (
COPY /A /V /Y RES\CYB.CFG RES\SED\CYB.CFG~TEMP >nul
CD RES/SED
sed.exe -e "s:digi_list.*:digi_list 10:g" -e "s:digi_card.*:digi_card 1:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
CD ../..
ATTRIB -R RES\CYB.CFG
COPY /A /V /Y RES\SED\CYB.CFG RES\CYB.CFG >nul
ATTRIB +R RES\CYB.CFG
DEL RES\SED\CYB.CFG~TEMP
DEL RES\SED\CYB.CFG
))
CD RES
IF EXIST ./SSP/flags/640x480 ( MOUSE2KV.exe 640 480 8 8 cdshock.exe )
IF EXIST ./SSP/flags/800x600 ( MOUSE2KV.exe 800 600 8 8 cdshock.exe )
IF EXIST ./SSP/flags/1024x768 ( MOUSE2KV.exe 1024 768 8 8 cdshock.exe )
::Mouselook and Mouse2kv are incompatible, but hey, try it yourself
IF EXIST ./SSP/flags/mouselook_enabled ( MOUSE2KV.exe 640 480 8 8 cdshock.exe )
IF EXIST ./RES/SSP/flags/affinity_1 ( START "" /d RES affinity.exe -a ntvdm.exe 01 )
GOTO EOF

:DOSBOX 
::Using SED to set some digi sound values in CYB.CFG for dosbox
IF EXIST ./RES/SSP/flags/auto_cyb (
COPY /A /V /Y RES\CYB.CFG RES\SED\CYB.CFG~TEMP >nul
CD RES/SED
sed.exe -e "s:digi_list.*:digi_list 0:g" -e "s:digi_card.*:digi_card 3:g" -e "s:digi_irq.*:digi_irq 7:g" <CYB.CFG~TEMP >CYB.CFG
CD ../..
ATTRIB -R RES\CYB.CFG
COPY /A /V /Y RES\SED\CYB.CFG RES\CYB.CFG >nul
ATTRIB +R RES\CYB.CFG
DEL RES\SED\CYB.CFG~TEMP
DEL RES\SED\CYB.CFG
)
::And which dosbox should we use?
IF EXIST ./RES/SSP/flags/dosbox_enabled ( START "" /d RES\dosbox dosbox.exe )
IF EXIST ./RES/SSP/flags/gulikoza_enabled ( START "" /d RES\gulikoza dosbox.exe )
GOTO EOF

:DOSCMD
::Show me your commands, baby
%windir%\hh.exe ms-its:c:\Windows\Help\ntcmds.chm::/ntcmds.htm
GOTO EOF

:OPTIONS
CLS
COLOR 1F
ECHO.
ECHO          ษอออออออออออออป
ECHO          บ   Options   บ 
ECHO          ศอออออออออออออผ  
ECHO.

::Show toggle for Malba's mod
IF EXIST ./RES/SSP/flags/mouselook_enabled (
ECHO  e: Disable Malba Tahan's mouselook mod
) ELSE (
ECHO  e: Enable Malba Tahan's mouselook mod
)

::Show toggle for the enhanced text mod
IF EXIST ./RES/SSP/flags/enhanced_text_enabled (
ECHO  t: Disable Gigaquad's true2speech text mod
) ELSE (
ECHO  t: Enable Gigaquad's true2speech text mod
)


::Show toggle for scaled up object textures mod
IF EXIST ./RES/SSP/flags/scaled_object_textures_enabled (
ECHO  p: Disable Gigaquad's scaled object textures mod
) ELSE (
ECHO  p: Enable Gigaquad's scaled object textures mod
)

::Show toggle for changing between original dosbox and gulikoza's build
IF EXIST ./RES/SSP/flags/gulikoza_enabled (
ECHO  b: Use Official DOSbox build
) ELSE (
ECHO  b: Use Gulikoza's custom DOSbox build
)

::Show VDMSound toggle only for OSs that have an NTVDM
::While NT has an NTVDM, VDMS is not compatible with NT
IF %showNTVDM% GEQ 1 (
IF EXIST "%VDMSPath%/dosdrv.exe" (
ECHO  u: VDMSound is installed. SFX will be stereo.
) ELSE (
ECHO  u: Install VDMSound
))

::Show DGVESA settings only for OSs that have an NTVDM
IF %showNTVDM% GEQ 1 (
ECHO  v: Change DGVESA-settings ^(Check ^"Platform: DOS^" on the pop-up^)
IF EXIST ./RES/SSP/flags/affinity_1 (
ECHO  a: Run NTVDM process affinity at system default
) ELSE (
ECHO  a: Limit NTVDM process affinity to the 1st CPU
))

::Malba's mouselook mod has it's own ingame resolution settings
IF NOT EXIST ./RES/SSP/flags/mouselook_enabled (
IF NOT EXIST ./RES/SSP/flags/800x600 (
ECHO  8: Enable 800x600 resolution
)
IF NOT EXIST ./RES/SSP/flags/1024x768 (
ECHO  1: Enable 1024x768 resolution
)
IF NOT EXIST ./RES/SSP/flags/640x480 (
ECHO  6: Restore 640x480 resolution
))

::So you wanna edit the config files?
ECHO  c: Config edit menu

::If there's no NTVDM many options that require it are not shown
::But don't just take my word for it
IF %showNTVDM% LEQ 0 (
ECHO  d: Disregard determined OS
) 
IF %showNTVDM% EQU 2 (
ECHO  d: Heed determined OS
)

ECHO  m: Main menu
ECHO  i: Information
ECHO  q: Quit
ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="e" GOTO XDSHOCK
if "%choice%"=="t" GOTO ENHANCEDTEXT
if "%choice%"=="p" GOTO SCALEDTEXTURES
if "%choice%"=="b" GOTO GULIKOZA
if "%choice%"=="u" GOTO VDMS
if "%choice%"=="v" GOTO VESASET
if "%choice%"=="a" GOTO AFFINITY
if "%choice%"=="8" GOTO 800x600
if "%choice%"=="1" GOTO 1024x768
if "%choice%"=="6" GOTO 640x480
if "%choice%"=="c" GOTO CFGEDIT
if "%choice%"=="d" GOTO FORCESHOWNTVDM
if "%choice%"=="m" GOTO MAIN
if "%choice%"=="i" GOTO INFO
if "%choice%"=="q" GOTO EOF
ECHO.
ECHO "%choice%" is not a valid choice. Please try again.
jchoice
GOTO OPTIONS

:XDSHOCK 
::Toggle mouselook mod
IF EXIST ./RES/SSP/flags/mouselook_enabled (
DEL .\RES\SSP\flags\mouselook_enabled
DEL .\RES\dos4gw.exe
START /d RES 7za.exe x -y SSP/mods/SSP/mods/640x480.7z
ECHO flag >> RES/SSP/flags/640x480
CLS
ECHO.
ECHO  Mouselook mod was disabled.
ECHO  Resolution has been reset to 640x480.
ECHO.
jchoice
) ELSE (
IF EXIST ./RES/SSP/flags/1024x768 ( DEL .\RES\SSP\flags\1024x768 )
IF EXIST ./RES/SSP/flags/800x600 ( DEL .\RES\SSP\flags\800x600 )
IF EXIST ./RES/SSP/flags/640x480 ( DEL .\RES\SSP\flags\640x480 )
ECHO flag >> RES/SSP/flags/mouselook_enabled
START /d RES 7za.exe x -y SSP/mods/xcdshock.7z
CLS
ECHO.
ECHO  Mouselook mod has been enabled.
ECHO  Press 'e' in game to use mouselook.
ECHO.
ECHO  Higher resolutions are also set in game by pressing:
ECHO  ESC - Options - Video - Video Mode 
ECHO.
ECHO  Note that Mouse2kv mode is incompatible with Mouselook mod and 
ECHO  therefor will not be available.
ECHO.
jchoice
)
GOTO OPTIONS

:ENHANCEDTEXT 
:::Toggle enhanced text mod
IF EXIST ./RES/SSP/flags/enhanced_text_enabled (
DEL .\RES\SSP\flags\enhanced_text_enabled
START /d RES 7za.exe x -y SSP/mods/text_original.7z
CLS
ECHO.
ECHO  Original log file texts have been restored.
ECHO.
jchoice
) ELSE (
ECHO flag >> RES/SSP/flags/enhanced_text_enabled
START /d RES 7za.exe x -y SSP/mods/text_enhanced.7z
CLS
ECHO.
ECHO  Gigaquad's enhanced text mod has been enabled.
ECHO  Log file texts will be true to the speech heard.
ECHO.
jchoice
)
GOTO OPTIONS

:SCALEDTEXTURES 
:::Toggle scaled up object textures
IF EXIST ./RES/SSP/flags/scaled_object_textures_enabled (
DEL .\RES\SSP\flags\scaled_object_textures_enabled
START /d RES 7za.exe x -y SSP/mods/citmat.7z
CLS
ECHO.
ECHO  Original object textures have been restored.
ECHO.
jchoice
) ELSE (
ECHO flag >> RES/SSP/flags/scaled_object_textures_enabled
START /d RES 7za.exe x -y SSP/mods/citmat_scaled.7z
CLS
ECHO.
ECHO  Gigaquad's scaled up object textures mod has been enabled.
ECHO.
jchoice
)
GOTO OPTIONS

:GULIKOZA
::Toggle official/gulikoza dosbox
IF EXIST ./RES/SSP/flags/gulikoza_enabled (
DEL .\RES\SSP\flags\gulikoza_enabled
ECHO flag >> RES/SSP/flags/dosbox_enabled
CLS
ECHO.
ECHO  Official DOSbox version will be used.
ECHO.
jchoice
) ELSE (
DEL .\RES\SSP\flags\dosbox_enabled
ECHO flag >> RES/SSP/flags/gulikoza_enabled
CLS
ECHO.
ECHO  Gulikoza's custom DOSbox build will be used.
ECHO.
jchoice
)
GOTO OPTIONS


:VDMS
::Yay! VDMSound is already installed.
CLS
ECHO.
ECHO  VDMSound allows stereo sound effects in DGVESA ^& Mouse2kv modes.
IF EXIST "%VDMSPath%/dosdrv.exe" (
ECHO  VDMSound was detected on the system. SFX will be stereo.
ECHO.
jchoice
) ELSE (
GOTO NOVDMS
)
GOTO OPTIONS

:NOVDMS
::If there's no VDMSound, offer to install it 
CLS
ECHO.
ECHO  VDMSound was NOT found on the system. SFX will be mono. 
ECHO  If you just installed VDMSound, please reboot.
ECHO  Do not install on Windows NT.  
ECHO.
ECHO  i: Install VDMSound now.
ECHO  Any other key: Go back to the options menu.
ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="i" GOTO VDMSINST
GOTO OPTIONS

:VDMSINST
START "" /d RES VDMSound2.1.0.exe
GOTO EOF

:AFFINITY
::Toggle affinity mask for NTVDM.exe
::Actually we're just setting a flag which will be checked at runtime
IF EXIST ./RES/SSP/flags/affinity_1 (
DEL .\RES\SSP\flags\affinity_1
CLS
ECHO.
ECHO  NTVDM process affinity mask has been restored to system default.  
ECHO.
jchoice
) ELSE (
ECHO flag >> RES\SSP\flags\affinity_1
CLS
ECHO.
ECHO  NTVDM process affinity mask has been set to the first processor.
ECHO.
jchoice
)
GOTO OPTIONS

:VESASET
::Change some VESA settings
START "" /d RES dgVoodooSetup.exe
GOTO OPTIONS

:800x600
START /d RES 7za.exe x -y SSP/mods/800x600.7z
IF EXIST ./RES/SSP/flags/mouselook_enabled ( DEL .\RES\SSP\flags\mouselook_enabled )
IF EXIST ./RES/SSP/flags/1024x768 ( DEL .\RES\SSP\flags\1024x768 )
IF EXIST ./RES/SSP/flags/640x480 ( DEL .\RES\SSP\flags\640x480 )
ECHO flag >> RES/SSP/flags/800x600
CLS
ECHO.
ECHO  800x600 resolution set.
ECHO.
jchoice
GOTO OPTIONS

:1024x768 
START /d RES 7za.exe x -y SSP/mods/1024x768.7z
IF EXIST ./RES/SSP/flags/mouselook_enabled ( DEL .\RES\SSP\flags\mouselook_enabled )
IF EXIST ./RES/SSP/flags/800x600 ( DEL .\RES\SSP\flags\800x600 )
IF EXIST ./RES/SSP/flags/640x480 ( DEL .\RES\SSP\flags\640x480 )
ECHO flag >> RES/SSP/flags/1024x768
CLS
ECHO.
ECHO  1024x768 resolution set.
ECHO.
jchoice
GOTO OPTIONS

:640x480 
START /d RES 7za.exe x -y SSP/mods/640x480.7z
IF EXIST ./RES/SSP/flags/mouselook_enabled ( DEL .\RES\SSP\flags\mouselook_enabled )
IF EXIST ./RES/SSP/flags/800x600 ( DEL .\RES\SSP\flags\800x600 )
IF EXIST ./RES/SSP/flags/1024x768 ( DEL .\RES\SSP\flags\1024x768 )
ECHO flag >> RES/SSP/flags/640x480
CLS
ECHO.
ECHO  Original 640x480 resolution reset.
ECHO.
jchoice
GOTO OPTIONS

::------------------------------------------------------
:CFGEDIT
::Edit config files or run the original installer
CLS
ECHO.
ECHO          ษออออออออออออออออออออป
ECHO          บ  Config Edit Menu  บ 
ECHO          ศออออออออออออออออออออผ  
ECHO.
IF EXIST ./RES/SSP/flags/mouselook_enabled ( ECHO  e: Edit XCYB.CFG ^(mouselook mod settings ^& key binds^) )
IF EXIST ./RES/SSP/flags/dosbox_enabled ( ECHO  b: Edit official dosbox.conf )
IF EXIST ./RES/SSP/flags/gulikoza_enabled ( ECHO  b: Edit Gulikoza dosbox.conf )
ECHO  c: Edit CYB.CFG
ECHO  i: Original installer
ECHO  m: Main menu
ECHO  o: Options
ECHO  q: Quit
ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="e" GOTO EDITXCYBCFG
if "%choice%"=="b" GOTO EDITDOSBOXCONF
if "%choice%"=="c" GOTO EDITCYBCFG
if "%choice%"=="i" GOTO ORIINST
if "%choice%"=="m" GOTO MAIN
if "%choice%"=="o" GOTO OPTIONS
if "%choice%"=="q" GOTO EOF
ECHO.
ECHO "%choice%" is not a valid choice. Please try again.
jchoice
GOTO CFGEDIT

:EDITXCYBCFG
START "" notepad RES/XCYB.cfg
GOTO CFGEDIT

:EDITDOSBOXCONF
::Which dosbox will it be? 
IF EXIST ./RES/SSP/flags/dosbox_enabled (
START "" notepad RES/dosbox/dosbox.conf
)
IF EXIST ./RES/SSP/flags/gulikoza_enabled (
START "" notepad RES/gulikoza/dosbox.conf
)
GOTO CFGEDIT

::----------------------------------
:EDITCYBCFG
CLS
ECHO.
IF EXIST ./RES/SSP/flags/auto_cyb (
ECHO  Please note that SSP writes a few audio settings ^(digi_list,
ECHO  digi_irq, digi_card^) to CYB.CFG during game startup that 
ECHO  depend on whether VDMSound is installed and how the game is
ECHO  started ^(DGVESA, Mouse2kv, DOSbox^).
ECHO  You can disable SSP's automatic settings below. ^(Not recommended.^)
) ELSE ( 
ECHO  SSP's automatic audio settings are disabled. 
)
ECHO.
ECHO  CYB.CFG is usually write protected to save the language setting 
ECHO  which the game otherwise resets to English. 
ECHO.
ECHO  r: remove write protection
ECHO  e: edit CYB.CFG
ECHO  s: set write protection
IF EXIST ./RES/SSP/flags/auto_cyb ( 
ECHO  x: Disable SSP's automatic settings
) ELSE ( 
ECHO  x: Enable SSP's automatic settings and reset CYB.CFG 
)
ECHO  m: Main menu
ECHO  o: Options
ECHO  c: Config edit menu
ECHO  q: Quit

ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="r" GOTO UNPRTCYBCFG
if "%choice%"=="s" GOTO WPRTCYBCFG
if "%choice%"=="e" GOTO EDCYBCFG
if "%choice%"=="x" GOTO AUTOCYB
if "%choice%"=="m" GOTO MAIN
if "%choice%"=="o" GOTO OPTIONS
if "%choice%"=="c" GOTO CFGEDIT
if "%choice%"=="q" GOTO EOF
ECHO.
ECHO "%choice%" is not a valid choice. Please try again.
jchoice

:UNPRTCYBCFG
ATTRIB -R RES\CYB.CFG >nul
CLS
ECHO.
ECHO  CYB.CFG is writable now.
ECHO.
jchoice
GOTO EDITCYBCFG

:WPRTCYBCFG
ATTRIB +R RES\CYB.CFG >nul
CLS
ECHO.
ECHO  CYB.CFG is write protected now.
ECHO.
jchoice
GOTO EDITCYBCFG

:EDCYBCFG
START "" notepad RES/CYB.cfg
GOTO EDITCYBCFG

:AUTOCYB
CLS
IF EXIST ./RES/SSP/flags/auto_cyb (
DEL .\RES\SSP\flags\auto_cyb
ECHO.
ECHO  SSP will not make automatic adjustments to CYB.CFG any more.  
ECHO.
jchoice
) ELSE (
START /d RES 7za.exe x -y SSP/mods/DEFAULT.CYB.CFG.7z
ECHO flag >> RES\SSP\flags\auto_cyb
ECHO.
ECHO  CYB.CFG has been reset.
ECHO  SSP will make automatic adjustments for best performance.
ECHO.
jchoice
)
GOTO EDITCYBCFG
::----------------------------------

:ORIINST
::By rare request... :/
CLS
ECHO.
ECHO  The original installer is provided here so you can create 
ECHO  your own CYB.CFG file and compare e.g. the sound settings 
ECHO  with the ones used in SSP.
ECHO  For the installer to run it needs to be in a DOS compatible
ECHO  path. If the installer doesn't run now, copy the folder "INST"
ECHO  from SHOCK/RES/INST to C:/INST and run INSTALL.EXE there.
ECHO  Note that the sound tests will not work.
ECHO.  
jchoice
START "" RES/INST/INSTALL.EXE
GOTO CFGEDIT

:FORCESHOWNTVDM
::You don't have to trust me, feel free to see all the options that are useless to you!
IF %showNTVDM% LEQ 0 (
SET showNTVDM=2
TITLE SYSTEMSHOCK-Portable %sspver%, forced disregarding OS
CLS
ECHO.
ECHO  Some game modes ^(DGVESA ^& Mouse2kv^) require the
ECHO  Windows NT Virtual DOS machine ^(NTVDM^) to run^.
ECHO  These game modes are now available in the main menu^.
ECHO.
ECHO  Note that your OS ^(%win_name%^) does not have the NTVDM
ECHO  and the game will not run in these modes on your system^. 
ECHO.
jchoice
GOTO OPTIONS
) 
IF %showNTVDM% EQU 2 (
SET showNTVDM=0
TITLE SYSTEMSHOCK-Portable on %win_name%
CLS
ECHO.
ECHO  Incompatible game modes hidden^.
::Hate to say I told you so. 
ECHO.
jchoice
GOTO OPTIONS
)


::-----------------------------------------------------------------------

:INFO
CLS
ECHO.
ECHO          ษอออออออออออออป
ECHO          บ  Info Menu  บ 
ECHO          ศอออออออออออออผ  
ECHO.
ECHO  z: Game start help
ECHO  c: Game controls
ECHO  l: I cannot beat the final boss!
ECHO  x: About SSP's startup modes
ECHO  r: About resolution settings
ECHO  w: Running the game in a window
ECHO  v: Screenshots and videos
IF %showNTVDM% GEQ 1 ( ECHO  u: About VDMSound )
ECHO  f: Playing in French or German
ECHO  s: Visit Systemshock.org for updates and French/German support.
ECHO  a: Cast SHODAN.
ECHO  m: Main menu
ECHO  o: Options
ECHO  q: Quit
ECHO.
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="z" GOTO SINFO
if "%choice%"=="c" GOTO CONTROLSINFO
if "%choice%"=="l" GOTO WINFO
if "%choice%"=="x" GOTO MODESINFO
if "%choice%"=="r" GOTO RESINFO
if "%choice%"=="w" GOTO WINDOWEDINFO
if "%choice%"=="v" GOTO SHOTSINFO
if "%choice%"=="u" GOTO VDMSINFO
if "%choice%"=="f" GOTO FRENGERINFO
if "%choice%"=="s" GOTO SMA
if "%choice%"=="a" GOTO HACKER
if "%choice%"=="m" GOTO MAIN
if "%choice%"=="o" GOTO OPTIONS
if "%choice%"=="q" GOTO EOF
echo.
ECHO "%choice%" is not a valid choice. Please try again.
jchoice
GOTO INFO

:SINFO
CLS
ECHO.
ECHO  Due to different resolutions the cursor might move quite fast 
ECHO  on the game's start menu screen and the gameplay options screen.
ECHO.
ECHO  After choosing your name and gameplay options, the game begins 
ECHO  with an interface-help screen. When you're ready, hit SPACE to 
ECHO  continue.
ECHO.
ECHO  In the game hit the ESC-key and click Options - Video - Video Mode. 
ECHO  Choose your resolution. To change the interface to fullscreen mode 
ECHO  click on the square button on the left upper side. 
ECHO. 
ECHO  Finally press ESC again to find the save game menu. 
ECHO  Saving the game also saves the settings. 
ECHO. 
jchoice
GOTO INFO

:CONTROLSINFO
CLS
ECHO.
ECHO  Read the included SSReferenceCard.pdf to learn the controls.
ECHO  Keybinds and mouse sensitivity can be changed after enabling 
ECHO  Malba's mouselook mod in the Options menu. 
ECHO  Next choose the Config edit menu and edit XCYB.CFG. 
ECHO.
jchoice
GOTO INFO

:WINFO
CLS
ECHO.
ECHO  Keep shooting even when she has filled the screen. 
ECHO  Use the Recall-Software. ^(Tip by kodan50^)
ECHO  If none of that helps, there is a processor slow-down program
ECHO  included ^(in RES/Speedset^). Do you want to start this program now?
ECHO.
ECHO  y/n
set choice=
set /p choice=
if not "%choice%"=="" set choice=%choice:~0,1%
if "%choice%"=="y" GOTO SPEEDSET
GOTO INFO

:SPEEDSET
CLS
START "Speedset" /d RES\Speedset cmd /K speedset.exe
ECHO.
ECHO  To set your processor speed, in the window that just popped up type:
ECHO  speedset speed 
ECHO  ...where speed is a number between 100.0 (fastest) and -100.0 
ECHO  (slowest).
ECHO  Leave the Speedset window open, start the game and load your save 
ECHO  game. If you want to disable Speedset, type EXIT in it's window.
ECHO.
jchoice
GOTO MAIN

:MODESINFO
CLS
ECHO.
ECHO  There are 3 modes to start SYSTEMSHOCK-Portable. 
ECHO  Depending on your operating system and game modifications not all 
echo  modes may be available.
ECHO.
ECHO  1. DGVESA emulates the grafic mode: VESA BIOS Extensions 2.0.
ECHO  This mode requires the NT Virtual DOS Machine (NTVDM) available
ECHO  only on Windows XP, Windows 2000, Windows NT, Windows Server 2003.
ECHO.
ECHO  2. Mouse2kv mode leaves VESA up to your hardware and only 
ECHO  adjusts mouse speed. It requires the NTVDM as well. 
ECHO  It is incompatible with the Mouselook mod and therefor will not show
ECHO  in the main menu when Mouselook mod is enabled in the Options menu.
ECHO.
ECHO  3. DOSbox emulates a DOS environment. It is the only way to run
ECHO  the game on later Windows versions like Vista and Windows 7. 
echo  There are two versions of DOSbox available: The official build and 
echo  Gulikoza^'s custom build.
ECHO  When finished playing leave DOSbox by typing "exit".
ECHO. 
jchoice
GOTO INFO

:RESINFO
CLS
ECHO.
ECHO  If you are playing with Malba Tahan's mouselook mod enabled, all
ECHO  available resolutions can be set in the game by pressing ESC then 
ECHO  clicking: Options - Video - Video Mode.
ECHO. 
ECHO  Without this mod you have to enable your preferred resolution from
ECHO  the Options menu first and then set it in game as described above.
ECHO.
jchoice
GOTO INFO

:WINDOWEDINFO
CLS
ECHO.
IF %showNTVDM% GEQ 1 ( 
ECHO  To run the game in a window in DGVESA mode open the DGVESA 
ECHO  configuration from the Options menu. 
ECHO  Choose "Platform: DOS" on the popup. On the Global tab, change the 
ECHO  screen mode to "Windowed mode".
)
ECHO  To run the game in a window in DOSbox mode go to the Options menu, 
ECHO  then choose the Config edit menu and edit the file dosbox.conf from
ECHO  there. Change the line ^"fullscreen^=true^" to ^"fullscreen^=false^".
ECHO.
jchoice
GOTO INFO

:SHOTSINFO
CLS
ECHO.
IF %showNTVDM% GEQ 1 ( 
ECHO  The native screenshot function only works in Mouse2kv mode.
ECHO  Hit the [Prt Scrn] key. A message will appear onscreen saying 
ECHO  ^"SHOCKxxx.GIF SAVED^" where x is the number of the screenshot. 
ECHO  You can find these screenshots in SHOCK/RES/GEN.
ECHO.
)
ECHO  In DOSbox you can record videos. To start recording press CTRL-ALT-F5.
ECHO  Press CTRL-ALT-F5 again to stop. You can find the videos in 
ECHO  SHOCK/RES/GEN. You may need to install the zmbv-codec to play them. 
ECHO  Go to SHOCK/GEN/zmbv_codec, rightclick zmbv.inf and choose install.
ECHO.
jchoice
GOTO INFO

:VDMSINFO
CLS
ECHO.
ECHO  VDMSound is a DOS sound emulation software. It is not necessary to 
ECHO  install VDMSound to play, but if you run System Shock outside of a 
ECHO  DOSbox emulation, you will get stereo SFX and an overall better sound 
ECHO  quality with it. If you don't have VDMSound installed but could use 
ECHO  it on your system you will see according info in the Options menu and
ECHO  can install VDMSound from there.
ECHO.
ECHO  Please install VDMSound while logged into the same Windows account 
ECHO  you want to play SSP in. After the installation reboot your system. 
ECHO  Note that VDMSound has been integrated in DOSbox, so installing it 
ECHO  when you run SSP in DOSbox, will do nothing.
ECHO.
jchoice
GOTO INFO

:FRENGERINFO
CLS
ECHO.
ECHO  System Shock was originally released trilingual but the German and 
ECHO  French files have been stripped from SSP to make it smaller. 
ECHO  You can download the language files at Systemshock.org. 
ECHO.
jchoice
GOTO INFO

:SMA
START http://www.systemshock.org/index.php?topic=211.0
GOTO INFO

:TTLG
START http://www.ttlg.com/forums/showthread.php?t=107149
GOTO INFO

:HACKER
START "Look at you %username%!" /wait /min /d RES\SSP\snd madplay.exe test.mp3
GOTO INFO



::-----------------------------------------------------------------------

:WAIT
::Buy us some time by pinging the localhost
@ping 127.0.0.1 -n 2 -w 1000 > nul
@ping 127.0.0.1 -n %delay% -w 1000> nul
GOTO %target%

::-----------------------------------------------------------------------

:EOF
::Good night, hacker.
EXIT