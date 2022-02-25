print(paste0(Sys.time(),  " --- source_logic_glm.R Start ---"))

formula <- formula(
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
	
# + Gen01.HansyokuNum
# + Gen01.TimeSdvByRaceAvg
# + Gen01.TimeSdvByRaceMin
# + Gen01.TimeSdvByRaceMax
+ Gen01.TimeSdvAvg
# + Gen01.TimeSdvMin
# + Gen01.TimeSdvMax
# + Gen01.OrderOfFinishSdvAvg
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

# + EOF

)

print(paste0(Sys.time(),  " --- source_logic_glm.R Finished ---"))
