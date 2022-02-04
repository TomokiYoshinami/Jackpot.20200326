jackpot_results1 <- lmer(

AnalyzeExpectedValueC01Jocky.ExpectedValue

~

+ 1

+ AnalyzeExpectedValueC01Jocky.PrevExpectedValue + (AnalyzeExpectedValueC01Jocky.PrevExpectedValue|AnalyzeExpectedValueC01Jocky.PrevKisyuCode)
+ AnalyzeExpectedValueC01Jocky.PrevHitRateA + (AnalyzeExpectedValueC01Jocky.PrevHitRateA|AnalyzeExpectedValueC01Jocky.PrevKisyuCode)

# ,offset = log(RaceResultByHorseByTotal.RunCount)
# ,offset = log(+ RaceHorse.BaTaijyu + 1) + log(Odds1ByWin.TotalBetCount + 1) + log(RaceResultByHorseByTotal.RunCount + 1)
# ,offset = log(RaceHorse.BaTaijyu) + log(Odds1ByWin.TotalBetCount+1)
# ,offset = log(Odds1ByWin.TotalBetCount)
# ,offset = log(RaceResultByJockyByTrackType.RunCount+1)
# ,offset = log(RaceHorse.BaTaijyu) + log(Odds1ByWin.TotalBetCount+1) + log(RaceResultByJockyByTrackType.RunCount+1)
# ,offset = log(Odds1ByWin.TotalBetCount+1) + log(RaceResultByJockyByTrackType.RunCount+1)

,control=lmerControl(
# ,optimizer = "bobyqa" # Default
# ,optimizer = "Nelder_Mead"
# ,optimizer = "optimx", optCtrl=list(method="L-BFGS-B", maxiter=100000)
# ,optimizer = "optimx", optCtrl=list(method="nlminb", maxiter=100000)
# ,restart_edge = TRUE
# ,boundary.tol = 1e-5
# ,calc.derivs=TRUE
# ,use.last.params=FALSE
# ,sparseX = FALSE
## input checking options
# ,check.nobs.vs.rankZ = "ignore"
# ,check.nobs.vs.nlev = "stop"
# ,check.nobs.vs.nlev = "ignore" #Recoomend
# ,check.nlev.gtreq.5 = "ignore"
# ,check.nlev.gtr.1 = "stop"
# ,check.nlev.gtr.1 = "ignore" #Recoomend
# ,check.nobs.vs.nRE="stop"
# ,check.nobs.vs.nRE="ignore" # Reccomend
# ,check.rankX = c("message+drop.cols", "silent.drop.cols", "warn+drop.cols","stop.deficient", "ignore")
# ,check.scaleX = c("warning","stop","silent.rescale","message+rescale","warn+rescale","ignore")
# ,check.formula.LHS = "stop"
## convergence checking options
# ,check.conv.grad = .makeCC("warning", tol = 2e-3, relTol = NULL)
# ,check.conv.singular = .makeCC(action = "ignore",  tol = 1e-4)
# ,check.conv.hess = .makeCC(action = "warning", tol = 1e-6)
## ,optimizer args
# ,optCtrl = list(maxfun=1000, maxiter=1000)
)
# ,family = "poisson"
# ,family = "binomial"
# ,family = "gaussian"
#
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
#
# ,REML = TRUE # Default
# ,REML =FALSE
#
# ,data = subset(data6, IsAnalyzeNormalPastAndFuture == 1)
,data = subset(data6, IsAnalyzeNormalPast == 1)
)
