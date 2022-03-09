@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%

ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 1
ECHO ********** Type12 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 2
ECHO ********** Type13 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 3
ECHO ********** Type14 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 4
ECHO ********** Type15 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 5
ECHO ********** Type16 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 6
ECHO ********** Type21 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 1
ECHO ********** Type22 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 2
ECHO ********** Type23 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 3
ECHO ********** Type24 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 4
ECHO ********** Type25 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 5
ECHO ********** Type26 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 2 6
ECHO ********** Type31 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 3 1
ECHO ********** Type35 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 3 5

REM PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 1

REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R D1115 analyze Gen02 IsHitA glm 1 1
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
ECHO %Date% %Time% --- Finished ---
