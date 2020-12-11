@echo off
Echo Setting Config.SYS and Autoexec.BAT to HIRAM Settings.  Hit any key to reboot.
@jchoice
copy config.hi config.sys
copy autoexec.hi autoexec.bat
imgset r
