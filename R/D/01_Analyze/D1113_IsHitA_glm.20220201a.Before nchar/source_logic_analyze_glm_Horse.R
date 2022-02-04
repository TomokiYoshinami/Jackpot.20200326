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
# + Horse.PrevKettoNum

# + Horse.PrevKettoNum
+ Horse.TimeDvByRaceAvg
# + Horse.TimeDvByRaceMax
# + Horse.RunCount
# + Horse.HitCount1
# + Horse.HitCount2
# + Horse.HitCount3
# + Horse.HitCount4
# + Horse.HitCount5
# + Horse.HitCountA
# + Horse.HitCountB
# + Horse.HitCountC
+ Horse.HitRate1
# + Horse.HitRate2
# + Horse.HitRate3
# + Horse.HitRate4
# + Horse.HitRate5
# + Horse.HitRateA
# + Horse.HitRateB
# + Horse.HitRateC
	
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
