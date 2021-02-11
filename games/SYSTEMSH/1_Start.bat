@ECHO OFF
CALL imgtry ide10 D "/cd/SystemSh/system_.chd" "/cd/SystemSh/system_.cue"
CD systemsh\SSHOCK
call run
