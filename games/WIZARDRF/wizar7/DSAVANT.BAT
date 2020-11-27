@echo off
cls
Moslowiz %1 ds
if ERRORLEVEL 30 goto err30
if ERRORLEVEL 29 goto err29
if ERRORLEVEL 28 goto err28
if ERRORLEVEL 27 goto err27
if ERRORLEVEL 26 goto err26
if ERRORLEVEL 25 goto err25
if ERRORLEVEL 24 goto err24
if ERRORLEVEL 23 goto err23
if ERRORLEVEL 22 goto err22
if ERRORLEVEL 21 goto err21
if ERRORLEVEL 20 goto err20
if ERRORLEVEL 19 goto err19
if ERRORLEVEL 18 goto err18
if ERRORLEVEL 17 goto err17
if ERRORLEVEL 16 goto err16
if ERRORLEVEL 15 goto err15
if ERRORLEVEL 14 goto err14
if ERRORLEVEL 13 goto err13
if ERRORLEVEL 12 goto err12
if ERRORLEVEL 11 goto err11
if ERRORLEVEL 10 goto err10
if ERRORLEVEL 9 goto err9
if ERRORLEVEL 8 goto err8
if ERRORLEVEL 7 goto err7
if ERRORLEVEL 6 goto err6
if ERRORLEVEL 5 goto err5
if ERRORLEVEL 4 goto err4
if ERRORLEVEL 3 goto err3
if ERRORLEVEL 2 goto err2
if ERRORLEVEL 1 goto err1
goto exitok

:err1
echo SYSTEM ERROR: Unable to Open SCENARIO.HDR
echo This usually means the game was not properly installed.
goto exitok

:err2 
echo SYSTEM ERROR: Graphics Mode Not Configured!
goto exitok

:err3
echo SYSTEM ERROR: Unable to Configure Graphics Mode
goto exitok

:err4
echo SYSTEM ERROR: Insufficient Conventional Memory.
echo This game needs 580K of Conventional Memory free.
echo Follow the instructions on the file:  CDSBOOT.TXT included
echo in the C:\DSAVANT directory.
goto exitok

:err5
echo SYSTEM ERROR: Unable to Load System Fonts
echo This usually means the game was not properly installed.
goto exitok

:err6
echo SYSTEM ERROR: Unable to Load Mouse Pointers
echo This usually means the game was not properly installed.
goto exitok

:err7
echo SYSTEM ERROR: Unable to Load BASE Graphics 
echo This usually means the game was not properly installed.
goto exitok

:err8
echo SYSTEM ERROR: Unable to Load System Headers
echo This usually means the game was not properly installed.
goto exitok

:err9
echo SYSTEM ERROR: Unable to Open MSG.DBS
goto exitok

:err10
echo SYSTEM ERROR: Unable to Open SCENARIO.DBS
echo This usually means the game was not properly installed.
goto exitok

:err11
echo SYSTEM ERROR: Unable to Open Sound File
echo This usually means the game was not properly installed.
goto exitok

:err12
echo SYSTEM ERROR: Insufficient Memory for Resident Sounds
goto exitok

:err13
echo SYSTEM ERROR: Insufficient Memory for Lists
goto exitok

:err14 
echo SYSTEM ERROR: Unable to Load MAIN Screen
echo This usually means the game was not properly installed.
goto exitok

:err15 
echo SYSTEM ERROR: Unable to Open Score
echo This usually means the game was not properly installed.
goto exitok

:err16 
echo SYSTEM ERROR: Unable to Open Patch Bank
goto exitok

:err17 
echo SYSTEM ERROR: Insufficient Memory for Score
goto exitok

:err18 
echo SYSTEM ERROR: Unable to Load ANIMATION 
goto exitok

:err19 
echo SYSTEM ERROR: Unable to Load PORTRAITS    
goto exitok

:err20 
echo SYSTEM ERROR: Unable to Re-Open SCENARIO.HDR
goto exitok

:err21 
echo Password Verification Error
goto exitok

:err22 
echo SYSTEM ERROR: Cache Index Overflow         
goto exitok

:err23 
echo SYSTEM ERROR: Insufficient Memory for Virtual Cache
goto exitok

:err24 
echo SYSTEM ERROR: Lost Virtual Cache!
goto exitok

:err25 
echo SYSTEM ERROR: Unable to Re-Open MSG.DBS     
goto exitok

:err26 
echo SYSTEM ERROR: Unable to Re-Open SCENARIO.DBS
goto exitok

:err27 
echo SYSTEM ERROR: Unable to Load MAZE Graphics
goto exitok

:err28 
echo SYSTEM ERROR: Unable to Load REVIEW Screen
goto exitok

:err29 
echo SYSTEM ERROR: Unable to Allocate Monster Memory!
goto exitok

:err30 
echo SYSTEM ERROR: Unknown Error - Please Report
goto exitok

:exitok
echo on

