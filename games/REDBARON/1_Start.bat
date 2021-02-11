@ECHO OFF
CALL imgtry ide10 D "/cd/RedBaron/redbaron.chd" "/cd/RedBaron/redbaron.iso"
CALL imgtry fdd0 A "/floppy/RedBaron/redbaro.chd" "/floppy/RedBaron/redbaro.ima"

CD RedBaron
CALL run
IMGRESET
