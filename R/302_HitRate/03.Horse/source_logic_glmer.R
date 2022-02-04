jackpot_results1 <- glmer(

AnalyzeExpectedValueC01Horse.IsHitA

~

+ 1

+ AnalyzeExpectedValueC01Horse.PrevHitRateA + (AnalyzeExpectedValueC01Horse.PrevHitRateA | AnalyzeExpectedValueC01Horse.PrevKettoNum)

# + AnalyzeExpectedValueC01Horse.PrevExpectedValue + (1 | AnalyzeExpectedValueC01Horse.PrevExpectedValue) + (0 + AnalyzeExpectedValueC01Horse.PrevExpectedValue | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Horse.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueC01Horse.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount2 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount3 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount4 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Horse.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount5 | AnalyzeExpectedValueC01Horse.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Horse.PrevRunCount + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevRunCount | AnalyzeExpectedValueC01Horse.PrevKettoNum)
# + AnalyzeExpectedValueC01Horse.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount1 | AnalyzeExpectedValueC01Horse.PrevKettoNum)
# + AnalyzeExpectedValueC01Horse.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount2 | AnalyzeExpectedValueC01Horse.PrevKettoNum)
# + AnalyzeExpectedValueC01Horse.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount3 | AnalyzeExpectedValueC01Horse.PrevKettoNum)
# + AnalyzeExpectedValueC01Horse.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount4 | AnalyzeExpectedValueC01Horse.PrevKettoNum)
# + AnalyzeExpectedValueC01Horse.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Horse.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Horse.PrevHitCount5 | AnalyzeExpectedValueC01Horse.PrevKettoNum)

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