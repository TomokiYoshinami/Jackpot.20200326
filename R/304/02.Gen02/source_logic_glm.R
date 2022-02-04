jackpot_results1 <- glm(

RaceHorse.zTime

~

+ 1

+ (1 | Race.RaceType1Cd)

+ PrevRace.SyussoTosu + (1 | PrevRace.RaceType1Cd) + (0 + PrevRace.SyussoTosu | PrevRace.RaceType1Cd)
# + PrevRaceHorse.zFutan + (1 | PrevRace.RaceType1Cd) + (0 + PrevRaceHorse.zFutan | PrevRace.RaceType1Cd)
+ PrevRaceHorse.zTime + (1 | PrevRace.RaceType1Cd) + (0 + PrevRaceHorse.zTime | PrevRace.RaceType1Cd)

# offset = log(PrevRaceHorse.TotalRunCount + 1)

,data = data6
)
