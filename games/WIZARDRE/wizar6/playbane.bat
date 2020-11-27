echo off
cls
wroot
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
goto exitok

:err2 
echo SYSTEM ERROR: Graphics Mode Not Configured!
goto exitok

:err3
echo SYSTEM ERROR: Unable to Load System Fonts
goto exitok

:err4
echo SYSTEM ERROR: Unable to Load MAZEDATA
goto exitok

:err5
echo SYSTEM ERROR: Illegal Graphic Mode for Hardware!
goto exitok

:err6
echo SYSTEM ERROR: Unable to Load System Headers
goto exitok

:err7
echo SYSTEM ERROR: Unable to Open MSG.DBS
goto exitok

:err8
echo SYSTEM ERROR: Unable to Open SCENARIO.DBS
goto exitok

:err9
echo SYSTEM ERROR: Unable to Open PICTURE
goto exitok

:err10
echo SYSTEM ERROR: Unable to Open SOUND
goto exitok

:err11
echo SYSTEM ERROR: Insufficient Memory for Window or Residents
goto exitok

:err12 
echo SYSTEM ERROR: Unable to Load TitlePage 
goto exitok

:err13 
echo SYSTEM ERROR: Unable to Load DragonScreen
goto exitok

:err14 
echo SYSTEM ERROR: Unable to Load PORTRAITS    
goto exitok

:err15 
echo SYSTEM ERROR: Unable to Load SOUND         
goto exitok

:err16 
echo SYSTEM ERROR: Insufficient Memory for Sound 
goto exitok

:err17 
echo SYSTEM ERROR: Unable to Re-Open MSG.DBS     
goto exitok

:err18 
echo SYSTEM ERROR: Unable to Re-Open SCENARIO.DBS
goto exitok

:err19 
echo SYSTEM ERROR: Unable to Re-Open SCENARIO.HDR
goto exitok

:err20 
echo SYSTEM ERROR: Insufficient Memory for Maze Buffers
goto exitok

:err21 
echo SYSTEM ERROR: Unable to Load PICTURE
goto exitok

:err22 
echo SYSTEM ERROR: Unknown Error - Please Report
goto exitok

:exitok
echo on

