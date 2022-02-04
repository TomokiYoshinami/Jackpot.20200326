# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.JyoCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.JyoCd)=", levels(data$Race.JyoCd)))
print(paste0("levels(InputDataSet$Race.JyoCd)=", levels(InputDataSet$Race.JyoCd)))
Race.JyoCd.Index <- which(!(InputDataSet$Race.JyoCd %in% levels(data$Race.JyoCd)))
print(paste0("length(Race.JyoCd.Index)=", length(Race.JyoCd.Index)))
InputDataSet$Race.JyoCd[Race.JyoCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.DistanceType2Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.DistanceType2Cd)=", levels(data$Race.DistanceType2Cd)))
print(paste0("levels(InputDataSet$Race.DistanceType2Cd)=", levels(InputDataSet$Race.DistanceType2Cd)))
Race.DistanceType2Cd.Index <- which(!(InputDataSet$Race.DistanceType2Cd %in% levels(data$Race.DistanceType2Cd)))
print(paste0("length(Race.DistanceType2Cd.Index)=", length(Race.DistanceType2Cd.Index)))
InputDataSet$Race.DistanceType2Cd[Race.DistanceType2Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.RaceType1Cd)=", levels(data$Race.RaceType1Cd)))
print(paste0("levels(InputDataSet$Race.RaceType1Cd)=", levels(InputDataSet$Race.RaceType1Cd)))
Race.RaceType1Cd.Index <- which(!(InputDataSet$Race.RaceType1Cd %in% levels(data$Race.RaceType1Cd)))
print(paste0("length(Race.RaceType1Cd.Index)=", length(Race.RaceType1Cd.Index)))
InputDataSet$Race.RaceType1Cd[Race.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.JyoType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.JyoType1Cd)=", levels(data$Race.JyoType1Cd)))
print(paste0("levels(InputDataSet$Race.JyoType1Cd)=", levels(InputDataSet$Race.JyoType1Cd)))
Race.JyoType1Cd.Index <- which(!(InputDataSet$Race.JyoType1Cd %in% levels(data$Race.JyoType1Cd)))
print(paste0("length(Race.JyoType1Cd.Index)=", length(Race.JyoType1Cd.Index)))
InputDataSet$Race.JyoType1Cd[Race.JyoType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.RaceType1Cd)=", levels(data$Race.RaceType1Cd)))
print(paste0("levels(InputDataSet$Race.RaceType1Cd)=", levels(InputDataSet$Race.RaceType1Cd)))
Race.RaceType1Cd.Index <- which(!(InputDataSet$Race.RaceType1Cd %in% levels(data$Race.RaceType1Cd)))
print(paste0("length(Race.RaceType1Cd.Index)=", length(Race.RaceType1Cd.Index)))
InputDataSet$Race.RaceType1Cd[Race.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.KeiroCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$RaceHorse.KeiroCd)=", levels(data$RaceHorse.KeiroCd)))
print(paste0("levels(InputDataSet$RaceHorse.KeiroCd)=", levels(InputDataSet$RaceHorse.KeiroCd)))
RaceHorse.KeiroCd.Index <- which(!(InputDataSet$RaceHorse.KeiroCd %in% levels(data$RaceHorse.KeiroCd)))
print(paste0("length(RaceHorse.KeiroCd.Index)=", length(RaceHorse.KeiroCd.Index)))
InputDataSet$RaceHorse.KeiroCd[RaceHorse.KeiroCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.MinariCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$RaceHorse.MinaraiCd)=", levels(data$RaceHorse.MinaraiCd)))
print(paste0("levels(InputDataSet$RaceHorse.MinaraiCd)=", levels(InputDataSet$RaceHorse.MinaraiCd)))
RaceHorse.MinaraiCd.Index <- which(!(InputDataSet$RaceHorse.MinaraiCd %in% levels(data$RaceHorse.MinaraiCd)))
print(paste0("length(RaceHorse.MinaraiCd.Index)=", length(RaceHorse.MinaraiCd.Index)))
InputDataSet$RaceHorse.MinaraiCd[RaceHorse.MinaraiCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.JyoCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.JyoCd)=", levels(data$PrevRace.JyoCd)))
print(paste0("levels(InputDataSet$PrevRace.JyoCd)=", levels(InputDataSet$PrevRace.JyoCd)))
PrevRace.JyoCd.Index <- which(!(InputDataSet$PrevRace.JyoCd %in% levels(data$PrevRace.JyoCd)))
print(paste0("length(PrevRace.JyoCd.Index)=", length(PrevRace.JyoCd.Index)))
InputDataSet$PrevRace.JyoCd[PrevRace.JyoCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.DistanceType2Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.DistanceType2Cd)=", levels(data$PrevRace.DistanceType2Cd)))
print(paste0("levels(InputDataSet$PrevRace.DistanceType2Cd)=", levels(InputDataSet$PrevRace.DistanceType2Cd)))
PrevRace.DistanceType2Cd.Index <- which(!(InputDataSet$PrevRace.DistanceType2Cd %in% levels(data$PrevRace.DistanceType2Cd)))
print(paste0("length(PrevRace.DistanceType2Cd.Index)=", length(PrevRace.DistanceType2Cd.Index)))
InputDataSet$PrevRace.DistanceType2Cd[PrevRace.DistanceType2Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.JyoType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.JyoType1Cd)=", levels(data$PrevRace.JyoType1Cd)))
print(paste0("levels(InputDataSet$PrevRace.JyoType1Cd)=", levels(InputDataSet$PrevRace.JyoType1Cd)))
PrevRace.JyoType1Cd.Index <- which(!(InputDataSet$PrevRace.JyoType1Cd %in% levels(data$PrevRace.JyoType1Cd)))
print(paste0("length(PrevRace.JyoType1Cd.Index)=", length(PrevRace.JyoType1Cd.Index)))
InputDataSet$PrevRace.JyoType1Cd[PrevRace.JyoType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.RaceType1Cd)=", levels(data$PrevRace.RaceType1Cd)))
print(paste0("levels(InputDataSet$PrevRace.RaceType1Cd)=", levels(InputDataSet$PrevRace.RaceType1Cd)))
PrevRace.RaceType1Cd.Index <- which(!(InputDataSet$PrevRace.RaceType1Cd %in% levels(data$PrevRace.RaceType1Cd)))
print(paste0("length(PrevRace.RaceType1Cd.Index)=", length(PrevRace.RaceType1Cd.Index)))
InputDataSet$PrevRace.RaceType1Cd[PrevRace.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.RaceType1Cd)=", levels(data$PrevRace.RaceType1Cd)))
print(paste0("levels(InputDataSet$PrevRace.RaceType1Cd)=", levels(InputDataSet$PrevRace.RaceType1Cd)))
PrevRace.RaceType1Cd.Index <- which(!(InputDataSet$PrevRace.RaceType1Cd %in% levels(data$PrevRace.RaceType1Cd)))
print(paste0("length(PrevRace.RaceType1Cd.Index)=", length(PrevRace.RaceType1Cd.Index)))
InputDataSet$PrevRace.RaceType1Cd[PrevRace.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.KeiroCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRaceHorse.KeiroCd)=", levels(data$PrevRaceHorse.KeiroCd)))
print(paste0("levels(InputDataSet$PrevRaceHorse.KeiroCd)=", levels(InputDataSet$PrevRaceHorse.KeiroCd)))
PrevRaceHorse.KeiroCd.Index <- which(!(InputDataSet$PrevRaceHorse.KeiroCd %in% levels(data$PrevRaceHorse.KeiroCd)))
print(paste0("length(PrevRaceHorse.KeiroCd.Index)=", length(PrevRaceHorse.KeiroCd.Index)))
InputDataSet$PrevRaceHorse.KeiroCd[PrevRaceHorse.KeiroCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.MinariCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$RaceHorse.MinaraiCd)=", levels(data$RaceHorse.MinaraiCd)))
print(paste0("levels(InputDataSet$RaceHorse.MinaraiCd)=", levels(InputDataSet$RaceHorse.MinaraiCd)))
RaceHorse.MinaraiCd.Index <- which(!(InputDataSet$RaceHorse.MinaraiCd %in% levels(data$RaceHorse.MinaraiCd)))
print(paste0("length(RaceHorse.MinaraiCd.Index)=", length(RaceHorse.MinaraiCd.Index)))
InputDataSet$RaceHorse.MinaraiCd[RaceHorse.MinaraiCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.JyoCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRace.JyoCd)=", levels(data$PrevRace.JyoCd)))
print(paste0("levels(InputDataSet$PrevRace.JyoCd)=", levels(InputDataSet$PrevRace.JyoCd)))
PrevRace.JyoCd.Index <- which(!(InputDataSet$PrevRace.JyoCd %in% levels(data$PrevRace.JyoCd)))
print(paste0("length(PrevRace.JyoCd.Index)=", length(PrevRace.JyoCd.Index)))
InputDataSet$PrevRace.JyoCd[PrevRace.JyoCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.KeiroCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$PrevRaceHorse.KeiroCd)=", levels(data$PrevRaceHorse.KeiroCd)))
print(paste0("levels(InputDataSet$PrevRaceHorse.KeiroCd)=", levels(InputDataSet$PrevRaceHorse.KeiroCd)))
PrevRaceHorse.KeiroCd.Index <- which(!(InputDataSet$PrevRaceHorse.KeiroCd %in% levels(data$PrevRaceHorse.KeiroCd)))
print(paste0("length(PrevRaceHorse.KeiroCd.Index)=", length(PrevRaceHorse.KeiroCd.Index)))
InputDataSet$PrevRaceHorse.KeiroCd[PrevRaceHorse.KeiroCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.MinariCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$RaceHorse.MinaraiCd)=", levels(data$RaceHorse.MinaraiCd)))
print(paste0("levels(InputDataSet$RaceHorse.MinaraiCd)=", levels(InputDataSet$RaceHorse.MinaraiCd)))
RaceHorse.MinaraiCd.Index <- which(!(InputDataSet$RaceHorse.MinaraiCd %in% levels(data$RaceHorse.MinaraiCd)))
print(paste0("length(RaceHorse.MinaraiCd.Index)=", length(RaceHorse.MinaraiCd.Index)))
InputDataSet$RaceHorse.MinaraiCd[RaceHorse.MinaraiCd.Index] <- NA
