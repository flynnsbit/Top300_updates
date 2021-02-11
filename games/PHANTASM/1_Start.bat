CALL imgtry ide10 D "/cd/Phantasm/phant1.chd" "/cd/Phantasm/phant1.iso"

@jchoice
cd Phantasm
echo.
echo This game spans 7 discs. When prompted to change CD's, press
echo Ctrl-F4. Each time you press these keys, it will load the next
echo disc in order. Disc 1 is already loaded, so it will change to
echo disc 2, then disc 3, etc...
echo.
@jchoice
call run