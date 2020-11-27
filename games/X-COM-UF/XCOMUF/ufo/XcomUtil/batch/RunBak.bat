REM RunBack 1[SrcFolder] 2[SrcExt] 3[DstFolder] 4[DstExt] 5[DisplayVar] 6[DisplaySection] 7[DisplayEntry]
set output=
if %xOS%. == DosBox. goto redok
if %xOS%. == Unknown. goto redok
if %xOS%. == 4DOS. goto redok
set output=2^>^&1
:redok
%backup% %1\A*.%2 %3\A*.%4 >>%redir% %output%
%backup% %1\B*.%2 %3\B*.%4 >>%redir% %output%
set %5=%clChk%Processing..%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\C*.%2 %3\C*.%4 >>%redir% %output%
%backup% %1\D*.%2 %3\D*.%4 >>%redir% %output%
set %5=%clChk%Processing...%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\E*.%2 %3\E*.%4 >>%redir% %output%
%backup% %1\F*.%2 %3\F*.%4 >>%redir% %output%
set %5=%clChk%Processing....%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\G*.%2 %3\G*.%4 >>%redir% %output%
%backup% %1\H*.%2 %3\H*.%4 >>%redir% %output%
set %5=%clChk%Processing.....%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\I*.%2 %3\I*.%4 >>%redir% %output%
%backup% %1\J*.%2 %3\J*.%4 >>%redir% %output%
set %5=%clChk%Processing......%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\K*.%2 %3\K*.%4 >>%redir% %output%
%backup% %1\L*.%2 %3\L*.%4 >>%redir% %output%
set %5=%clChk%Processing.......%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\M*.%2 %3\M*.%4 >>%redir% %output%
%backup% %1\N*.%2 %3\N*.%4 >>%redir% %output%
set %5=%clChk%Processing........%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\O*.%2 %3\O*.%4 >>%redir% %output%
%backup% %1\P*.%2 %3\P*.%4 >>%redir% %output%
set %5=%clChk%Processing.........%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\Q*.%2 %3\Q*.%4 >>%redir% %output%
%backup% %1\R*.%2 %3\R*.%4 >>%redir% %output%
set %5=%clChk%Processing..........%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\S*.%2 %3\S*.%4 >>%redir% %output%
%backup% %1\T*.%2 %3\T*.%4 >>%redir% %output%
set %5=%clChk%Processing...........%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\U*.%2 %3\U*.%4 >>%redir% %output%
%backup% %1\V*.%2 %3\V*.%4 >>%redir% %output%
set %5=%clChk%Processing............%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\W*.%2 %3\W*.%4 >>%redir% %output%
%backup% %1\X*.%2 %3\X*.%4 >>%redir% %output%
set %5=%clChk%Processing..............%clOff%
call XcomUtil\Batch\display.bat %6 %7
%backup% %1\Y*.%2 %3\Y*.%4 >>%redir% %output%
%backup% %1\Z*.%2 %3\Z*.%4 >>%redir% %output%
set %5=%clChk%Processing...............%clOff%
call XcomUtil\Batch\display.bat %6 %7

:EOF