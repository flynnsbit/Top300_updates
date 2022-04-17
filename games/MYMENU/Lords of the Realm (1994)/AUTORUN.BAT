CD\GAMES\LORDSOFT
subst a: /d
subst a: lordofrm\floppy
@jchoice
CALL imgtry ide10 D "/cd/lordofrm/lotr.chd" "/cd/lordofrm/lotr.cue"
@echo off
echo.
echo This game needs to be slowed down.
echo.

@jchoice
cd lordofrm
call run