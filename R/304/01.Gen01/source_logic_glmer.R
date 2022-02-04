jackpot_results1 <- glmer(

AnalyzeExpectedValueF01Gen01.IsHitA

~

+ 1

+ AnalyzeExpectedValueF01Gen01.PrevHitRateA
+ (AnalyzeExpectedValueF01Gen01.PrevHitRateA | AnalyzeExpectedValueF01Gen01.HansyokuNum)
+ (AnalyzeExpectedValueF01Gen01.PrevHitRateA | AnalyzeExpectedValueF01Gen01.RaceType3Cd)
+ (AnalyzeExpectedValueF01Gen01.PrevHitRateA | AnalyzeExpectedValueF01Gen01.PrevRaceType3Cd)

# + AnalyzeExpectedValueF01Gen01.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueF01Gen01.PrevHitCount1 + (1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount2 + (1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount2 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount3 + (1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount3 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount4 + (1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount4 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount5 + (1 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount5 | AnalyzeExpectedValueF01Gen01.PrevRaceType1Cd)

# + AnalyzeExpectedValueF01Gen01.PrevRunCount + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevRunCount | AnalyzeExpectedValueF01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount1 + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount2 + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount2 | AnalyzeExpectedValueF01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount3 + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount3 | AnalyzeExpectedValueF01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount4 + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount4 | AnalyzeExpectedValueF01Gen01.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen01.PrevHitCount5 + (1 | AnalyzeExpectedValueF01Gen01.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen01.PrevHitCount5 | AnalyzeExpectedValueF01Gen01.PrevKettoNum)

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