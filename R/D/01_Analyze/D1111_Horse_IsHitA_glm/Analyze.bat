@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%
ECHO ***** Type11 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 1 > script.R.Type11.log
ECHO ***** Type12 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 2 > script.R.Type12.log
ECHO ***** Type13 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 3 > script.R.Type13.log
ECHO ***** Type14 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 4 > script.R.Type14.log
ECHO ***** Type15 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 5 > script.R.Type15.log
ECHO ***** Type16 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 1 6 > script.R.Type16.log
REM Rscript --slave --vanilla --encoding=utf-8 script.2.R glm 1 6 > script.R.Type16.log
ECHO ***** Type21 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 1 > script.R.Type21.log
ECHO ***** Type22 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 2 > script.R.Type22.log
ECHO ***** Type23 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 3 > script.R.Type23.log
ECHO ***** Type24 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 4 > script.R.Type24.log
ECHO ***** Type25 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 5 > script.R.Type25.log
ECHO ***** Type26 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 2 6 > script.R.Type26.log
REM Rscript --slave --vanilla --encoding=utf-8 script.2.R glm 2 6 > script.R.Type26.log
ECHO ***** Type31 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 3 1 > script.R.Type31.log
ECHO ***** Type35 *****
Rscript --slave --vanilla --encoding=utf-8 script.R glm 3 5 > script.R.Type35.log
REM Rscript --slave --vanilla --encoding=utf-8 script.R glmer 1 1 > script.R.log
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
ECHO %Date% %Time% --- Finished ---