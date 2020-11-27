@echo off
cd exe
rem --------------------------------------------------------------------------
rem .   sound.bat
rem .
rem .   This is a batch file to load the Gravis Ultrasound in Native mode.
rem .   And run the sound installer...
rem .
rem .   Author:         Ralph Thomas
rem .
rem .   Revision:       1.0     1/24/94
rem .                   1.1     2/7/94  Fixed to accomodate the loadpats
rem .                                   program detecting the GUS software
rem .                                   revision...
rem --------------------------------------------------------------------------

rem Detect card

IF "%ULTRADIR%"=="" goto NO_GRAVIS
GOTO GUS_LOAD 

:GUS_LOAD

rem --------------------------------------------------------------------------
rem If loadpats fails it means that the user has an old revision of the Gravis
rem software and will need to contact Gravis for an update to make this work...
rem --------------------------------------------------------------------------

loadpats
IF ERRORLEVEL 1 GOTO OLD_REVISION
goto RUN_GRAVIS

:OLD_REVISION

rem --------------------------------------------------------------------------
rem Set the environmental var to NULL so the sound installer will not "detect"
rem the Gravis
rem --------------------------------------------------------------------------

set ULTRASND=

cls
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ       Gravis Native Mode Installation Error         บ
echo ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo บ                                                     บ
echo บ  ERROR: Native Mode is not Supported by Revisions   บ
echo บ         of the Gravis Software Less Then 2.00       บ
echo บ                                                     บ
echo บ         Contact Gravis to Obtain an Update of       บ
echo บ         Their Software...                           บ
echo บ                                                     บ
echo บ          Voice (604) 431-5020                       บ
echo บ          Fax   (604) 431-5155                       บ
echo บ          BBS   (604) 431-5927 V32bis                บ
echo บ                                                     บ
echo บ          Compuserve: GO PCVENB (71333,350)          บ
echo บ          FidoNET: 1:153/978                         บ
echo บ          InterNET EMail: tech@gravis.com            บ
echo บ          SBCNET: 13:900/3                           บ
echo บ                                                     บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
pause
GOTO NO_GRAVIS

:RUN_GRAVIS
cls
sound.exe
cls
goto END

:NO_GRAVIS
cls
sound.exe
cls
goto END

:END
cd ..
