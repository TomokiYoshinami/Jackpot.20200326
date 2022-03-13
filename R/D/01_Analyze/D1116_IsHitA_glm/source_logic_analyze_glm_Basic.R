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
+ Race.RaceType1Cd

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

# + RaceHorse.SexCd
# + RaceHorse.HorseNumRatio
# + RaceHorse.Weight
# + RaceHorse.WeightDelta
# + RaceHorse.WeightDeltaRatio
# + RaceHorse.Handicap
# + RaceHorse.HandicapRatio
# + RaceHorse.Lifetime

# + RaceHorse.HorseNumRatioSdvByRace
# + RaceHorse.WeightSdvByRace
# + RaceHorse.WeightDeltaSdvByRace
+ RaceHorse.WeightDeltaRatioSdvByRace
# + RaceHorse.HandicapSdvByRace
+ RaceHorse.HandicapRatioSdvByRace
# + RaceHorse.LifetimeSdvByRace

# + RaceHorse.HorseNumRatioSdv
# + RaceHorse.WeightSdv
# + RaceHorse.WeightDeltaSdv
# + RaceHorse.WeightDeltaRatioSdv
# + RaceHorse.HandicapSdv
# + RaceHorse.HandicapRatioSdv
# + RaceHorse.LifetimeSdv

# + DataMining.DmTimeSdv
	
+ DataMiningTaisen.TmScoreSdv

# + OddsByWin.Ninki
# + OddsByWin.OddsLog1
# + log(OddsByWin.Odds1)
# + OddsByWin.RealOddsLog1
+ log(OddsByWin.RealOdds1)
# + OddsByWin.ApprovalRate1
# + OddsByWin.RealApprovalRate1

# + EOF

)

print(paste0(Sys.time(),  " --- source_logic_glm.R Finished ---"))
