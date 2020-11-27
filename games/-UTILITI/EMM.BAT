@Echo off
echo Setting Config.SYS and Autoexec.BAT to EMM386 configuration. CTRL-C to BREAK or any key to reboot.
pause
copy config.emm config.sys
copy autoexec.emm autoexec.bat
imgset r
