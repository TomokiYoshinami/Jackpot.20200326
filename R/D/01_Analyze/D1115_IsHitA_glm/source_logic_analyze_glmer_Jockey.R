print(paste0(Sys.time(),  " --- source_logic_glmer.R Start ---"))

analyze.results.glmer <- glmer(
RaceHorse.IsHitA
# RaceHorse.IsHitB
# RaceHorse.IsHitC
~
+ 1
# + Race.RaceId
# + Race.IsPredictedRace
# + Race.IsAnalyzeNormalPastAndFuture
# + Race.IsAnalyzeNormalPast
# + Race.IsAnalyzeNormalFuture
# + Race.IsAnalyzeFullPastAndFuture
# + Race.IsAnalyzeFullPast
# + Race.IsAnalyzeFullFuture
# + Race.JyokenCd
# + Race.JyoType1Cd
# + Race.RaceType0Cd
# + Race.RaceType1Cd
# + Race.RaceType2Cd
# + Race.RaceType3Cd
# + Race.RaceType4Cd

# + RaceHorse.RaceId
# + RaceHorse.KettoNum
# + RaceHorse.IsHit1
# + RaceHorse.IsHit2
# + RaceHorse.IsHit3
# + RaceHorse.IsHit4
# + RaceHorse.IsHit5
# + RaceHorse.IsHit6
# + RaceHorse.IsValidRaceHorse
# + RaceHorse.IsHitA
# + RaceHorse.IsHitB
# + RaceHorse.IsHitC
# + RaceHorse.IsHitD
# + RaceHorse.IsHitE

# + Jockey.KisyuCode
+ Jockey.TimeSdvByRaceAvg
# + Jockey.TimeSdvByRaceMax
# + Jockey.RunCount
# + Jockey.HitCount1
# + Jockey.HitCount2
# + Jockey.HitCount3
# + Jockey.HitCount4
# + Jockey.HitCount5
# + Jockey.HitCountA
# + Jockey.HitCountB
# + Jockey.HitCountC
+ Jockey.HitRate1
# + Jockey.HitRate2
# + Jockey.HitRate3
# + Jockey.HitRate4
# + Jockey.HitRate5
# + Jockey.HitRateA
# + Jockey.HitRateB
# + Jockey.HitRateC

# + EOF

+ (1 + Jockey.TimeSdvByRaceAvg | Jockey.KisyuCode)
+ (1 + Jockey.HitRate1 | Jockey.KisyuCode)
# + (1 + Jockey.HitRate2 | Jockey.KisyuCode)
# + (1 + Jockey.HitRate3 | Jockey.KisyuCode)

# offset = log(PrevH01RaceHorse.TotalRunCount + 1)

# ,control=lmerControl(
# ,control=glmerControl(
# optimizer = "bobyqa" # Default
# optimizer = "Nelder_Mead"
# optimizer = "optimx", optCtrl=list(method="L-BFGS-B", maxiter=100000)
# optimizer = "optimx", optCtrl=list(method="nlminb", maxiter=100000)
# ,restart_edge = TRUE
# ,boundary.tol = 1e-5
# ,calc.derivs=TRUE
# ,use.last.params=FALSE
# ,sparseX = FALSE
# input checking options
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

# convergence checking options
# ,check.conv.grad = .makeCC("warning", tol = 2e-3, relTol = NULL)
# ,check.conv.singular = .makeCC(action = "ignore",  tol = 1e-4)
# ,check.conv.hess = .makeCC(action = "warning", tol = 1e-6)

# ,optimizer args
# ,optCtrl = list(maxfun=1000, maxiter=1000)
# )

# ,family = "gaussian"
,family = "binomial"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
,data=data
# ,data = subset(data, Race.IsAnalyzeNormalPast == 1)
)

print(paste0(Sys.time(),  " --- source_logic_glmer.R Finished ---"))
