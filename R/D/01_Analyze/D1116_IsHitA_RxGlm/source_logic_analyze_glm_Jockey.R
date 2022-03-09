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

+ PrevRaceHorse.FinishTimeSdvByRace
# + exp(PrevRaceHorse.FinishTimeSdvByRace)
# + PrevRaceHorse.FirstTimeSdvByRace
# + PrevRaceHorse.LastTimeSdvByRace
# + PrevRaceHorse.FinishTimeSdv
# + PrevRaceHorse.FirstTimeSdv
# + PrevRaceHorse.LastTimeSdv
# + PrevRaceHorse.RealOddsLog1
# + PrevRaceHorse.RunCount
# + PrevRaceHorse.HitCount1
# + PrevRaceHorse.HitCount2
# + PrevRaceHorse.HitCount3
# + PrevRaceHorse.HitCount4
# + PrevRaceHorse.HitCount5
# + PrevRaceHorse.HitCountA
# + PrevRaceHorse.HitCountB
# + PrevRaceHorse.HitCountC
# + PrevRaceHorse.HitRate1
# + PrevRaceHorse.HitRate2
# + PrevRaceHorse.HitRate3
# + PrevRaceHorse.HitRate4
# + PrevRaceHorse.HitRate5
# + PrevRaceHorse.HitRateA
# + PrevRaceHorse.HitRateB
# + PrevRaceHorse.HitRateC

# + EOF

)

print(paste0(Sys.time(),  " --- source_logic_glm.R Finished ---"))
