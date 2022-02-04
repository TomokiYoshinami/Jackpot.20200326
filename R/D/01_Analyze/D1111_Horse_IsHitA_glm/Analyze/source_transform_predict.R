print(paste0(Sys.time(),  " --- source_transform.R Start ---"))

#-------------------------------------
#Transform
#-------------------------------------
# as.POSIXct("2020-05-01",tz="UTC")
# as.POSIXit("2020-05-01",tz="UTC")
data<-transform(data
# InputDataSet<-transform(InputDataSet

# + Race.RaceId
# + Race.IsAnalyzeNormalPastAndFuture
# + Race.IsAnalyzeNormalPast
# + Race.IsAnalyzeNormalFuture
# + Race.IsAnalyzeFullPastAndFuture
# + Race.IsAnalyzeFullPast
# + Race.IsAnalyzeFullFuture
# + Race.JyokenCd
# + Race.JyoType1Cd
# + Race.RaceType0Cd
# + Race.RaceType1Cd
# + Race.RaceType2Cd
# + Race.RaceType3Cd
# + Race.RaceType4Cd

# + RaceHorse.RaceId
# + RaceHorse.KettoNum
# + RaceHorse.IsHit1
# + RaceHorse.IsHit2
# + RaceHorse.IsHit3
# + RaceHorse.IsHit4
# + RaceHorse.IsHit5
# + RaceHorse.IsHit6
# + RaceHorse.IsValidRaceHorse
# + RaceHorse.IsHitA
# + RaceHorse.IsHitB
# + RaceHorse.IsHitC
# + RaceHorse.IsHitD
# + RaceHorse.IsHitE

# + Horse.TimeDvByRace
# + Horse.TimeDvByRaceType1

# + EOF

)

print(paste0(Sys.time(),  " --- source_transform.R Finished ---"))
