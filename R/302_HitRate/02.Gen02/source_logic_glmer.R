jackpot_results1 <- glmer(

AnalyzeExpectedValueC01Gen02.IsHitA

~

+ 1

+ AnalyzeExpectedValueC01Gen02.PrevHitRateA + (AnalyzeExpectedValueC01Gen02.PrevHitRateA | AnalyzeExpectedValueC01Gen02.PrevHansyokuNum)

# + AnalyzeExpectedValueC01Gen02.PrevExpectedValue + (1 | AnalyzeExpectedValueC01Gen02.PrevExpectedValue) + (0 + AnalyzeExpectedValueC01Gen02.PrevExpectedValue | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Gen02.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueC01Gen02.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount2 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount3 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount4 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount5 | AnalyzeExpectedValueC01Gen02.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Gen02.PrevRunCount + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevRunCount | AnalyzeExpectedValueC01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount2 | AnalyzeExpectedValueC01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount3 | AnalyzeExpectedValueC01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount4 | AnalyzeExpectedValueC01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen02.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen02.PrevHitCount5 | AnalyzeExpectedValueC01Gen02.PrevKettoNum)

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