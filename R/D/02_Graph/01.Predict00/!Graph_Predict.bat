@ECHO OFF
ECHO %Date% %Time% --- Started ---
ECHO %CD%

ECHO ********** Type00 **********
Rscript --slave --vanilla --encoding=utf-8 scriptGraph.R "D1115" "Graph" "Predict00" 0 "0"

REM PAUSE

REM R CMD BATCH --slave --vanilla --encoding=utf-8 script.R D1115 analyze Odds IsHitA glm 1 1
REM Rscript --slave --vanilla --encoding=utf-8 script.R D1115 analyze Odds IsHitA glm 1 1

REM CMD BATCHはすべて大文字
REM R CMD BATCH --slave --vanilla ' --encoding=utf-8 script.R D1115 analyze Odds IsHitA glm 1 1
REM OR
REM Rscript scriptfile arg1 arg2 arg3
 
ECHO %Date% %Time% --- Finished ---

pause
