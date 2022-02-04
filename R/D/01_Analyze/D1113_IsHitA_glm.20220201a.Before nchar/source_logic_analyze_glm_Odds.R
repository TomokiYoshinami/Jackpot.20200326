print(paste0(Sys.time(),  " --- source_logic_glm.R Start ---"))

analyze.results.glm <- glm(
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

# +OddsByWin.Odds1
# +OddsByWin.Ninki
# +OddsByWin.OddsLog1
# +OddsByWin.OddsRatio1
+OddsByWin.OddsLogit1
# +OddsByWin.ApprovalRate1
# +OddsByWin.ApprovalRateLog1

# + EOF

# offset = log(PrevH01RaceHorse.TotalRunCount + 1)

# ,family = "gaussian"
,family = "binomial"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
,data=data
# ,data = subset(data6, Race.IsAnalyzeNormalPast == 1)
)

print(paste0(Sys.time(),  " --- source_logic_glm.R Finished ---"))
