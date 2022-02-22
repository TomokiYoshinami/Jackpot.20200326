# -------------------------------------
# Centering
# -------------------------------------
print(paste0(Sys.time(),  " --- source_centering.R Start ---"))

dummy <- 0.5
print("Centering...")
data5$RaceHorse.BaTaijyu <- data5$RaceHorse.BaTaijyu - mean(data5$RaceHorse.BaTaijyu)
data5$Odds1ByWin.BetCount <- data5$Odds1ByWin.BetCount - mean(data5$Odds1ByWin.BetCount)
data5$Odds1ByWin.TotalBetCount <- data5$Odds1ByWin.TotalBetCount - mean(data5$Odds1ByWin.TotalBetCount)
data5$DataMining.DmTimeDevValueOfRace <- data5$DataMining.DmTimeDevValueOfRace - mean(data5$DataMining.DmTimeDevValueOfRace)

data5$RaceHorse.Time <- data5$RaceHorse.Time - mean(data5$RaceHorse.Time)
data5$RaceHorse.TimeDevValueOfRace <- data5$RaceHorse.TimeDevValueOfRace - mean(data5$RaceHorse.TimeDevValueOfRace)
# data5$RaceHorse.IsHit_1 <- data5$RaceHorse.IsHit_1 - dummy
data5$RaceHorse.IsHit_1 <- data5$RaceHorse.IsHit_1
# data5$RaceHorse.IsHit_12 <- data5$RaceHorse.IsHit_12 - dummy
data5$RaceHorse.IsHit_1 <- data5$RaceHorse.IsHit_12
# data5$RaceHorse.IsHit_123 <- data5$RaceHorse.IsHit_123 - dummy
data5$RaceHorse.IsHit_1 <- data5$RaceHorse.IsHit_123
data5$RaceHorse.KakuteiJyuni <- data5$RaceHorse.KakuteiJyuni - mean(data5$RaceHorse.KakuteiJyuni)
data5$RaceHorseBet.PayoffWin <- data5$RaceHorseBet.PayoffWin - mean(data5$RaceHorseBet.PayoffWin)
data5$RaceHorseBet.PayoffWinLog <- data5$RaceHorseBet.PayoffWinLog - mean(data5$RaceHorseBet.PayoffWinLog)
data5$RaceHorseBet.PayoffPlace <- data5$RaceHorseBet.PayoffPlace - mean(data5$RaceHorseBet.PayoffPlace)
data5$RaceHorseBet.PayoffPlaceLog <- data5$RaceHorseBet.PayoffPlaceLog - mean(data5$RaceHorseBet.PayoffPlaceLog)
#
data5$Race.JyoCd <- data5$Race.JyoCd
data5$MasterJyo.IsJyoCd_01 <- data5$MasterJyo.IsJyoCd_01 - dummy
data5$MasterJyo.IsJyoCd_02 <- data5$MasterJyo.IsJyoCd_02 - dummy
data5$MasterJyo.IsJyoCd_03 <- data5$MasterJyo.IsJyoCd_03 - dummy
data5$MasterJyo.IsJyoCd_04 <- data5$MasterJyo.IsJyoCd_04 - dummy
data5$MasterJyo.IsJyoCd_05 <- data5$MasterJyo.IsJyoCd_05 - dummy
data5$MasterJyo.IsJyoCd_06 <- data5$MasterJyo.IsJyoCd_06 - dummy
data5$MasterJyo.IsJyoCd_07 <- data5$MasterJyo.IsJyoCd_07 - dummy
data5$MasterJyo.IsJyoCd_08 <- data5$MasterJyo.IsJyoCd_08 - dummy
data5$MasterJyo.IsJyoCd_09 <- data5$MasterJyo.IsJyoCd_09 - dummy
data5$MasterJyo.IsJyoCd_10 <- data5$MasterJyo.IsJyoCd_10 - dummy
data5$Race.GradeCd <- data5$Race.GradeCd
data5$MasterGrade.IsGradeCd_G1 <- data5$MasterGrade.IsGradeCd_G1 - dummy
data5$MasterGrade.IsGradeCd_G2 <- data5$MasterGrade.IsGradeCd_G2 - dummy
data5$MasterGrade.IsGradeCd_G3 <- data5$MasterGrade.IsGradeCd_G3 - dummy
data5$MasterGrade.IsGradeCd_Jyusyo <- data5$MasterGrade.IsGradeCd_Jyusyo - dummy
data5$MasterGrade.IsGradeCd_Tokubetu <- data5$MasterGrade.IsGradeCd_Tokubetu - dummy
data5$MasterGrade.IsGradeCd_JG1 <- data5$MasterGrade.IsGradeCd_JG1 - dummy
data5$MasterGrade.IsGradeCd_JG2 <- data5$MasterGrade.IsGradeCd_JG2 - dummy
data5$MasterGrade.IsGradeCd_JG3 <- data5$MasterGrade.IsGradeCd_JG3 - dummy
data5$Race.KigoCd <- data5$Race.KigoCd
data5$Race.SyubetuCd <- data5$Race.SyubetuCd
data5$MasterSyubetu.IsSyubetu_11 <- data5$MasterSyubetu.IsSyubetu_11 - dummy
data5$MasterSyubetu.IsSyubetu_12 <- data5$MasterSyubetu.IsSyubetu_12 - dummy
data5$MasterSyubetu.IsSyubetu_13 <- data5$MasterSyubetu.IsSyubetu_13 - dummy
data5$MasterSyubetu.IsSyubetu_14 <- data5$MasterSyubetu.IsSyubetu_14 - dummy
data5$MasterSyubetu.IsSyubetu_18 <- data5$MasterSyubetu.IsSyubetu_18 - dummy
data5$MasterSyubetu.IsSyubetu_19 <- data5$MasterSyubetu.IsSyubetu_19 - dummy
data5$MasterSyubetu.IsSyubetu_21 <- data5$MasterSyubetu.IsSyubetu_21 - dummy
data5$MasterSyubetu.IsSyubetu_22 <- data5$MasterSyubetu.IsSyubetu_22 - dummy
data5$MasterSyubetu.IsSyubetu_23 <- data5$MasterSyubetu.IsSyubetu_23 - dummy
data5$MasterSyubetu.IsSyubetu_24 <- data5$MasterSyubetu.IsSyubetu_24 - dummy
data5$Race.JyuryoCd <- data5$Race.JyuryoCd
data5$MasterJyuryo.IsJyuryoCd_1 <- data5$MasterJyuryo.IsJyuryoCd_1 - dummy
data5$MasterJyuryo.IsJyuryoCd_2 <- data5$MasterJyuryo.IsJyuryoCd_2 - dummy
data5$MasterJyuryo.IsJyuryoCd_3 <- data5$MasterJyuryo.IsJyuryoCd_3 - dummy
data5$MasterJyuryo.IsJyuryoCd_4 <- data5$MasterJyuryo.IsJyuryoCd_4 - dummy
data5$Race.JyokenCd5 <- data5$Race.JyokenCd5
data5$MasterJyoken5.IsJyokenCd_701 <- data5$MasterJyoken5.IsJyokenCd_701 - dummy
data5$MasterJyoken5.IsJyokenCd_703 <- data5$MasterJyoken5.IsJyokenCd_703 - dummy
data5$MasterJyoken5.IsJyokenCd_005 <- data5$MasterJyoken5.IsJyokenCd_005 - dummy
data5$MasterJyoken5.IsJyokenCd_010 <- data5$MasterJyoken5.IsJyokenCd_010 - dummy
data5$MasterJyoken5.IsJyokenCd_016 <- data5$MasterJyoken5.IsJyokenCd_016 - dummy
data5$MasterJyoken5.IsJyokenCd_999 <- data5$MasterJyoken5.IsJyokenCd_999 - dummy
data5$Race.Kyori <- data5$Race.Kyori - mean(data5$Race.Kyori)
data5$MasterKyori.IsKyori_1000 <- data5$MasterKyori.IsKyori_1000 - dummy
data5$MasterKyori.IsKyori_1150 <- data5$MasterKyori.IsKyori_1150 - dummy
data5$MasterKyori.IsKyori_1200 <- data5$MasterKyori.IsKyori_1200 - dummy
data5$MasterKyori.IsKyori_1300 <- data5$MasterKyori.IsKyori_1300 - dummy
data5$MasterKyori.IsKyori_1400 <- data5$MasterKyori.IsKyori_1400 - dummy
data5$MasterKyori.IsKyori_1500 <- data5$MasterKyori.IsKyori_1500 - dummy
data5$MasterKyori.IsKyori_1600 <- data5$MasterKyori.IsKyori_1600 - dummy
data5$MasterKyori.IsKyori_1700 <- data5$MasterKyori.IsKyori_1700 - dummy
data5$MasterKyori.IsKyori_1800 <- data5$MasterKyori.IsKyori_1800 - dummy
data5$MasterKyori.IsKyori_1900 <- data5$MasterKyori.IsKyori_1900 - dummy
data5$MasterKyori.IsKyori_2000 <- data5$MasterKyori.IsKyori_2000 - dummy
data5$MasterKyori.IsKyori_2100 <- data5$MasterKyori.IsKyori_2100 - dummy
data5$MasterKyori.IsKyori_2200 <- data5$MasterKyori.IsKyori_2200 - dummy
data5$MasterKyori.IsKyori_2300 <- data5$MasterKyori.IsKyori_2300 - dummy
data5$MasterKyori.IsKyori_2400 <- data5$MasterKyori.IsKyori_2400 - dummy
data5$MasterKyori.IsKyori_2500 <- data5$MasterKyori.IsKyori_2500 - dummy
data5$MasterKyori.IsKyori_2600 <- data5$MasterKyori.IsKyori_2600 - dummy
data5$MasterKyori.IsKyori_2750 <- data5$MasterKyori.IsKyori_2750 - dummy
data5$MasterKyori.IsKyori_2770 <- data5$MasterKyori.IsKyori_2770 - dummy
data5$MasterKyori.IsKyori_2800 <- data5$MasterKyori.IsKyori_2800 - dummy
data5$MasterKyori.IsKyori_2850 <- data5$MasterKyori.IsKyori_2850 - dummy
data5$MasterKyori.IsKyori_2880 <- data5$MasterKyori.IsKyori_2880 - dummy
data5$MasterKyori.IsKyori_2890 <- data5$MasterKyori.IsKyori_2900 - dummy
data5$MasterKyori.IsKyori_2900 <- data5$MasterKyori.IsKyori_2900 - dummy
data5$MasterKyori.IsKyori_2910 <- data5$MasterKyori.IsKyori_2910 - dummy
data5$MasterKyori.IsKyori_2930 <- data5$MasterKyori.IsKyori_2930 - dummy
data5$MasterKyori.IsKyori_2970 <- data5$MasterKyori.IsKyori_2970 - dummy
data5$MasterKyori.IsKyori_3000 <- data5$MasterKyori.IsKyori_3000 - dummy
data5$MasterKyori.IsKyori_3100 <- data5$MasterKyori.IsKyori_3100 - dummy
data5$MasterKyori.IsKyori_3110 <- data5$MasterKyori.IsKyori_3110 - dummy
data5$MasterKyori.IsKyori_3140 <- data5$MasterKyori.IsKyori_3140 - dummy
data5$MasterKyori.IsKyori_3170 <- data5$MasterKyori.IsKyori_3170 - dummy
data5$MasterKyori.IsKyori_3190 <- data5$MasterKyori.IsKyori_3190 - dummy
data5$MasterKyori.IsKyori_3200 <- data5$MasterKyori.IsKyori_3200 - dummy
data5$MasterKyori.IsKyori_3210 <- data5$MasterKyori.IsKyori_3210 - dummy
data5$MasterKyori.IsKyori_3250 <- data5$MasterKyori.IsKyori_3250 - dummy
data5$MasterKyori.IsKyori_3285 <- data5$MasterKyori.IsKyori_3285 - dummy
data5$MasterKyori.IsKyori_3290 <- data5$MasterKyori.IsKyori_3290 - dummy
data5$MasterKyori.IsKyori_3300 <- data5$MasterKyori.IsKyori_3300 - dummy
data5$MasterKyori.IsKyori_3330 <- data5$MasterKyori.IsKyori_3330 - dummy
data5$MasterKyori.IsKyori_3350 <- data5$MasterKyori.IsKyori_3350 - dummy
data5$MasterKyori.IsKyori_3370 <- data5$MasterKyori.IsKyori_3370 - dummy
data5$MasterKyori.IsKyori_3380 <- data5$MasterKyori.IsKyori_3380 - dummy
data5$MasterKyori.IsKyori_3390 <- data5$MasterKyori.IsKyori_3290 - dummy
data5$MasterKyori.IsKyori_3400 <- data5$MasterKyori.IsKyori_3400 - dummy
data5$MasterKyori.IsKyori_3570 <- data5$MasterKyori.IsKyori_3570 - dummy
data5$MasterKyori.IsKyori_3600 <- data5$MasterKyori.IsKyori_3600 - dummy
data5$MasterKyori.IsKyori_3760 <- data5$MasterKyori.IsKyori_3760 - dummy
data5$MasterKyori.IsKyori_3790 <- data5$MasterKyori.IsKyori_3790 - dummy
data5$MasterKyori.IsKyori_3900 <- data5$MasterKyori.IsKyori_3900 - dummy
data5$MasterKyori.IsKyori_3930 <- data5$MasterKyori.IsKyori_3930 - dummy
data5$MasterKyori.IsKyori_4100 <- data5$MasterKyori.IsKyori_4100 - dummy
data5$MasterKyori.IsKyori_4250 <- data5$MasterKyori.IsKyori_4250 - dummy
data5$MasterKyori.IsKyori_4260 <- data5$MasterKyori.IsKyori_4260 - dummy
data5$Race.CourseKubunCd <- data5$Race.CourseKubunCd
data5$MasterCourseKubun.IsCourseKubun_SP <- data5$MasterCourseKubun.IsCourseKubun_SP - dummy
data5$MasterCourseKubun.IsCourseKubun_A <- data5$MasterCourseKubun.IsCourseKubun_A - dummy
data5$MasterCourseKubun.IsCourseKubun_B <- data5$MasterCourseKubun.IsCourseKubun_B - dummy
data5$MasterCourseKubun.IsCourseKubun_C <- data5$MasterCourseKubun.IsCourseKubun_C - dummy
data5$MasterCourseKubun.IsCourseKubun_D <- data5$MasterCourseKubun.IsCourseKubun_D - dummy
data5$MasterCourseKubun.IsCourseKubun_E <- data5$MasterCourseKubun.IsCourseKubun_E - dummy
data5$Race.CourseTypeCd <- data5$Race.CourseTypeCd
data5$MasterCourseType.IsCourseTypeCd_1 <- data5$MasterCourseType.IsCourseTypeCd_1 - dummy
data5$MasterCourseType.IsCourseTypeCd_2 <- data5$MasterCourseType.IsCourseTypeCd_2 - dummy
data5$MasterCourseType.IsCourseTypeCd_3 <- data5$MasterCourseType.IsCourseTypeCd_3 - dummy
data5$MasterCourseType.IsCourseTypeCd_4 <- data5$MasterCourseType.IsCourseTypeCd_4 - dummy
data5$Race.TenkoCd <- data5$Race.TenkoCd
data5$MasterTenko.IsTenkoCd_1 <- data5$MasterTenko.IsTenkoCd_1 - dummy
data5$MasterTenko.IsTenkoCd_2 <- data5$MasterTenko.IsTenkoCd_2 - dummy
data5$MasterTenko.IsTenkoCd_3 <- data5$MasterTenko.IsTenkoCd_3 - dummy
data5$MasterTenko.IsTenkoCd_4 <- data5$MasterTenko.IsTenkoCd_4 - dummy
data5$MasterTenko.IsTenkoCd_5 <- data5$MasterTenko.IsTenkoCd_5 - dummy
data5$MasterTenko.IsTenkoCd_6 <- data5$MasterTenko.IsTenkoCd_6 - dummy
data5$Race.TrackCd <- data5$Race.TrackCd
data5$MasterTrack.IsTrackCd_Straight <-  data5$MasterTrack.IsTrackCd_Straight - dummy
data5$MasterTrack.IsTrackCd_Left <- data5$MasterTrack.IsTrackCd_Left - dummy
data5$MasterTrack.IsTrackCd_Right <- data5$MasterTrack.IsTrackCd_Right - dummy
data5$MasterTrack.IsTrackCd_10 <- data5$MasterTrack.IsTrackCd_10 - dummy
data5$MasterTrack.IsTrackCd_11 <- data5$MasterTrack.IsTrackCd_11 - dummy
data5$MasterTrack.IsTrackCd_12 <- data5$MasterTrack.IsTrackCd_12 - dummy
data5$MasterTrack.IsTrackCd_13 <- data5$MasterTrack.IsTrackCd_13 - dummy
data5$MasterTrack.IsTrackCd_14 <- data5$MasterTrack.IsTrackCd_14 - dummy
data5$MasterTrack.IsTrackCd_15 <- data5$MasterTrack.IsTrackCd_15 - dummy
data5$MasterTrack.IsTrackCd_16 <- data5$MasterTrack.IsTrackCd_16 - dummy
data5$MasterTrack.IsTrackCd_17 <- data5$MasterTrack.IsTrackCd_17 - dummy
data5$MasterTrack.IsTrackCd_18 <- data5$MasterTrack.IsTrackCd_18 - dummy
data5$MasterTrack.IsTrackCd_19 <- data5$MasterTrack.IsTrackCd_19 - dummy
data5$MasterTrack.IsTrackCd_20 <- data5$MasterTrack.IsTrackCd_20 - dummy
data5$MasterTrack.IsTrackCd_21 <- data5$MasterTrack.IsTrackCd_21 - dummy
data5$MasterTrack.IsTrackCd_22 <- data5$MasterTrack.IsTrackCd_22 - dummy
data5$MasterTrack.IsTrackCd_23 <- data5$MasterTrack.IsTrackCd_23 - dummy
data5$MasterTrack.IsTrackCd_24 <- data5$MasterTrack.IsTrackCd_24 - dummy
data5$MasterTrack.IsTrackCd_25 <- data5$MasterTrack.IsTrackCd_25 - dummy
data5$MasterTrack.IsTrackCd_26 <- data5$MasterTrack.IsTrackCd_26 - dummy
data5$MasterTrack.IsTrackCd_27 <- data5$MasterTrack.IsTrackCd_27 - dummy
data5$MasterTrack.IsTrackCd_28 <- data5$MasterTrack.IsTrackCd_28 - dummy
data5$MasterTrack.IsTrackCd_29 <- data5$MasterTrack.IsTrackCd_29 - dummy
data5$MasterTrack.IsTrackCd_51 <- data5$MasterTrack.IsTrackCd_51 - dummy
data5$MasterTrack.IsTrackCd_52 <- data5$MasterTrack.IsTrackCd_52 - dummy
data5$MasterTrack.IsTrackCd_53 <- data5$MasterTrack.IsTrackCd_53 - dummy
data5$MasterTrack.IsTrackCd_54 <- data5$MasterTrack.IsTrackCd_54 - dummy
data5$MasterTrack.IsTrackCd_55 <- data5$MasterTrack.IsTrackCd_55 - dummy
data5$MasterTrack.IsTrackCd_56 <- data5$MasterTrack.IsTrackCd_56 - dummy
data5$MasterTrack.IsTrackCd_57 <- data5$MasterTrack.IsTrackCd_57 - dummy
data5$MasterTrack.IsTrackCd_58 <- data5$MasterTrack.IsTrackCd_58 - dummy
data5$MasterTrack.IsTrackCd_59 <- data5$MasterTrack.IsTrackCd_59 - dummy
data5$Race.TrackTypeCd <- data5$Race.TrackTypeCd
data5$MasterTrackType.IsTrackTypeCd_1 <- data5$MasterTrackType.IsTrackTypeCd_1 - dummy
data5$MasterTrackType.IsTrackTypeCd_2 <- data5$MasterTrackType.IsTrackTypeCd_2 - dummy
data5$MasterTrackType.IsTrackTypeCd_3 <- data5$MasterTrackType.IsTrackTypeCd_3 - dummy
data5$MasterTrackType.IsTrackTypeCd_4 <- data5$MasterTrackType.IsTrackTypeCd_4 - dummy
data5$Race.TrackConditionCd <- data5$Race.TrackConditionCd
data5$MasterTrackCondition.IsTrackConditionCd_1 <- data5$MasterTrackCondition.IsTrackConditionCd_1 - dummy
data5$MasterTrackCondition.IsTrackConditionCd_2 <- data5$MasterTrackCondition.IsTrackConditionCd_2 - dummy
data5$MasterTrackCondition.IsTrackConditionCd_3 <- data5$MasterTrackCondition.IsTrackConditionCd_3 - dummy
data5$MasterTrackCondition.IsTrackConditionCd_4 <- data5$MasterTrackCondition.IsTrackConditionCd_4 - dummy
#
data5$RaceHorse.KettoNum <- data5$RaceHorse.KettoNum
# data5$RaceHorse.DmTimeDevValueDiffOfRace <- data5$RaceHorse.DmTimeDevValueDiffOfRace - mean(data5$RaceHorse.DmTimeDevValueDiffOfRace)
data5$RaceHorse.BaTaijyu <- data5$RaceHorse.BaTaijyu - mean(data5$RaceHorse.BaTaijyu)
data5$RaceHorse.ZogenSa <- data5$RaceHorse.ZogenSa - mean(data5$RaceHorse.ZogenSa)
data5$RaceHorse.ZogenPercent <- data5$RaceHorse.ZogenPercent - mean(data5$RaceHorse.ZogenPercent)
data5$RaceHorse.Futan <- data5$RaceHorse.Futan - mean(data5$RaceHorse.Futan)
data5$RaceHorse.FutanPercent <- data5$RaceHorse.FutanPercent - mean(data5$RaceHorse.FutanPercent)
data5$RaceHorse.IsBlinker <- data5$RaceHorse.IsBlinker - dummy
data5$RaceHorse.Barei <- data5$RaceHorse.Barei - mean(data5$RaceHorse.Barei)
data5$RaceHorse.LifeTime <- data5$RaceHorse.LifeTime - mean(data5$RaceHorse.LifeTime)
data5$RaceHorse.SexCd <- data5$RaceHorse.SexCd
data5$MasterSex.IsSexCd_1 <- data5$MasterSex.IsSexCd_1 - dummy
data5$MasterSex.IsSexCd_2 <- data5$MasterSex.IsSexCd_2 - dummy
data5$MasterSex.IsSexCd_3 <- data5$MasterSex.IsSexCd_3 - dummy
data5$RaceHorse.HinsyuCd <- data5$RaceHorse.HinsyuCd
data5$RaceHorse.KeiroCd <- data5$RaceHorse.KeiroCd
data5$MasterKeiro.IsKeiroCd_01 <- data5$MasterKeiro.IsKeiroCd_01 - dummy
data5$MasterKeiro.IsKeiroCd_02 <- data5$MasterKeiro.IsKeiroCd_02 - dummy
data5$MasterKeiro.IsKeiroCd_03 <- data5$MasterKeiro.IsKeiroCd_03 - dummy
data5$MasterKeiro.IsKeiroCd_04 <- data5$MasterKeiro.IsKeiroCd_04 - dummy
data5$MasterKeiro.IsKeiroCd_05 <- data5$MasterKeiro.IsKeiroCd_05 - dummy
data5$MasterKeiro.IsKeiroCd_06 <- data5$MasterKeiro.IsKeiroCd_06 - dummy
data5$MasterKeiro.IsKeiroCd_07 <- data5$MasterKeiro.IsKeiroCd_07 - dummy
data5$MasterKeiro.IsKeiroCd_08 <- data5$MasterKeiro.IsKeiroCd_08 - dummy
data5$MasterKeiro.IsKeiroCd_09 <- data5$MasterKeiro.IsKeiroCd_09 - dummy
data5$MasterKeiro.IsKeiroCd_10 <- data5$MasterKeiro.IsKeiroCd_10 - dummy
data5$MasterKeiro.IsKeiroCd_11 <- data5$MasterKeiro.IsKeiroCd_11 - dummy
data5$RaceHorse.MinaraiCd <- data5$RaceHorse.MinaraiCd
data5$MasterMinarai.IsMinaraiCd_1 - data5$MasterMinarai.IsMinaraiCd_1 - dummy
data5$MasterMinarai.IsMinaraiCd_2 - data5$MasterMinarai.IsMinaraiCd_2 - dummy
data5$MasterMinarai.IsMinaraiCd_3 - data5$MasterMinarai.IsMinaraiCd_3 - dummy
data5$RaceHorse.IsPrev1JyokenCd5_Up <- data5$RaceHorse.IsPrev1JyokenCd5_Up - dummy
data5$RaceHorse.IsPrev1JyokenCd5_Down <- data5$RaceHorse.IsPrev1JyokenCd5_Down - dummy
data5$RaceHorse.Prev1TimeDevValueOfRace <- data5$RaceHorse.Prev1TimeDevValueOfRace - mean(data5$RaceHorse.Prev1TimeDevValueOfRace)
# data5$RaceHorse.Prev1TimeDevValueOfClass <- data5$RaceHorse.Prev1TimeDevValueOfClass - mean(data5$RaceHorse.Prev1TimeDevValueOfClass)
# data5$RaceHorse.Prev1TimeDevValueOfAll <- data5$RaceHorse.Prev1TimeDevValueOfAll - mean(data5$RaceHorse.Prev1TimeDevValueOfAll)
data5$RaceHorse.Ninki <- data5$RaceHorse.Ninki - mean(data5$RaceHorse.Ninki)
data5$MasterNinki.IsNinki_01 <- data5$MasterNinki.IsNinki_01 - dummy
data5$MasterNinki.IsNinki_02 <- data5$MasterNinki.IsNinki_02 - dummy
data5$MasterNinki.IsNinki_03 <- data5$MasterNinki.IsNinki_03 - dummy
data5$MasterNinki.IsNinki_04 <- data5$MasterNinki.IsNinki_04 - dummy
data5$MasterNinki.IsNinki_05 <- data5$MasterNinki.IsNinki_05 - dummy
data5$MasterNinki.IsNinki_06 <- data5$MasterNinki.IsNinki_06 - dummy
data5$MasterNinki.IsNinki_07 <- data5$MasterNinki.IsNinki_07 - dummy
data5$MasterNinki.IsNinki_08 <- data5$MasterNinki.IsNinki_08 - dummy
data5$MasterNinki.IsNinki_09 <- data5$MasterNinki.IsNinki_09 - dummy
data5$MasterNinki.IsNinki_10 <- data5$MasterNinki.IsNinki_10 - dummy
data5$MasterNinki.IsNinki_11 <- data5$MasterNinki.IsNinki_11 - dummy
data5$MasterNinki.IsNinki_12 <- data5$MasterNinki.IsNinki_12 - dummy
data5$MasterNinki.IsNinki_13 <- data5$MasterNinki.IsNinki_13 - dummy
data5$MasterNinki.IsNinki_14 <- data5$MasterNinki.IsNinki_14 - dummy
data5$MasterNinki.IsNinki_15 <- data5$MasterNinki.IsNinki_15 - dummy
data5$MasterNinki.IsNinki_16 <- data5$MasterNinki.IsNinki_16 - dummy
data5$MasterNinki.IsNinki_17 <- data5$MasterNinki.IsNinki_17 - dummy
data5$MasterNinki.IsNinki_18 <- data5$MasterNinki.IsNinki_18 - dummy
#
data5$Odds1ByWin.BetCount <- data5$Odds1ByWin.BetCount - mean(data5$Odds1ByWin.BetCount)
data5$Odds1ByWin.TotalBetCount <- data5$Odds1ByWin.TotalBetCount - mean(data5$Odds1ByWin.TotalBetCount)
data5$Odds1ByWin.Odds1 <- data5$Odds1ByWin.Odds1 - mean(data5$Odds1ByWin.Odds1)
data5$Odds4ByWin.Odds1Log <- data5$Odds1ByWin.Odds1Log - mean(data5$Odds1ByWin.Odds1Log)
data5$Odds1ByWin.OddsRate1 <- data5$Odds1ByWin.OddsRate1 - mean(data5$Odds1ByWin.OddsRate1)
data5$Odds1ByWin.OddsInverse1 <- data5$Odds1ByWin.OddsInverse1 - mean(data5$Odds1ByWin.OddsInverse1)
data5$Odds1ByWin.OddsInverse1Log <- data5$Odds1ByWin.OddsInverse1Log - mean(data5$Odds1ByWin.OddsInverse1Log)
data5$Odds1ByWin.ApprovalRateWin <- data5$Odds1ByWin.ApprovalRateWin - mean(data5$Odds1ByWin.ApprovalRateWin)
data5$Odds1ByWin.ApprovalRateWinLog <- data5$Odds1ByWin.ApprovalRateWinLog - mean(data5$Odds1ByWin.ApprovalRateWinLog)
#
data5$Odds1ByPlace.Odds1 <- data5$Odds1ByPlace.Odds1 - mean(data5$Odds1ByPlace.Odds1)
data5$Odds1ByPlace.Odds1Log <- data5$Odds1ByPlace.Odds1Log - mean(data5$Odds1ByPlace.Odds1Log)
data5$Odds1ByPlace.Odds2 <- data5$Odds1ByPlace.Odds2 - mean(data5$Odds1ByPlace.Odds2)
data5$Odds1ByPlace.Odds2Log <- data5$Odds1ByPlace.Odds2Log - mean(data5$Odds1ByPlace.Odds2Log)
data5$Odds1ByPlace.OddsRate1 <- data5$Odds1ByPlace.OddsRate1 - mean(data5$Odds1ByPlace.OddsRate1)
data5$Odds1ByPlace.OddsRate2 <- data5$Odds1ByPlace.OddsRate2 - mean(data5$Odds1ByPlace.OddsRate2)
data5$Odds1ByPlace.OddsInverse1 <- data5$Odds1ByPlace.OddsInverse1 - mean(data5$Odds1ByPlace.OddsInverse1)
data5$Odds1ByPlace.OddsInverse1Log <- data5$Odds1ByPlace.OddsInverse1Log - mean(data5$Odds1ByPlace.OddsInverse1Log)
data5$Odds1ByPlace.OddsInverse2 <- data5$Odds1ByPlace.OddsInverse2 - mean(data5$Odds1ByPlace.OddsInverse2)
data5$Odds1ByPlace.OddsInverse2Log <- data5$Odds1ByPlace.OddsInverse2Log - mean(data5$Odds1ByPlace.OddsInverse2Log)
data5$Odds1ByPlace.ApprovalRatePlace1 <- data5$Odds1ByPlace.ApprovalRatePlace1 - mean(data5$Odds1ByPlace.ApprovalRatePlace1)
data5$Odds1ByPlace.ApprovalRatePlace1Log <- data5$Odds1ByPlace.ApprovalRatePlace1Log - mean(data5$Odds1ByPlace.ApprovalRatePlace1Log)
data5$Odds1ByPlace.ApprovalRatePlace2 <- data5$Odds1ByPlace.ApprovalRatePlace2 - mean(data5$Odds1ByPlace.ApprovalRatePlace2)
data5$Odds1ByPlace.ApprovalRatePlace2Log <- data5$Odds1ByPlace.ApprovalRatePlace2Log - mean(data5$Odds1ByPlace.ApprovalRatePlace2Log)
#
data5$DataMining.DmTime <- data5$DataMining.DmTime - mean(data5$DataMining.DmTime)
data5$DataMining.DmTimeP <- data5$DataMining.DmTimeP - mean(data5$DataMining.DmTimeP)
data5$DataMining.DmTimeM <- data5$DataMining.DmTimeM - mean(data5$DataMining.DmTimeM)
data5$DataMining.DmTimeDevValueOfRace <- data5$DataMining.DmTimeDevValueOfRace - mean(data5$DataMining.DmTimeDevValueOfRace)
# data5$DataMining.DmTimeDevValueOfClass <- data5$DataMining.DmTimeDevValueOfClass - mean(data5$DataMining.DmTimeDevValueOfClass)
# data5$DataMining.DmTimeDevValueOfAll <- data5$DataMining.DmTimeDevValueOfAll - mean(data5$DataMining.DmTimeDevValueOfAll)
#
data5$JockyByTotal.RunCount <- data5$JockyByTotal.RunCount - mean(data5$JockyByTotal.RunCount)
data5$JockyByTotal.RunCountLog <- data5$JockyByTotal.RunCountLog - mean(data5$JockyByTotal.RunCountLog)
data5$JockyByTotal.HitCount1 <- data5$JockyByTotal.HitCount1 - mean(data5$JockyByTotal.HitCount1)
data5$JockyByTotal.HitCount1Log <- data5$JockyByTotal.HitCount1Log - mean(data5$JockyByTotal.HitCount1Log)
data5$JockyByTotal.HitRate1 <- data5$JockyByTotal.HitRate1 - mean(data5$JockyByTotal.HitRate1)
data5$JockyByTotal.HitRate1Log <- data5$JockyByTotal.HitRate1Log - mean(data5$JockyByTotal.HitRate1Log)
data5$JockyByTotal.HitCount12 <- data5$JockyByTotal.HitCount12 - mean(data5$JockyByTotal.HitCount12)
data5$JockyByTotal.HitCount12Log <- data5$JockyByTotal.HitCount12Log - mean(data5$JockyByTotal.HitCount12Log)
data5$JockyByTotal.HitRate12 <- data5$JockyByTotal.HitRate12 - mean(data5$JockyByTotal.HitRate12)
data5$JockyByTotal.HitRate12Log <- data5$JockyByTotal.HitRate12Log - mean(data5$JockyByTotal.HitRate12Log)
data5$JockyByTotal.HitCount123 <- data5$JockyByTotal.HitCount123 - mean(data5$JockyByTotal.HitCount123)
data5$JockyByTotal.HitCount123Log <- data5$JockyByTotal.HitCount123Log - mean(data5$JockyByTotal.HitCount123Log)
data5$JockyByTotal.HitRate123 <- data5$JockyByTotal.HitRate123 - mean(data5$JockyByTotal.HitRate123)
data5$JockyByTotal.HitRate123Log <-data5$JockyByTotal.HitRate123Log - mean(data5$JockyByTotal.HitRate123Log)
#
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123 <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123 - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog)
# data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog <- data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog - mean(data5$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog)
#
data5$RaceResultByBanusi.HonSyokinTotal <- data5$RaceResultByBanusi.HonSyokinTotal - mean(data5$RaceResultByBanusi.HonSyokinTotal)
data5$RaceResultByBanusi.HonSyokinTotalLog <- data5$RaceResultByBanusi.HonSyokinTotalLog - mean(data5$RaceResultByBanusi.HonSyokinTotalLog)
data5$RaceResultByBanusi.FukaSyokin <- data5$RaceResultByBanusi.FukaSyokin - mean(data5$RaceResultByBanusi.FukaSyokin)
data5$RaceResultByBanusi.FukaSyokinLog <- data5$RaceResultByBanusi.FukaSyokinLog - mean(data5$RaceResultByBanusi.FukaSyokinLog)
#
data5$RaceResultByBanusiByTotal.RunCount <- data5$RaceResultByBanusiByTotal.RunCount - mean(data5$RaceResultByBanusiByTotal.RunCount)
data5$RaceResultByBanusiByTotal.RunCountLog <- data5$RaceResultByBanusiByTotal.RunCountLog - mean(data5$RaceResultByBanusiByTotal.RunCountLog)
data5$RaceResultByBanusiByTotal.HitCount1 <- data5$RaceResultByBanusiByTotal.HitCount1 - mean(data5$RaceResultByBanusiByTotal.HitCount1)
data5$RaceResultByBanusiByTotal.HitCount1Log <- data5$RaceResultByBanusiByTotal.HitCount1Log - mean(data5$RaceResultByBanusiByTotal.HitCount1Log)
data5$RaceResultByBanusiByTotal.HitRate1 <- data5$RaceResultByBanusiByTotal.HitRate1 - mean(data5$RaceResultByBanusiByTotal.HitRate1)
data5$RaceResultByBanusiByTotal.HitRate1Log <- data5$RaceResultByBanusiByTotal.HitRate1Log - mean(data5$RaceResultByBanusiByTotal.HitRate1Log)
data5$RaceResultByBanusiByTotal.HitCount12 <- data5$RaceResultByBanusiByTotal.HitCount12 - mean(data5$RaceResultByBanusiByTotal.HitCount12)
data5$RaceResultByBanusiByTotal.HitCount12Log <- data5$RaceResultByBanusiByTotal.HitCount12Log - mean(data5$RaceResultByBanusiByTotal.HitCount12Log)
data5$RaceResultByBanusiByTotal.HitRate12 <- data5$RaceResultByBanusiByTotal.HitRate12 - mean(data5$RaceResultByBanusiByTotal.HitRate12)
data5$RaceResultByBanusiByTotal.HitRate12Log <- data5$RaceResultByBanusiByTotal.HitRate12Log - mean(data5$RaceResultByBanusiByTotal.HitRate12Log)
data5$RaceResultByBanusiByTotal.HitCount123 <- data5$RaceResultByBanusiByTotal.HitCount123 - mean(data5$RaceResultByBanusiByTotal.HitCount123)
data5$RaceResultByBanusiByTotal.HitCount123Log <- data5$RaceResultByBanusiByTotal.HitCount123Log - mean(data5$RaceResultByBanusiByTotal.HitCount123Log)
data5$RaceResultByBanusiByTotal.HitRate123 <- data5$RaceResultByBanusiByTotal.HitRate123 - mean(data5$RaceResultByBanusiByTotal.HitRate123)
data5$RaceResultByBanusiByTotal.HitRate123Log <-data5$RaceResultByBanusiByTotal.HitRate123Log - mean(data5$RaceResultByBanusiByTotal.HitRate123Log)
data5$RaceResultByBanusiByTotal.OddsWin <- data5$RaceResultByBanusiByTotal.OddsWin - mean(data5$RaceResultByBanusiByTotal.OddsWin)
data5$RaceResultByBanusiByTotal.OddsWinLog <- data5$RaceResultByBanusiByTotal.OddsWinLog - mean(data5$RaceResultByBanusiByTotal.OddsWinLog)
data5$RaceResultByBanusiByTotal.OddsPlace1 <- data5$RaceResultByBanusiByTotal.OddsPlace1 - mean(data5$RaceResultByBanusiByTotal.OddsPlace1)
data5$RaceResultByBanusiByTotal.OddsPlace1Log <- data5$RaceResultByBanusiByTotal.OddsPlace1Log - mean(data5$RaceResultByBanusiByTotal.OddsPlace1Log)
data5$RaceResultByBanusiByTotal.OddsPlace2 <- data5$RaceResultByBanusiByTotal.OddsPlace2 - mean(data5$RaceResultByBanusiByTotal.OddsPlace2)
data5$RaceResultByBanusiByTotal.OddsPlace2Log <- data5$RaceResultByBanusiByTotal.OddsPlace2Log - mean(data5$RaceResultByBanusiByTotal.OddsPlace2Log)
data5$RaceResultByBanusiByTotal.OddsWinInverse <- data5$RaceResultByBanusiByTotal.OddsWinInverse - mean(data5$RaceResultByBanusiByTotal.OddsWinInverse)
data5$RaceResultByBanusiByTotal.OddsWinInverseLog <- data5$RaceResultByBanusiByTotal.OddsWinInverseLog - mean(data5$RaceResultByBanusiByTotal.OddsWinInverseLog)
data5$RaceResultByBanusiByTotal.OddsPlaceInverse1 <- data5$RaceResultByBanusiByTotal.OddsPlaceInverse1 - mean(data5$RaceResultByBanusiByTotal.OddsPlaceInverse1)
data5$RaceResultByBanusiByTotal.OddsPlaceInverse1Log <- data5$RaceResultByBanusiByTotal.OddsPlaceInverse1Log - mean(data5$RaceResultByBanusiByTotal.OddsPlaceInverse1Log)
data5$RaceResultByBanusiByTotal.OddsPlaceInverse2 <- data5$RaceResultByBanusiByTotal.OddsPlaceInverse2 - mean(data5$RaceResultByBanusiByTotal.OddsPlaceInverse2)
data5$RaceResultByBanusiByTotal.OddsPlaceInverse2Log <- data5$RaceResultByBanusiByTotal.OddsPlaceInverse2Log - mean(data5$RaceResultByBanusiByTotal.OddsPlaceInverse2Log)
data5$RaceResultByBanusiByTotal.ApprovalRateWin <- data5$RaceResultByBanusiByTotal.ApprovalRateWin - mean(data5$RaceResultByBanusiByTotal.ApprovalRateWin)
data5$RaceResultByBanusiByTotal.ApprovalRateWinLog <- data5$RaceResultByBanusiByTotal.ApprovalRateWinLog - mean(data5$RaceResultByBanusiByTotal.ApprovalRateWinLog)
data5$RaceResultByBanusiByTotal.ApprovalRatePlace1 <- data5$RaceResultByBanusiByTotal.ApprovalRatePlace1 - mean(data5$RaceResultByBanusiByTotal.ApprovalRatePlace1)
data5$RaceResultByBanusiByTotal.ApprovalRatePlace1Log <- data5$RaceResultByBanusiByTotal.ApprovalRatePlace1Log - mean(data5$RaceResultByBanusiByTotal.ApprovalRatePlace1Log)
data5$RaceResultByBanusiByTotal.ApprovalRatePlace2 <- data5$RaceResultByBanusiByTotal.ApprovalRatePlace2 - mean(data5$RaceResultByBanusiByTotal.ApprovalRatePlace2)
data5$RaceResultByBanusiByTotal.ApprovalRatePlace2Log <- data5$RaceResultByBanusiByTotal.ApprovalRatePlace2Log - mean(data5$RaceResultByBanusiByTotal.ApprovalRatePlace2Log)
data5$RaceResultByBanusiByTotal.ExpectedValueWin <- data5$RaceResultByBanusiByTotal.ExpectedValueWin - mean(data5$RaceResultByBanusiByTotal.ExpectedValueWin)
data5$RaceResultByBanusiByTotal.ExpectedValueWinLog <- data5$RaceResultByBanusiByTotal.ExpectedValueWinLog - mean(data5$RaceResultByBanusiByTotal.ExpectedValueWinLog)
data5$RaceResultByBanusiByTotal.ExpectedValuePlace <- data5$RaceResultByBanusiByTotal.ExpectedValuePlace - mean(data5$RaceResultByBanusiByTotal.ExpectedValuePlace)
data5$RaceResultByBanusiByTotal.ExpectedValuePlaceLog <- data5$RaceResultByBanusiByTotal.ExpectedValuePlaceLog - mean(data5$RaceResultByBanusiByTotal.ExpectedValuePlaceLog)
#
data5$RaceResultByBreeder.HonSyokinTotal <- data5$RaceResultByBreeder.HonSyokinTotal - mean(data5$RaceResultByBreeder.HonSyokinTotal)
data5$RaceResultByBreeder.HonSyokinTotalLog <- data5$RaceResultByBreeder.HonSyokinTotalLog - mean(data5$RaceResultByBreeder.HonSyokinTotalLog)
data5$RaceResultByBreeder.FukaSyokin <- data5$RaceResultByBreeder.FukaSyokin - mean(data5$RaceResultByBreeder.FukaSyokin)
data5$RaceResultByBreeder.FukaSyokinLog <- data5$RaceResultByBreeder.FukaSyokinLog - mean(data5$RaceResultByBreeder.FukaSyokinLog)
#
data5$RaceResultByBreederByTotal.RunCount <- data5$RaceResultByBreederByTotal.RunCount - mean(data5$RaceResultByBreederByTotal.RunCount)
data5$RaceResultByBreederByTotal.RunCountLog <- data5$RaceResultByBreederByTotal.RunCountLog - mean(data5$RaceResultByBreederByTotal.RunCountLog)
data5$RaceResultByBreederByTotal.HitCount1 <- data5$RaceResultByBreederByTotal.HitCount1 - mean(data5$RaceResultByBreederByTotal.HitCount1)
data5$RaceResultByBreederByTotal.HitCount1Log <- data5$RaceResultByBreederByTotal.HitCount1Log - mean(data5$RaceResultByBreederByTotal.HitCount1Log)
data5$RaceResultByBreederByTotal.HitRate1 <- data5$RaceResultByBreederByTotal.HitRate1 - mean(data5$RaceResultByBreederByTotal.HitRate1)
data5$RaceResultByBreederByTotal.HitRate1Log <- data5$RaceResultByBreederByTotal.HitRate1Log - mean(data5$RaceResultByBreederByTotal.HitRate1Log)
data5$RaceResultByBreederByTotal.HitCount12 <- data5$RaceResultByBreederByTotal.HitCount12 - mean(data5$RaceResultByBreederByTotal.HitCount12)
data5$RaceResultByBreederByTotal.HitCount12Log <- data5$RaceResultByBreederByTotal.HitCount12Log - mean(data5$RaceResultByBreederByTotal.HitCount12Log)
data5$RaceResultByBreederByTotal.HitRate12 <- data5$RaceResultByBreederByTotal.HitRate12 - mean(data5$RaceResultByBreederByTotal.HitRate12)
data5$RaceResultByBreederByTotal.HitRate12Log <- data5$RaceResultByBreederByTotal.HitRate12Log - mean(data5$RaceResultByBreederByTotal.HitRate12Log)
data5$RaceResultByBreederByTotal.HitCount123 <- data5$RaceResultByBreederByTotal.HitCount123 - mean(data5$RaceResultByBreederByTotal.HitCount123)
data5$RaceResultByBreederByTotal.HitCount123Log <- data5$RaceResultByBreederByTotal.HitCount123Log - mean(data5$RaceResultByBreederByTotal.HitCount123Log)
data5$RaceResultByBreederByTotal.HitRate123 <- data5$RaceResultByBreederByTotal.HitRate123 - mean(data5$RaceResultByBreederByTotal.HitRate123)
data5$RaceResultByBreederByTotal.HitRate123Log <-data5$RaceResultByBreederByTotal.HitRate123Log - mean(data5$RaceResultByBreederByTotal.HitRate123Log)
data5$RaceResultByBreederByTotal.OddsWin <- data5$RaceResultByBreederByTotal.OddsWin - mean(data5$RaceResultByBreederByTotal.OddsWin)
data5$RaceResultByBreederByTotal.OddsWinLog <- data5$RaceResultByBreederByTotal.OddsWinLog - mean(data5$RaceResultByBreederByTotal.OddsWinLog)
data5$RaceResultByBreederByTotal.OddsPlace1 <- data5$RaceResultByBreederByTotal.OddsPlace1 - mean(data5$RaceResultByBreederByTotal.OddsPlace1)
data5$RaceResultByBreederByTotal.OddsPlace1Log <- data5$RaceResultByBreederByTotal.OddsPlace1Log - mean(data5$RaceResultByBreederByTotal.OddsPlace1Log)
data5$RaceResultByBreederByTotal.OddsPlace2 <- data5$RaceResultByBreederByTotal.OddsPlace2 - mean(data5$RaceResultByBreederByTotal.OddsPlace2)
data5$RaceResultByBreederByTotal.OddsPlace2Log <- data5$RaceResultByBreederByTotal.OddsPlace2Log - mean(data5$RaceResultByBreederByTotal.OddsPlace2Log)
data5$RaceResultByBreederByTotal.OddsWinInverse <- data5$RaceResultByBreederByTotal.OddsWinInverse - mean(data5$RaceResultByBreederByTotal.OddsWinInverse)
data5$RaceResultByBreederByTotal.OddsWinInverseLog <- data5$RaceResultByBreederByTotal.OddsWinInverseLog - mean(data5$RaceResultByBreederByTotal.OddsWinInverseLog)
data5$RaceResultByBreederByTotal.OddsPlaceInverse1 <- data5$RaceResultByBreederByTotal.OddsPlaceInverse1 - mean(data5$RaceResultByBreederByTotal.OddsPlaceInverse1)
data5$RaceResultByBreederByTotal.OddsPlaceInverse1Log <- data5$RaceResultByBreederByTotal.OddsPlaceInverse1Log - mean(data5$RaceResultByBreederByTotal.OddsPlaceInverse1Log)
data5$RaceResultByBreederByTotal.OddsPlaceInverse2 <- data5$RaceResultByBreederByTotal.OddsPlaceInverse2 - mean(data5$RaceResultByBreederByTotal.OddsPlaceInverse2)
data5$RaceResultByBreederByTotal.OddsPlaceInverse2Log <- data5$RaceResultByBreederByTotal.OddsPlaceInverse2Log - mean(data5$RaceResultByBreederByTotal.OddsPlaceInverse2Log)
data5$RaceResultByBreederByTotal.ApprovalRateWin <- data5$RaceResultByBreederByTotal.ApprovalRateWin - mean(data5$RaceResultByBreederByTotal.ApprovalRateWin)
data5$RaceResultByBreederByTotal.ApprovalRateWinLog <- data5$RaceResultByBreederByTotal.ApprovalRateWinLog - mean(data5$RaceResultByBreederByTotal.ApprovalRateWinLog)
data5$RaceResultByBreederByTotal.ApprovalRatePlace1 <- data5$RaceResultByBreederByTotal.ApprovalRatePlace1 - mean(data5$RaceResultByBreederByTotal.ApprovalRatePlace1)
data5$RaceResultByBreederByTotal.ApprovalRatePlace1Log <- data5$RaceResultByBreederByTotal.ApprovalRatePlace1Log - mean(data5$RaceResultByBreederByTotal.ApprovalRatePlace1Log)
data5$RaceResultByBreederByTotal.ApprovalRatePlace2 <- data5$RaceResultByBreederByTotal.ApprovalRatePlace2 - mean(data5$RaceResultByBreederByTotal.ApprovalRatePlace2)
data5$RaceResultByBreederByTotal.ApprovalRatePlace2Log <- data5$RaceResultByBreederByTotal.ApprovalRatePlace2Log - mean(data5$RaceResultByBreederByTotal.ApprovalRatePlace2Log)
data5$RaceResultByBreederByTotal.ExpectedValueWin <- data5$RaceResultByBreederByTotal.ExpectedValueWin - mean(data5$RaceResultByBreederByTotal.ExpectedValueWin)
data5$RaceResultByBreederByTotal.ExpectedValueWinLog <- data5$RaceResultByBreederByTotal.ExpectedValueWinLog - mean(data5$RaceResultByBreederByTotal.ExpectedValueWinLog)
data5$RaceResultByBreederByTotal.ExpectedValuePlace <- data5$RaceResultByBreederByTotal.ExpectedValuePlace - mean(data5$RaceResultByBreederByTotal.ExpectedValuePlace)
data5$RaceResultByBreederByTotal.ExpectedValuePlaceLog <- data5$RaceResultByBreederByTotal.ExpectedValuePlaceLog - mean(data5$RaceResultByBreederByTotal.ExpectedValuePlaceLog)
#
data5$RaceResultByHorse.RuikeiHonsyoHeiti <- data5$RaceResultByHorse.RuikeiHonsyoHeiti - mean(data5$RaceResultByHorse.RuikeiHonsyoHeiti)
data5$RaceResultByHorse.RuikeiHonsyoHeitiLog <- data5$RaceResultByHorse.RuikeiHonsyoHeitiLog - mean(data5$RaceResultByHorse.RuikeiHonsyoHeitiLog)
data5$RaceResultByHorse.RuikeiHonsyoSyogai <- data5$RaceResultByHorse.RuikeiHonsyoSyogai - mean(data5$RaceResultByHorse.RuikeiHonsyoSyogai)
data5$RaceResultByHorse.RuikeiHonsyoSyogaiLog <- data5$RaceResultByHorse.RuikeiHonsyoSyogaiLog - mean(data5$RaceResultByHorse.RuikeiHonsyoSyogaiLog)
#
# data5$RaceResultByHorseByCourseType.RunCount <- data5$RaceResultByHorseByCourseType.RunCount - mean(data5$RaceResultByHorseByCourseType.RunCount)
# data5$RaceResultByHorseByCourseType.RunCountLog <- data5$RaceResultByHorseByCourseType.RunCountLog - mean(data5$RaceResultByHorseByCourseType.RunCountLog)
# data5$RaceResultByHorseByCourseType.HitCount1 <- data5$RaceResultByHorseByCourseType.HitCount1 - mean(data5$RaceResultByHorseByCourseType.HitCount1)
# data5$RaceResultByHorseByCourseType.HitCount1Log <- data5$RaceResultByHorseByCourseType.HitCount1Log - mean(data5$RaceResultByHorseByCourseType.HitCount1Log)
# data5$RaceResultByHorseByCourseType.HitRate1 <- data5$RaceResultByHorseByCourseType.HitRate1 - mean(data5$RaceResultByHorseByCourseType.HitRate1)
# data5$RaceResultByHorseByCourseType.HitRate1Log <- data5$RaceResultByHorseByCourseType.HitRate1Log - mean(data5$RaceResultByHorseByCourseType.HitRate1Log)
# data5$RaceResultByHorseByCourseType.HitCount12 <- data5$RaceResultByHorseByCourseType.HitCount12 - mean(data5$RaceResultByHorseByCourseType.HitCount12)
# data5$RaceResultByHorseByCourseType.HitCount12Log <- data5$RaceResultByHorseByCourseType.HitCount12Log - mean(data5$RaceResultByHorseByCourseType.HitCount12Log)
# data5$RaceResultByHorseByCourseType.HitRate12 <- data5$RaceResultByHorseByCourseType.HitRate12 - mean(data5$RaceResultByHorseByCourseType.HitRate12)
# data5$RaceResultByHorseByCourseType.HitRate12Log <- data5$RaceResultByHorseByCourseType.HitRate12Log - mean(data5$RaceResultByHorseByCourseType.HitRate12Log)
# data5$RaceResultByHorseByCourseType.HitCount123 <- data5$RaceResultByHorseByCourseType.HitCount123 - mean(data5$RaceResultByHorseByCourseType.HitCount123)
# data5$RaceResultByHorseByCourseType.HitCount123Log <- data5$RaceResultByHorseByCourseType.HitCount123Log - mean(data5$RaceResultByHorseByCourseType.HitCount123Log)
# data5$RaceResultByHorseByCourseType.HitRate123 <- data5$RaceResultByHorseByCourseType.HitRate123 - mean(data5$RaceResultByHorseByCourseType.HitRate123)
# data5$RaceResultByHorseByCourseType.HitRate123Log <-data5$RaceResultByHorseByCourseType.HitRate123Log - mean(data5$RaceResultByHorseByCourseType.HitRate123Log)
# data5$RaceResultByHorseByCourseType.OddsWin <- data5$RaceResultByHorseByCourseType.OddsWin - mean(data5$RaceResultByHorseByCourseType.OddsWin)
# data5$RaceResultByHorseByCourseType.OddsWinLog <- data5$RaceResultByHorseByCourseType.OddsWinLog - mean(data5$RaceResultByHorseByCourseType.OddsWinLog)
# data5$RaceResultByHorseByCourseType.OddsPlace1 <- data5$RaceResultByHorseByCourseType.OddsPlace1 - mean(data5$RaceResultByHorseByCourseType.OddsPlace1)
# data5$RaceResultByHorseByCourseType.OddsPlace1Log <- data5$RaceResultByHorseByCourseType.OddsPlace1Log - mean(data5$RaceResultByHorseByCourseType.OddsPlace1Log)
# data5$RaceResultByHorseByCourseType.OddsPlace2 <- data5$RaceResultByHorseByCourseType.OddsPlace2 - mean(data5$RaceResultByHorseByCourseType.OddsPlace2)
# data5$RaceResultByHorseByCourseType.OddsPlace2Log <- data5$RaceResultByHorseByCourseType.OddsPlace2Log - mean(data5$RaceResultByHorseByCourseType.OddsPlace2Log)
# data5$RaceResultByHorseByCourseType.OddsWinInverse <- data5$RaceResultByHorseByCourseType.OddsWinInverse - mean(data5$RaceResultByHorseByCourseType.OddsWinInverse)
# data5$RaceResultByHorseByCourseType.OddsWinInverseLog <- data5$RaceResultByHorseByCourseType.OddsWinInverseLog - mean(data5$RaceResultByHorseByCourseType.OddsWinInverseLog)
# data5$RaceResultByHorseByCourseType.OddsPlaceInverse1 <- data5$RaceResultByHorseByCourseType.OddsPlaceInverse1 - mean(data5$RaceResultByHorseByCourseType.OddsPlaceInverse1)
# data5$RaceResultByHorseByCourseType.OddsPlaceInverse1Log <- data5$RaceResultByHorseByCourseType.OddsPlaceInverse1Log - mean(data5$RaceResultByHorseByCourseType.OddsPlaceInverse1Log)
# data5$RaceResultByHorseByCourseType.OddsPlaceInverse2 <- data5$RaceResultByHorseByCourseType.OddsPlaceInverse2 - mean(data5$RaceResultByHorseByCourseType.OddsPlaceInverse2)
# data5$RaceResultByHorseByCourseType.OddsPlaceInverse2Log <- data5$RaceResultByHorseByCourseType.OddsPlaceInverse2Log - mean(data5$RaceResultByHorseByCourseType.OddsPlaceInverse2Log)
# data5$RaceResultByHorseByCourseType.ApprovalRateWin <- data5$RaceResultByHorseByCourseType.ApprovalRateWin - mean(data5$RaceResultByHorseByCourseType.ApprovalRateWin)
# data5$RaceResultByHorseByCourseType.ApprovalRateWinLog <- data5$RaceResultByHorseByCourseType.ApprovalRateWinLog - mean(data5$RaceResultByHorseByCourseType.ApprovalRateWinLog)
# data5$RaceResultByHorseByCourseType.ApprovalRatePlace1 <- data5$RaceResultByHorseByCourseType.ApprovalRatePlace1 - mean(data5$RaceResultByHorseByCourseType.ApprovalRatePlace1)
# data5$RaceResultByHorseByCourseType.ApprovalRatePlace1Log <- data5$RaceResultByHorseByCourseType.ApprovalRatePlace1Log - mean(data5$RaceResultByHorseByCourseType.ApprovalRatePlace1Log)
# data5$RaceResultByHorseByCourseType.ApprovalRatePlace2 <- data5$RaceResultByHorseByCourseType.ApprovalRatePlace2 - mean(data5$RaceResultByHorseByCourseType.ApprovalRatePlace2)
# data5$RaceResultByHorseByCourseType.ApprovalRatePlace2Log <- data5$RaceResultByHorseByCourseType.ApprovalRatePlace2Log - mean(data5$RaceResultByHorseByCourseType.ApprovalRatePlace2Log)
# data5$RaceResultByHorseByCourseType.ExpectedValueWin <- data5$RaceResultByHorseByCourseType.ExpectedValueWin - mean(data5$RaceResultByHorseByCourseType.ExpectedValueWin)
# data5$RaceResultByHorseByCourseType.ExpectedValueWinLog <- data5$RaceResultByHorseByCourseType.ExpectedValueWinLog - mean(data5$RaceResultByHorseByCourseType.ExpectedValueWinLog)
# data5$RaceResultByHorseByCourseType.ExpectedValuePlace <- data5$RaceResultByHorseByCourseType.ExpectedValuePlace - mean(data5$RaceResultByHorseByCourseType.ExpectedValuePlace)
# data5$RaceResultByHorseByCourseType.ExpectedValuePlaceLog <- data5$RaceResultByHorseByCourseType.ExpectedValuePlaceLog - mean(data5$RaceResultByHorseByCourseType.ExpectedValuePlaceLog)
#
# data5$RaceResultByHorseByJyo.RunCount <- data5$RaceResultByHorseByJyo.RunCount - mean(data5$RaceResultByHorseByJyo.RunCount)
# data5$RaceResultByHorseByJyo.RunCountLog <- data5$RaceResultByHorseByJyo.RunCountLog - mean(data5$RaceResultByHorseByJyo.RunCountLog)
# data5$RaceResultByHorseByJyo.HitCount1 <- data5$RaceResultByHorseByJyo.HitCount1 - mean(data5$RaceResultByHorseByJyo.HitCount1)
# data5$RaceResultByHorseByJyo.HitCount1Log <- data5$RaceResultByHorseByJyo.HitCount1Log - mean(data5$RaceResultByHorseByJyo.HitCount1Log)
# data5$RaceResultByHorseByJyo.HitRate1 <- data5$RaceResultByHorseByJyo.HitRate1 - mean(data5$RaceResultByHorseByJyo.HitRate1)
# data5$RaceResultByHorseByJyo.HitRate1Log <- data5$RaceResultByHorseByJyo.HitRate1Log - mean(data5$RaceResultByHorseByJyo.HitRate1Log)
# data5$RaceResultByHorseByJyo.HitCount12 <- data5$RaceResultByHorseByJyo.HitCount12 - mean(data5$RaceResultByHorseByJyo.HitCount12)
# data5$RaceResultByHorseByJyo.HitCount12Log <- data5$RaceResultByHorseByJyo.HitCount12Log - mean(data5$RaceResultByHorseByJyo.HitCount12Log)
# data5$RaceResultByHorseByJyo.HitRate12 <- data5$RaceResultByHorseByJyo.HitRate12 - mean(data5$RaceResultByHorseByJyo.HitRate12)
# data5$RaceResultByHorseByJyo.HitRate12Log <- data5$RaceResultByHorseByJyo.HitRate12Log - mean(data5$RaceResultByHorseByJyo.HitRate12Log)
# data5$RaceResultByHorseByJyo.HitCount123 <- data5$RaceResultByHorseByJyo.HitCount123 - mean(data5$RaceResultByHorseByJyo.HitCount123)
# data5$RaceResultByHorseByJyo.HitCount123Log <- data5$RaceResultByHorseByJyo.HitCount123Log - mean(data5$RaceResultByHorseByJyo.HitCount123Log)
# data5$RaceResultByHorseByJyo.HitRate123 <- data5$RaceResultByHorseByJyo.HitRate123 - mean(data5$RaceResultByHorseByJyo.HitRate123)
# data5$RaceResultByHorseByJyo.HitRate123Log <-data5$RaceResultByHorseByJyo.HitRate123Log - mean(data5$RaceResultByHorseByJyo.HitRate123Log)
# data5$RaceResultByHorseByJyo.OddsWin <- data5$RaceResultByHorseByJyo.OddsWin - mean(data5$RaceResultByHorseByJyo.OddsWin)
# data5$RaceResultByHorseByJyo.OddsWinLog <- data5$RaceResultByHorseByJyo.OddsWinLog - mean(data5$RaceResultByHorseByJyo.OddsWinLog)
# data5$RaceResultByHorseByJyo.OddsPlace1 <- data5$RaceResultByHorseByJyo.OddsPlace1 - mean(data5$RaceResultByHorseByJyo.OddsPlace1)
# data5$RaceResultByHorseByJyo.OddsPlace1Log <- data5$RaceResultByHorseByJyo.OddsPlace1Log - mean(data5$RaceResultByHorseByJyo.OddsPlace1Log)
# data5$RaceResultByHorseByJyo.OddsPlace2 <- data5$RaceResultByHorseByJyo.OddsPlace2 - mean(data5$RaceResultByHorseByJyo.OddsPlace2)
# data5$RaceResultByHorseByJyo.OddsPlace2Log <- data5$RaceResultByHorseByJyo.OddsPlace2Log - mean(data5$RaceResultByHorseByJyo.OddsPlace2Log)
# data5$RaceResultByHorseByJyo.OddsWinInverse <- data5$RaceResultByHorseByJyo.OddsWinInverse - mean(data5$RaceResultByHorseByJyo.OddsWinInverse)
# data5$RaceResultByHorseByJyo.OddsWinInverseLog <- data5$RaceResultByHorseByJyo.OddsWinInverseLog - mean(data5$RaceResultByHorseByJyo.OddsWinInverseLog)
# data5$RaceResultByHorseByJyo.OddsPlaceInverse1 <- data5$RaceResultByHorseByJyo.OddsPlaceInverse1 - mean(data5$RaceResultByHorseByJyo.OddsPlaceInverse1)
# data5$RaceResultByHorseByJyo.OddsPlaceInverse1Log <- data5$RaceResultByHorseByJyo.OddsPlaceInverse1Log - mean(data5$RaceResultByHorseByJyo.OddsPlaceInverse1Log)
# data5$RaceResultByHorseByJyo.OddsPlaceInverse2 <- data5$RaceResultByHorseByJyo.OddsPlaceInverse2 - mean(data5$RaceResultByHorseByJyo.OddsPlaceInverse2)
# data5$RaceResultByHorseByJyo.OddsPlaceInverse2Log <- data5$RaceResultByHorseByJyo.OddsPlaceInverse2Log - mean(data5$RaceResultByHorseByJyo.OddsPlaceInverse2Log)
# data5$RaceResultByHorseByJyo.ApprovalRateWin <- data5$RaceResultByHorseByJyo.ApprovalRateWin - mean(data5$RaceResultByHorseByJyo.ApprovalRateWin)
# data5$RaceResultByHorseByJyo.ApprovalRateWinLog <- data5$RaceResultByHorseByJyo.ApprovalRateWinLog - mean(data5$RaceResultByHorseByJyo.ApprovalRateWinLog)
# data5$RaceResultByHorseByJyo.ApprovalRatePlace1 <- data5$RaceResultByHorseByJyo.ApprovalRatePlace1 - mean(data5$RaceResultByHorseByJyo.ApprovalRatePlace1)
# data5$RaceResultByHorseByJyo.ApprovalRatePlace1Log <- data5$RaceResultByHorseByJyo.ApprovalRatePlace1Log - mean(data5$RaceResultByHorseByJyo.ApprovalRatePlace1Log)
# data5$RaceResultByHorseByJyo.ApprovalRatePlace2 <- data5$RaceResultByHorseByJyo.ApprovalRatePlace2 - mean(data5$RaceResultByHorseByJyo.ApprovalRatePlace2)
# data5$RaceResultByHorseByJyo.ApprovalRatePlace2Log <- data5$RaceResultByHorseByJyo.ApprovalRatePlace2Log - mean(data5$RaceResultByHorseByJyo.ApprovalRatePlace2Log)
# data5$RaceResultByHorseByJyo.ExpectedValueWin <- data5$RaceResultByHorseByJyo.ExpectedValueWin - mean(data5$RaceResultByHorseByJyo.ExpectedValueWin)
# data5$RaceResultByHorseByJyo.ExpectedValueWinLog <- data5$RaceResultByHorseByJyo.ExpectedValueWinLog - mean(data5$RaceResultByHorseByJyo.ExpectedValueWinLog)
# data5$RaceResultByHorseByJyo.ExpectedValuePlace <- data5$RaceResultByHorseByJyo.ExpectedValuePlace - mean(data5$RaceResultByHorseByJyo.ExpectedValuePlace)
# data5$RaceResultByHorseByJyo.ExpectedValuePlaceLog <- data5$RaceResultByHorseByJyo.ExpectedValuePlaceLog - mean(data5$RaceResultByHorseByJyo.ExpectedValuePlaceLog)
#
data5$RaceResultByHorseByRunningStyle.RunningStyleAvg <- data5$RaceResultByHorseByRunningStyle.RunningStyleAvg - mean(data5$RaceResultByHorseByRunningStyle.RunningStyleAvg)
data5$RaceResultByHorseByRunningStyle.HitRate1 <- data5$RaceResultByHorseByRunningStyle.HitRate1 - mean(data5$RaceResultByHorseByRunningStyle.HitRate1)
data5$RaceResultByHorseByRunningStyle.HitRate1Log <- data5$RaceResultByHorseByRunningStyle.HitRate1Log - mean(data5$RaceResultByHorseByRunningStyle.HitRate1Log)
data5$RaceResultByHorseByRunningStyle.HitRate2 <- data5$RaceResultByHorseByRunningStyle.HitRate2 - mean(data5$RaceResultByHorseByRunningStyle.HitRate2)
data5$RaceResultByHorseByRunningStyle.HitRate2Log <- data5$RaceResultByHorseByRunningStyle.HitRate2Log - mean(data5$RaceResultByHorseByRunningStyle.HitRate2Log)
data5$RaceResultByHorseByRunningStyle.HitRate3 <- data5$RaceResultByHorseByRunningStyle.HitRate3 - mean(data5$RaceResultByHorseByRunningStyle.HitRate3)
data5$RaceResultByHorseByRunningStyle.HitRate3Log <- data5$RaceResultByHorseByRunningStyle.HitRate3Log - mean(data5$RaceResultByHorseByRunningStyle.HitRate3Log)
data5$RaceResultByHorseByRunningStyle.HitRate4 <- data5$RaceResultByHorseByRunningStyle.HitRate4 - mean(data5$RaceResultByHorseByRunningStyle.HitRate4)
data5$RaceResultByHorseByRunningStyle.HitRate4Log <- data5$RaceResultByHorseByRunningStyle.HitRate4Log - mean(data5$RaceResultByHorseByRunningStyle.HitRate4Log)
#
data5$RaceResultByHorseByTotal.RunCount <- data5$RaceResultByHorseByTotal.RunCount - mean(data5$RaceResultByHorseByTotal.RunCount)
data5$RaceResultByHorseByTotal.RunCountLog <- data5$RaceResultByHorseByTotal.RunCountLog - mean(data5$RaceResultByHorseByTotal.RunCountLog)
data5$RaceResultByHorseByTotal.HitCount1 <- data5$RaceResultByHorseByTotal.HitCount1 - mean(data5$RaceResultByHorseByTotal.HitCount1)
data5$RaceResultByHorseByTotal.HitCount1Log <- data5$RaceResultByHorseByTotal.HitCount1Log - mean(data5$RaceResultByHorseByTotal.HitCount1Log)
data5$RaceResultByHorseByTotal.HitRate1 <- data5$RaceResultByHorseByTotal.HitRate1 - mean(data5$RaceResultByHorseByTotal.HitRate1)
data5$RaceResultByHorseByTotal.HitRate1Log <- data5$RaceResultByHorseByTotal.HitRate1Log - mean(data5$RaceResultByHorseByTotal.HitRate1Log)
data5$RaceResultByHorseByTotal.HitCount12 <- data5$RaceResultByHorseByTotal.HitCount12 - mean(data5$RaceResultByHorseByTotal.HitCount12)
data5$RaceResultByHorseByTotal.HitCount12Log <- data5$RaceResultByHorseByTotal.HitCount12Log - mean(data5$RaceResultByHorseByTotal.HitCount12Log)
data5$RaceResultByHorseByTotal.HitRate12 <- data5$RaceResultByHorseByTotal.HitRate12 - mean(data5$RaceResultByHorseByTotal.HitRate12)
data5$RaceResultByHorseByTotal.HitRate12Log <- data5$RaceResultByHorseByTotal.HitRate12Log - mean(data5$RaceResultByHorseByTotal.HitRate12Log)
data5$RaceResultByHorseByTotal.HitCount123 <- data5$RaceResultByHorseByTotal.HitCount123 - mean(data5$RaceResultByHorseByTotal.HitCount123)
data5$RaceResultByHorseByTotal.HitCount123Log <- data5$RaceResultByHorseByTotal.HitCount123Log - mean(data5$RaceResultByHorseByTotal.HitCount123Log)
data5$RaceResultByHorseByTotal.HitRate123 <- data5$RaceResultByHorseByTotal.HitRate123 - mean(data5$RaceResultByHorseByTotal.HitRate123)
data5$RaceResultByHorseByTotal.HitRate123Log <-data5$RaceResultByHorseByTotal.HitRate123Log - mean(data5$RaceResultByHorseByTotal.HitRate123Log)
data5$RaceResultByHorseByTotal.OddsWin <- data5$RaceResultByHorseByTotal.OddsWin - mean(data5$RaceResultByHorseByTotal.OddsWin)
data5$RaceResultByHorseByTotal.OddsWinLog <- data5$RaceResultByHorseByTotal.OddsWinLog - mean(data5$RaceResultByHorseByTotal.OddsWinLog)
data5$RaceResultByHorseByTotal.OddsPlace1 <- data5$RaceResultByHorseByTotal.OddsPlace1 - mean(data5$RaceResultByHorseByTotal.OddsPlace1)
data5$RaceResultByHorseByTotal.OddsPlace1Log <- data5$RaceResultByHorseByTotal.OddsPlace1Log - mean(data5$RaceResultByHorseByTotal.OddsPlace1Log)
data5$RaceResultByHorseByTotal.OddsPlace2 <- data5$RaceResultByHorseByTotal.OddsPlace2 - mean(data5$RaceResultByHorseByTotal.OddsPlace2)
data5$RaceResultByHorseByTotal.OddsPlace2Log <- data5$RaceResultByHorseByTotal.OddsPlace2Log - mean(data5$RaceResultByHorseByTotal.OddsPlace2Log)
data5$RaceResultByHorseByTotal.OddsWinInverse <- data5$RaceResultByHorseByTotal.OddsWinInverse - mean(data5$RaceResultByHorseByTotal.OddsWinInverse)
data5$RaceResultByHorseByTotal.OddsWinInverseLog <- data5$RaceResultByHorseByTotal.OddsWinInverseLog - mean(data5$RaceResultByHorseByTotal.OddsWinInverseLog)
data5$RaceResultByHorseByTotal.OddsPlaceInverse1 <- data5$RaceResultByHorseByTotal.OddsPlaceInverse1 - mean(data5$RaceResultByHorseByTotal.OddsPlaceInverse1)
data5$RaceResultByHorseByTotal.OddsPlaceInverse1Log <- data5$RaceResultByHorseByTotal.OddsPlaceInverse1Log - mean(data5$RaceResultByHorseByTotal.OddsPlaceInverse1Log)
data5$RaceResultByHorseByTotal.OddsPlaceInverse2 <- data5$RaceResultByHorseByTotal.OddsPlaceInverse2 - mean(data5$RaceResultByHorseByTotal.OddsPlaceInverse2)
data5$RaceResultByHorseByTotal.OddsPlaceInverse2Log <- data5$RaceResultByHorseByTotal.OddsPlaceInverse2Log - mean(data5$RaceResultByHorseByTotal.OddsPlaceInverse2Log)
data5$RaceResultByHorseByTotal.ApprovalRateWin <- data5$RaceResultByHorseByTotal.ApprovalRateWin - mean(data5$RaceResultByHorseByTotal.ApprovalRateWin)
data5$RaceResultByHorseByTotal.ApprovalRateWinLog <- data5$RaceResultByHorseByTotal.ApprovalRateWinLog - mean(data5$RaceResultByHorseByTotal.ApprovalRateWinLog)
data5$RaceResultByHorseByTotal.ApprovalRatePlace1 <- data5$RaceResultByHorseByTotal.ApprovalRatePlace1 - mean(data5$RaceResultByHorseByTotal.ApprovalRatePlace1)
data5$RaceResultByHorseByTotal.ApprovalRatePlace1Log <- data5$RaceResultByHorseByTotal.ApprovalRatePlace1Log - mean(data5$RaceResultByHorseByTotal.ApprovalRatePlace1Log)
data5$RaceResultByHorseByTotal.ApprovalRatePlace2 <- data5$RaceResultByHorseByTotal.ApprovalRatePlace2 - mean(data5$RaceResultByHorseByTotal.ApprovalRatePlace2)
data5$RaceResultByHorseByTotal.ApprovalRatePlace2Log <- data5$RaceResultByHorseByTotal.ApprovalRatePlace2Log - mean(data5$RaceResultByHorseByTotal.ApprovalRatePlace2Log)
data5$RaceResultByHorseByTotal.ExpectedValueWin <- data5$RaceResultByHorseByTotal.ExpectedValueWin - mean(data5$RaceResultByHorseByTotal.ExpectedValueWin)
data5$RaceResultByHorseByTotal.ExpectedValueWinLog <- data5$RaceResultByHorseByTotal.ExpectedValueWinLog - mean(data5$RaceResultByHorseByTotal.ExpectedValueWinLog)
data5$RaceResultByHorseByTotal.ExpectedValuePlace <- data5$RaceResultByHorseByTotal.ExpectedValuePlace - mean(data5$RaceResultByHorseByTotal.ExpectedValuePlace)
data5$RaceResultByHorseByTotal.ExpectedValuePlaceLog <- data5$RaceResultByHorseByTotal.ExpectedValuePlaceLog - mean(data5$RaceResultByHorseByTotal.ExpectedValuePlaceLog)
#
# data5$RaceResultByHorseByTrackCondition.RunCount <- data5$RaceResultByHorseByTrackCondition.RunCount - mean(data5$RaceResultByHorseByTrackCondition.RunCount)
# data5$RaceResultByHorseByTrackCondition.RunCountLog <- data5$RaceResultByHorseByTrackCondition.RunCountLog - mean(data5$RaceResultByHorseByTrackCondition.RunCountLog)
# data5$RaceResultByHorseByTrackCondition.HitCount1 <- data5$RaceResultByHorseByTrackCondition.HitCount1 - mean(data5$RaceResultByHorseByTrackCondition.HitCount1)
# data5$RaceResultByHorseByTrackCondition.HitCount1Log <- data5$RaceResultByHorseByTrackCondition.HitCount1Log - mean(data5$RaceResultByHorseByTrackCondition.HitCount1Log)
# data5$RaceResultByHorseByTrackCondition.HitRate1 <- data5$RaceResultByHorseByTrackCondition.HitRate1 - mean(data5$RaceResultByHorseByTrackCondition.HitRate1)
# data5$RaceResultByHorseByTrackCondition.HitRate1Log <- data5$RaceResultByHorseByTrackCondition.HitRate1Log - mean(data5$RaceResultByHorseByTrackCondition.HitRate1Log)
# data5$RaceResultByHorseByTrackCondition.HitCount12 <- data5$RaceResultByHorseByTrackCondition.HitCount12 - mean(data5$RaceResultByHorseByTrackCondition.HitCount12)
# data5$RaceResultByHorseByTrackCondition.HitCount12Log <- data5$RaceResultByHorseByTrackCondition.HitCount12Log - mean(data5$RaceResultByHorseByTrackCondition.HitCount12Log)
# data5$RaceResultByHorseByTrackCondition.HitRate12 <- data5$RaceResultByHorseByTrackCondition.HitRate12 - mean(data5$RaceResultByHorseByTrackCondition.HitRate12)
# data5$RaceResultByHorseByTrackCondition.HitRate12Log <- data5$RaceResultByHorseByTrackCondition.HitRate12Log - mean(data5$RaceResultByHorseByTrackCondition.HitRate12Log)
# data5$RaceResultByHorseByTrackCondition.HitCount123 <- data5$RaceResultByHorseByTrackCondition.HitCount123 - mean(data5$RaceResultByHorseByTrackCondition.HitCount123)
# data5$RaceResultByHorseByTrackCondition.HitCount123Log <- data5$RaceResultByHorseByTrackCondition.HitCount123Log - mean(data5$RaceResultByHorseByTrackCondition.HitCount123Log)
# data5$RaceResultByHorseByTrackCondition.HitRate123 <- data5$RaceResultByHorseByTrackCondition.HitRate123 - mean(data5$RaceResultByHorseByTrackCondition.HitRate123)
# data5$RaceResultByHorseByTrackCondition.HitRate123Log <-data5$RaceResultByHorseByTrackCondition.HitRate123Log - mean(data5$RaceResultByHorseByTrackCondition.HitRate123Log)
# data5$RaceResultByHorseByTrackCondition.OddsWin <- data5$RaceResultByHorseByTrackCondition.OddsWin - mean(data5$RaceResultByHorseByTrackCondition.OddsWin)
# data5$RaceResultByHorseByTrackCondition.OddsWinLog <- data5$RaceResultByHorseByTrackCondition.OddsWinLog - mean(data5$RaceResultByHorseByTrackCondition.OddsWinLog)
# data5$RaceResultByHorseByTrackCondition.OddsPlace1 <- data5$RaceResultByHorseByTrackCondition.OddsPlace1 - mean(data5$RaceResultByHorseByTrackCondition.OddsPlace1)
# data5$RaceResultByHorseByTrackCondition.OddsPlace1Log <- data5$RaceResultByHorseByTrackCondition.OddsPlace1Log - mean(data5$RaceResultByHorseByTrackCondition.OddsPlace1Log)
# data5$RaceResultByHorseByTrackCondition.OddsPlace2 <- data5$RaceResultByHorseByTrackCondition.OddsPlace2 - mean(data5$RaceResultByHorseByTrackCondition.OddsPlace2)
# data5$RaceResultByHorseByTrackCondition.OddsPlace2Log <- data5$RaceResultByHorseByTrackCondition.OddsPlace2Log - mean(data5$RaceResultByHorseByTrackCondition.OddsPlace2Log)
# data5$RaceResultByHorseByTrackCondition.OddsWinInverse <- data5$RaceResultByHorseByTrackCondition.OddsWinInverse - mean(data5$RaceResultByHorseByTrackCondition.OddsWinInverse)
# data5$RaceResultByHorseByTrackCondition.OddsWinInverseLog <- data5$RaceResultByHorseByTrackCondition.OddsWinInverseLog - mean(data5$RaceResultByHorseByTrackCondition.OddsWinInverseLog)
# data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1 <- data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1 - mean(data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1)
# data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log <- data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log - mean(data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log)
# data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2 <- data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2 - mean(data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2)
# data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log <- data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log - mean(data5$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log)
# data5$RaceResultByHorseByTrackCondition.ApprovalRateWin <- data5$RaceResultByHorseByTrackCondition.ApprovalRateWin - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRateWin)
# data5$RaceResultByHorseByTrackCondition.ApprovalRateWinLog <- data5$RaceResultByHorseByTrackCondition.ApprovalRateWinLog - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRateWinLog)
# data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1 <- data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1 - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1)
# data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log <- data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log)
# data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2 <- data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2 - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2)
# data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log <- data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log - mean(data5$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log)
# data5$RaceResultByHorseByTrackCondition.ExpectedValueWin <- data5$RaceResultByHorseByTrackCondition.ExpectedValueWin - mean(data5$RaceResultByHorseByTrackCondition.ExpectedValueWin)
# data5$RaceResultByHorseByTrackCondition.ExpectedValueWinLog <- data5$RaceResultByHorseByTrackCondition.ExpectedValueWinLog - mean(data5$RaceResultByHorseByTrackCondition.ExpectedValueWinLog)
# data5$RaceResultByHorseByTrackCondition.ExpectedValuePlace <- data5$RaceResultByHorseByTrackCondition.ExpectedValuePlace - mean(data5$RaceResultByHorseByTrackCondition.ExpectedValuePlace)
# data5$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog <- data5$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog - mean(data5$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog)
#
# data5$RaceResultByHorseByTrackType.RunCount <- data5$RaceResultByHorseByTrackType.RunCount - mean(data5$RaceResultByHorseByTrackType.RunCount)
# data5$RaceResultByHorseByTrackType.RunCountLog <- data5$RaceResultByHorseByTrackType.RunCountLog - mean(data5$RaceResultByHorseByTrackType.RunCountLog)
# data5$RaceResultByHorseByTrackType.HitCount1 <- data5$RaceResultByHorseByTrackType.HitCount1 - mean(data5$RaceResultByHorseByTrackType.HitCount1)
# data5$RaceResultByHorseByTrackType.HitCount1Log <- data5$RaceResultByHorseByTrackType.HitCount1Log - mean(data5$RaceResultByHorseByTrackType.HitCount1Log)
# data5$RaceResultByHorseByTrackType.HitRate1 <- data5$RaceResultByHorseByTrackType.HitRate1 - mean(data5$RaceResultByHorseByTrackType.HitRate1)
# data5$RaceResultByHorseByTrackType.HitRate1Log <- data5$RaceResultByHorseByTrackType.HitRate1Log - mean(data5$RaceResultByHorseByTrackType.HitRate1Log)
# data5$RaceResultByHorseByTrackType.HitCount12 <- data5$RaceResultByHorseByTrackType.HitCount12 - mean(data5$RaceResultByHorseByTrackType.HitCount12)
# data5$RaceResultByHorseByTrackType.HitCount12Log <- data5$RaceResultByHorseByTrackType.HitCount12Log - mean(data5$RaceResultByHorseByTrackType.HitCount12Log)
# data5$RaceResultByHorseByTrackType.HitRate12 <- data5$RaceResultByHorseByTrackType.HitRate12 - mean(data5$RaceResultByHorseByTrackType.HitRate12)
# data5$RaceResultByHorseByTrackType.HitRate12Log <- data5$RaceResultByHorseByTrackType.HitRate12Log - mean(data5$RaceResultByHorseByTrackType.HitRate12Log)
# data5$RaceResultByHorseByTrackType.HitCount123 <- data5$RaceResultByHorseByTrackType.HitCount123 - mean(data5$RaceResultByHorseByTrackType.HitCount123)
# data5$RaceResultByHorseByTrackType.HitCount123Log <- data5$RaceResultByHorseByTrackType.HitCount123Log - mean(data5$RaceResultByHorseByTrackType.HitCount123Log)
# data5$RaceResultByHorseByTrackType.HitRate123 <- data5$RaceResultByHorseByTrackType.HitRate123 - mean(data5$RaceResultByHorseByTrackType.HitRate123)
# data5$RaceResultByHorseByTrackType.HitRate123Log <-data5$RaceResultByHorseByTrackType.HitRate123Log - mean(data5$RaceResultByHorseByTrackType.HitRate123Log)
# data5$RaceResultByHorseByTrackType.OddsWin <- data5$RaceResultByHorseByTrackType.OddsWin - mean(data5$RaceResultByHorseByTrackType.OddsWin)
# data5$RaceResultByHorseByTrackType.OddsWinLog <- data5$RaceResultByHorseByTrackType.OddsWinLog - mean(data5$RaceResultByHorseByTrackType.OddsWinLog)
# data5$RaceResultByHorseByTrackType.OddsPlace1 <- data5$RaceResultByHorseByTrackType.OddsPlace1 - mean(data5$RaceResultByHorseByTrackType.OddsPlace1)
# data5$RaceResultByHorseByTrackType.OddsPlace1Log <- data5$RaceResultByHorseByTrackType.OddsPlace1Log - mean(data5$RaceResultByHorseByTrackType.OddsPlace1Log)
# data5$RaceResultByHorseByTrackType.OddsPlace2 <- data5$RaceResultByHorseByTrackType.OddsPlace2 - mean(data5$RaceResultByHorseByTrackType.OddsPlace2)
# data5$RaceResultByHorseByTrackType.OddsPlace2Log <- data5$RaceResultByHorseByTrackType.OddsPlace2Log - mean(data5$RaceResultByHorseByTrackType.OddsPlace2Log)
# data5$RaceResultByHorseByTrackType.OddsWinInverse <- data5$RaceResultByHorseByTrackType.OddsWinInverse - mean(data5$RaceResultByHorseByTrackType.OddsWinInverse)
# data5$RaceResultByHorseByTrackType.OddsWinInverseLog <- data5$RaceResultByHorseByTrackType.OddsWinInverseLog - mean(data5$RaceResultByHorseByTrackType.OddsWinInverseLog)
# data5$RaceResultByHorseByTrackType.OddsPlaceInverse1 <- data5$RaceResultByHorseByTrackType.OddsPlaceInverse1 - mean(data5$RaceResultByHorseByTrackType.OddsPlaceInverse1)
# data5$RaceResultByHorseByTrackType.OddsPlaceInverse1Log <- data5$RaceResultByHorseByTrackType.OddsPlaceInverse1Log - mean(data5$RaceResultByHorseByTrackType.OddsPlaceInverse1Log)
# data5$RaceResultByHorseByTrackType.OddsPlaceInverse2 <- data5$RaceResultByHorseByTrackType.OddsPlaceInverse2 - mean(data5$RaceResultByHorseByTrackType.OddsPlaceInverse2)
# data5$RaceResultByHorseByTrackType.OddsPlaceInverse2Log <- data5$RaceResultByHorseByTrackType.OddsPlaceInverse2Log - mean(data5$RaceResultByHorseByTrackType.OddsPlaceInverse2Log)
# data5$RaceResultByHorseByTrackType.ApprovalRateWin <- data5$RaceResultByHorseByTrackType.ApprovalRateWin - mean(data5$RaceResultByHorseByTrackType.ApprovalRateWin)
# data5$RaceResultByHorseByTrackType.ApprovalRateWinLog <- data5$RaceResultByHorseByTrackType.ApprovalRateWinLog - mean(data5$RaceResultByHorseByTrackType.ApprovalRateWinLog)
# data5$RaceResultByHorseByTrackType.ApprovalRatePlace1 <- data5$RaceResultByHorseByTrackType.ApprovalRatePlace1 - mean(data5$RaceResultByHorseByTrackType.ApprovalRatePlace1)
# data5$RaceResultByHorseByTrackType.ApprovalRatePlace1Log <- data5$RaceResultByHorseByTrackType.ApprovalRatePlace1Log - mean(data5$RaceResultByHorseByTrackType.ApprovalRatePlace1Log)
# data5$RaceResultByHorseByTrackType.ApprovalRatePlace2 <- data5$RaceResultByHorseByTrackType.ApprovalRatePlace2 - mean(data5$RaceResultByHorseByTrackType.ApprovalRatePlace2)
# data5$RaceResultByHorseByTrackType.ApprovalRatePlace2Log <- data5$RaceResultByHorseByTrackType.ApprovalRatePlace2Log - mean(data5$RaceResultByHorseByTrackType.ApprovalRatePlace2Log)
# data5$RaceResultByHorseByTrackType.ExpectedValueWin <- data5$RaceResultByHorseByTrackType.ExpectedValueWin - mean(data5$RaceResultByHorseByTrackType.ExpectedValueWin)
# data5$RaceResultByHorseByTrackType.ExpectedValueWinLog <- data5$RaceResultByHorseByTrackType.ExpectedValueWinLog - mean(data5$RaceResultByHorseByTrackType.ExpectedValueWinLog)
# data5$RaceResultByHorseByTrackType.ExpectedValuePlace <- data5$RaceResultByHorseByTrackType.ExpectedValuePlace - mean(data5$RaceResultByHorseByTrackType.ExpectedValuePlace)
# data5$RaceResultByHorseByTrackType.ExpectedValuePlaceLog <- data5$RaceResultByHorseByTrackType.ExpectedValuePlaceLog - mean(data5$RaceResultByHorseByTrackType.ExpectedValuePlaceLog)
#
data5$RaceResultByJocky.HonSyokinHeichi <- data5$RaceResultByJocky.HonSyokinHeichi - mean(data5$RaceResultByJocky.HonSyokinHeichi)
data5$RaceResultByJocky.HonSyokinHeichiLog <- data5$RaceResultByJocky.HonSyokinHeichiLog - mean(data5$RaceResultByJocky.HonSyokinHeichiLog)
data5$RaceResultByJocky.HonSyokinSyogai <- data5$RaceResultByJocky.HonSyokinSyogai - mean(data5$RaceResultByJocky.HonSyokinSyogai)
data5$RaceResultByJocky.HonSyokinSyogaiLog <- data5$RaceResultByJocky.HonSyokinSyogaiLog - mean(data5$RaceResultByJocky.HonSyokinSyogaiLog)
#
# data5$RaceResultByJockyByJyo.RunCount <- data5$RaceResultByJockyByJyo.RunCount - mean(data5$RaceResultByJockyByJyo.RunCount)
# data5$RaceResultByJockyByJyo.RunCountLog <- data5$RaceResultByJockyByJyo.RunCountLog - mean(data5$RaceResultByJockyByJyo.RunCountLog)
# data5$RaceResultByJockyByJyo.HitCount1 <- data5$RaceResultByJockyByJyo.HitCount1 - mean(data5$RaceResultByJockyByJyo.HitCount1)
# data5$RaceResultByJockyByJyo.HitCount1Log <- data5$RaceResultByJockyByJyo.HitCount1Log - mean(data5$RaceResultByJockyByJyo.HitCount1Log)
# data5$RaceResultByJockyByJyo.HitRate1 <- data5$RaceResultByJockyByJyo.HitRate1 - mean(data5$RaceResultByJockyByJyo.HitRate1)
# data5$RaceResultByJockyByJyo.HitRate1Log <- data5$RaceResultByJockyByJyo.HitRate1Log - mean(data5$RaceResultByJockyByJyo.HitRate1Log)
# data5$RaceResultByJockyByJyo.HitCount12 <- data5$RaceResultByJockyByJyo.HitCount12 - mean(data5$RaceResultByJockyByJyo.HitCount12)
# data5$RaceResultByJockyByJyo.HitCount12Log <- data5$RaceResultByJockyByJyo.HitCount12Log - mean(data5$RaceResultByJockyByJyo.HitCount12Log)
# data5$RaceResultByJockyByJyo.HitRate12 <- data5$RaceResultByJockyByJyo.HitRate12 - mean(data5$RaceResultByJockyByJyo.HitRate12)
# data5$RaceResultByJockyByJyo.HitRate12Log <- data5$RaceResultByJockyByJyo.HitRate12Log - mean(data5$RaceResultByJockyByJyo.HitRate12Log)
# data5$RaceResultByJockyByJyo.HitCount123 <- data5$RaceResultByJockyByJyo.HitCount123 - mean(data5$RaceResultByJockyByJyo.HitCount123)
# data5$RaceResultByJockyByJyo.HitCount123Log <- data5$RaceResultByJockyByJyo.HitCount123Log - mean(data5$RaceResultByJockyByJyo.HitCount123Log)
# data5$RaceResultByJockyByJyo.HitRate123 <- data5$RaceResultByJockyByJyo.HitRate123 - mean(data5$RaceResultByJockyByJyo.HitRate123)
# data5$RaceResultByJockyByJyo.HitRate123Log <-data5$RaceResultByJockyByJyo.HitRate123Log - mean(data5$RaceResultByJockyByJyo.HitRate123Log)
# data5$RaceResultByJockyByJyo.OddsWin <- data5$RaceResultByJockyByJyo.OddsWin - mean(data5$RaceResultByJockyByJyo.OddsWin)
# data5$RaceResultByJockyByJyo.OddsWinLog <- data5$RaceResultByJockyByJyo.OddsWinLog - mean(data5$RaceResultByJockyByJyo.OddsWinLog)
# data5$RaceResultByJockyByJyo.OddsPlace1 <- data5$RaceResultByJockyByJyo.OddsPlace1 - mean(data5$RaceResultByJockyByJyo.OddsPlace1)
# data5$RaceResultByJockyByJyo.OddsPlace1Log <- data5$RaceResultByJockyByJyo.OddsPlace1Log - mean(data5$RaceResultByJockyByJyo.OddsPlace1Log)
# data5$RaceResultByJockyByJyo.OddsPlace2 <- data5$RaceResultByJockyByJyo.OddsPlace2 - mean(data5$RaceResultByJockyByJyo.OddsPlace2)
# data5$RaceResultByJockyByJyo.OddsPlace2Log <- data5$RaceResultByJockyByJyo.OddsPlace2Log - mean(data5$RaceResultByJockyByJyo.OddsPlace2Log)
# data5$RaceResultByJockyByJyo.OddsWinInverse <- data5$RaceResultByJockyByJyo.OddsWinInverse - mean(data5$RaceResultByJockyByJyo.OddsWinInverse)
# data5$RaceResultByJockyByJyo.OddsWinInverseLog <- data5$RaceResultByJockyByJyo.OddsWinInverseLog - mean(data5$RaceResultByJockyByJyo.OddsWinInverseLog)
# data5$RaceResultByJockyByJyo.OddsPlaceInverse1 <- data5$RaceResultByJockyByJyo.OddsPlaceInverse1 - mean(data5$RaceResultByJockyByJyo.OddsPlaceInverse1)
# data5$RaceResultByJockyByJyo.OddsPlaceInverse1Log <- data5$RaceResultByJockyByJyo.OddsPlaceInverse1Log - mean(data5$RaceResultByJockyByJyo.OddsPlaceInverse1Log)
# data5$RaceResultByJockyByJyo.OddsPlaceInverse2 <- data5$RaceResultByJockyByJyo.OddsPlaceInverse2 - mean(data5$RaceResultByJockyByJyo.OddsPlaceInverse2)
# data5$RaceResultByJockyByJyo.OddsPlaceInverse2Log <- data5$RaceResultByJockyByJyo.OddsPlaceInverse2Log - mean(data5$RaceResultByJockyByJyo.OddsPlaceInverse2Log)
# data5$RaceResultByJockyByJyo.ApprovalRateWin <- data5$RaceResultByJockyByJyo.ApprovalRateWin - mean(data5$RaceResultByJockyByJyo.ApprovalRateWin)
# data5$RaceResultByJockyByJyo.ApprovalRateWinLog <- data5$RaceResultByJockyByJyo.ApprovalRateWinLog - mean(data5$RaceResultByJockyByJyo.ApprovalRateWinLog)
# data5$RaceResultByJockyByJyo.ApprovalRatePlace1 <- data5$RaceResultByJockyByJyo.ApprovalRatePlace1 - mean(data5$RaceResultByJockyByJyo.ApprovalRatePlace1)
# data5$RaceResultByJockyByJyo.ApprovalRatePlace1Log <- data5$RaceResultByJockyByJyo.ApprovalRatePlace1Log - mean(data5$RaceResultByJockyByJyo.ApprovalRatePlace1Log)
# data5$RaceResultByJockyByJyo.ApprovalRatePlace2 <- data5$RaceResultByJockyByJyo.ApprovalRatePlace2 - mean(data5$RaceResultByJockyByJyo.ApprovalRatePlace2)
# data5$RaceResultByJockyByJyo.ApprovalRatePlace2Log <- data5$RaceResultByJockyByJyo.ApprovalRatePlace2Log - mean(data5$RaceResultByJockyByJyo.ApprovalRatePlace2Log)
# data5$RaceResultByJockyByJyo.ExpectedValueWin <- data5$RaceResultByJockyByJyo.ExpectedValueWin - mean(data5$RaceResultByJockyByJyo.ExpectedValueWin)
# data5$RaceResultByJockyByJyo.ExpectedValueWinLog <- data5$RaceResultByJockyByJyo.ExpectedValueWinLog - mean(data5$RaceResultByJockyByJyo.ExpectedValueWinLog)
# data5$RaceResultByJockyByJyo.ExpectedValuePlace <- data5$RaceResultByJockyByJyo.ExpectedValuePlace - mean(data5$RaceResultByJockyByJyo.ExpectedValuePlace)
# data5$RaceResultByJockyByJyo.ExpectedValuePlaceLog <- data5$RaceResultByJockyByJyo.ExpectedValuePlaceLog - mean(data5$RaceResultByJockyByJyo.ExpectedValuePlaceLog)
#
data5$RaceResultByJockyByTrackType.RunCount <- data5$RaceResultByJockyByTrackType.RunCount - mean(data5$RaceResultByJockyByTrackType.RunCount)
data5$RaceResultByJockyByTrackType.RunCountLog <- data5$RaceResultByJockyByTrackType.RunCountLog - mean(data5$RaceResultByJockyByTrackType.RunCountLog)
data5$RaceResultByJockyByTrackType.HitCount1 <- data5$RaceResultByJockyByTrackType.HitCount1 - mean(data5$RaceResultByJockyByTrackType.HitCount1)
data5$RaceResultByJockyByTrackType.HitCount1Log <- data5$RaceResultByJockyByTrackType.HitCount1Log - mean(data5$RaceResultByJockyByTrackType.HitCount1Log)
data5$RaceResultByJockyByTrackType.HitRate1 <- data5$RaceResultByJockyByTrackType.HitRate1 - mean(data5$RaceResultByJockyByTrackType.HitRate1)
data5$RaceResultByJockyByTrackType.HitRate1Log <- data5$RaceResultByJockyByTrackType.HitRate1Log - mean(data5$RaceResultByJockyByTrackType.HitRate1Log)
data5$RaceResultByJockyByTrackType.HitCount12 <- data5$RaceResultByJockyByTrackType.HitCount12 - mean(data5$RaceResultByJockyByTrackType.HitCount12)
data5$RaceResultByJockyByTrackType.HitCount12Log <- data5$RaceResultByJockyByTrackType.HitCount12Log - mean(data5$RaceResultByJockyByTrackType.HitCount12Log)
data5$RaceResultByJockyByTrackType.HitRate12 <- data5$RaceResultByJockyByTrackType.HitRate12 - mean(data5$RaceResultByJockyByTrackType.HitRate12)
data5$RaceResultByJockyByTrackType.HitRate12Log <- data5$RaceResultByJockyByTrackType.HitRate12Log - mean(data5$RaceResultByJockyByTrackType.HitRate12Log)
data5$RaceResultByJockyByTrackType.HitCount123 <- data5$RaceResultByJockyByTrackType.HitCount123 - mean(data5$RaceResultByJockyByTrackType.HitCount123)
data5$RaceResultByJockyByTrackType.HitCount123Log <- data5$RaceResultByJockyByTrackType.HitCount123Log - mean(data5$RaceResultByJockyByTrackType.HitCount123Log)
data5$RaceResultByJockyByTrackType.HitRate123 <- data5$RaceResultByJockyByTrackType.HitRate123 - mean(data5$RaceResultByJockyByTrackType.HitRate123)
data5$RaceResultByJockyByTrackType.HitRate123Log <-data5$RaceResultByJockyByTrackType.HitRate123Log - mean(data5$RaceResultByJockyByTrackType.HitRate123Log)
data5$RaceResultByJockyByTrackType.OddsWin <- data5$RaceResultByJockyByTrackType.OddsWin - mean(data5$RaceResultByJockyByTrackType.OddsWin)
data5$RaceResultByJockyByTrackType.OddsWinLog <- data5$RaceResultByJockyByTrackType.OddsWinLog - mean(data5$RaceResultByJockyByTrackType.OddsWinLog)
data5$RaceResultByJockyByTrackType.OddsPlace1 <- data5$RaceResultByJockyByTrackType.OddsPlace1 - mean(data5$RaceResultByJockyByTrackType.OddsPlace1)
data5$RaceResultByJockyByTrackType.OddsPlace1Log <- data5$RaceResultByJockyByTrackType.OddsPlace1Log - mean(data5$RaceResultByJockyByTrackType.OddsPlace1Log)
data5$RaceResultByJockyByTrackType.OddsPlace2 <- data5$RaceResultByJockyByTrackType.OddsPlace2 - mean(data5$RaceResultByJockyByTrackType.OddsPlace2)
data5$RaceResultByJockyByTrackType.OddsPlace2Log <- data5$RaceResultByJockyByTrackType.OddsPlace2Log - mean(data5$RaceResultByJockyByTrackType.OddsPlace2Log)
data5$RaceResultByJockyByTrackType.OddsWinInverse <- data5$RaceResultByJockyByTrackType.OddsWinInverse - mean(data5$RaceResultByJockyByTrackType.OddsWinInverse)
data5$RaceResultByJockyByTrackType.OddsWinInverseLog <- data5$RaceResultByJockyByTrackType.OddsWinInverseLog - mean(data5$RaceResultByJockyByTrackType.OddsWinInverseLog)
data5$RaceResultByJockyByTrackType.OddsPlaceInverse1 <- data5$RaceResultByJockyByTrackType.OddsPlaceInverse1 - mean(data5$RaceResultByJockyByTrackType.OddsPlaceInverse1)
data5$RaceResultByJockyByTrackType.OddsPlaceInverse1Log <- data5$RaceResultByJockyByTrackType.OddsPlaceInverse1Log - mean(data5$RaceResultByJockyByTrackType.OddsPlaceInverse1Log)
data5$RaceResultByJockyByTrackType.OddsPlaceInverse2 <- data5$RaceResultByJockyByTrackType.OddsPlaceInverse2 - mean(data5$RaceResultByJockyByTrackType.OddsPlaceInverse2)
data5$RaceResultByJockyByTrackType.OddsPlaceInverse2Log <- data5$RaceResultByJockyByTrackType.OddsPlaceInverse2Log - mean(data5$RaceResultByJockyByTrackType.OddsPlaceInverse2Log)
data5$RaceResultByJockyByTrackType.ApprovalRateWin <- data5$RaceResultByJockyByTrackType.ApprovalRateWin - mean(data5$RaceResultByJockyByTrackType.ApprovalRateWin)
data5$RaceResultByJockyByTrackType.ApprovalRateWinLog <- data5$RaceResultByJockyByTrackType.ApprovalRateWinLog - mean(data5$RaceResultByJockyByTrackType.ApprovalRateWinLog)
data5$RaceResultByJockyByTrackType.ApprovalRatePlace1 <- data5$RaceResultByJockyByTrackType.ApprovalRatePlace1 - mean(data5$RaceResultByJockyByTrackType.ApprovalRatePlace1)
data5$RaceResultByJockyByTrackType.ApprovalRatePlace1Log <- data5$RaceResultByJockyByTrackType.ApprovalRatePlace1Log - mean(data5$RaceResultByJockyByTrackType.ApprovalRatePlace1Log)
data5$RaceResultByJockyByTrackType.ApprovalRatePlace2 <- data5$RaceResultByJockyByTrackType.ApprovalRatePlace2 - mean(data5$RaceResultByJockyByTrackType.ApprovalRatePlace2)
data5$RaceResultByJockyByTrackType.ApprovalRatePlace2Log <- data5$RaceResultByJockyByTrackType.ApprovalRatePlace2Log - mean(data5$RaceResultByJockyByTrackType.ApprovalRatePlace2Log)
data5$RaceResultByJockyByTrackType.ExpectedValueWin <- data5$RaceResultByJockyByTrackType.ExpectedValueWin - mean(data5$RaceResultByJockyByTrackType.ExpectedValueWin)
data5$RaceResultByJockyByTrackType.ExpectedValueWinLog <- data5$RaceResultByJockyByTrackType.ExpectedValueWinLog - mean(data5$RaceResultByJockyByTrackType.ExpectedValueWinLog)
data5$RaceResultByJockyByTrackType.ExpectedValuePlace <- data5$RaceResultByJockyByTrackType.ExpectedValuePlace - mean(data5$RaceResultByJockyByTrackType.ExpectedValuePlace)
data5$RaceResultByJockyByTrackType.ExpectedValuePlaceLog <- data5$RaceResultByJockyByTrackType.ExpectedValuePlaceLog - mean(data5$RaceResultByJockyByTrackType.ExpectedValuePlaceLog)
#
data5$RaceResultByTrainer.HonSyokinHeichi <- data5$RaceResultByTrainer.HonSyokinHeichi - mean(data5$RaceResultByTrainer.HonSyokinHeichi)
data5$RaceResultByTrainer.HonSyokinHeichiLog <- data5$RaceResultByTrainer.HonSyokinHeichiLog - mean(data5$RaceResultByTrainer.HonSyokinHeichiLog)
data5$RaceResultByTrainer.HonSyokinSyogai <- data5$RaceResultByTrainer.HonSyokinSyogai - mean(data5$RaceResultByTrainer.HonSyokinSyogai)
data5$RaceResultByTrainer.HonSyokinSyogaiLog <- data5$RaceResultByTrainer.HonSyokinSyogaiLog - mean(data5$RaceResultByTrainer.HonSyokinSyogaiLog)
#
# data5$RaceResultByTrainerByJyo.RunCount <- data5$RaceResultByTrainerByJyo.RunCount - mean(data5$RaceResultByTrainerByJyo.RunCount)
# data5$RaceResultByTrainerByJyo.RunCountLog <- data5$RaceResultByTrainerByJyo.RunCountLog - mean(data5$RaceResultByTrainerByJyo.RunCountLog)
# data5$RaceResultByTrainerByJyo.HitCount1 <- data5$RaceResultByTrainerByJyo.HitCount1 - mean(data5$RaceResultByTrainerByJyo.HitCount1)
# data5$RaceResultByTrainerByJyo.HitCount1Log <- data5$RaceResultByTrainerByJyo.HitCount1Log - mean(data5$RaceResultByTrainerByJyo.HitCount1Log)
# data5$RaceResultByTrainerByJyo.HitRate1 <- data5$RaceResultByTrainerByJyo.HitRate1 - mean(data5$RaceResultByTrainerByJyo.HitRate1)
# data5$RaceResultByTrainerByJyo.HitRate1Log <- data5$RaceResultByTrainerByJyo.HitRate1Log - mean(data5$RaceResultByTrainerByJyo.HitRate1Log)
# data5$RaceResultByTrainerByJyo.HitCount12 <- data5$RaceResultByTrainerByJyo.HitCount12 - mean(data5$RaceResultByTrainerByJyo.HitCount12)
# data5$RaceResultByTrainerByJyo.HitCount12Log <- data5$RaceResultByTrainerByJyo.HitCount12Log - mean(data5$RaceResultByTrainerByJyo.HitCount12Log)
# data5$RaceResultByTrainerByJyo.HitRate12 <- data5$RaceResultByTrainerByJyo.HitRate12 - mean(data5$RaceResultByTrainerByJyo.HitRate12)
# data5$RaceResultByTrainerByJyo.HitRate12Log <- data5$RaceResultByTrainerByJyo.HitRate12Log - mean(data5$RaceResultByTrainerByJyo.HitRate12Log)
# data5$RaceResultByTrainerByJyo.HitCount123 <- data5$RaceResultByTrainerByJyo.HitCount123 - mean(data5$RaceResultByTrainerByJyo.HitCount123)
# data5$RaceResultByTrainerByJyo.HitCount123Log <- data5$RaceResultByTrainerByJyo.HitCount123Log - mean(data5$RaceResultByTrainerByJyo.HitCount123Log)
# data5$RaceResultByTrainerByJyo.HitRate123 <- data5$RaceResultByTrainerByJyo.HitRate123 - mean(data5$RaceResultByTrainerByJyo.HitRate123)
# data5$RaceResultByTrainerByJyo.HitRate123Log <-data5$RaceResultByTrainerByJyo.HitRate123Log - mean(data5$RaceResultByTrainerByJyo.HitRate123Log)
# data5$RaceResultByTrainerByJyo.OddsWin <- data5$RaceResultByTrainerByJyo.OddsWin - mean(data5$RaceResultByTrainerByJyo.OddsWin)
# data5$RaceResultByTrainerByJyo.OddsWinLog <- data5$RaceResultByTrainerByJyo.OddsWinLog - mean(data5$RaceResultByTrainerByJyo.OddsWinLog)
# data5$RaceResultByTrainerByJyo.OddsPlace1 <- data5$RaceResultByTrainerByJyo.OddsPlace1 - mean(data5$RaceResultByTrainerByJyo.OddsPlace1)
# data5$RaceResultByTrainerByJyo.OddsPlace1Log <- data5$RaceResultByTrainerByJyo.OddsPlace1Log - mean(data5$RaceResultByTrainerByJyo.OddsPlace1Log)
# data5$RaceResultByTrainerByJyo.OddsPlace2 <- data5$RaceResultByTrainerByJyo.OddsPlace2 - mean(data5$RaceResultByTrainerByJyo.OddsPlace2)
# data5$RaceResultByTrainerByJyo.OddsPlace2Log <- data5$RaceResultByTrainerByJyo.OddsPlace2Log - mean(data5$RaceResultByTrainerByJyo.OddsPlace2Log)
# data5$RaceResultByTrainerByJyo.OddsWinInverse <- data5$RaceResultByTrainerByJyo.OddsWinInverse - mean(data5$RaceResultByTrainerByJyo.OddsWinInverse)
# data5$RaceResultByTrainerByJyo.OddsWinInverseLog <- data5$RaceResultByTrainerByJyo.OddsWinInverseLog - mean(data5$RaceResultByTrainerByJyo.OddsWinInverseLog)
# data5$RaceResultByTrainerByJyo.OddsPlaceInverse1 <- data5$RaceResultByTrainerByJyo.OddsPlaceInverse1 - mean(data5$RaceResultByTrainerByJyo.OddsPlaceInverse1)
# data5$RaceResultByTrainerByJyo.OddsPlaceInverse1Log <- data5$RaceResultByTrainerByJyo.OddsPlaceInverse1Log - mean(data5$RaceResultByTrainerByJyo.OddsPlaceInverse1Log)
# data5$RaceResultByTrainerByJyo.OddsPlaceInverse2 <- data5$RaceResultByTrainerByJyo.OddsPlaceInverse2 - mean(data5$RaceResultByTrainerByJyo.OddsPlaceInverse2)
# data5$RaceResultByTrainerByJyo.OddsPlaceInverse2Log <- data5$RaceResultByTrainerByJyo.OddsPlaceInverse2Log - mean(data5$RaceResultByTrainerByJyo.OddsPlaceInverse2Log)
# data5$RaceResultByTrainerByJyo.ApprovalRateWin <- data5$RaceResultByTrainerByJyo.ApprovalRateWin - mean(data5$RaceResultByTrainerByJyo.ApprovalRateWin)
# data5$RaceResultByTrainerByJyo.ApprovalRateWinLog <- data5$RaceResultByTrainerByJyo.ApprovalRateWinLog - mean(data5$RaceResultByTrainerByJyo.ApprovalRateWinLog)
# data5$RaceResultByTrainerByJyo.ApprovalRatePlace1 <- data5$RaceResultByTrainerByJyo.ApprovalRatePlace1 - mean(data5$RaceResultByTrainerByJyo.ApprovalRatePlace1)
# data5$RaceResultByTrainerByJyo.ApprovalRatePlace1Log <- data5$RaceResultByTrainerByJyo.ApprovalRatePlace1Log - mean(data5$RaceResultByTrainerByJyo.ApprovalRatePlace1Log)
# data5$RaceResultByTrainerByJyo.ApprovalRatePlace2 <- data5$RaceResultByTrainerByJyo.ApprovalRatePlace2 - mean(data5$RaceResultByTrainerByJyo.ApprovalRatePlace2)
# data5$RaceResultByTrainerByJyo.ApprovalRatePlace2Log <- data5$RaceResultByTrainerByJyo.ApprovalRatePlace2Log - mean(data5$RaceResultByTrainerByJyo.ApprovalRatePlace2Log)
# data5$RaceResultByTrainerByJyo.ExpectedValueWin <- data5$RaceResultByTrainerByJyo.ExpectedValueWin - mean(data5$RaceResultByTrainerByJyo.ExpectedValueWin)
# data5$RaceResultByTrainerByJyo.ExpectedValueWinLog <- data5$RaceResultByTrainerByJyo.ExpectedValueWinLog - mean(data5$RaceResultByTrainerByJyo.ExpectedValueWinLog)
# data5$RaceResultByTrainerByJyo.ExpectedValuePlace <- data5$RaceResultByTrainerByJyo.ExpectedValuePlace - mean(data5$RaceResultByTrainerByJyo.ExpectedValuePlace)
# data5$RaceResultByTrainerByJyo.ExpectedValuePlaceLog <- data5$RaceResultByTrainerByJyo.ExpectedValuePlaceLog - mean(data5$RaceResultByTrainerByJyo.ExpectedValuePlaceLog)
#
data5$RaceResultByTrainerByTrackType.RunCount <- data5$RaceResultByTrainerByTrackType.RunCount - mean(data5$RaceResultByTrainerByTrackType.RunCount)
data5$RaceResultByTrainerByTrackType.RunCountLog <- data5$RaceResultByTrainerByTrackType.RunCountLog - mean(data5$RaceResultByTrainerByTrackType.RunCountLog)
data5$RaceResultByTrainerByTrackType.HitCount1 <- data5$RaceResultByTrainerByTrackType.HitCount1 - mean(data5$RaceResultByTrainerByTrackType.HitCount1)
data5$RaceResultByTrainerByTrackType.HitCount1Log <- data5$RaceResultByTrainerByTrackType.HitCount1Log - mean(data5$RaceResultByTrainerByTrackType.HitCount1Log)
data5$RaceResultByTrainerByTrackType.HitRate1 <- data5$RaceResultByTrainerByTrackType.HitRate1 - mean(data5$RaceResultByTrainerByTrackType.HitRate1)
data5$RaceResultByTrainerByTrackType.HitRate1Log <- data5$RaceResultByTrainerByTrackType.HitRate1Log - mean(data5$RaceResultByTrainerByTrackType.HitRate1Log)
data5$RaceResultByTrainerByTrackType.HitCount12 <- data5$RaceResultByTrainerByTrackType.HitCount12 - mean(data5$RaceResultByTrainerByTrackType.HitCount12)
data5$RaceResultByTrainerByTrackType.HitCount12Log <- data5$RaceResultByTrainerByTrackType.HitCount12Log - mean(data5$RaceResultByTrainerByTrackType.HitCount12Log)
data5$RaceResultByTrainerByTrackType.HitRate12 <- data5$RaceResultByTrainerByTrackType.HitRate12 - mean(data5$RaceResultByTrainerByTrackType.HitRate12)
data5$RaceResultByTrainerByTrackType.HitRate12Log <- data5$RaceResultByTrainerByTrackType.HitRate12Log - mean(data5$RaceResultByTrainerByTrackType.HitRate12Log)
data5$RaceResultByTrainerByTrackType.HitCount123 <- data5$RaceResultByTrainerByTrackType.HitCount123 - mean(data5$RaceResultByTrainerByTrackType.HitCount123)
data5$RaceResultByTrainerByTrackType.HitCount123Log <- data5$RaceResultByTrainerByTrackType.HitCount123Log - mean(data5$RaceResultByTrainerByTrackType.HitCount123Log)
data5$RaceResultByTrainerByTrackType.HitRate123 <- data5$RaceResultByTrainerByTrackType.HitRate123 - mean(data5$RaceResultByTrainerByTrackType.HitRate123)
data5$RaceResultByTrainerByTrackType.HitRate123Log <-data5$RaceResultByTrainerByTrackType.HitRate123Log - mean(data5$RaceResultByTrainerByTrackType.HitRate123Log)
data5$RaceResultByTrainerByTrackType.OddsWin <- data5$RaceResultByTrainerByTrackType.OddsWin - mean(data5$RaceResultByTrainerByTrackType.OddsWin)
data5$RaceResultByTrainerByTrackType.OddsWinLog <- data5$RaceResultByTrainerByTrackType.OddsWinLog - mean(data5$RaceResultByTrainerByTrackType.OddsWinLog)
data5$RaceResultByTrainerByTrackType.OddsPlace1 <- data5$RaceResultByTrainerByTrackType.OddsPlace1 - mean(data5$RaceResultByTrainerByTrackType.OddsPlace1)
data5$RaceResultByTrainerByTrackType.OddsPlace1Log <- data5$RaceResultByTrainerByTrackType.OddsPlace1Log - mean(data5$RaceResultByTrainerByTrackType.OddsPlace1Log)
data5$RaceResultByTrainerByTrackType.OddsPlace2 <- data5$RaceResultByTrainerByTrackType.OddsPlace2 - mean(data5$RaceResultByTrainerByTrackType.OddsPlace2)
data5$RaceResultByTrainerByTrackType.OddsPlace2Log <- data5$RaceResultByTrainerByTrackType.OddsPlace2Log - mean(data5$RaceResultByTrainerByTrackType.OddsPlace2Log)
data5$RaceResultByTrainerByTrackType.OddsWinInverse <- data5$RaceResultByTrainerByTrackType.OddsWinInverse - mean(data5$RaceResultByTrainerByTrackType.OddsWinInverse)
data5$RaceResultByTrainerByTrackType.OddsWinInverseLog <- data5$RaceResultByTrainerByTrackType.OddsWinInverseLog - mean(data5$RaceResultByTrainerByTrackType.OddsWinInverseLog)
data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1 <- data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1 - mean(data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1)
data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log <- data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log - mean(data5$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log)
data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2 <- data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2 - mean(data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2)
data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log <- data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log - mean(data5$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log)
data5$RaceResultByTrainerByTrackType.ApprovalRateWin <- data5$RaceResultByTrainerByTrackType.ApprovalRateWin - mean(data5$RaceResultByTrainerByTrackType.ApprovalRateWin)
data5$RaceResultByTrainerByTrackType.ApprovalRateWinLog <- data5$RaceResultByTrainerByTrackType.ApprovalRateWinLog - mean(data5$RaceResultByTrainerByTrackType.ApprovalRateWinLog)
data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1 <- data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1 - mean(data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1)
data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log <- data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log - mean(data5$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log)
data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2 <- data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2 - mean(data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2)
data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log <- data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log - mean(data5$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log)
data5$RaceResultByTrainerByTrackType.ExpectedValueWin <- data5$RaceResultByTrainerByTrackType.ExpectedValueWin - mean(data5$RaceResultByTrainerByTrackType.ExpectedValueWin)
data5$RaceResultByTrainerByTrackType.ExpectedValueWinLog <- data5$RaceResultByTrainerByTrackType.ExpectedValueWinLog - mean(data5$RaceResultByTrainerByTrackType.ExpectedValueWinLog)
data5$RaceResultByTrainerByTrackType.ExpectedValuePlace <- data5$RaceResultByTrainerByTrackType.ExpectedValuePlace - mean(data5$RaceResultByTrainerByTrackType.ExpectedValuePlace)
data5$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog <- data5$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog - mean(data5$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog)

# print("summarySE")
# jackpot.DataMining.DmTimeDevValueOfRace.sum <-
# summarySE(data5
# measurevar="DataMining.DmTimeDevValueOfRace"
# groupvars=c("Race.JyokenCd5","Race.JyoCd","Race.JyuryoCd")
# )
# jackpot.DataMining.DmTimeDevValueOfRace.sum

print(paste0(Sys.time(),  " --- source_centering.R Finished ---"))