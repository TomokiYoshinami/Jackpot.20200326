@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%

REM ECHO ********** Type11 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 1
REM ECHO ********** Type12 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 2
REM ECHO ********** Type13 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 3
REM ECHO ********** Type14 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 4
REM ECHO ********** Type15 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 5
REM ECHO ********** Type16 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 6
REM ECHO ********** Type21 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 1
REM ECHO ********** Type22 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 2
REM ECHO ********** Type23 **********
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 3
ECHO ********** Type24 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 4
ECHO ********** Type25 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 5
ECHO ********** Type26 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 2 6
ECHO ********** Type31 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 3 1
ECHO ********** Type35 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 3 5

REM PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 1

REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R D1115 analyze Horse IsHitA glm 1 1
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
ECHO %Date% %Time% --- Finished ---
