:menu
echo off
cls
if exist CGA.SEL goto CGA
if exist COMP.SEL goto COMP
if exist EGA.SEL goto EGA
if exist TANDY.SEL goto TANDY

:CGA
set s1=comp
set s2=ega
set s3=tandy
cd CGA
cls
wl
goto quit

:COMP
set s1=cga
set s2=ega
set s3=tandy
cd COMP
cls
wl
goto quit

:EGA
set s1=comp
set s2=cga
set s3=tandy
cd EGA
cls
wl
goto quit

:TANDY
set s1=comp
set s2=ega
set s3=cga
cd TANDY
cls
wl
goto quit

:quit
copy game1 ..\%s1%
copy game2 ..\%s1%
copy game1 ..\%s2%
copy game2 ..\%s2%
copy game1 ..\%s3%
copy game2 ..\%s3%
exit