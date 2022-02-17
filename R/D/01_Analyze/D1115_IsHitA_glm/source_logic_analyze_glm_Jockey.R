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

# + Jockey.KisyuCode
# + Jockey.TimeDvByRaceAvg
# + Jockey.TimeDvByRaceMin
# + Jockey.TimeDvByRaceMax
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
+ Jockey.HitRate2
+ Jockey.HitRate3
# + Jockey.HitRate4
# + Jockey.HitRate5
# + Jockey.HitRateA
# + Jockey.HitRateB
# + Jockey.HitRateC

# + EOF

)

print(paste0(Sys.time(),  " --- source_logic_glm.R Finished ---"))
