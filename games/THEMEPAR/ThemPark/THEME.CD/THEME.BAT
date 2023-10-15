@D:
@cd D:\game 
:START
@intro -E:/THEME.CD
@main -cD:/game/ -dE:/THEME.CD/ -l0
@IF ERRORLEVEL 10 GOTO START
@cd \