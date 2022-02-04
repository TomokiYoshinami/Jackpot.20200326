@ECHO OFF
ECHO %CD%
ECHO ***** Type11 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 1 > script.R.Type11.log
ECHO ***** Type16 *****
Rscript --slave --vanilla --encoding=utf-8 script.2.R glm 1 6 > script.R.Type16.log
ECHO ***** Type26 *****
Rscript --slave --vanilla --encoding=utf-8 script.2.R glm 2 6 > script.R.Type26.log
PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R script.R.log glm 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 1 > script.R.log

REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R "glm "3 1  script.R.log
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
 
REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 --args trackTypeCd=3 jyokenCd=1' script.R script.R.log
REM trackTypeCd <- 3
REM jyokenCd <- 5
