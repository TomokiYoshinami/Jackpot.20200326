jackpot_results1 <- glmer(

AnalyzeExpectedValueF01Gen02.IsHitA

~

+ 1

+ AnalyzeExpectedValueF01Gen02.PrevHitRateA
+ (AnalyzeExpectedValueF01Gen02.PrevHitRateA | AnalyzeExpectedValueF01Gen02.HansyokuNum)
+ (AnalyzeExpectedValueF01Gen02.PrevHitRateA | AnalyzeExpectedValueF01Gen02.RaceType3Cd)
+ (AnalyzeExpectedValueF01Gen02.PrevHitRateA | AnalyzeExpectedValueF01Gen02.PrevRaceType3Cd)

# + AnalyzeExpectedValueF01Gen02.PrevRunCount + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevRunCount | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount1 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount1 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount2 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount2 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount3 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount3 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount4 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount4 | Race.RaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount5 + (1 | Race.RaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount5 | Race.RaceType1Cd)

# + AnalyzeExpectedValueF01Gen02.PrevHitCount1 + (1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount2 + (1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount2 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount3 + (1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount3 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount4 + (1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount4 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount5 + (1 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount5 | AnalyzeExpectedValueF01Gen02.PrevRaceType1Cd)

# + AnalyzeExpectedValueF01Gen02.PrevRunCount + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevRunCount | AnalyzeExpectedValueF01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount1 + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount2 + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount2 | AnalyzeExpectedValueF01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount3 + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount3 | AnalyzeExpectedValueF01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount4 + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount4 | AnalyzeExpectedValueF01Gen02.PrevKettoNum)
# + AnalyzeExpectedValueF01Gen02.PrevHitCount5 + (1 | AnalyzeExpectedValueF01Gen02.PrevKettoNum) + (0 + AnalyzeExpectedValueF01Gen02.PrevHitCount5 | AnalyzeExpectedValueF01Gen02.PrevKettoNum)

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