print(paste0(Sys.time(),  " --- source_logic_glmer.R Start ---"))

form <- formula(
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
	
+ Gen02.HansyokuNum
+ Gen02.TimeDvByRaceAvg
# + Gen02.TimeDvByRaceMin
# + Gen02.TimeDvByRaceMax
# + Gen02.RunCount
# + Gen02.HitCount1
# + Gen02.HitCount2
# + Gen02.HitCount3
# + Gen02.HitCount4
# + Gen02.HitCount5
# + Gen02.HitCountA
# + Gen02.HitCountB
# + Gen02.HitCountC
# + Gen02.HitRate1
# + Gen02.HitRate2
# + Gen02.HitRate3
# + Gen02.HitRate4
# + Gen02.HitRate5
# + Gen02.HitRateA
# + Gen02.HitRateB
# + Gen02.HitRateC

# + EOF

)

print(paste0(Sys.time(),  " --- source_logic_glmer.R Finished ---"))
