@echo off
rem Batch file for SimCity 2000 DOS Special Edition
rem
rem Facilitates launching of WillTV from within SC2K.
rem
rem by Kevin O'Hare 2/16/96
rem    Last Updated  3/6/96
rem
rem Copyright Maxis 1996
rem

INTRO

:RunSC2K
SC2K %1
if errorlevel 55 goto RunWillTV
goto END

:RunWillTV
WILLTV
goto :RunSC2K

:END

