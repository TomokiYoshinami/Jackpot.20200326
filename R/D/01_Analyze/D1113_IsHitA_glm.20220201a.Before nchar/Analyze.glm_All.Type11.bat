@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%

ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Gen01 glm 1 1
ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Gen02 glm 1 1
ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Horse glm 1 1
ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Jockey glm 1 1
ECHO ********** Type11 **********
Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Odds glm 1 1

PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R D1113 analyze Gen01 glm 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1113 analyze Gen01 glm 1 1

REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R D1113 analyze Gen01 glm 1 1
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
ECHO %Date% %Time% --- Finished ---
