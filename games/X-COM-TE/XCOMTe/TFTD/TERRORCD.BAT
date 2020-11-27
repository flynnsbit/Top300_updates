@echo off
cls
%1sound\sndstart       %1
%1ufoexe\black
%1intro                %1
%1ufoexe\black
%1ufoexe\geoscape  "0" %1
if errorlevel 2 goto begin
goto end
:begin
%1ufoexe\black
%1ufo2exe\tactical "1" %1
:geo
%1ufoexe\black
%1ufoexe\geoscape  "1" %1
if errorlevel 2 goto begin
:end
%1sound\sndend
