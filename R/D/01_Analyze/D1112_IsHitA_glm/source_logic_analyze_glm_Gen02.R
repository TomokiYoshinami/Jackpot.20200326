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
	
# + Horse.TimeDvByRace
# + Horse.TimeDvByRaceType1
# + Horse.RunCount
# + Horse.HitCount1
# + Horse.HitCount2
# + Horse.HitCount3
# + Horse.HitCount4
# + Horse.HitCount5
# + Horse.HitCountA
# + Horse.HitCountB
# + Horse.HitCountC
# + Horse.HitRate1
# + Horse.HitRate2
# + Horse.HitRate3
# + Horse.HitRate4
# + Horse.HitRate5
# + Horse.HitRateA
# + Horse.HitRateB
# + Horse.HitRateC
	
# +OddsByWin.Odds1
# +OddsByWin.Ninki
# +OddsByWin.OddsLog1
# +OddsByWin.OddsRatio1
# +OddsByWin.OddsLogit1
# +OddsByWin.ApprovalRate1
# +OddsByWin.ApprovalRateLog1

# + Gen01.TimeDvByRace
# + Gen01.TimeDvByRaceType1
# + Gen01.RunCount
# + Gen01.HitCount1
# + Gen01.HitCount2
# + Gen01.HitCount3
# + Gen01.HitCount4
# + Gen01.HitCount5
# + Gen01.HitCountA
# + Gen01.HitCountB
# + Gen01.HitCountC
# + Gen01.HitRate1
# + Gen01.HitRate2
# + Gen01.HitRate3
# + Gen01.HitRate4
# + Gen01.HitRate5
# + Gen01.HitRateA
# + Gen01.HitRateB
# + Gen01.HitRateC

# + Gen02.TimeDvByRace
+ Gen02.TimeDvByRaceType1
# + Gen02.RunCount
# + Gen02.HitCount1
# + Gen02.HitCount2
# + Gen02.HitCount3
# + Gen02.HitCount4
# + Gen02.HitCount5
# + Gen02.HitCountA
# + Gen02.HitCountB
# + Gen02.HitCountC
+ Gen02.HitRate1
+ Gen02.HitRate2
+ Gen02.HitRate3
+ Gen02.HitRate4
+ Gen02.HitRate5
# + Gen02.HitRateA
# + Gen02.HitRateB
# + Gen02.HitRateC

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
