@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%

REM ECHO ********** Type11 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 1
REM ECHO ********** Type12 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 2
REM ECHO ********** Type13 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 3
REM ECHO ********** Type14 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 4
ECHO ********** Type15 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 5
REM ECHO ********** Type16 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 6
REM ECHO ********** Type21 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 1
REM ECHO ********** Type22 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 2
REM ECHO ********** Type23 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 3
REM ECHO ********** Type24 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 4
REM ECHO ********** Type25 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 5
REM ECHO ********** Type26 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 2 6
REM ECHO ********** Type31 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 3 1
REM ECHO ********** Type35 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 3 5

REM PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 1

REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R D1117 analyze Gen01 IsHitA glmer 1 1
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
ECHO %Date% %Time% --- Finished ---
