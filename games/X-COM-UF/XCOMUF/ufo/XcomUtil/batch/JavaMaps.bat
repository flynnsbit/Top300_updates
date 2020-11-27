@echo off
if NOT exist .\XcomUtil\XcomUtil.txt goto chD
goto chJv
:chD
cd ..\..
if NOT exist .\XcomUtil\XcomUtil.txt goto BadDir

:chJv
if %COMSPEC%. == Z:\COMMAND.COM. goto noJava
java -version >nul
if errorlevel 1 goto noJava
:Java

echo Creating New Farm and Desert Terrain
java -jar XcomUtTE.jar -quiet -mcd cultivat barn -map culta00 culta01 culta02 culta03 culta04 culta05 culta06 culta07 culta08 culta09 culta10 culta11 culta12 culta13 culta14 -mcd roads urbits urban frniture -map urban15 urban16 -write culta/cultivat
java -jar XcomUtTE.jar -quiet -mcd cultivat -map culta00 culta01 culta02 culta03 culta04 culta05 culta06 culta07 culta08 culta09 culta10 culta11 culta12 culta13 culta14 culta15 culta16 -mcd forest -map forest00 forest01 -write culta/cultivat
java -jar XcomUtTE.jar -quiet -mcd cultivat -map culta00 culta01 culta02 culta03 culta04 culta05 culta06 culta07 culta08 culta09 culta10 culta11 culta12 culta13 culta14 culta15 culta16 culta17 culta18 -change 39/20 40/21 43/2 44/11 45/7 85/2 -write culta/cultivat
xcopy terrain\blanks.* terrain\barn.* /y >nul

java -jar XcomUtTE.jar -quiet -mcd desert -map desert00 desert01 desert02 desert03 desert04 desert05 desert06 desert07 desert08 desert09 desert10 desert11 -mcd mars u_wall02 -map mars08 -write desert
java -jar XcomUtTE.jar -quiet -mcd desert -map desert00 desert12 desert02 desert03 desert04 desert05 desert06 desert07 desert08 desert09 desert10 desert11 desert01 -change 67/2 -write desert

goto EOF
:BadDir
echo Cant Find Game.
goto EOF
:noJava
echo No Java
:EOF