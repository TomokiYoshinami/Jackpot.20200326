jackpot_results1 <- glmer(

AnalyzeExpectedValueC01Jocky.IsHitA

~

+ 1

+ AnalyzeExpectedValueC01Jocky.PrevHitRateA + (AnalyzeExpectedValueC01Jocky.PrevHitRateA | AnalyzeExpectedValueC01Jocky.PrevKisyuCode)

# + AnalyzeExpectedValueC01Jocky.PrevExpectedValue + (1 | AnalyzeExpectedValueC01Jocky.PrevExpectedValue) + (0 + AnalyzeExpectedValueC01Jocky.PrevExpectedValue | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Jocky.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueC01Jocky.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount2 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount3 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount4 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount5 | AnalyzeExpectedValueC01Jocky.PrevRaceType1Cd)

# + AnalyzeExpectedValueC01Jocky.PrevRunCount + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevRunCount | AnalyzeExpectedValueC01Jocky.PrevKettoNum)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount1 + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount2 + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount2 | AnalyzeExpectedValueC01Jocky.PrevKettoNum)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount3 + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount3 | AnalyzeExpectedValueC01Jocky.PrevKettoNum)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount4 + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount4 | AnalyzeExpectedValueC01Jocky.PrevKettoNum)
# + AnalyzeExpectedValueC01Jocky.PrevHitCount5 + (1 | AnalyzeExpectedValueC01Jocky.PrevKettoNum) + (0 + AnalyzeExpectedValueC01Jocky.PrevHitCount5 | AnalyzeExpectedValueC01Jocky.PrevKettoNum)

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