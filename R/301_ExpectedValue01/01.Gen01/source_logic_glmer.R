jackpot_results1 <- glmer(

AnalyzeExpectedValue01HorseTotal.ExpectedValue

~

+ 1

+ AnalyzeExpectedValue01HorseTotal.PrevExpectedValue + (1 | AnalyzeExpectedValue01HorseTotal.PrevExpectedValue)

# + AnalyzeExpectedValue01HorseTotal.PrevExpectedValue + (1 | AnalyzeExpectedValue01HorseTotal.PrevExpectedValue) + (0 + AnalyzeExpectedValue01HorseTotal.PrevExpectedValue | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)

# + AnalyzeExpectedValue01HorseTotal.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 + (1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 + (1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 + (1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 + (1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 + (1 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 | AnalyzeExpectedValue01HorseTotal.PrevRaceType1Cd)

# + AnalyzeExpectedValue01HorseTotal.PrevRunCount + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevRunCount | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount2 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount3 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount4 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)
# + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 + (1 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum) + (0 + AnalyzeExpectedValue01HorseTotal.PrevHitCount5 | AnalyzeExpectedValue01HorseTotal.PrevKettoNum)

,family = "binomial"
# ,family = "binomial"
# ,family = "gaussian"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
# ,data = data6
,data = subset(data6, Race.IsAnalyzeNormalPast == 1)
)