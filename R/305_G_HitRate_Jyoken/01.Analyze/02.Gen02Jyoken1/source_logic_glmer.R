jackpot_results1 <- glmer(

AnalyzeExpectedValueG01JyokenGen02.IsHitA

~

+ 1

+ AnalyzeExpectedValueG01JyokenGen02.PrevHitRateA
+ (AnalyzeExpectedValueG01JyokenGen02.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen02.HansyokuNum)
# + (AnalyzeExpectedValueG01JyokenGen02.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen02.JyokenCd)
+ (AnalyzeExpectedValueG01JyokenGen02.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen02.PrevJyokenCd)

# + AnalyzeExpectedValueG01JyokenGen02.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 | AnalyzeExpectedValueG01JyokenGen02.PrevRaceType1Cd)

# + AnalyzeExpectedValueG01JyokenGen02.PrevRunCount + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevRunCount | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount2 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount3 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount4 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 + (1 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen02.PrevHitCount5 | AnalyzeExpectedValueG01JyokenGen02.PrevKettoNum)

,family = "binomial"
# ,family = "binomial"
# ,family = "gaussian"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
# ,data = data6
# ,data = subset(data6, IsAnalyzeNormalPastAndFuture == 1)
,data = subset(data6, IsAnalyzeNormalPast == 1)
)