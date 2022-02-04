jackpot_results1 <- glmer(

AnalyzeExpectedValueG01JyokenGen01.IsHitA

~

+ 1

+ AnalyzeExpectedValueG01JyokenGen01.PrevHitRateA
+ (AnalyzeExpectedValueG01JyokenGen01.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen01.HansyokuNum)
# + (AnalyzeExpectedValueG01JyokenGen01.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen01.JyokenCd)
+ (AnalyzeExpectedValueG01JyokenGen01.PrevHitRateA | AnalyzeExpectedValueG01JyokenGen01.PrevJyokenCd)

# + AnalyzeExpectedValueG01JyokenGen01.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 | AnalyzeExpectedValueG01JyokenGen01.PrevRaceType1Cd)

# + AnalyzeExpectedValueG01JyokenGen01.PrevRunCount + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevRunCount | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount2 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount3 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount4 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)
# + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 + (1 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum) + (0 + AnalyzeExpectedValueG01JyokenGen01.PrevHitCount5 | AnalyzeExpectedValueG01JyokenGen01.PrevKettoNum)

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