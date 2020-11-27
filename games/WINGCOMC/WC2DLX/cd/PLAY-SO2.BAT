@echo off
cd wing2
..\sgfind origin2 gamedat
if errorlevel 26 goto s26
if errorlevel 25 goto s25
if errorlevel 24 goto s24
if errorlevel 23 goto s23
if errorlevel 22 goto s22
if errorlevel 21 goto s21
if errorlevel 20 goto s20
if errorlevel 19 goto s19
if errorlevel 18 goto s18
if errorlevel 17 goto s17
if errorlevel 16 goto s16
if errorlevel 15 goto s15
if errorlevel 14 goto s14
if errorlevel 13 goto s13
if errorlevel 12 goto s12
if errorlevel 11 goto s11
if errorlevel 10 goto s10
if errorlevel 9 goto s9
if errorlevel 8 goto s8
if errorlevel 7 goto s7
if errorlevel 6 goto s6
if errorlevel 5 goto s5
if errorlevel 4 goto s4
if errorlevel 3 goto s3
if errorlevel 2 goto s2
if errorlevel 1 goto s1
goto abort
:s1
..\cdwedge 1
goto rungame
:s2
..\cdwedge 2
goto rungame
:s3
..\cdwedge 3
goto rungame
:s4
..\cdwedge 4
goto rungame
:s5
..\cdwedge 5
goto rungame
:s6
..\cdwedge 6
goto rungame
:s7
..\cdwedge 7
goto rungame
:s8
..\cdwedge 8
goto rungame
:s9
..\cdwedge 9
goto rungame
:s10
..\cdwedge 10
goto rungame
:s11
..\cdwedge 11
goto rungame
:s12
..\cdwedge 12
goto rungame
:s13
..\cdwedge 13
goto rungame
:s14
..\cdwedge 14
goto rungame
:s15
..\cdwedge 15
goto rungame
:s16
..\cdwedge 16
goto rungame
:s17
..\cdwedge 17
goto rungame
:s18
..\cdwedge 18
goto rungame
:s19
..\cdwedge 19
goto rungame
:s20
..\cdwedge 20
goto rungame
:s21
..\cdwedge 21
goto rungame
:s22
..\cdwedge 22
goto rungame
:s23
..\cdwedge 23
goto rungame
:s24
..\cdwedge 24
goto rungame
:s25
..\cdwedge 25
goto rungame
:s26
..\cdwedge 26

:rungame
echo Wing Commander II Mission Selector
if "%1" == "1" goto  :check_mission
if "%1" == "2" goto  :check_mission
if "%1" == "3" goto  :check_mission
if "%1" == "4" goto  :check_mission
if "%1" == "5" goto  :check_mission
	goto :dead_series

:check_mission

if "%2" == "A" goto :cap_a
if "%2" == "B" goto :cap_b
if "%2" == "C" goto :cap_c
if "%2" == "D" goto :cap_d

if "%2" == "a" goto :run_game
if "%2" == "b" goto :run_game
if "%2" == "c" goto :run_game
if "%2" == "d" goto :run_game


:run_game

echo Now loading Series %1, Mission %2.

so2 Origin s%1 m%2

goto :end


:cap_a

echo Now loading Series %1, Mission %2.
so2 Origin s%1 ma

goto :end


:cap_b

echo Now loading Series %1, Mission %2.
so2 Origin s%1 mb

goto :end


:cap_c

echo Now loading Series %1, Mission %2.
so2 Origin s%1 mc

goto :end


:cap_d

echo Now loading Series %1, Mission %2.
so2 Origin s%1 md

goto :end


:dead_series

echo Sorry, that isn't a valid Series number.  Please try again.

	goto :end


:dead_mission

echo Sorry, that isn't a valid Mission number.  Please try again.

	goto :end

:end

..\tsroff
cd ..
echo .
:abort
