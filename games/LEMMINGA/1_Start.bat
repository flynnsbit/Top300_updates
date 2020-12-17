@echo off
subst a: /d
subst a: lemm2\disk
cls
echo Requires EMM386 to run correctly.
echo Please reboot and select EMM386 before continuing
jchoice
cd lemm2
call run
