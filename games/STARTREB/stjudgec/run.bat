:menu
echo off
cls
echo.
echo Press 1 for Star Trek: Judgement Rites CD w/ SoundBlaster
echo Press 2 for Star Trek: Judgement Rites CD w/ MT-32
echo Press 3 for Star Trek: Judgement Rites CD w/ Sound Canvas
echo Press 4 for Star Trek: Judgement Rites Collector's CD
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto CD2
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
CALL imgtry ide10 D "/cd/stjudgec/startre.chd" "/cd/stjudgec/startre.cue"


@jchoice
cls
trekjr
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
CALL imgtry ide10 D "/cd/stjudgec/startre.chd" "/cd/stjudgec/startre.cue"


@jchoice
cls
trekjr
goto quit

:SC55
mt32-pi -g -v
xcopy .\sc55\*.* .\
CALL imgtry ide10 D "/cd/stjudgec/startre.chd" "/cd/stjudgec/startre.cue"


@jchoice
cls
trekjr
goto quit

:CD2
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
CALL imgtry ide10 D "/cd/stjudgec/star_tr.chd" "/cd/stjudgec/star_tr.iso"


@jchoice
d:
cls
call 2
goto quit

:quit
exit