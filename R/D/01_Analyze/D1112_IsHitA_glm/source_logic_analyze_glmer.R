print(paste0(Sys.time(),  " --- source_logic_glmer.R Start ---"))

anayze.results.glm <- glmer(
## RaceHorse.Time
RaceHorse.IsHitA
# RaceHorse.IsHitB
# RaceHorse.IsHitC
## RaceHorse.TimeDv
## RaceHorse.TimeDvByRace
## RaceHorse.TimeDvByJyoType1
## RaceHorse.TimeDvByRaceType0
## RaceHorse.TimeDvByRaceType1
## RaceHorse.LastTimeDv
## RaceHorse.LastTimeDvByRace
## RaceHorse.LastTimeDvByJyoType1
## RaceHorse.LastTimeDvByRaceType0
## RaceHorse.LastTimeDvByRaceType1
## RaceHorse.LastSpeedDvByRace
## RaceHorse.LastSpeedDvByJyoType1
## RaceHorse.LastSpeedDvByRaceType0
## RaceHorse.LastSpeedDvByRaceType1
## RaceHorse.LastTimeSpeedDvByRace
## RaceHorse.LastTimeSpeedDvByJyoType1
## RaceHorse.LastTimeSpeedDvByRaceType0
## RaceHorse.LastTimeSpeedDvByRaceType1
~
+ 1
# + Race.RecKubun
# + Race.DataKubun
# + Race.MakeDate
# + Race.RaceDate
# + Race.JyoCd
# + Race.Kaiji
# + Race.Nichiji
# + Race.RaceNum
# + Race.RaceId
# + Race.YoubiCd
# + Race.TokuNum
# + Race.Hondai
# + Race.Fukudai
# + Race.Kakko
# + Race.HondaiEng
# + Race.FukudaiEng
# + Race.KakkoEng
# + Race.Ryakusyo10
# + Race.Ryakusyo6
# + Race.Ryakusyo3
# + Race.Kubun
# + Race.Nkai
# + Race.GradeCd
# + Race.GradeCdBefore
# + Race.SyubetuCd
# + Race.KigoCd
# + Race.JyuryoCd
# + Race.Jyoken1Cd
# + Race.Jyoken2Cd
# + Race.Jyoken3Cd
# + Race.Jyoken4Cd
# + Race.Jyoken5Cd
# + Race.JyokenName
# + Race.Kyori
# + Race.KyoriBefore
# + Race.DistanceTypeCd
# + Race.DistanceType2Cd
# + Race.TrackCd
# + Race.TrackCdBefore
# + Race.CourseKubunCd
# + Race.CourseKubunCdBefore
# + Race.Honsyokin1
# + Race.Honsyokin2
# + Race.Honsyokin3
# + Race.Honsyokin4
# + Race.Honsyokin5
# + Race.Honsyokin6
# + Race.Honsyokin7
# + Race.HonsyokinBefore1
# + Race.HonsyokinBefore2
# + Race.HonsyokinBefore3
# + Race.HonsyokinBefore4
# + Race.HonsyokinBefore5
# + Race.Fukasyokin1
# + Race.Fukasyokin2
# + Race.Fukasyokin3
# + Race.Fukasyokin4
# + Race.Fukasyokin5
# + Race.FukasyokinBefore1
# + Race.FukasyokinBefore2
# + Race.FukasyokinBefore3
# + Race.HassoTime
# + Race.HassoTimeBefore
# + Race.TorokuTosu
# + Race.SyussoTosu
# + Race.NyusenTosu
# + Race.TenkoCd
# + Race.TrackTypeCd
# + Race.TrackType2Cd
# + Race.TrackType3Cd
# + Race.CourseTypeCd
# + Race.TrackConditionCd
# + Race.SibaBabaCd
# + Race.DirtBabaCd
# + Race.FastestStart3Time
# + Race.FastestStart8Time
# + Race.FastestStart4Time
# + Race.FastestLast3Time
# + Race.FastestLast4Time
# + Race.RecordUpKubun
# + Race.IsUpdatedEntity
# + Race.Timestamp01
# + Race.IsJraRace
# + Race.IsUpdatedRace
# + Race.IsUpdatedRaceHorse
# + Race.IsUpdatedDataMining
# + Race.IsUpdatedDataMiningTaisen
# + Race.IsUpdatedRaceHorseHistory
# + Race.IsPredictedRace
# + Race.Timestamp02
# + Race.IsConfirmedRace
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
# + Race.ThisRaceYear
# + Race.PrevRaceYear
# + Race.AnalyzeGeneralRaceDateFrom
# + Race.AnalyzeGeneralRaceDateTo
# + Race.AnalyzeGen01RaceDateFrom
# + Race.AnalyzeGen01RaceDateTo
# + Race.AnalyzeGen01RaceDateFrom
# + Race.AnalyzeGen01RaceDateTo
# + Race.AnalyzeHorseRaceDateFrom
# + Race.AnalyzeHorseRaceDateTo
# + Race.AnalyzeJockyRaceDateFrom
# + Race.AnalyzeJockyRaceDateTo
# + Race.KyoriRemainder
# + Race.FastestStart38Time
# + Race.Timestamp03
# + Race.CrawlDatetime
# + Race.IsAutoBet
# + Race.AutoBetDatetime
# + Race.Timestamp05
# + Race.Guid

# + Race.DefaultHitRateA
# + Race.DefaultHitRateB
# + Race.DefaultHitRateC
# + RaceHorse.RecKubun
# + RaceHorse.DataKubun
# + RaceHorse.MakeDate
# + RaceHorse.RaceDate
# + RaceHorse.JyoCd
# + RaceHorse.Kaiji
# + RaceHorse.Nichiji
# + RaceHorse.RaceNum
# + RaceHorse.RaceId
# + RaceHorse.KettoNum
# + RaceHorse.Wakuban
# + RaceHorse.Umaban
# + RaceHorse.Bamei
# + RaceHorse.UmaKigoCd
# + RaceHorse.SexCd
# + RaceHorse.IsSex1
# + RaceHorse.IsSex2
# + RaceHorse.IsSex3
# + RaceHorse.HinsyuCd
# + RaceHorse.KeiroCd
# + RaceHorse.Barei
# + RaceHorse.TozaiCd
# + RaceHorse.ChokyosiCode
# + RaceHorse.ChokyosiRyakusyo
# + RaceHorse.BanusiCode
# + RaceHorse.BanusiName
# + RaceHorse.ColourCd
# + RaceHorse.Reserved1
# + RaceHorse.Futan
# + RaceHorse.FutanBefore
# + RaceHorse.BlinkerCd
# + RaceHorse.IsBlinker
# + RaceHorse.Reserved2
# + RaceHorse.KisyuCode
# + RaceHorse.KisyuCodeBefore
# + RaceHorse.KisyuRyakusyo
# + RaceHorse.KisyuRyakusyoBefore
# + RaceHorse.MinaraiCd
# + RaceHorse.IsMinarai0
# + RaceHorse.IsMinarai1
# + RaceHorse.IsMinarai2
# + RaceHorse.IsMinarai3
# + RaceHorse.IsMinarai4
# + RaceHorse.IsMinarai9
# + RaceHorse.MinaraiCdBefore
# + RaceHorse.Bataijyu
# + RaceHorse.ZogenFugo
# + RaceHorse.ZogenSa
# + RaceHorse.IjyoCd
# + RaceHorse.NyusenJyuni
# + RaceHorse.KakuteiJyuni
# + RaceHorse.DochakuKubun
# + RaceHorse.DochakuTosu
# + RaceHorse.Time
# + RaceHorse.ChakusaCd
# + RaceHorse.ChakusaCdP
# + RaceHorse.ChakusaCdPp
# + RaceHorse.Jyuni1C
# + RaceHorse.Jyuni2C
# + RaceHorse.Jyuni3C
# + RaceHorse.Jyuni4C
# + RaceHorse.Odds
# + RaceHorse.Ninki
# + RaceHorse.Honsyokin
# + RaceHorse.Fukasyokin
# + RaceHorse.Reserved3
# + RaceHorse.Reserved4
# + RaceHorse.Last4Time
# + RaceHorse.Last3Time
# + RaceHorse.KettoNum1
# + RaceHorse.Bamei1
# + RaceHorse.KettoNum2
# + RaceHorse.Bamei2
# + RaceHorse.KettoNum3
# + RaceHorse.Bamei3
# + RaceHorse.TimeDiff
# + RaceHorse.RecordUpKubun
# + RaceHorse.DmKubun
# + RaceHorse.DmTime
# + RaceHorse.DmGosaP
# + RaceHorse.DmGosaM
# + RaceHorse.DmJyuni
# + RaceHorse.RunTypeCd
# + RaceHorse.RunType
# + RaceHorse.IsRunType1
# + RaceHorse.IsRunType2
# + RaceHorse.IsRunType3
# + RaceHorse.IsRunType4
# + RaceHorse.IsUpdatedEntity
# + RaceHorse.IsConfirmedRaceHorse
# + RaceHorse.RunNum
# + RaceHorse.RunNumDesc
# + RaceHorse.IsRun
# + RaceHorse.Lifetime
# + RaceHorse.FutanRatio
# + RaceHorse.IsHit1
# + RaceHorse.IsHit2
# + RaceHorse.IsHit3
# + RaceHorse.IsHit4
# + RaceHorse.IsHit5
# + RaceHorse.IsHit6
# + RaceHorse.PrevRaceId
# + RaceHorse.PrevRunNum
# + RaceHorse.PrevJyokenCd
# + RaceHorse.PrevJyoType1Cd
# + RaceHorse.PrevRaceType0Cd
# + RaceHorse.PrevRaceType1Cd
# + RaceHorse.PrevRaceType2Cd
# + RaceHorse.PrevRaceType3Cd
# + RaceHorse.PrevRaceType4Cd
# + RaceHorse.IsValidPrepTimeSdv
# + RaceHorse.PrepTimeSdv
# + RaceHorse.PrepTimeDv
# + RaceHorse.IsValidRaceHorse
# + RaceHorse.Speed
# + RaceHorse.LastSpeed
# + RaceHorse.IsValidTimeSdv
# + RaceHorse.TimeSdv
# + RaceHorse.TimeDv
# + RaceHorse.TimeRank
# + RaceHorse.IsValidTimeSdvByRace
# + RaceHorse.TimeSdvByRace
# + RaceHorse.TimeDvByRace
# + RaceHorse.TimeRankByRace
# + RaceHorse.IsValidTimeSdvByJyoType1
# + RaceHorse.TimeSdvByJyoType1
# + RaceHorse.TimeDvByJyoType1
# + RaceHorse.TimeRankByJyoType1
# + RaceHorse.IsValidTimeSdvByRaceType0
# + RaceHorse.TimeSdvByRaceType0
# + RaceHorse.TimeDvByRaceType0
# + RaceHorse.TimeRankByRaceType0
# + RaceHorse.IsValidTimeSdvByRaceType1
# + RaceHorse.TimeSdvByRaceType1
# + RaceHorse.TimeDvByRaceType1
# + RaceHorse.TimeRankByRaceType1
# + RaceHorse.IsValidLastTimeSdv
# + RaceHorse.LastTimeSdv
# + RaceHorse.LastTimeDv
# + RaceHorse.LastTimeRank
# + RaceHorse.IsValidLastTimeSdvByRace
# + RaceHorse.LastTimeSdvByRace
# + RaceHorse.LastTimeDvByRace
# + RaceHorse.LastTimeRankByRace
# + RaceHorse.IsValidLastTimeSdvByJyoType1
# + RaceHorse.LastTimeSdvByJyoType1
# + RaceHorse.LastTimeDvByJyoType1
# + RaceHorse.LastTimeRankByJyoType1
# + RaceHorse.IsValidLastTimeSdvByRaceType0
# + RaceHorse.LastTimeSdvByRaceType0
# + RaceHorse.LastTimeDvByRaceType0
# + RaceHorse.LastTimeRankByRaceType0
# + RaceHorse.IsValidLastTimeSdvByRaceType1
# + RaceHorse.LastTimeSdvByRaceType1
# + RaceHorse.LastTimeDvByRaceType1
# + RaceHorse.LastTimeRankByRaceType1
# + RaceHorse.IsValidBareiSdv
# + RaceHorse.BareiSdv
# + RaceHorse.BareiDv
# + RaceHorse.IsValidBataijyuSdv
# + RaceHorse.BataijyuSdv
# + RaceHorse.BataijyuDv
# + RaceHorse.IsValidFutanSdv
# + RaceHorse.FutanSdv
+ RaceHorse.FutanDv
# + RaceHorse.IsValidLifetimeSdv
# + RaceHorse.LifetimeSdv
# + RaceHorse.LifetimeDv
# + RaceHorse.IsValidFutanRatioSdv
# + RaceHorse.FutanRatioSdv
# + RaceHorse.FutanRatioDv
# + RaceHorse.IsValidSpeedSdv
# + RaceHorse.SpeedSdv
# + RaceHorse.SpeedDv
# + RaceHorse.IsValidSpeedSdvByRace
# + RaceHorse.SpeedSdvByRace
# + RaceHorse.SpeedDvByRace
# + RaceHorse.IsValidSpeedSdvByJyoType1
# + RaceHorse.SpeedSdvByJyoType1
# + RaceHorse.SpeedDvByJyoType1
# + RaceHorse.IsValidSpeedSdvByRaceType0
# + RaceHorse.SpeedSdvByRaceType0
# + RaceHorse.SpeedDvByRaceType0
# + RaceHorse.IsValidSpeedSdvByRaceType1
# + RaceHorse.SpeedSdvByRaceType1
# + RaceHorse.SpeedDvByRaceType1
# + RaceHorse.IsValidLastSpeedSdv
# + RaceHorse.LastSpeedSdv
# + RaceHorse.LastSpeedDv
# + RaceHorse.IsValidLastSpeedSdvByRace
# + RaceHorse.LastSpeedSdvByRace
# + RaceHorse.LastSpeedDvByRace
# + RaceHorse.IsValidLastSpeedSdvByJyoType1
# + RaceHorse.LastSpeedSdvByJyoType1
# + RaceHorse.LastSpeedDvByJyoType1
# + RaceHorse.IsValidLastSpeedSdvByRaceType0
# + RaceHorse.LastSpeedSdvByRaceType0
# + RaceHorse.LastSpeedDvByRaceType0
# + RaceHorse.IsValidLastSpeedSdvByRaceType1
# + RaceHorse.LastSpeedSdvByRaceType1
# + RaceHorse.LastSpeedDvByRaceType1
# + RaceHorse.StdTimeByClass
# + RaceHorse.StdTime
# + RaceHorse.StdJyoType1Cd
# + RaceHorse.StdRaceType1Cd
# + RaceHorse.StdFutan
# + RaceHorse.StdPrevJyoType1Cd
# + RaceHorse.StdPrevRaceType1Cd
# + RaceHorse.StdPrevFutan
# + RaceHorse.IsValidStdTimeSdv
# + RaceHorse.StdTimeSdv
# + RaceHorse.StdTimeDv
# + RaceHorse.StdTimeRank
# + RaceHorse.StdTimeSdvByRace
# + RaceHorse.StdTimeDvByRace
# + RaceHorse.StdTimeRankByRace
# + RaceHorse.IsValidPredictTime
# + RaceHorse.PredictTime
# + RaceHorse.PredictTimeSdvByRace
# + RaceHorse.PredictTimeDvByRace
# + RaceHorse.PredictTimeRankByRace
# + RaceHorse.IsValidPerfTime
# + RaceHorse.PerfTime
# + RaceHorse.PerfTimeSdvByRace
# + RaceHorse.PerfTimeDvByRace
# + RaceHorse.PerfTimeRankByRace
# + RaceHorse.PredictDatetime
# + RaceHorse.IsValidPredictValueA
# + RaceHorse.PredictValueA
# + RaceHorse.PredictValueDvA
# + RaceHorse.PredictValueRankA
# + RaceHorse.PredictErrorA
# + RaceHorse.ExpectedOddsA
# + RaceHorse.Odds1A
# + RaceHorse.Odds2A
# + RaceHorse.IsValidPredictValueB
# + RaceHorse.PredictValueB
# + RaceHorse.PredictValueDvB
# + RaceHorse.PredictValueRankB
# + RaceHorse.PredictErrorB
# + RaceHorse.ExpectedOddsB
# + RaceHorse.Odds1B
# + RaceHorse.Odds2B
# + RaceHorse.IsValidPredictValueC
# + RaceHorse.PredictValueC
# + RaceHorse.PredictValueDvC
# + RaceHorse.PredictValueRankC
# + RaceHorse.PredictErrorC
# + RaceHorse.ExpectedOddsC
# + RaceHorse.Odds1C
# + RaceHorse.Odds2C
# + RaceHorse.OddsLog
# + RaceHorse.OddsRatio
# + RaceHorse.OddsLogit
# + RaceHorse.ApprovalRate
# + RaceHorse.ApprovalRateLog
# + RaceHorse.IsHitA
# + RaceHorse.IsHitB
# + RaceHorse.IsHitC
# + RaceHorse.IsHitD
# + RaceHorse.IsHitE
# + RaceHorse.LifetimeLog

# + PrevRace.RecKubun
# + PrevRace.DataKubun
# + PrevRace.MakeDate
# + PrevRace.RaceDate
# + PrevRace.JyoCd
# + PrevRace.Kaiji
# + PrevRace.Nichiji
# + PrevRace.RaceNum
# + PrevRace.RaceId
# + PrevRace.YoubiCd
# + PrevRace.TokuNum
# + PrevRace.Hondai
# + PrevRace.Fukudai
# + PrevRace.Kakko
# + PrevRace.HondaiEng
# + PrevRace.FukudaiEng
# + PrevRace.KakkoEng
# + PrevRace.Ryakusyo10
# + PrevRace.Ryakusyo6
# + PrevRace.Ryakusyo3
# + PrevRace.Kubun
# + PrevRace.Nkai
# + PrevRace.GradeCd
# + PrevRace.GradeCdBefore
# + PrevRace.SyubetuCd
# + PrevRace.KigoCd
# + PrevRace.JyuryoCd
# + PrevRace.Jyoken1Cd
# + PrevRace.Jyoken2Cd
# + PrevRace.Jyoken3Cd
# + PrevRace.Jyoken4Cd
# + PrevRace.Jyoken5Cd
# + PrevRace.JyokenName
# + PrevRace.Kyori
# + PrevRace.KyoriBefore
# + PrevRace.DistanceTypeCd
# + PrevRace.DistanceType2Cd
# + PrevRace.TrackCd
# + PrevRace.TrackCdBefore
# + PrevRace.CourseKubunCd
# + PrevRace.CourseKubunCdBefore
# + PrevRace.Honsyokin1
# + PrevRace.Honsyokin2
# + PrevRace.Honsyokin3
# + PrevRace.Honsyokin4
# + PrevRace.Honsyokin5
# + PrevRace.Honsyokin6
# + PrevRace.Honsyokin7
# + PrevRace.HonsyokinBefore1
# + PrevRace.HonsyokinBefore2
# + PrevRace.HonsyokinBefore3
# + PrevRace.HonsyokinBefore4
# + PrevRace.HonsyokinBefore5
# + PrevRace.Fukasyokin1
# + PrevRace.Fukasyokin2
# + PrevRace.Fukasyokin3
# + PrevRace.Fukasyokin4
# + PrevRace.Fukasyokin5
# + PrevRace.FukasyokinBefore1
# + PrevRace.FukasyokinBefore2
# + PrevRace.FukasyokinBefore3
# + PrevRace.HassoTime
# + PrevRace.HassoTimeBefore
# + PrevRace.TorokuTosu
# + PrevRace.SyussoTosu
# + PrevRace.NyusenTosu
# + PrevRace.TenkoCd
# + PrevRace.TrackTypeCd
# + PrevRace.TrackType2Cd
# + PrevRace.TrackType3Cd
# + PrevRace.CourseTypeCd
# + PrevRace.TrackConditionCd
# + PrevRace.SibaBabaCd
# + PrevRace.DirtBabaCd
# + PrevRace.FastestStart3Time
# + PrevRace.FastestStart8Time
# + PrevRace.FastestStart4Time
# + PrevRace.FastestLast3Time
# + PrevRace.FastestLast4Time
# + PrevRace.RecordUpKubun
# + PrevRace.IsUpdatedEntity
# + PrevRace.Timestamp01
# + PrevRace.IsJraRace
# + PrevRace.IsUpdatedRace
# + PrevRace.IsUpdatedRaceHorse
# + PrevRace.IsUpdatedDataMining
# + PrevRace.IsUpdatedDataMiningTaisen
# + PrevRace.IsUpdatedRaceHorseHistory
# + PrevRace.IsPredictedRace
# + PrevRace.Timestamp02
# + PrevRace.IsConfirmedRace
# + PrevRace.IsAnalyzeNormalPastAndFuture
# + PrevRace.IsAnalyzeNormalPast
# + PrevRace.IsAnalyzeNormalFuture
# + PrevRace.IsAnalyzeFullPastAndFuture
# + PrevRace.IsAnalyzeFullPast
# + PrevRace.IsAnalyzeFullFuture
# + PrevRace.JyokenCd
# + PrevRace.JyoType1Cd
# + PrevRace.RaceType0Cd
# + PrevRace.RaceType1Cd
# + PrevRace.RaceType2Cd
# + PrevRace.RaceType3Cd
# + PrevRace.RaceType4Cd
# + PrevRace.ThisRaceYear
# + PrevRace.PrevRaceYear
# + PrevRace.AnalyzeGeneralRaceDateFrom
# + PrevRace.AnalyzeGeneralRaceDateTo
# + PrevRace.AnalyzeGen01RaceDateFrom
# + PrevRace.AnalyzeGen01RaceDateTo
# + PrevRace.AnalyzeGen01RaceDateFrom
# + PrevRace.AnalyzeGen01RaceDateTo
# + PrevRace.AnalyzeHorseRaceDateFrom
# + PrevRace.AnalyzeHorseRaceDateTo
# + PrevRace.AnalyzeJockyRaceDateFrom
# + PrevRace.AnalyzeJockyRaceDateTo
# + PrevRace.KyoriRemainder
# + PrevRace.FastestStart38Time
# + PrevRace.Timestamp03
# + PrevRace.CrawlDatetime
# + PrevRace.IsAutoBet
# + PrevRace.AutoBetDatetime
# + PrevRace.Timestamp05
# + PrevRace.Guid
# + PrevRace.DefaultHitRateA
# + PrevRace.DefaultHitRateB
# + PrevRace.DefaultHitRateC
# + PrevRaceHorse.RecKubun
# + PrevRaceHorse.DataKubun
# + PrevRaceHorse.MakeDate
# + PrevRaceHorse.RaceDate
# + PrevRaceHorse.JyoCd
# + PrevRaceHorse.Kaiji
# + PrevRaceHorse.Nichiji
# + PrevRaceHorse.RaceNum
# + PrevRaceHorse.RaceId
# + PrevRaceHorse.KettoNum
# + PrevRaceHorse.Wakuban
# + PrevRaceHorse.Umaban
# + PrevRaceHorse.Bamei
# + PrevRaceHorse.UmaKigoCd
# + PrevRaceHorse.SexCd
# + PrevRaceHorse.IsSex1
# + PrevRaceHorse.IsSex2
# + PrevRaceHorse.IsSex3
# + PrevRaceHorse.HinsyuCd
# + PrevRaceHorse.KeiroCd
# + PrevRaceHorse.Barei
# + PrevRaceHorse.TozaiCd
# + PrevRaceHorse.ChokyosiCode
# + PrevRaceHorse.ChokyosiRyakusyo
# + PrevRaceHorse.BanusiCode
# + PrevRaceHorse.BanusiName
# + PrevRaceHorse.ColourCd
# + PrevRaceHorse.Reserved1
# + PrevRaceHorse.Futan
# + PrevRaceHorse.FutanBefore
# + PrevRaceHorse.BlinkerCd
# + PrevRaceHorse.IsBlinker
# + PrevRaceHorse.Reserved2
# + PrevRaceHorse.KisyuCode
# + PrevRaceHorse.KisyuCodeBefore
# + PrevRaceHorse.KisyuRyakusyo
# + PrevRaceHorse.KisyuRyakusyoBefore
# + PrevRaceHorse.MinaraiCd
# + PrevRaceHorse.IsMinarai0
# + PrevRaceHorse.IsMinarai1
# + PrevRaceHorse.IsMinarai2
# + PrevRaceHorse.IsMinarai3
# + PrevRaceHorse.IsMinarai4
# + PrevRaceHorse.IsMinarai9
# + PrevRaceHorse.MinaraiCdBefore
# + PrevRaceHorse.Bataijyu
# + PrevRaceHorse.ZogenFugo
# + PrevRaceHorse.ZogenSa
# + PrevRaceHorse.IjyoCd
# + PrevRaceHorse.NyusenJyuni
# + PrevRaceHorse.KakuteiJyuni
# + PrevRaceHorse.DochakuKubun
# + PrevRaceHorse.DochakuTosu
# + PrevRaceHorse.Time
# + PrevRaceHorse.ChakusaCd
# + PrevRaceHorse.ChakusaCdP
# + PrevRaceHorse.ChakusaCdPp
# + PrevRaceHorse.Jyuni1C
# + PrevRaceHorse.Jyuni2C
# + PrevRaceHorse.Jyuni3C
# + PrevRaceHorse.Jyuni4C
# + PrevRaceHorse.Odds
# + PrevRaceHorse.Ninki
# + PrevRaceHorse.Honsyokin
# + PrevRaceHorse.Fukasyokin
# + PrevRaceHorse.Reserved3
# + PrevRaceHorse.Reserved4
# + PrevRaceHorse.Last4Time
# + PrevRaceHorse.Last3Time
# + PrevRaceHorse.KettoNum1
# + PrevRaceHorse.Bamei1
# + PrevRaceHorse.KettoNum2
# + PrevRaceHorse.Bamei2
# + PrevRaceHorse.KettoNum3
# + PrevRaceHorse.Bamei3
# + PrevRaceHorse.TimeDiff
# + PrevRaceHorse.RecordUpKubun
# + PrevRaceHorse.DmKubun
# + PrevRaceHorse.DmTime
# + PrevRaceHorse.DmGosaP
# + PrevRaceHorse.DmGosaM
# + PrevRaceHorse.DmJyuni
# + PrevRaceHorse.RunTypeCd
# + PrevRaceHorse.RunType
# + PrevRaceHorse.IsRunType1
# + PrevRaceHorse.IsRunType2
# + PrevRaceHorse.IsRunType3
# + PrevRaceHorse.IsRunType4
# + PrevRaceHorse.IsUpdatedEntity
# + PrevRaceHorse.IsConfirmedRaceHorse
# + PrevRaceHorse.RunNum
# + PrevRaceHorse.RunNumDesc
# + PrevRaceHorse.IsRun
# + PrevRaceHorse.Lifetime
# + PrevRaceHorse.FutanRatio
# + PrevRaceHorse.IsHit1
# + PrevRaceHorse.IsHit2
# + PrevRaceHorse.IsHit3
# + PrevRaceHorse.IsHit4
# + PrevRaceHorse.IsHit5
# + PrevRaceHorse.IsHit6
# + PrevRaceHorse.PrevRaceId
# + PrevRaceHorse.PrevRunNum
# + PrevRaceHorse.PrevJyokenCd
# + PrevRaceHorse.PrevJyoType1Cd
# + PrevRaceHorse.PrevRaceType0Cd
# + PrevRaceHorse.PrevRaceType1Cd
# + PrevRaceHorse.PrevRaceType2Cd
# + PrevRaceHorse.PrevRaceType3Cd
# + PrevRaceHorse.PrevRaceType4Cd
# + PrevRaceHorse.IsValidPrepTimeSdv
# + PrevRaceHorse.PrepTimeSdv
# + PrevRaceHorse.PrepTimeDv
# + PrevRaceHorse.IsValidRaceHorse
# + PrevRaceHorse.Speed
# + PrevRaceHorse.LastSpeed
# + PrevRaceHorse.IsValidTimeSdv
# + PrevRaceHorse.TimeSdv
# + PrevRaceHorse.TimeDv
# + PrevRaceHorse.TimeRank
# + PrevRaceHorse.IsValidTimeSdvByRace
# + PrevRaceHorse.TimeSdvByRace
+ PrevRaceHorse.TimeDvByRace
# + PrevRaceHorse.TimeRankByRace
# + PrevRaceHorse.IsValidTimeSdvByJyoType1
# + PrevRaceHorse.TimeSdvByJyoType1
# + PrevRaceHorse.TimeDvByJyoType1
# + PrevRaceHorse.TimeRankByJyoType1
# + PrevRaceHorse.IsValidTimeSdvByRaceType0
# + PrevRaceHorse.TimeSdvByRaceType0
# + RaceHorse.TimeDvByRaceType0
# + PrevRaceHorse.TimeRankByRaceType0
# + PrevRaceHorse.IsValidTimeSdvByRaceType1
# + PrevRaceHorse.TimeSdvByRaceType1
# + RaceHorse.TimeDvByRaceType1
# + PrevRaceHorse.TimeRankByRaceType1
# + PrevRaceHorse.IsValidLastTimeSdv
# + PrevRaceHorse.LastTimeSdv
# + PrevRaceHorse.LastTimeDv
# + PrevRaceHorse.LastTimeRank
# + PrevRaceHorse.IsValidLastTimeSdvByRace
# + PrevRaceHorse.LastTimeSdvByRace
# + PrevRaceHorse.LastTimeDvByRace
# + PrevRaceHorse.LastTimeRankByRace
# + PrevRaceHorse.IsValidLastTimeSdvByJyoType1
# + PrevRaceHorse.LastTimeSdvByJyoType1
# + PrevRaceHorse.LastTimeDvByJyoType1
# + PrevRaceHorse.LastTimeRankByJyoType1
# + PrevRaceHorse.IsValidLastTimeSdvByRaceType0
# + PrevRaceHorse.LastTimeSdvByRaceType0
# + PrevRaceHorse.LastTimeDvByRaceType0
# + PrevRaceHorse.LastTimeRankByRaceType0
# + PrevRaceHorse.IsValidLastTimeSdvByRaceType1
# + PrevRaceHorse.LastTimeSdvByRaceType1
# + PrevRaceHorse.LastTimeDvByRaceType1
# + PrevRaceHorse.LastTimeRankByRaceType1
# + PrevRaceHorse.IsValidBareiSdv
# + PrevRaceHorse.BareiSdv
# + PrevRaceHorse.BareiDv
# + PrevRaceHorse.IsValidBataijyuSdv
# + PrevRaceHorse.BataijyuSdv
# + PrevRaceHorse.BataijyuDv
# + PrevRaceHorse.IsValidFutanSdv
# + PrevRaceHorse.FutanSdv
+ PrevRaceHorse.FutanDv
# + PrevRaceHorse.IsValidLifetimeSdv
# + PrevRaceHorse.LifetimeSdv
# + PrevRaceHorse.LifetimeDv
# + PrevRaceHorse.IsValidFutanRatioSdv
# + PrevRaceHorse.FutanRatioSdv
# + PrevRaceHorse.FutanRatioDv
# + PrevRaceHorse.IsValidSpeedSdv
# + PrevRaceHorse.SpeedSdv
# + PrevRaceHorse.SpeedDv
# + PrevRaceHorse.IsValidSpeedSdvByRace
# + PrevRaceHorse.SpeedSdvByRace
# + PrevRaceHorse.SpeedDvByRace
# + PrevRaceHorse.IsValidSpeedSdvByJyoType1
# + PrevRaceHorse.SpeedSdvByJyoType1
# + PrevRaceHorse.SpeedDvByJyoType1
# + PrevRaceHorse.IsValidSpeedSdvByRaceType0
# + PrevRaceHorse.SpeedSdvByRaceType0
# + PrevRaceHorse.SpeedDvByRaceType0
# + PrevRaceHorse.IsValidSpeedSdvByRaceType1
# + PrevRaceHorse.SpeedSdvByRaceType1
# + PrevRaceHorse.SpeedDvByRaceType1
# + PrevRaceHorse.IsValidLastSpeedSdv
# + PrevRaceHorse.LastSpeedSdv
# + PrevRaceHorse.LastSpeedDv
# + PrevRaceHorse.IsValidLastSpeedSdvByRace
# + PrevRaceHorse.LastSpeedSdvByRace
# + PrevRaceHorse.LastSpeedDvByRace
# + PrevRaceHorse.IsValidLastSpeedSdvByJyoType1
# + PrevRaceHorse.LastSpeedSdvByJyoType1
# + PrevRaceHorse.LastSpeedDvByJyoType1
# + PrevRaceHorse.IsValidLastSpeedSdvByRaceType0
# + PrevRaceHorse.LastSpeedSdvByRaceType0
# + PrevRaceHorse.LastSpeedDvByRaceType0
# + PrevRaceHorse.IsValidLastSpeedSdvByRaceType1
# + PrevRaceHorse.LastSpeedSdvByRaceType1
# + PrevRaceHorse.LastSpeedDvByRaceType1
# + PrevRaceHorse.StdTimeByClass
# + PrevRaceHorse.StdTime
# + PrevRaceHorse.StdJyoType1Cd
# + PrevRaceHorse.StdRaceType1Cd
# + PrevRaceHorse.StdFutan
# + PrevRaceHorse.StdPrevJyoType1Cd
# + PrevRaceHorse.StdPrevRaceType1Cd
# + PrevRaceHorse.StdPrevFutan
# + PrevRaceHorse.IsValidStdTimeSdv
# + PrevRaceHorse.StdTimeSdv
# + PrevRaceHorse.StdTimeDv
# + PrevRaceHorse.StdTimeRank
# + PrevRaceHorse.StdTimeSdvByRace
# + PrevRaceHorse.StdTimeDvByRace
# + PrevRaceHorse.StdTimeRankByRace
# + PrevRaceHorse.IsValidPredictTime
# + PrevRaceHorse.PredictTime
# + PrevRaceHorse.PredictTimeSdvByRace
# + PrevRaceHorse.PredictTimeDvByRace
# + PrevRaceHorse.PredictTimeRankByRace
# + PrevRaceHorse.IsValidPerfTime
# + PrevRaceHorse.PerfTime
# + PrevRaceHorse.PerfTimeSdvByRace
# + PrevRaceHorse.PerfTimeDvByRace
# + PrevRaceHorse.PerfTimeRankByRace
# + PrevRaceHorse.PredictDatetime
# + PrevRaceHorse.IsValidPredictValueA
# + PrevRaceHorse.PredictValueA
# + PrevRaceHorse.PredictValueDvA
# + PrevRaceHorse.PredictValueRankA
# + PrevRaceHorse.PredictErrorA
# + PrevRaceHorse.ExpectedOddsA
# + PrevRaceHorse.Odds1A
# + PrevRaceHorse.Odds2A
# + PrevRaceHorse.IsValidPredictValueB
# + PrevRaceHorse.PredictValueB
# + PrevRaceHorse.PredictValueDvB
# + PrevRaceHorse.PredictValueRankB
# + PrevRaceHorse.PredictErrorB
# + PrevRaceHorse.ExpectedOddsB
# + PrevRaceHorse.Odds1B
# + PrevRaceHorse.Odds2B
# + PrevRaceHorse.IsValidPredictValueC
# + PrevRaceHorse.PredictValueC
# + PrevRaceHorse.PredictValueDvC
# + PrevRaceHorse.PredictValueRankC
# + PrevRaceHorse.PredictErrorC
# + PrevRaceHorse.ExpectedOddsC
# + PrevRaceHorse.Odds1C
# + PrevRaceHorse.Odds2C
# + PrevRaceHorse.OddsLog
# + PrevRaceHorse.OddsRatio
# + PrevRaceHorse.OddsLogit
# + PrevRaceHorse.ApprovalRate
# + PrevRaceHorse.ApprovalRateLog
# + PrevRaceHorse.IsHitA
# + PrevRaceHorse.IsHitB
# + PrevRaceHorse.IsHitC
# + PrevRaceHorse.IsHitD
# + PrevRaceHorse.IsHitE
# + PrevRaceHorse.LifetimeLog

# ,OddsByWin.Odds1
# ,OddsByWin.OddsLog1
# ,OddsByWin.OddsRatio1
# ,OddsByWin.OddsLogit1
# ,OddsByWin.ApprovalRate1
# ,OddsByWin.ApprovalRateLog1

# ,Horse.TimeDvByRace
# ,Horse.TimeDvByRaceType1
# ,Horse.RunCount
# ,Horse.HitCount1
# ,Horse.HitCount2
# ,Horse.HitCount3
# ,Horse.HitCount4
# ,Horse.HitCount5
# ,Horse.HitCountA
# ,Horse.HitCountB
# ,Horse.HitCountC
# ,Horse.HitRate1
# ,Horse.HitRate2
# ,Horse.HitRate3
# ,Horse.HitRate4
# ,Horse.HitRate5
# ,Horse.HitRateA
# ,Horse.HitRateB
# ,Horse.HitRateC

# ,Gen01.TimeDvByRace
# ,Gen01.TimeDvByRaceType1
# ,Gen01.RunCount
# ,Gen01.HitCount1
# ,Gen01.HitCount2
# ,Gen01.HitCount3
# ,Gen01.HitCount4
# ,Gen01.HitCount5
# ,Gen01.HitCountA
# ,Gen01.HitCountB
# ,Gen01.HitCountC
# ,Gen01.HitRate1
# ,Gen01.HitRate2
# ,Gen01.HitRate3
# ,Gen01.HitRate4
# ,Gen01.HitRate5
# ,Gen01.HitRateA
# ,Gen01.HitRateB
# ,Gen01.HitRateC

# ,Gen02.TimeDvByRace
# ,Gen02.TimeDvByRaceType1
# ,Gen02.RunCount
# ,Gen02.HitCount1
# ,Gen02.HitCount2
# ,Gen02.HitCount3
# ,Gen02.HitCount4
# ,Gen02.HitCount5
# ,Gen02.HitCountA
# ,Gen02.HitCountB
# ,Gen02.HitCountC
# ,Gen02.HitRate1
# ,Gen02.HitRate2
# ,Gen02.HitRate3
# ,Gen02.HitRate4
# ,Gen02.HitRate5
# ,Gen02.HitRateA
# ,Gen02.HitRateB
# ,Gen02.HitRateC

# + EOF

+ (1 + PrevRaceHorse.TimeDvByRace | PrevRace.RaceType1Cd)
# + (1 + PrevRaceHorse.FutanDv | PrevRace.RaceType1Cd)

# offset = log(PrevH01RaceHorse.TotalRunCount + 1)

# ,control=lmerControl(
# ,control=glmerControl(
# optimizer = "bobyqa" # Default
# optimizer = "Nelder_Mead"
# optimizer = "optimx", optCtrl=list(method="L-BFGS-B", maxiter=100000)
# optimizer = "optimx", optCtrl=list(method="nlminb", maxiter=100000)
# ,restart_edge = TRUE
# ,boundary.tol = 1e-5
# ,calc.derivs=TRUE
# ,use.last.params=FALSE
# ,sparseX = FALSE
# input checking options
# ,check.nobs.vs.rankZ = "ignore"
# ,check.nobs.vs.nlev = "stop"
# ,check.nobs.vs.nlev = "ignore" #Recoomend
# ,check.nlev.gtreq.5 = "ignore"
# ,check.nlev.gtr.1 = "stop"
# ,check.nlev.gtr.1 = "ignore" #Recoomend
# ,check.nobs.vs.nRE="stop"
# ,check.nobs.vs.nRE="ignore" # Reccomend
# ,check.rankX = c("message+drop.cols", "silent.drop.cols", "warn+drop.cols","stop.deficient", "ignore")
# ,check.scaleX = c("warning","stop","silent.rescale","message+rescale","warn+rescale","ignore")
# ,check.formula.LHS = "stop"

# convergence checking options
# ,check.conv.grad = .makeCC("warning", tol = 2e-3, relTol = NULL)
# ,check.conv.singular = .makeCC(action = "ignore",  tol = 1e-4)
# ,check.conv.hess = .makeCC(action = "warning", tol = 1e-6)

# ,optimizer args
# ,optCtrl = list(maxfun=1000, maxiter=1000)
# )

# ,family = "gaussian"
,family = "binomial"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
,data=data
# ,data = subset(data, Race.IsAnalyzeNormalPast == 1)
)

print(paste0(Sys.time(),  " --- source_logic_glmer.R Finished ---"))
