@echo off
REM Find sdump
if exist XcomUtil\bin\sdump.exe goto xcubin
if exist ..\bin\sdump.exe goto bak1
if exist bin\sdump.exe goto bin
if exist sdump.exe goto cwd
echo Unable to find Sdump. Please run Xdump from the same folder as Sdump
goto finis
:xcubin
set sdump=XcomUtil\bin\sdump.exe
goto start
:bak1
set sdump=..\bin\sdump.exe
goto start
:bin
set sdump=bin\sdump.exe
goto start
:cwd
set sdump=sdump.exe
goto start



:start
if .%1==.         goto help

if .%2==.basedat  goto basedat
if .%2==.basedatt goto basedatt
if .%2==.geodata  goto geodata
if .%2==.map11    goto map11
if .%2==.map12    goto map12
if .%2==.map21    goto map21
if .%2==.map22    goto map22
if .%2==.map23    goto map23
if .%2==.map32    goto map32
if .%2==.map33    goto map33
if .%2==.mcd      goto mcd
if .%2==.mission  goto mission
if .%2==.obdata   goto obdata
if .%2==.obpos    goto obpos
if .%2==.product  goto product
if .%2==.project  goto project
if .%2==.research goto research
if .%2==.rmp      goto rmp
if .%2==.saveinfo goto saveinfo
if .%2==.soldier  goto soldier
if .%2==.soldiert goto soldiert
if .%2==.unitpos  goto unitpos
if .%2==.unitref  goto unitref
if .%2==.unitreft goto unitreft
if .%2==.up       goto up
if .%2==.world    goto world

echo Unknown filetype.  Dump aborted.
goto finis

:help
echo.
echo XDUMP - Dump XCOM/TFTD Files by Scott T Jones, Scott@ScottTJones.com
echo.
echo   XDUMP filename filetype [ numrecs [ dest ] ]
echo.
echo filename = file to be dumped
echo filetype = basedat basedatt geodata mission obdata obpos
echo            product project research rmp saveinfo soldier
echo            soldiert unitpos unitref unitreft up world
echo            map11 map12 map21 map22 map23 map32 map33 mcd
echo numrecs  = dump only the first numrecs records, 0 = all
echo dest     = destination of output or MORE
echo.
goto finis

:basedat
XcomUtil\Bin\sdump.exe %1 rpt::%3 asc:::::16 ::::6 :6:6:2 ::::2 2::::15 2::::80 ::::6 >xdump.tmp
goto  show

:basedatt
XcomUtil\Bin\sdump.exe %1 rpt::%3 asc:::::16 2::::15 2::::80 ::::12 :6:6:2 ::::2 ::::4 >xdump.tmp
goto  show

:geodata
XcomUtil\Bin\sdump.exe missdat\geodata.dat 2:6:1:1::Rows/Cols/Lvls/HShp/AShp/Trn 1:6:6:2 1:8::::Shps/HTyp/HRow/HCol/ATyp/ARow/ACol/pad >xdump.tmp
goto  show

:map11
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:10:10:1 >xdump.tmp
goto  show

:map12
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:20:10:1 >xdump.tmp
goto  show

:map21
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:10:20:1 >xdump.tmp
goto  show

:map22
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:20:20:1 >xdump.tmp
goto  show

:map23
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:30:20:1 >xdump.tmp
goto  show

:map32
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:20:30:1 >xdump.tmp
goto  show

:map33
XcomUtil\Bin\sdump.exe %1 ::::3 rpt::%3 4:30:30:1 >xdump.tmp
goto  show

:mcd
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::8 ::::54 >xdump.tmp
goto  show

:mission
XcomUtil\Bin\sdump.exe %1 2 >xdump.tmp
goto  show

:obdata
XcomUtil\Bin\sdump.exe %1 +rpt::%3 asc:::::20 ::::34 >xdump.tmp
goto  show

:obpos
XcomUtil\Bin\sdump.exe %1 + rpt::%3 ::::16 >xdump.tmp
goto  show

:product
XcomUtil\Bin\sdump.exe %1 rpt::%3 4::::1 2::::2 :3:2:1 ::::4 >xdump.tmp
goto  show

:project
XcomUtil\Bin\sdump.exe %1 rpt::%3 2:8:::96 1:8:::96 >xdump.tmp
goto  show

:research
XcomUtil\Bin\sdump.exe %1 + rpt::%3 2::::1 ::::8 4::::3 >xdump.tmp
goto  show

:rmp
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::4 :3:5:1 ::::5 >xdump.tmp
goto  show

:saveinfo
XcomUtil\Bin\sdump.exe %1 2:1:1:1 asc:::::26 2::::6 >xdump.tmp
goto  show

:soldier
XcomUtil\Bin\sdump.exe %1 rpt::%3 2::::8 asc:::::22 ::::30 >xdump.tmp
goto  show

:soldiert
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::6 2::::8 ::::13 asc:::::22 ::::13 >xdump.tmp
goto  show

:unitpos
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::14 + >xdump.tmp
goto  show

:unitref
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::0x4C 2::::2 ::::6 asc:::::25 ::::13 >xdump.tmp
goto  show

:unitreft
XcomUtil\Bin\sdump.exe %1 rpt::%3 ::::0x4C 2::::2 ::::6 asc:::::25 ::::21 >xdump.tmp
goto  show

:up
XcomUtil\Bin\sdump.exe %1 rpt::%3 2::::6 >xdump.tmp
goto  show

:world
XcomUtil\Bin\sdump.exe %1 rpt::%3 2:2:4:1 4::::1 >xdump.tmp
goto  show

:show
if .%4==.     goto :type
if .%4==.more goto :more

copy xdump.tmp %4 >nul
goto finis

:more
type xdump.tmp | more
goto finis

:type
type xdump.tmp

:finis
if exist xdump.tmp erase xdump.tmp
echo.
