jackpot_results1 <- glmer(

AnalyzeExpectedValueC01Gen01.IsHitA

~

+ 1

+ AnalyzeExpectedValueC01Gen01.PrevHitRateA + (AnalyzeExpectedValueC01Gen01.PrevHitRateA | AnalyzeExpectedValueC01Gen01.PrevHansyokuNum)

# + AnalyzeExpectedValueC01Gen01.PrevExpectedValue + (1 | AnalyzeExpectedValueC01Gen01.PrevExpectedValue) + (0 + AnalyzeExpectedValueC01Gen01.PrevExpectedValue | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Gen01.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueC01Gen01.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount2 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount3 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount4 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount5 | AnalyzeExpectedValueC01Gen01.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Gen01.PrevRunCount + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevRunCount | AnalyzeExpectedValueC01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount2 | AnalyzeExpectedValueC01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount3 | AnalyzeExpectedValueC01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount4 | AnalyzeExpectedValueC01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueC01Gen01.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Gen01.PrevHitCount5 | AnalyzeExpectedValueC01Gen01.PrevKettoNum)

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