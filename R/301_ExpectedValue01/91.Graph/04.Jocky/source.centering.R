# -------------------------------------
# Centering
# -------------------------------------
dummy <- 0.5
print("Centering...")
data4$RaceHorse.BaTaijyu <- data4$RaceHorse.BaTaijyu - mean(data4$RaceHorse.BaTaijyu)
data4$Odds1ByWin.BetCount <- data4$Odds1ByWin.BetCount - mean(data4$Odds1ByWin.BetCount)
data4$Odds1ByWin.TotalBetCount <- data4$Odds1ByWin.TotalBetCount - mean(data4$Odds1ByWin.TotalBetCount)
data4$DataMining.DmTimeDevValueOfRace <- data4$DataMining.DmTimeDevValueOfRace - mean(data4$DataMining.DmTimeDevValueOfRace)

data4$RaceHorse.Time <- data4$RaceHorse.Time - mean(data4$RaceHorse.Time)
data4$RaceHorse.TimeDevValueOfRace <- data4$RaceHorse.TimeDevValueOfRace - mean(data4$RaceHorse.TimeDevValueOfRace)
# data4$RaceHorse.IsHit_1 <- data4$RaceHorse.IsHit_1 - dummy
data4$RaceHorse.IsHit_1 <- data4$RaceHorse.IsHit_1
# data4$RaceHorse.IsHit_12 <- data4$RaceHorse.IsHit_12 - dummy
data4$RaceHorse.IsHit_1 <- data4$RaceHorse.IsHit_12
# data4$RaceHorse.IsHit_123 <- data4$RaceHorse.IsHit_123 - dummy
data4$RaceHorse.IsHit_1 <- data4$RaceHorse.IsHit_123
data4$RaceHorse.KakuteiJyuni <- data4$RaceHorse.KakuteiJyuni - mean(data4$RaceHorse.KakuteiJyuni)
data4$RaceHorseBet.PayoffWin <- data4$RaceHorseBet.PayoffWin - mean(data4$RaceHorseBet.PayoffWin)
data4$RaceHorseBet.PayoffWinLog <- data4$RaceHorseBet.PayoffWinLog - mean(data4$RaceHorseBet.PayoffWinLog)
data4$RaceHorseBet.PayoffPlace <- data4$RaceHorseBet.PayoffPlace - mean(data4$RaceHorseBet.PayoffPlace)
data4$RaceHorseBet.PayoffPlaceLog <- data4$RaceHorseBet.PayoffPlaceLog - mean(data4$RaceHorseBet.PayoffPlaceLog)
#
data4$Race.JyoCd <- data4$Race.JyoCd
data4$MasterJyo.IsJyoCd_01 <- data4$MasterJyo.IsJyoCd_01 - dummy
data4$MasterJyo.IsJyoCd_02 <- data4$MasterJyo.IsJyoCd_02 - dummy
data4$MasterJyo.IsJyoCd_03 <- data4$MasterJyo.IsJyoCd_03 - dummy
data4$MasterJyo.IsJyoCd_04 <- data4$MasterJyo.IsJyoCd_04 - dummy
data4$MasterJyo.IsJyoCd_05 <- data4$MasterJyo.IsJyoCd_05 - dummy
data4$MasterJyo.IsJyoCd_06 <- data4$MasterJyo.IsJyoCd_06 - dummy
data4$MasterJyo.IsJyoCd_07 <- data4$MasterJyo.IsJyoCd_07 - dummy
data4$MasterJyo.IsJyoCd_08 <- data4$MasterJyo.IsJyoCd_08 - dummy
data4$MasterJyo.IsJyoCd_09 <- data4$MasterJyo.IsJyoCd_09 - dummy
data4$MasterJyo.IsJyoCd_10 <- data4$MasterJyo.IsJyoCd_10 - dummy
data4$Race.GradeCd <- data4$Race.GradeCd
data4$MasterGrade.IsGradeCd_G1 <- data4$MasterGrade.IsGradeCd_G1 - dummy
data4$MasterGrade.IsGradeCd_G2 <- data4$MasterGrade.IsGradeCd_G2 - dummy
data4$MasterGrade.IsGradeCd_G3 <- data4$MasterGrade.IsGradeCd_G3 - dummy
data4$MasterGrade.IsGradeCd_Jyusyo <- data4$MasterGrade.IsGradeCd_Jyusyo - dummy
data4$MasterGrade.IsGradeCd_Tokubetu <- data4$MasterGrade.IsGradeCd_Tokubetu - dummy
data4$MasterGrade.IsGradeCd_JG1 <- data4$MasterGrade.IsGradeCd_JG1 - dummy
data4$MasterGrade.IsGradeCd_JG2 <- data4$MasterGrade.IsGradeCd_JG2 - dummy
data4$MasterGrade.IsGradeCd_JG3 <- data4$MasterGrade.IsGradeCd_JG3 - dummy
data4$Race.KigoCd <- data4$Race.KigoCd
data4$Race.SyubetuCd <- data4$Race.SyubetuCd
data4$MasterSyubetu.IsSyubetu_11 <- data4$MasterSyubetu.IsSyubetu_11 - dummy
data4$MasterSyubetu.IsSyubetu_12 <- data4$MasterSyubetu.IsSyubetu_12 - dummy
data4$MasterSyubetu.IsSyubetu_13 <- data4$MasterSyubetu.IsSyubetu_13 - dummy
data4$MasterSyubetu.IsSyubetu_14 <- data4$MasterSyubetu.IsSyubetu_14 - dummy
data4$MasterSyubetu.IsSyubetu_18 <- data4$MasterSyubetu.IsSyubetu_18 - dummy
data4$MasterSyubetu.IsSyubetu_19 <- data4$MasterSyubetu.IsSyubetu_19 - dummy
data4$MasterSyubetu.IsSyubetu_21 <- data4$MasterSyubetu.IsSyubetu_21 - dummy
data4$MasterSyubetu.IsSyubetu_22 <- data4$MasterSyubetu.IsSyubetu_22 - dummy
data4$MasterSyubetu.IsSyubetu_23 <- data4$MasterSyubetu.IsSyubetu_23 - dummy
data4$MasterSyubetu.IsSyubetu_24 <- data4$MasterSyubetu.IsSyubetu_24 - dummy
data4$Race.JyuryoCd <- data4$Race.JyuryoCd
data4$MasterJyuryo.IsJyuryoCd_1 <- data4$MasterJyuryo.IsJyuryoCd_1 - dummy
data4$MasterJyuryo.IsJyuryoCd_2 <- data4$MasterJyuryo.IsJyuryoCd_2 - dummy
data4$MasterJyuryo.IsJyuryoCd_3 <- data4$MasterJyuryo.IsJyuryoCd_3 - dummy
data4$MasterJyuryo.IsJyuryoCd_4 <- data4$MasterJyuryo.IsJyuryoCd_4 - dummy
data4$Race.JyokenCd5 <- data4$Race.JyokenCd5
data4$MasterJyoken5.IsJyokenCd_701 <- data4$MasterJyoken5.IsJyokenCd_701 - dummy
data4$MasterJyoken5.IsJyokenCd_703 <- data4$MasterJyoken5.IsJyokenCd_703 - dummy
data4$MasterJyoken5.IsJyokenCd_005 <- data4$MasterJyoken5.IsJyokenCd_005 - dummy
data4$MasterJyoken5.IsJyokenCd_010 <- data4$MasterJyoken5.IsJyokenCd_010 - dummy
data4$MasterJyoken5.IsJyokenCd_016 <- data4$MasterJyoken5.IsJyokenCd_016 - dummy
data4$MasterJyoken5.IsJyokenCd_999 <- data4$MasterJyoken5.IsJyokenCd_999 - dummy
data4$Race.Kyori <- data4$Race.Kyori - mean(data4$Race.Kyori)
data4$MasterKyori.IsKyori_1000 <- data4$MasterKyori.IsKyori_1000 - dummy
data4$MasterKyori.IsKyori_1150 <- data4$MasterKyori.IsKyori_1150 - dummy
data4$MasterKyori.IsKyori_1200 <- data4$MasterKyori.IsKyori_1200 - dummy
data4$MasterKyori.IsKyori_1300 <- data4$MasterKyori.IsKyori_1300 - dummy
data4$MasterKyori.IsKyori_1400 <- data4$MasterKyori.IsKyori_1400 - dummy
data4$MasterKyori.IsKyori_1500 <- data4$MasterKyori.IsKyori_1500 - dummy
data4$MasterKyori.IsKyori_1600 <- data4$MasterKyori.IsKyori_1600 - dummy
data4$MasterKyori.IsKyori_1700 <- data4$MasterKyori.IsKyori_1700 - dummy
data4$MasterKyori.IsKyori_1800 <- data4$MasterKyori.IsKyori_1800 - dummy
data4$MasterKyori.IsKyori_1900 <- data4$MasterKyori.IsKyori_1900 - dummy
data4$MasterKyori.IsKyori_2000 <- data4$MasterKyori.IsKyori_2000 - dummy
data4$MasterKyori.IsKyori_2100 <- data4$MasterKyori.IsKyori_2100 - dummy
data4$MasterKyori.IsKyori_2200 <- data4$MasterKyori.IsKyori_2200 - dummy
data4$MasterKyori.IsKyori_2300 <- data4$MasterKyori.IsKyori_2300 - dummy
data4$MasterKyori.IsKyori_2400 <- data4$MasterKyori.IsKyori_2400 - dummy
data4$MasterKyori.IsKyori_2500 <- data4$MasterKyori.IsKyori_2500 - dummy
data4$MasterKyori.IsKyori_2600 <- data4$MasterKyori.IsKyori_2600 - dummy
data4$MasterKyori.IsKyori_2750 <- data4$MasterKyori.IsKyori_2750 - dummy
data4$MasterKyori.IsKyori_2770 <- data4$MasterKyori.IsKyori_2770 - dummy
data4$MasterKyori.IsKyori_2800 <- data4$MasterKyori.IsKyori_2800 - dummy
data4$MasterKyori.IsKyori_2850 <- data4$MasterKyori.IsKyori_2850 - dummy
data4$MasterKyori.IsKyori_2880 <- data4$MasterKyori.IsKyori_2880 - dummy
data4$MasterKyori.IsKyori_2890 <- data4$MasterKyori.IsKyori_2900 - dummy
data4$MasterKyori.IsKyori_2900 <- data4$MasterKyori.IsKyori_2900 - dummy
data4$MasterKyori.IsKyori_2910 <- data4$MasterKyori.IsKyori_2910 - dummy
data4$MasterKyori.IsKyori_2930 <- data4$MasterKyori.IsKyori_2930 - dummy
data4$MasterKyori.IsKyori_2970 <- data4$MasterKyori.IsKyori_2970 - dummy
data4$MasterKyori.IsKyori_3000 <- data4$MasterKyori.IsKyori_3000 - dummy
data4$MasterKyori.IsKyori_3100 <- data4$MasterKyori.IsKyori_3100 - dummy
data4$MasterKyori.IsKyori_3110 <- data4$MasterKyori.IsKyori_3110 - dummy
data4$MasterKyori.IsKyori_3140 <- data4$MasterKyori.IsKyori_3140 - dummy
data4$MasterKyori.IsKyori_3170 <- data4$MasterKyori.IsKyori_3170 - dummy
data4$MasterKyori.IsKyori_3190 <- data4$MasterKyori.IsKyori_3190 - dummy
data4$MasterKyori.IsKyori_3200 <- data4$MasterKyori.IsKyori_3200 - dummy
data4$MasterKyori.IsKyori_3210 <- data4$MasterKyori.IsKyori_3210 - dummy
data4$MasterKyori.IsKyori_3250 <- data4$MasterKyori.IsKyori_3250 - dummy
data4$MasterKyori.IsKyori_3285 <- data4$MasterKyori.IsKyori_3285 - dummy
data4$MasterKyori.IsKyori_3290 <- data4$MasterKyori.IsKyori_3290 - dummy
data4$MasterKyori.IsKyori_3300 <- data4$MasterKyori.IsKyori_3300 - dummy
data4$MasterKyori.IsKyori_3330 <- data4$MasterKyori.IsKyori_3330 - dummy
data4$MasterKyori.IsKyori_3350 <- data4$MasterKyori.IsKyori_3350 - dummy
data4$MasterKyori.IsKyori_3370 <- data4$MasterKyori.IsKyori_3370 - dummy
data4$MasterKyori.IsKyori_3380 <- data4$MasterKyori.IsKyori_3380 - dummy
data4$MasterKyori.IsKyori_3390 <- data4$MasterKyori.IsKyori_3290 - dummy
data4$MasterKyori.IsKyori_3400 <- data4$MasterKyori.IsKyori_3400 - dummy
data4$MasterKyori.IsKyori_3570 <- data4$MasterKyori.IsKyori_3570 - dummy
data4$MasterKyori.IsKyori_3600 <- data4$MasterKyori.IsKyori_3600 - dummy
data4$MasterKyori.IsKyori_3760 <- data4$MasterKyori.IsKyori_3760 - dummy
data4$MasterKyori.IsKyori_3790 <- data4$MasterKyori.IsKyori_3790 - dummy
data4$MasterKyori.IsKyori_3900 <- data4$MasterKyori.IsKyori_3900 - dummy
data4$MasterKyori.IsKyori_3930 <- data4$MasterKyori.IsKyori_3930 - dummy
data4$MasterKyori.IsKyori_4100 <- data4$MasterKyori.IsKyori_4100 - dummy
data4$MasterKyori.IsKyori_4250 <- data4$MasterKyori.IsKyori_4250 - dummy
data4$MasterKyori.IsKyori_4260 <- data4$MasterKyori.IsKyori_4260 - dummy
data4$Race.CourseKubunCd <- data4$Race.CourseKubunCd
data4$MasterCourseKubun.IsCourseKubun_SP <- data4$MasterCourseKubun.IsCourseKubun_SP - dummy
data4$MasterCourseKubun.IsCourseKubun_A <- data4$MasterCourseKubun.IsCourseKubun_A - dummy
data4$MasterCourseKubun.IsCourseKubun_B <- data4$MasterCourseKubun.IsCourseKubun_B - dummy
data4$MasterCourseKubun.IsCourseKubun_C <- data4$MasterCourseKubun.IsCourseKubun_C - dummy
data4$MasterCourseKubun.IsCourseKubun_D <- data4$MasterCourseKubun.IsCourseKubun_D - dummy
data4$MasterCourseKubun.IsCourseKubun_E <- data4$MasterCourseKubun.IsCourseKubun_E - dummy
data4$Race.CourseTypeCd <- data4$Race.CourseTypeCd
data4$MasterCourseType.IsCourseTypeCd_1 <- data4$MasterCourseType.IsCourseTypeCd_1 - dummy
data4$MasterCourseType.IsCourseTypeCd_2 <- data4$MasterCourseType.IsCourseTypeCd_2 - dummy
data4$MasterCourseType.IsCourseTypeCd_3 <- data4$MasterCourseType.IsCourseTypeCd_3 - dummy
data4$MasterCourseType.IsCourseTypeCd_4 <- data4$MasterCourseType.IsCourseTypeCd_4 - dummy
data4$Race.TenkoCd <- data4$Race.TenkoCd
data4$MasterTenko.IsTenkoCd_1 <- data4$MasterTenko.IsTenkoCd_1 - dummy
data4$MasterTenko.IsTenkoCd_2 <- data4$MasterTenko.IsTenkoCd_2 - dummy
data4$MasterTenko.IsTenkoCd_3 <- data4$MasterTenko.IsTenkoCd_3 - dummy
data4$MasterTenko.IsTenkoCd_4 <- data4$MasterTenko.IsTenkoCd_4 - dummy
data4$MasterTenko.IsTenkoCd_5 <- data4$MasterTenko.IsTenkoCd_5 - dummy
data4$MasterTenko.IsTenkoCd_6 <- data4$MasterTenko.IsTenkoCd_6 - dummy
data4$Race.TrackCd <- data4$Race.TrackCd
data4$MasterTrack.IsTrackCd_Straight <-  data4$MasterTrack.IsTrackCd_Straight - dummy
data4$MasterTrack.IsTrackCd_Left <- data4$MasterTrack.IsTrackCd_Left - dummy
data4$MasterTrack.IsTrackCd_Right <- data4$MasterTrack.IsTrackCd_Right - dummy
data4$MasterTrack.IsTrackCd_10 <- data4$MasterTrack.IsTrackCd_10 - dummy
data4$MasterTrack.IsTrackCd_11 <- data4$MasterTrack.IsTrackCd_11 - dummy
data4$MasterTrack.IsTrackCd_12 <- data4$MasterTrack.IsTrackCd_12 - dummy
data4$MasterTrack.IsTrackCd_13 <- data4$MasterTrack.IsTrackCd_13 - dummy
data4$MasterTrack.IsTrackCd_14 <- data4$MasterTrack.IsTrackCd_14 - dummy
data4$MasterTrack.IsTrackCd_15 <- data4$MasterTrack.IsTrackCd_15 - dummy
data4$MasterTrack.IsTrackCd_16 <- data4$MasterTrack.IsTrackCd_16 - dummy
data4$MasterTrack.IsTrackCd_17 <- data4$MasterTrack.IsTrackCd_17 - dummy
data4$MasterTrack.IsTrackCd_18 <- data4$MasterTrack.IsTrackCd_18 - dummy
data4$MasterTrack.IsTrackCd_19 <- data4$MasterTrack.IsTrackCd_19 - dummy
data4$MasterTrack.IsTrackCd_20 <- data4$MasterTrack.IsTrackCd_20 - dummy
data4$MasterTrack.IsTrackCd_21 <- data4$MasterTrack.IsTrackCd_21 - dummy
data4$MasterTrack.IsTrackCd_22 <- data4$MasterTrack.IsTrackCd_22 - dummy
data4$MasterTrack.IsTrackCd_23 <- data4$MasterTrack.IsTrackCd_23 - dummy
data4$MasterTrack.IsTrackCd_24 <- data4$MasterTrack.IsTrackCd_24 - dummy
data4$MasterTrack.IsTrackCd_25 <- data4$MasterTrack.IsTrackCd_25 - dummy
data4$MasterTrack.IsTrackCd_26 <- data4$MasterTrack.IsTrackCd_26 - dummy
data4$MasterTrack.IsTrackCd_27 <- data4$MasterTrack.IsTrackCd_27 - dummy
data4$MasterTrack.IsTrackCd_28 <- data4$MasterTrack.IsTrackCd_28 - dummy
data4$MasterTrack.IsTrackCd_29 <- data4$MasterTrack.IsTrackCd_29 - dummy
data4$MasterTrack.IsTrackCd_51 <- data4$MasterTrack.IsTrackCd_51 - dummy
data4$MasterTrack.IsTrackCd_52 <- data4$MasterTrack.IsTrackCd_52 - dummy
data4$MasterTrack.IsTrackCd_53 <- data4$MasterTrack.IsTrackCd_53 - dummy
data4$MasterTrack.IsTrackCd_54 <- data4$MasterTrack.IsTrackCd_54 - dummy
data4$MasterTrack.IsTrackCd_55 <- data4$MasterTrack.IsTrackCd_55 - dummy
data4$MasterTrack.IsTrackCd_56 <- data4$MasterTrack.IsTrackCd_56 - dummy
data4$MasterTrack.IsTrackCd_57 <- data4$MasterTrack.IsTrackCd_57 - dummy
data4$MasterTrack.IsTrackCd_58 <- data4$MasterTrack.IsTrackCd_58 - dummy
data4$MasterTrack.IsTrackCd_59 <- data4$MasterTrack.IsTrackCd_59 - dummy
data4$Race.TrackTypeCd <- data4$Race.TrackTypeCd
data4$MasterTrackType.IsTrackTypeCd_1 <- data4$MasterTrackType.IsTrackTypeCd_1 - dummy
data4$MasterTrackType.IsTrackTypeCd_2 <- data4$MasterTrackType.IsTrackTypeCd_2 - dummy
data4$MasterTrackType.IsTrackTypeCd_3 <- data4$MasterTrackType.IsTrackTypeCd_3 - dummy
data4$MasterTrackType.IsTrackTypeCd_4 <- data4$MasterTrackType.IsTrackTypeCd_4 - dummy
data4$Race.TrackConditionCd <- data4$Race.TrackConditionCd
data4$MasterTrackCondition.IsTrackConditionCd_1 <- data4$MasterTrackCondition.IsTrackConditionCd_1 - dummy
data4$MasterTrackCondition.IsTrackConditionCd_2 <- data4$MasterTrackCondition.IsTrackConditionCd_2 - dummy
data4$MasterTrackCondition.IsTrackConditionCd_3 <- data4$MasterTrackCondition.IsTrackConditionCd_3 - dummy
data4$MasterTrackCondition.IsTrackConditionCd_4 <- data4$MasterTrackCondition.IsTrackConditionCd_4 - dummy
#
data4$RaceHorse.KettoNum <- data4$RaceHorse.KettoNum
# data4$RaceHorse.DmTimeDevValueDiffOfRace <- data4$RaceHorse.DmTimeDevValueDiffOfRace - mean(data4$RaceHorse.DmTimeDevValueDiffOfRace)
data4$RaceHorse.BaTaijyu <- data4$RaceHorse.BaTaijyu - mean(data4$RaceHorse.BaTaijyu)
data4$RaceHorse.ZogenSa <- data4$RaceHorse.ZogenSa - mean(data4$RaceHorse.ZogenSa)
data4$RaceHorse.ZogenPercent <- data4$RaceHorse.ZogenPercent - mean(data4$RaceHorse.ZogenPercent)
data4$RaceHorse.Futan <- data4$RaceHorse.Futan - mean(data4$RaceHorse.Futan)
data4$RaceHorse.FutanPercent <- data4$RaceHorse.FutanPercent - mean(data4$RaceHorse.FutanPercent)
data4$RaceHorse.IsBlinker <- data4$RaceHorse.IsBlinker - dummy
data4$RaceHorse.Barei <- data4$RaceHorse.Barei - mean(data4$RaceHorse.Barei)
data4$RaceHorse.LifeTime <- data4$RaceHorse.LifeTime - mean(data4$RaceHorse.LifeTime)
data4$RaceHorse.SexCd <- data4$RaceHorse.SexCd
data4$MasterSex.IsSexCd_1 <- data4$MasterSex.IsSexCd_1 - dummy
data4$MasterSex.IsSexCd_2 <- data4$MasterSex.IsSexCd_2 - dummy
data4$MasterSex.IsSexCd_3 <- data4$MasterSex.IsSexCd_3 - dummy
data4$RaceHorse.HinsyuCd <- data4$RaceHorse.HinsyuCd
data4$RaceHorse.KeiroCd <- data4$RaceHorse.KeiroCd
data4$MasterKeiro.IsKeiroCd_01 <- data4$MasterKeiro.IsKeiroCd_01 - dummy
data4$MasterKeiro.IsKeiroCd_02 <- data4$MasterKeiro.IsKeiroCd_02 - dummy
data4$MasterKeiro.IsKeiroCd_03 <- data4$MasterKeiro.IsKeiroCd_03 - dummy
data4$MasterKeiro.IsKeiroCd_04 <- data4$MasterKeiro.IsKeiroCd_04 - dummy
data4$MasterKeiro.IsKeiroCd_05 <- data4$MasterKeiro.IsKeiroCd_05 - dummy
data4$MasterKeiro.IsKeiroCd_06 <- data4$MasterKeiro.IsKeiroCd_06 - dummy
data4$MasterKeiro.IsKeiroCd_07 <- data4$MasterKeiro.IsKeiroCd_07 - dummy
data4$MasterKeiro.IsKeiroCd_08 <- data4$MasterKeiro.IsKeiroCd_08 - dummy
data4$MasterKeiro.IsKeiroCd_09 <- data4$MasterKeiro.IsKeiroCd_09 - dummy
data4$MasterKeiro.IsKeiroCd_10 <- data4$MasterKeiro.IsKeiroCd_10 - dummy
data4$MasterKeiro.IsKeiroCd_11 <- data4$MasterKeiro.IsKeiroCd_11 - dummy
data4$RaceHorse.MinaraiCd <- data4$RaceHorse.MinaraiCd
data4$MasterMinarai.IsMinaraiCd_1 - data4$MasterMinarai.IsMinaraiCd_1 - dummy
data4$MasterMinarai.IsMinaraiCd_2 - data4$MasterMinarai.IsMinaraiCd_2 - dummy
data4$MasterMinarai.IsMinaraiCd_3 - data4$MasterMinarai.IsMinaraiCd_3 - dummy
data4$RaceHorse.IsPrev1JyokenCd5_Up <- data4$RaceHorse.IsPrev1JyokenCd5_Up - dummy
data4$RaceHorse.IsPrev1JyokenCd5_Down <- data4$RaceHorse.IsPrev1JyokenCd5_Down - dummy
data4$RaceHorse.Prev1TimeDevValueOfRace <- data4$RaceHorse.Prev1TimeDevValueOfRace - mean(data4$RaceHorse.Prev1TimeDevValueOfRace)
# data4$RaceHorse.Prev1TimeDevValueOfClass <- data4$RaceHorse.Prev1TimeDevValueOfClass - mean(data4$RaceHorse.Prev1TimeDevValueOfClass)
# data4$RaceHorse.Prev1TimeDevValueOfAll <- data4$RaceHorse.Prev1TimeDevValueOfAll - mean(data4$RaceHorse.Prev1TimeDevValueOfAll)
data4$RaceHorse.Ninki <- data4$RaceHorse.Ninki - mean(data4$RaceHorse.Ninki)
data4$MasterNinki.IsNinki_01 <- data4$MasterNinki.IsNinki_01 - dummy
data4$MasterNinki.IsNinki_02 <- data4$MasterNinki.IsNinki_02 - dummy
data4$MasterNinki.IsNinki_03 <- data4$MasterNinki.IsNinki_03 - dummy
data4$MasterNinki.IsNinki_04 <- data4$MasterNinki.IsNinki_04 - dummy
data4$MasterNinki.IsNinki_05 <- data4$MasterNinki.IsNinki_05 - dummy
data4$MasterNinki.IsNinki_06 <- data4$MasterNinki.IsNinki_06 - dummy
data4$MasterNinki.IsNinki_07 <- data4$MasterNinki.IsNinki_07 - dummy
data4$MasterNinki.IsNinki_08 <- data4$MasterNinki.IsNinki_08 - dummy
data4$MasterNinki.IsNinki_09 <- data4$MasterNinki.IsNinki_09 - dummy
data4$MasterNinki.IsNinki_10 <- data4$MasterNinki.IsNinki_10 - dummy
data4$MasterNinki.IsNinki_11 <- data4$MasterNinki.IsNinki_11 - dummy
data4$MasterNinki.IsNinki_12 <- data4$MasterNinki.IsNinki_12 - dummy
data4$MasterNinki.IsNinki_13 <- data4$MasterNinki.IsNinki_13 - dummy
data4$MasterNinki.IsNinki_14 <- data4$MasterNinki.IsNinki_14 - dummy
data4$MasterNinki.IsNinki_15 <- data4$MasterNinki.IsNinki_15 - dummy
data4$MasterNinki.IsNinki_16 <- data4$MasterNinki.IsNinki_16 - dummy
data4$MasterNinki.IsNinki_17 <- data4$MasterNinki.IsNinki_17 - dummy
data4$MasterNinki.IsNinki_18 <- data4$MasterNinki.IsNinki_18 - dummy
#
data4$Odds1ByWin.BetCount <- data4$Odds1ByWin.BetCount - mean(data4$Odds1ByWin.BetCount)
data4$Odds1ByWin.TotalBetCount <- data4$Odds1ByWin.TotalBetCount - mean(data4$Odds1ByWin.TotalBetCount)
data4$Odds1ByWin.Odds1 <- data4$Odds1ByWin.Odds1 - mean(data4$Odds1ByWin.Odds1)
data4$Odds4ByWin.Odds1Log <- data4$Odds1ByWin.Odds1Log - mean(data4$Odds1ByWin.Odds1Log)
data4$Odds1ByWin.OddsRate1 <- data4$Odds1ByWin.OddsRate1 - mean(data4$Odds1ByWin.OddsRate1)
data4$Odds1ByWin.OddsInverse1 <- data4$Odds1ByWin.OddsInverse1 - mean(data4$Odds1ByWin.OddsInverse1)
data4$Odds1ByWin.OddsInverse1Log <- data4$Odds1ByWin.OddsInverse1Log - mean(data4$Odds1ByWin.OddsInverse1Log)
data4$Odds1ByWin.ApprovalRateWin <- data4$Odds1ByWin.ApprovalRateWin - mean(data4$Odds1ByWin.ApprovalRateWin)
data4$Odds1ByWin.ApprovalRateWinLog <- data4$Odds1ByWin.ApprovalRateWinLog - mean(data4$Odds1ByWin.ApprovalRateWinLog)
#
data4$Odds1ByPlace.Odds1 <- data4$Odds1ByPlace.Odds1 - mean(data4$Odds1ByPlace.Odds1)
data4$Odds1ByPlace.Odds1Log <- data4$Odds1ByPlace.Odds1Log - mean(data4$Odds1ByPlace.Odds1Log)
data4$Odds1ByPlace.Odds2 <- data4$Odds1ByPlace.Odds2 - mean(data4$Odds1ByPlace.Odds2)
data4$Odds1ByPlace.Odds2Log <- data4$Odds1ByPlace.Odds2Log - mean(data4$Odds1ByPlace.Odds2Log)
data4$Odds1ByPlace.OddsRate1 <- data4$Odds1ByPlace.OddsRate1 - mean(data4$Odds1ByPlace.OddsRate1)
data4$Odds1ByPlace.OddsRate2 <- data4$Odds1ByPlace.OddsRate2 - mean(data4$Odds1ByPlace.OddsRate2)
data4$Odds1ByPlace.OddsInverse1 <- data4$Odds1ByPlace.OddsInverse1 - mean(data4$Odds1ByPlace.OddsInverse1)
data4$Odds1ByPlace.OddsInverse1Log <- data4$Odds1ByPlace.OddsInverse1Log - mean(data4$Odds1ByPlace.OddsInverse1Log)
data4$Odds1ByPlace.OddsInverse2 <- data4$Odds1ByPlace.OddsInverse2 - mean(data4$Odds1ByPlace.OddsInverse2)
data4$Odds1ByPlace.OddsInverse2Log <- data4$Odds1ByPlace.OddsInverse2Log - mean(data4$Odds1ByPlace.OddsInverse2Log)
data4$Odds1ByPlace.ApprovalRatePlace1 <- data4$Odds1ByPlace.ApprovalRatePlace1 - mean(data4$Odds1ByPlace.ApprovalRatePlace1)
data4$Odds1ByPlace.ApprovalRatePlace1Log <- data4$Odds1ByPlace.ApprovalRatePlace1Log - mean(data4$Odds1ByPlace.ApprovalRatePlace1Log)
data4$Odds1ByPlace.ApprovalRatePlace2 <- data4$Odds1ByPlace.ApprovalRatePlace2 - mean(data4$Odds1ByPlace.ApprovalRatePlace2)
data4$Odds1ByPlace.ApprovalRatePlace2Log <- data4$Odds1ByPlace.ApprovalRatePlace2Log - mean(data4$Odds1ByPlace.ApprovalRatePlace2Log)
#
data4$DataMining.DmTime <- data4$DataMining.DmTime - mean(data4$DataMining.DmTime)
data4$DataMining.DmTimeP <- data4$DataMining.DmTimeP - mean(data4$DataMining.DmTimeP)
data4$DataMining.DmTimeM <- data4$DataMining.DmTimeM - mean(data4$DataMining.DmTimeM)
data4$DataMining.DmTimeDevValueOfRace <- data4$DataMining.DmTimeDevValueOfRace - mean(data4$DataMining.DmTimeDevValueOfRace)
# data4$DataMining.DmTimeDevValueOfClass <- data4$DataMining.DmTimeDevValueOfClass - mean(data4$DataMining.DmTimeDevValueOfClass)
# data4$DataMining.DmTimeDevValueOfAll <- data4$DataMining.DmTimeDevValueOfAll - mean(data4$DataMining.DmTimeDevValueOfAll)
#
data4$JockyByTotal.RunCount <- data4$JockyByTotal.RunCount - mean(data4$JockyByTotal.RunCount)
data4$JockyByTotal.RunCountLog <- data4$JockyByTotal.RunCountLog - mean(data4$JockyByTotal.RunCountLog)
data4$JockyByTotal.HitCount1 <- data4$JockyByTotal.HitCount1 - mean(data4$JockyByTotal.HitCount1)
data4$JockyByTotal.HitCount1Log <- data4$JockyByTotal.HitCount1Log - mean(data4$JockyByTotal.HitCount1Log)
data4$JockyByTotal.HitRate1 <- data4$JockyByTotal.HitRate1 - mean(data4$JockyByTotal.HitRate1)
data4$JockyByTotal.HitRate1Log <- data4$JockyByTotal.HitRate1Log - mean(data4$JockyByTotal.HitRate1Log)
data4$JockyByTotal.HitCount12 <- data4$JockyByTotal.HitCount12 - mean(data4$JockyByTotal.HitCount12)
data4$JockyByTotal.HitCount12Log <- data4$JockyByTotal.HitCount12Log - mean(data4$JockyByTotal.HitCount12Log)
data4$JockyByTotal.HitRate12 <- data4$JockyByTotal.HitRate12 - mean(data4$JockyByTotal.HitRate12)
data4$JockyByTotal.HitRate12Log <- data4$JockyByTotal.HitRate12Log - mean(data4$JockyByTotal.HitRate12Log)
data4$JockyByTotal.HitCount123 <- data4$JockyByTotal.HitCount123 - mean(data4$JockyByTotal.HitCount123)
data4$JockyByTotal.HitCount123Log <- data4$JockyByTotal.HitCount123Log - mean(data4$JockyByTotal.HitCount123Log)
data4$JockyByTotal.HitRate123 <- data4$JockyByTotal.HitRate123 - mean(data4$JockyByTotal.HitRate123)
data4$JockyByTotal.HitRate123Log <-data4$JockyByTotal.HitRate123Log - mean(data4$JockyByTotal.HitRate123Log)
#
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceSum)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvg)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinSum)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvg)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123 <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123 - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceSum)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvg)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinSum)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceCount)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvg)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01RunCountLog)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount1Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate1Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount12Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate12Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitCount123Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01HitRate123Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffWinAvgLog)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type01PayoffPlaceAvgLog)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02RunCountLog)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount1Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate1Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount12Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate12Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitCount123Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02HitRate123Log)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffWinAvgLog)
# data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog <- data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog - mean(data4$RaceResultByBayesianByChildrenTrackTypeJyokenSmile01.Type02PayoffPlaceAvgLog)
#
data4$RaceResultByBanusi.HonSyokinTotal <- data4$RaceResultByBanusi.HonSyokinTotal - mean(data4$RaceResultByBanusi.HonSyokinTotal)
data4$RaceResultByBanusi.HonSyokinTotalLog <- data4$RaceResultByBanusi.HonSyokinTotalLog - mean(data4$RaceResultByBanusi.HonSyokinTotalLog)
data4$RaceResultByBanusi.FukaSyokin <- data4$RaceResultByBanusi.FukaSyokin - mean(data4$RaceResultByBanusi.FukaSyokin)
data4$RaceResultByBanusi.FukaSyokinLog <- data4$RaceResultByBanusi.FukaSyokinLog - mean(data4$RaceResultByBanusi.FukaSyokinLog)
#
data4$RaceResultByBanusiByTotal.RunCount <- data4$RaceResultByBanusiByTotal.RunCount - mean(data4$RaceResultByBanusiByTotal.RunCount)
data4$RaceResultByBanusiByTotal.RunCountLog <- data4$RaceResultByBanusiByTotal.RunCountLog - mean(data4$RaceResultByBanusiByTotal.RunCountLog)
data4$RaceResultByBanusiByTotal.HitCount1 <- data4$RaceResultByBanusiByTotal.HitCount1 - mean(data4$RaceResultByBanusiByTotal.HitCount1)
data4$RaceResultByBanusiByTotal.HitCount1Log <- data4$RaceResultByBanusiByTotal.HitCount1Log - mean(data4$RaceResultByBanusiByTotal.HitCount1Log)
data4$RaceResultByBanusiByTotal.HitRate1 <- data4$RaceResultByBanusiByTotal.HitRate1 - mean(data4$RaceResultByBanusiByTotal.HitRate1)
data4$RaceResultByBanusiByTotal.HitRate1Log <- data4$RaceResultByBanusiByTotal.HitRate1Log - mean(data4$RaceResultByBanusiByTotal.HitRate1Log)
data4$RaceResultByBanusiByTotal.HitCount12 <- data4$RaceResultByBanusiByTotal.HitCount12 - mean(data4$RaceResultByBanusiByTotal.HitCount12)
data4$RaceResultByBanusiByTotal.HitCount12Log <- data4$RaceResultByBanusiByTotal.HitCount12Log - mean(data4$RaceResultByBanusiByTotal.HitCount12Log)
data4$RaceResultByBanusiByTotal.HitRate12 <- data4$RaceResultByBanusiByTotal.HitRate12 - mean(data4$RaceResultByBanusiByTotal.HitRate12)
data4$RaceResultByBanusiByTotal.HitRate12Log <- data4$RaceResultByBanusiByTotal.HitRate12Log - mean(data4$RaceResultByBanusiByTotal.HitRate12Log)
data4$RaceResultByBanusiByTotal.HitCount123 <- data4$RaceResultByBanusiByTotal.HitCount123 - mean(data4$RaceResultByBanusiByTotal.HitCount123)
data4$RaceResultByBanusiByTotal.HitCount123Log <- data4$RaceResultByBanusiByTotal.HitCount123Log - mean(data4$RaceResultByBanusiByTotal.HitCount123Log)
data4$RaceResultByBanusiByTotal.HitRate123 <- data4$RaceResultByBanusiByTotal.HitRate123 - mean(data4$RaceResultByBanusiByTotal.HitRate123)
data4$RaceResultByBanusiByTotal.HitRate123Log <-data4$RaceResultByBanusiByTotal.HitRate123Log - mean(data4$RaceResultByBanusiByTotal.HitRate123Log)
data4$RaceResultByBanusiByTotal.OddsWin <- data4$RaceResultByBanusiByTotal.OddsWin - mean(data4$RaceResultByBanusiByTotal.OddsWin)
data4$RaceResultByBanusiByTotal.OddsWinLog <- data4$RaceResultByBanusiByTotal.OddsWinLog - mean(data4$RaceResultByBanusiByTotal.OddsWinLog)
data4$RaceResultByBanusiByTotal.OddsPlace1 <- data4$RaceResultByBanusiByTotal.OddsPlace1 - mean(data4$RaceResultByBanusiByTotal.OddsPlace1)
data4$RaceResultByBanusiByTotal.OddsPlace1Log <- data4$RaceResultByBanusiByTotal.OddsPlace1Log - mean(data4$RaceResultByBanusiByTotal.OddsPlace1Log)
data4$RaceResultByBanusiByTotal.OddsPlace2 <- data4$RaceResultByBanusiByTotal.OddsPlace2 - mean(data4$RaceResultByBanusiByTotal.OddsPlace2)
data4$RaceResultByBanusiByTotal.OddsPlace2Log <- data4$RaceResultByBanusiByTotal.OddsPlace2Log - mean(data4$RaceResultByBanusiByTotal.OddsPlace2Log)
data4$RaceResultByBanusiByTotal.OddsWinInverse <- data4$RaceResultByBanusiByTotal.OddsWinInverse - mean(data4$RaceResultByBanusiByTotal.OddsWinInverse)
data4$RaceResultByBanusiByTotal.OddsWinInverseLog <- data4$RaceResultByBanusiByTotal.OddsWinInverseLog - mean(data4$RaceResultByBanusiByTotal.OddsWinInverseLog)
data4$RaceResultByBanusiByTotal.OddsPlaceInverse1 <- data4$RaceResultByBanusiByTotal.OddsPlaceInverse1 - mean(data4$RaceResultByBanusiByTotal.OddsPlaceInverse1)
data4$RaceResultByBanusiByTotal.OddsPlaceInverse1Log <- data4$RaceResultByBanusiByTotal.OddsPlaceInverse1Log - mean(data4$RaceResultByBanusiByTotal.OddsPlaceInverse1Log)
data4$RaceResultByBanusiByTotal.OddsPlaceInverse2 <- data4$RaceResultByBanusiByTotal.OddsPlaceInverse2 - mean(data4$RaceResultByBanusiByTotal.OddsPlaceInverse2)
data4$RaceResultByBanusiByTotal.OddsPlaceInverse2Log <- data4$RaceResultByBanusiByTotal.OddsPlaceInverse2Log - mean(data4$RaceResultByBanusiByTotal.OddsPlaceInverse2Log)
data4$RaceResultByBanusiByTotal.ApprovalRateWin <- data4$RaceResultByBanusiByTotal.ApprovalRateWin - mean(data4$RaceResultByBanusiByTotal.ApprovalRateWin)
data4$RaceResultByBanusiByTotal.ApprovalRateWinLog <- data4$RaceResultByBanusiByTotal.ApprovalRateWinLog - mean(data4$RaceResultByBanusiByTotal.ApprovalRateWinLog)
data4$RaceResultByBanusiByTotal.ApprovalRatePlace1 <- data4$RaceResultByBanusiByTotal.ApprovalRatePlace1 - mean(data4$RaceResultByBanusiByTotal.ApprovalRatePlace1)
data4$RaceResultByBanusiByTotal.ApprovalRatePlace1Log <- data4$RaceResultByBanusiByTotal.ApprovalRatePlace1Log - mean(data4$RaceResultByBanusiByTotal.ApprovalRatePlace1Log)
data4$RaceResultByBanusiByTotal.ApprovalRatePlace2 <- data4$RaceResultByBanusiByTotal.ApprovalRatePlace2 - mean(data4$RaceResultByBanusiByTotal.ApprovalRatePlace2)
data4$RaceResultByBanusiByTotal.ApprovalRatePlace2Log <- data4$RaceResultByBanusiByTotal.ApprovalRatePlace2Log - mean(data4$RaceResultByBanusiByTotal.ApprovalRatePlace2Log)
data4$RaceResultByBanusiByTotal.ExpectedValueWin <- data4$RaceResultByBanusiByTotal.ExpectedValueWin - mean(data4$RaceResultByBanusiByTotal.ExpectedValueWin)
data4$RaceResultByBanusiByTotal.ExpectedValueWinLog <- data4$RaceResultByBanusiByTotal.ExpectedValueWinLog - mean(data4$RaceResultByBanusiByTotal.ExpectedValueWinLog)
data4$RaceResultByBanusiByTotal.ExpectedValuePlace <- data4$RaceResultByBanusiByTotal.ExpectedValuePlace - mean(data4$RaceResultByBanusiByTotal.ExpectedValuePlace)
data4$RaceResultByBanusiByTotal.ExpectedValuePlaceLog <- data4$RaceResultByBanusiByTotal.ExpectedValuePlaceLog - mean(data4$RaceResultByBanusiByTotal.ExpectedValuePlaceLog)
#
data4$RaceResultByBreeder.HonSyokinTotal <- data4$RaceResultByBreeder.HonSyokinTotal - mean(data4$RaceResultByBreeder.HonSyokinTotal)
data4$RaceResultByBreeder.HonSyokinTotalLog <- data4$RaceResultByBreeder.HonSyokinTotalLog - mean(data4$RaceResultByBreeder.HonSyokinTotalLog)
data4$RaceResultByBreeder.FukaSyokin <- data4$RaceResultByBreeder.FukaSyokin - mean(data4$RaceResultByBreeder.FukaSyokin)
data4$RaceResultByBreeder.FukaSyokinLog <- data4$RaceResultByBreeder.FukaSyokinLog - mean(data4$RaceResultByBreeder.FukaSyokinLog)
#
data4$RaceResultByBreederByTotal.RunCount <- data4$RaceResultByBreederByTotal.RunCount - mean(data4$RaceResultByBreederByTotal.RunCount)
data4$RaceResultByBreederByTotal.RunCountLog <- data4$RaceResultByBreederByTotal.RunCountLog - mean(data4$RaceResultByBreederByTotal.RunCountLog)
data4$RaceResultByBreederByTotal.HitCount1 <- data4$RaceResultByBreederByTotal.HitCount1 - mean(data4$RaceResultByBreederByTotal.HitCount1)
data4$RaceResultByBreederByTotal.HitCount1Log <- data4$RaceResultByBreederByTotal.HitCount1Log - mean(data4$RaceResultByBreederByTotal.HitCount1Log)
data4$RaceResultByBreederByTotal.HitRate1 <- data4$RaceResultByBreederByTotal.HitRate1 - mean(data4$RaceResultByBreederByTotal.HitRate1)
data4$RaceResultByBreederByTotal.HitRate1Log <- data4$RaceResultByBreederByTotal.HitRate1Log - mean(data4$RaceResultByBreederByTotal.HitRate1Log)
data4$RaceResultByBreederByTotal.HitCount12 <- data4$RaceResultByBreederByTotal.HitCount12 - mean(data4$RaceResultByBreederByTotal.HitCount12)
data4$RaceResultByBreederByTotal.HitCount12Log <- data4$RaceResultByBreederByTotal.HitCount12Log - mean(data4$RaceResultByBreederByTotal.HitCount12Log)
data4$RaceResultByBreederByTotal.HitRate12 <- data4$RaceResultByBreederByTotal.HitRate12 - mean(data4$RaceResultByBreederByTotal.HitRate12)
data4$RaceResultByBreederByTotal.HitRate12Log <- data4$RaceResultByBreederByTotal.HitRate12Log - mean(data4$RaceResultByBreederByTotal.HitRate12Log)
data4$RaceResultByBreederByTotal.HitCount123 <- data4$RaceResultByBreederByTotal.HitCount123 - mean(data4$RaceResultByBreederByTotal.HitCount123)
data4$RaceResultByBreederByTotal.HitCount123Log <- data4$RaceResultByBreederByTotal.HitCount123Log - mean(data4$RaceResultByBreederByTotal.HitCount123Log)
data4$RaceResultByBreederByTotal.HitRate123 <- data4$RaceResultByBreederByTotal.HitRate123 - mean(data4$RaceResultByBreederByTotal.HitRate123)
data4$RaceResultByBreederByTotal.HitRate123Log <-data4$RaceResultByBreederByTotal.HitRate123Log - mean(data4$RaceResultByBreederByTotal.HitRate123Log)
data4$RaceResultByBreederByTotal.OddsWin <- data4$RaceResultByBreederByTotal.OddsWin - mean(data4$RaceResultByBreederByTotal.OddsWin)
data4$RaceResultByBreederByTotal.OddsWinLog <- data4$RaceResultByBreederByTotal.OddsWinLog - mean(data4$RaceResultByBreederByTotal.OddsWinLog)
data4$RaceResultByBreederByTotal.OddsPlace1 <- data4$RaceResultByBreederByTotal.OddsPlace1 - mean(data4$RaceResultByBreederByTotal.OddsPlace1)
data4$RaceResultByBreederByTotal.OddsPlace1Log <- data4$RaceResultByBreederByTotal.OddsPlace1Log - mean(data4$RaceResultByBreederByTotal.OddsPlace1Log)
data4$RaceResultByBreederByTotal.OddsPlace2 <- data4$RaceResultByBreederByTotal.OddsPlace2 - mean(data4$RaceResultByBreederByTotal.OddsPlace2)
data4$RaceResultByBreederByTotal.OddsPlace2Log <- data4$RaceResultByBreederByTotal.OddsPlace2Log - mean(data4$RaceResultByBreederByTotal.OddsPlace2Log)
data4$RaceResultByBreederByTotal.OddsWinInverse <- data4$RaceResultByBreederByTotal.OddsWinInverse - mean(data4$RaceResultByBreederByTotal.OddsWinInverse)
data4$RaceResultByBreederByTotal.OddsWinInverseLog <- data4$RaceResultByBreederByTotal.OddsWinInverseLog - mean(data4$RaceResultByBreederByTotal.OddsWinInverseLog)
data4$RaceResultByBreederByTotal.OddsPlaceInverse1 <- data4$RaceResultByBreederByTotal.OddsPlaceInverse1 - mean(data4$RaceResultByBreederByTotal.OddsPlaceInverse1)
data4$RaceResultByBreederByTotal.OddsPlaceInverse1Log <- data4$RaceResultByBreederByTotal.OddsPlaceInverse1Log - mean(data4$RaceResultByBreederByTotal.OddsPlaceInverse1Log)
data4$RaceResultByBreederByTotal.OddsPlaceInverse2 <- data4$RaceResultByBreederByTotal.OddsPlaceInverse2 - mean(data4$RaceResultByBreederByTotal.OddsPlaceInverse2)
data4$RaceResultByBreederByTotal.OddsPlaceInverse2Log <- data4$RaceResultByBreederByTotal.OddsPlaceInverse2Log - mean(data4$RaceResultByBreederByTotal.OddsPlaceInverse2Log)
data4$RaceResultByBreederByTotal.ApprovalRateWin <- data4$RaceResultByBreederByTotal.ApprovalRateWin - mean(data4$RaceResultByBreederByTotal.ApprovalRateWin)
data4$RaceResultByBreederByTotal.ApprovalRateWinLog <- data4$RaceResultByBreederByTotal.ApprovalRateWinLog - mean(data4$RaceResultByBreederByTotal.ApprovalRateWinLog)
data4$RaceResultByBreederByTotal.ApprovalRatePlace1 <- data4$RaceResultByBreederByTotal.ApprovalRatePlace1 - mean(data4$RaceResultByBreederByTotal.ApprovalRatePlace1)
data4$RaceResultByBreederByTotal.ApprovalRatePlace1Log <- data4$RaceResultByBreederByTotal.ApprovalRatePlace1Log - mean(data4$RaceResultByBreederByTotal.ApprovalRatePlace1Log)
data4$RaceResultByBreederByTotal.ApprovalRatePlace2 <- data4$RaceResultByBreederByTotal.ApprovalRatePlace2 - mean(data4$RaceResultByBreederByTotal.ApprovalRatePlace2)
data4$RaceResultByBreederByTotal.ApprovalRatePlace2Log <- data4$RaceResultByBreederByTotal.ApprovalRatePlace2Log - mean(data4$RaceResultByBreederByTotal.ApprovalRatePlace2Log)
data4$RaceResultByBreederByTotal.ExpectedValueWin <- data4$RaceResultByBreederByTotal.ExpectedValueWin - mean(data4$RaceResultByBreederByTotal.ExpectedValueWin)
data4$RaceResultByBreederByTotal.ExpectedValueWinLog <- data4$RaceResultByBreederByTotal.ExpectedValueWinLog - mean(data4$RaceResultByBreederByTotal.ExpectedValueWinLog)
data4$RaceResultByBreederByTotal.ExpectedValuePlace <- data4$RaceResultByBreederByTotal.ExpectedValuePlace - mean(data4$RaceResultByBreederByTotal.ExpectedValuePlace)
data4$RaceResultByBreederByTotal.ExpectedValuePlaceLog <- data4$RaceResultByBreederByTotal.ExpectedValuePlaceLog - mean(data4$RaceResultByBreederByTotal.ExpectedValuePlaceLog)
#
data4$RaceResultByHorse.RuikeiHonsyoHeiti <- data4$RaceResultByHorse.RuikeiHonsyoHeiti - mean(data4$RaceResultByHorse.RuikeiHonsyoHeiti)
data4$RaceResultByHorse.RuikeiHonsyoHeitiLog <- data4$RaceResultByHorse.RuikeiHonsyoHeitiLog - mean(data4$RaceResultByHorse.RuikeiHonsyoHeitiLog)
data4$RaceResultByHorse.RuikeiHonsyoSyogai <- data4$RaceResultByHorse.RuikeiHonsyoSyogai - mean(data4$RaceResultByHorse.RuikeiHonsyoSyogai)
data4$RaceResultByHorse.RuikeiHonsyoSyogaiLog <- data4$RaceResultByHorse.RuikeiHonsyoSyogaiLog - mean(data4$RaceResultByHorse.RuikeiHonsyoSyogaiLog)
#
# data4$RaceResultByHorseByCourseType.RunCount <- data4$RaceResultByHorseByCourseType.RunCount - mean(data4$RaceResultByHorseByCourseType.RunCount)
# data4$RaceResultByHorseByCourseType.RunCountLog <- data4$RaceResultByHorseByCourseType.RunCountLog - mean(data4$RaceResultByHorseByCourseType.RunCountLog)
# data4$RaceResultByHorseByCourseType.HitCount1 <- data4$RaceResultByHorseByCourseType.HitCount1 - mean(data4$RaceResultByHorseByCourseType.HitCount1)
# data4$RaceResultByHorseByCourseType.HitCount1Log <- data4$RaceResultByHorseByCourseType.HitCount1Log - mean(data4$RaceResultByHorseByCourseType.HitCount1Log)
# data4$RaceResultByHorseByCourseType.HitRate1 <- data4$RaceResultByHorseByCourseType.HitRate1 - mean(data4$RaceResultByHorseByCourseType.HitRate1)
# data4$RaceResultByHorseByCourseType.HitRate1Log <- data4$RaceResultByHorseByCourseType.HitRate1Log - mean(data4$RaceResultByHorseByCourseType.HitRate1Log)
# data4$RaceResultByHorseByCourseType.HitCount12 <- data4$RaceResultByHorseByCourseType.HitCount12 - mean(data4$RaceResultByHorseByCourseType.HitCount12)
# data4$RaceResultByHorseByCourseType.HitCount12Log <- data4$RaceResultByHorseByCourseType.HitCount12Log - mean(data4$RaceResultByHorseByCourseType.HitCount12Log)
# data4$RaceResultByHorseByCourseType.HitRate12 <- data4$RaceResultByHorseByCourseType.HitRate12 - mean(data4$RaceResultByHorseByCourseType.HitRate12)
# data4$RaceResultByHorseByCourseType.HitRate12Log <- data4$RaceResultByHorseByCourseType.HitRate12Log - mean(data4$RaceResultByHorseByCourseType.HitRate12Log)
# data4$RaceResultByHorseByCourseType.HitCount123 <- data4$RaceResultByHorseByCourseType.HitCount123 - mean(data4$RaceResultByHorseByCourseType.HitCount123)
# data4$RaceResultByHorseByCourseType.HitCount123Log <- data4$RaceResultByHorseByCourseType.HitCount123Log - mean(data4$RaceResultByHorseByCourseType.HitCount123Log)
# data4$RaceResultByHorseByCourseType.HitRate123 <- data4$RaceResultByHorseByCourseType.HitRate123 - mean(data4$RaceResultByHorseByCourseType.HitRate123)
# data4$RaceResultByHorseByCourseType.HitRate123Log <-data4$RaceResultByHorseByCourseType.HitRate123Log - mean(data4$RaceResultByHorseByCourseType.HitRate123Log)
# data4$RaceResultByHorseByCourseType.OddsWin <- data4$RaceResultByHorseByCourseType.OddsWin - mean(data4$RaceResultByHorseByCourseType.OddsWin)
# data4$RaceResultByHorseByCourseType.OddsWinLog <- data4$RaceResultByHorseByCourseType.OddsWinLog - mean(data4$RaceResultByHorseByCourseType.OddsWinLog)
# data4$RaceResultByHorseByCourseType.OddsPlace1 <- data4$RaceResultByHorseByCourseType.OddsPlace1 - mean(data4$RaceResultByHorseByCourseType.OddsPlace1)
# data4$RaceResultByHorseByCourseType.OddsPlace1Log <- data4$RaceResultByHorseByCourseType.OddsPlace1Log - mean(data4$RaceResultByHorseByCourseType.OddsPlace1Log)
# data4$RaceResultByHorseByCourseType.OddsPlace2 <- data4$RaceResultByHorseByCourseType.OddsPlace2 - mean(data4$RaceResultByHorseByCourseType.OddsPlace2)
# data4$RaceResultByHorseByCourseType.OddsPlace2Log <- data4$RaceResultByHorseByCourseType.OddsPlace2Log - mean(data4$RaceResultByHorseByCourseType.OddsPlace2Log)
# data4$RaceResultByHorseByCourseType.OddsWinInverse <- data4$RaceResultByHorseByCourseType.OddsWinInverse - mean(data4$RaceResultByHorseByCourseType.OddsWinInverse)
# data4$RaceResultByHorseByCourseType.OddsWinInverseLog <- data4$RaceResultByHorseByCourseType.OddsWinInverseLog - mean(data4$RaceResultByHorseByCourseType.OddsWinInverseLog)
# data4$RaceResultByHorseByCourseType.OddsPlaceInverse1 <- data4$RaceResultByHorseByCourseType.OddsPlaceInverse1 - mean(data4$RaceResultByHorseByCourseType.OddsPlaceInverse1)
# data4$RaceResultByHorseByCourseType.OddsPlaceInverse1Log <- data4$RaceResultByHorseByCourseType.OddsPlaceInverse1Log - mean(data4$RaceResultByHorseByCourseType.OddsPlaceInverse1Log)
# data4$RaceResultByHorseByCourseType.OddsPlaceInverse2 <- data4$RaceResultByHorseByCourseType.OddsPlaceInverse2 - mean(data4$RaceResultByHorseByCourseType.OddsPlaceInverse2)
# data4$RaceResultByHorseByCourseType.OddsPlaceInverse2Log <- data4$RaceResultByHorseByCourseType.OddsPlaceInverse2Log - mean(data4$RaceResultByHorseByCourseType.OddsPlaceInverse2Log)
# data4$RaceResultByHorseByCourseType.ApprovalRateWin <- data4$RaceResultByHorseByCourseType.ApprovalRateWin - mean(data4$RaceResultByHorseByCourseType.ApprovalRateWin)
# data4$RaceResultByHorseByCourseType.ApprovalRateWinLog <- data4$RaceResultByHorseByCourseType.ApprovalRateWinLog - mean(data4$RaceResultByHorseByCourseType.ApprovalRateWinLog)
# data4$RaceResultByHorseByCourseType.ApprovalRatePlace1 <- data4$RaceResultByHorseByCourseType.ApprovalRatePlace1 - mean(data4$RaceResultByHorseByCourseType.ApprovalRatePlace1)
# data4$RaceResultByHorseByCourseType.ApprovalRatePlace1Log <- data4$RaceResultByHorseByCourseType.ApprovalRatePlace1Log - mean(data4$RaceResultByHorseByCourseType.ApprovalRatePlace1Log)
# data4$RaceResultByHorseByCourseType.ApprovalRatePlace2 <- data4$RaceResultByHorseByCourseType.ApprovalRatePlace2 - mean(data4$RaceResultByHorseByCourseType.ApprovalRatePlace2)
# data4$RaceResultByHorseByCourseType.ApprovalRatePlace2Log <- data4$RaceResultByHorseByCourseType.ApprovalRatePlace2Log - mean(data4$RaceResultByHorseByCourseType.ApprovalRatePlace2Log)
# data4$RaceResultByHorseByCourseType.ExpectedValueWin <- data4$RaceResultByHorseByCourseType.ExpectedValueWin - mean(data4$RaceResultByHorseByCourseType.ExpectedValueWin)
# data4$RaceResultByHorseByCourseType.ExpectedValueWinLog <- data4$RaceResultByHorseByCourseType.ExpectedValueWinLog - mean(data4$RaceResultByHorseByCourseType.ExpectedValueWinLog)
# data4$RaceResultByHorseByCourseType.ExpectedValuePlace <- data4$RaceResultByHorseByCourseType.ExpectedValuePlace - mean(data4$RaceResultByHorseByCourseType.ExpectedValuePlace)
# data4$RaceResultByHorseByCourseType.ExpectedValuePlaceLog <- data4$RaceResultByHorseByCourseType.ExpectedValuePlaceLog - mean(data4$RaceResultByHorseByCourseType.ExpectedValuePlaceLog)
#
# data4$RaceResultByHorseByJyo.RunCount <- data4$RaceResultByHorseByJyo.RunCount - mean(data4$RaceResultByHorseByJyo.RunCount)
# data4$RaceResultByHorseByJyo.RunCountLog <- data4$RaceResultByHorseByJyo.RunCountLog - mean(data4$RaceResultByHorseByJyo.RunCountLog)
# data4$RaceResultByHorseByJyo.HitCount1 <- data4$RaceResultByHorseByJyo.HitCount1 - mean(data4$RaceResultByHorseByJyo.HitCount1)
# data4$RaceResultByHorseByJyo.HitCount1Log <- data4$RaceResultByHorseByJyo.HitCount1Log - mean(data4$RaceResultByHorseByJyo.HitCount1Log)
# data4$RaceResultByHorseByJyo.HitRate1 <- data4$RaceResultByHorseByJyo.HitRate1 - mean(data4$RaceResultByHorseByJyo.HitRate1)
# data4$RaceResultByHorseByJyo.HitRate1Log <- data4$RaceResultByHorseByJyo.HitRate1Log - mean(data4$RaceResultByHorseByJyo.HitRate1Log)
# data4$RaceResultByHorseByJyo.HitCount12 <- data4$RaceResultByHorseByJyo.HitCount12 - mean(data4$RaceResultByHorseByJyo.HitCount12)
# data4$RaceResultByHorseByJyo.HitCount12Log <- data4$RaceResultByHorseByJyo.HitCount12Log - mean(data4$RaceResultByHorseByJyo.HitCount12Log)
# data4$RaceResultByHorseByJyo.HitRate12 <- data4$RaceResultByHorseByJyo.HitRate12 - mean(data4$RaceResultByHorseByJyo.HitRate12)
# data4$RaceResultByHorseByJyo.HitRate12Log <- data4$RaceResultByHorseByJyo.HitRate12Log - mean(data4$RaceResultByHorseByJyo.HitRate12Log)
# data4$RaceResultByHorseByJyo.HitCount123 <- data4$RaceResultByHorseByJyo.HitCount123 - mean(data4$RaceResultByHorseByJyo.HitCount123)
# data4$RaceResultByHorseByJyo.HitCount123Log <- data4$RaceResultByHorseByJyo.HitCount123Log - mean(data4$RaceResultByHorseByJyo.HitCount123Log)
# data4$RaceResultByHorseByJyo.HitRate123 <- data4$RaceResultByHorseByJyo.HitRate123 - mean(data4$RaceResultByHorseByJyo.HitRate123)
# data4$RaceResultByHorseByJyo.HitRate123Log <-data4$RaceResultByHorseByJyo.HitRate123Log - mean(data4$RaceResultByHorseByJyo.HitRate123Log)
# data4$RaceResultByHorseByJyo.OddsWin <- data4$RaceResultByHorseByJyo.OddsWin - mean(data4$RaceResultByHorseByJyo.OddsWin)
# data4$RaceResultByHorseByJyo.OddsWinLog <- data4$RaceResultByHorseByJyo.OddsWinLog - mean(data4$RaceResultByHorseByJyo.OddsWinLog)
# data4$RaceResultByHorseByJyo.OddsPlace1 <- data4$RaceResultByHorseByJyo.OddsPlace1 - mean(data4$RaceResultByHorseByJyo.OddsPlace1)
# data4$RaceResultByHorseByJyo.OddsPlace1Log <- data4$RaceResultByHorseByJyo.OddsPlace1Log - mean(data4$RaceResultByHorseByJyo.OddsPlace1Log)
# data4$RaceResultByHorseByJyo.OddsPlace2 <- data4$RaceResultByHorseByJyo.OddsPlace2 - mean(data4$RaceResultByHorseByJyo.OddsPlace2)
# data4$RaceResultByHorseByJyo.OddsPlace2Log <- data4$RaceResultByHorseByJyo.OddsPlace2Log - mean(data4$RaceResultByHorseByJyo.OddsPlace2Log)
# data4$RaceResultByHorseByJyo.OddsWinInverse <- data4$RaceResultByHorseByJyo.OddsWinInverse - mean(data4$RaceResultByHorseByJyo.OddsWinInverse)
# data4$RaceResultByHorseByJyo.OddsWinInverseLog <- data4$RaceResultByHorseByJyo.OddsWinInverseLog - mean(data4$RaceResultByHorseByJyo.OddsWinInverseLog)
# data4$RaceResultByHorseByJyo.OddsPlaceInverse1 <- data4$RaceResultByHorseByJyo.OddsPlaceInverse1 - mean(data4$RaceResultByHorseByJyo.OddsPlaceInverse1)
# data4$RaceResultByHorseByJyo.OddsPlaceInverse1Log <- data4$RaceResultByHorseByJyo.OddsPlaceInverse1Log - mean(data4$RaceResultByHorseByJyo.OddsPlaceInverse1Log)
# data4$RaceResultByHorseByJyo.OddsPlaceInverse2 <- data4$RaceResultByHorseByJyo.OddsPlaceInverse2 - mean(data4$RaceResultByHorseByJyo.OddsPlaceInverse2)
# data4$RaceResultByHorseByJyo.OddsPlaceInverse2Log <- data4$RaceResultByHorseByJyo.OddsPlaceInverse2Log - mean(data4$RaceResultByHorseByJyo.OddsPlaceInverse2Log)
# data4$RaceResultByHorseByJyo.ApprovalRateWin <- data4$RaceResultByHorseByJyo.ApprovalRateWin - mean(data4$RaceResultByHorseByJyo.ApprovalRateWin)
# data4$RaceResultByHorseByJyo.ApprovalRateWinLog <- data4$RaceResultByHorseByJyo.ApprovalRateWinLog - mean(data4$RaceResultByHorseByJyo.ApprovalRateWinLog)
# data4$RaceResultByHorseByJyo.ApprovalRatePlace1 <- data4$RaceResultByHorseByJyo.ApprovalRatePlace1 - mean(data4$RaceResultByHorseByJyo.ApprovalRatePlace1)
# data4$RaceResultByHorseByJyo.ApprovalRatePlace1Log <- data4$RaceResultByHorseByJyo.ApprovalRatePlace1Log - mean(data4$RaceResultByHorseByJyo.ApprovalRatePlace1Log)
# data4$RaceResultByHorseByJyo.ApprovalRatePlace2 <- data4$RaceResultByHorseByJyo.ApprovalRatePlace2 - mean(data4$RaceResultByHorseByJyo.ApprovalRatePlace2)
# data4$RaceResultByHorseByJyo.ApprovalRatePlace2Log <- data4$RaceResultByHorseByJyo.ApprovalRatePlace2Log - mean(data4$RaceResultByHorseByJyo.ApprovalRatePlace2Log)
# data4$RaceResultByHorseByJyo.ExpectedValueWin <- data4$RaceResultByHorseByJyo.ExpectedValueWin - mean(data4$RaceResultByHorseByJyo.ExpectedValueWin)
# data4$RaceResultByHorseByJyo.ExpectedValueWinLog <- data4$RaceResultByHorseByJyo.ExpectedValueWinLog - mean(data4$RaceResultByHorseByJyo.ExpectedValueWinLog)
# data4$RaceResultByHorseByJyo.ExpectedValuePlace <- data4$RaceResultByHorseByJyo.ExpectedValuePlace - mean(data4$RaceResultByHorseByJyo.ExpectedValuePlace)
# data4$RaceResultByHorseByJyo.ExpectedValuePlaceLog <- data4$RaceResultByHorseByJyo.ExpectedValuePlaceLog - mean(data4$RaceResultByHorseByJyo.ExpectedValuePlaceLog)
#
data4$RaceResultByHorseByRunningStyle.RunningStyleAvg <- data4$RaceResultByHorseByRunningStyle.RunningStyleAvg - mean(data4$RaceResultByHorseByRunningStyle.RunningStyleAvg)
data4$RaceResultByHorseByRunningStyle.HitRate1 <- data4$RaceResultByHorseByRunningStyle.HitRate1 - mean(data4$RaceResultByHorseByRunningStyle.HitRate1)
data4$RaceResultByHorseByRunningStyle.HitRate1Log <- data4$RaceResultByHorseByRunningStyle.HitRate1Log - mean(data4$RaceResultByHorseByRunningStyle.HitRate1Log)
data4$RaceResultByHorseByRunningStyle.HitRate2 <- data4$RaceResultByHorseByRunningStyle.HitRate2 - mean(data4$RaceResultByHorseByRunningStyle.HitRate2)
data4$RaceResultByHorseByRunningStyle.HitRate2Log <- data4$RaceResultByHorseByRunningStyle.HitRate2Log - mean(data4$RaceResultByHorseByRunningStyle.HitRate2Log)
data4$RaceResultByHorseByRunningStyle.HitRate3 <- data4$RaceResultByHorseByRunningStyle.HitRate3 - mean(data4$RaceResultByHorseByRunningStyle.HitRate3)
data4$RaceResultByHorseByRunningStyle.HitRate3Log <- data4$RaceResultByHorseByRunningStyle.HitRate3Log - mean(data4$RaceResultByHorseByRunningStyle.HitRate3Log)
data4$RaceResultByHorseByRunningStyle.HitRate4 <- data4$RaceResultByHorseByRunningStyle.HitRate4 - mean(data4$RaceResultByHorseByRunningStyle.HitRate4)
data4$RaceResultByHorseByRunningStyle.HitRate4Log <- data4$RaceResultByHorseByRunningStyle.HitRate4Log - mean(data4$RaceResultByHorseByRunningStyle.HitRate4Log)
#
data4$RaceResultByHorseByTotal.RunCount <- data4$RaceResultByHorseByTotal.RunCount - mean(data4$RaceResultByHorseByTotal.RunCount)
data4$RaceResultByHorseByTotal.RunCountLog <- data4$RaceResultByHorseByTotal.RunCountLog - mean(data4$RaceResultByHorseByTotal.RunCountLog)
data4$RaceResultByHorseByTotal.HitCount1 <- data4$RaceResultByHorseByTotal.HitCount1 - mean(data4$RaceResultByHorseByTotal.HitCount1)
data4$RaceResultByHorseByTotal.HitCount1Log <- data4$RaceResultByHorseByTotal.HitCount1Log - mean(data4$RaceResultByHorseByTotal.HitCount1Log)
data4$RaceResultByHorseByTotal.HitRate1 <- data4$RaceResultByHorseByTotal.HitRate1 - mean(data4$RaceResultByHorseByTotal.HitRate1)
data4$RaceResultByHorseByTotal.HitRate1Log <- data4$RaceResultByHorseByTotal.HitRate1Log - mean(data4$RaceResultByHorseByTotal.HitRate1Log)
data4$RaceResultByHorseByTotal.HitCount12 <- data4$RaceResultByHorseByTotal.HitCount12 - mean(data4$RaceResultByHorseByTotal.HitCount12)
data4$RaceResultByHorseByTotal.HitCount12Log <- data4$RaceResultByHorseByTotal.HitCount12Log - mean(data4$RaceResultByHorseByTotal.HitCount12Log)
data4$RaceResultByHorseByTotal.HitRate12 <- data4$RaceResultByHorseByTotal.HitRate12 - mean(data4$RaceResultByHorseByTotal.HitRate12)
data4$RaceResultByHorseByTotal.HitRate12Log <- data4$RaceResultByHorseByTotal.HitRate12Log - mean(data4$RaceResultByHorseByTotal.HitRate12Log)
data4$RaceResultByHorseByTotal.HitCount123 <- data4$RaceResultByHorseByTotal.HitCount123 - mean(data4$RaceResultByHorseByTotal.HitCount123)
data4$RaceResultByHorseByTotal.HitCount123Log <- data4$RaceResultByHorseByTotal.HitCount123Log - mean(data4$RaceResultByHorseByTotal.HitCount123Log)
data4$RaceResultByHorseByTotal.HitRate123 <- data4$RaceResultByHorseByTotal.HitRate123 - mean(data4$RaceResultByHorseByTotal.HitRate123)
data4$RaceResultByHorseByTotal.HitRate123Log <-data4$RaceResultByHorseByTotal.HitRate123Log - mean(data4$RaceResultByHorseByTotal.HitRate123Log)
data4$RaceResultByHorseByTotal.OddsWin <- data4$RaceResultByHorseByTotal.OddsWin - mean(data4$RaceResultByHorseByTotal.OddsWin)
data4$RaceResultByHorseByTotal.OddsWinLog <- data4$RaceResultByHorseByTotal.OddsWinLog - mean(data4$RaceResultByHorseByTotal.OddsWinLog)
data4$RaceResultByHorseByTotal.OddsPlace1 <- data4$RaceResultByHorseByTotal.OddsPlace1 - mean(data4$RaceResultByHorseByTotal.OddsPlace1)
data4$RaceResultByHorseByTotal.OddsPlace1Log <- data4$RaceResultByHorseByTotal.OddsPlace1Log - mean(data4$RaceResultByHorseByTotal.OddsPlace1Log)
data4$RaceResultByHorseByTotal.OddsPlace2 <- data4$RaceResultByHorseByTotal.OddsPlace2 - mean(data4$RaceResultByHorseByTotal.OddsPlace2)
data4$RaceResultByHorseByTotal.OddsPlace2Log <- data4$RaceResultByHorseByTotal.OddsPlace2Log - mean(data4$RaceResultByHorseByTotal.OddsPlace2Log)
data4$RaceResultByHorseByTotal.OddsWinInverse <- data4$RaceResultByHorseByTotal.OddsWinInverse - mean(data4$RaceResultByHorseByTotal.OddsWinInverse)
data4$RaceResultByHorseByTotal.OddsWinInverseLog <- data4$RaceResultByHorseByTotal.OddsWinInverseLog - mean(data4$RaceResultByHorseByTotal.OddsWinInverseLog)
data4$RaceResultByHorseByTotal.OddsPlaceInverse1 <- data4$RaceResultByHorseByTotal.OddsPlaceInverse1 - mean(data4$RaceResultByHorseByTotal.OddsPlaceInverse1)
data4$RaceResultByHorseByTotal.OddsPlaceInverse1Log <- data4$RaceResultByHorseByTotal.OddsPlaceInverse1Log - mean(data4$RaceResultByHorseByTotal.OddsPlaceInverse1Log)
data4$RaceResultByHorseByTotal.OddsPlaceInverse2 <- data4$RaceResultByHorseByTotal.OddsPlaceInverse2 - mean(data4$RaceResultByHorseByTotal.OddsPlaceInverse2)
data4$RaceResultByHorseByTotal.OddsPlaceInverse2Log <- data4$RaceResultByHorseByTotal.OddsPlaceInverse2Log - mean(data4$RaceResultByHorseByTotal.OddsPlaceInverse2Log)
data4$RaceResultByHorseByTotal.ApprovalRateWin <- data4$RaceResultByHorseByTotal.ApprovalRateWin - mean(data4$RaceResultByHorseByTotal.ApprovalRateWin)
data4$RaceResultByHorseByTotal.ApprovalRateWinLog <- data4$RaceResultByHorseByTotal.ApprovalRateWinLog - mean(data4$RaceResultByHorseByTotal.ApprovalRateWinLog)
data4$RaceResultByHorseByTotal.ApprovalRatePlace1 <- data4$RaceResultByHorseByTotal.ApprovalRatePlace1 - mean(data4$RaceResultByHorseByTotal.ApprovalRatePlace1)
data4$RaceResultByHorseByTotal.ApprovalRatePlace1Log <- data4$RaceResultByHorseByTotal.ApprovalRatePlace1Log - mean(data4$RaceResultByHorseByTotal.ApprovalRatePlace1Log)
data4$RaceResultByHorseByTotal.ApprovalRatePlace2 <- data4$RaceResultByHorseByTotal.ApprovalRatePlace2 - mean(data4$RaceResultByHorseByTotal.ApprovalRatePlace2)
data4$RaceResultByHorseByTotal.ApprovalRatePlace2Log <- data4$RaceResultByHorseByTotal.ApprovalRatePlace2Log - mean(data4$RaceResultByHorseByTotal.ApprovalRatePlace2Log)
data4$RaceResultByHorseByTotal.ExpectedValueWin <- data4$RaceResultByHorseByTotal.ExpectedValueWin - mean(data4$RaceResultByHorseByTotal.ExpectedValueWin)
data4$RaceResultByHorseByTotal.ExpectedValueWinLog <- data4$RaceResultByHorseByTotal.ExpectedValueWinLog - mean(data4$RaceResultByHorseByTotal.ExpectedValueWinLog)
data4$RaceResultByHorseByTotal.ExpectedValuePlace <- data4$RaceResultByHorseByTotal.ExpectedValuePlace - mean(data4$RaceResultByHorseByTotal.ExpectedValuePlace)
data4$RaceResultByHorseByTotal.ExpectedValuePlaceLog <- data4$RaceResultByHorseByTotal.ExpectedValuePlaceLog - mean(data4$RaceResultByHorseByTotal.ExpectedValuePlaceLog)
#
# data4$RaceResultByHorseByTrackCondition.RunCount <- data4$RaceResultByHorseByTrackCondition.RunCount - mean(data4$RaceResultByHorseByTrackCondition.RunCount)
# data4$RaceResultByHorseByTrackCondition.RunCountLog <- data4$RaceResultByHorseByTrackCondition.RunCountLog - mean(data4$RaceResultByHorseByTrackCondition.RunCountLog)
# data4$RaceResultByHorseByTrackCondition.HitCount1 <- data4$RaceResultByHorseByTrackCondition.HitCount1 - mean(data4$RaceResultByHorseByTrackCondition.HitCount1)
# data4$RaceResultByHorseByTrackCondition.HitCount1Log <- data4$RaceResultByHorseByTrackCondition.HitCount1Log - mean(data4$RaceResultByHorseByTrackCondition.HitCount1Log)
# data4$RaceResultByHorseByTrackCondition.HitRate1 <- data4$RaceResultByHorseByTrackCondition.HitRate1 - mean(data4$RaceResultByHorseByTrackCondition.HitRate1)
# data4$RaceResultByHorseByTrackCondition.HitRate1Log <- data4$RaceResultByHorseByTrackCondition.HitRate1Log - mean(data4$RaceResultByHorseByTrackCondition.HitRate1Log)
# data4$RaceResultByHorseByTrackCondition.HitCount12 <- data4$RaceResultByHorseByTrackCondition.HitCount12 - mean(data4$RaceResultByHorseByTrackCondition.HitCount12)
# data4$RaceResultByHorseByTrackCondition.HitCount12Log <- data4$RaceResultByHorseByTrackCondition.HitCount12Log - mean(data4$RaceResultByHorseByTrackCondition.HitCount12Log)
# data4$RaceResultByHorseByTrackCondition.HitRate12 <- data4$RaceResultByHorseByTrackCondition.HitRate12 - mean(data4$RaceResultByHorseByTrackCondition.HitRate12)
# data4$RaceResultByHorseByTrackCondition.HitRate12Log <- data4$RaceResultByHorseByTrackCondition.HitRate12Log - mean(data4$RaceResultByHorseByTrackCondition.HitRate12Log)
# data4$RaceResultByHorseByTrackCondition.HitCount123 <- data4$RaceResultByHorseByTrackCondition.HitCount123 - mean(data4$RaceResultByHorseByTrackCondition.HitCount123)
# data4$RaceResultByHorseByTrackCondition.HitCount123Log <- data4$RaceResultByHorseByTrackCondition.HitCount123Log - mean(data4$RaceResultByHorseByTrackCondition.HitCount123Log)
# data4$RaceResultByHorseByTrackCondition.HitRate123 <- data4$RaceResultByHorseByTrackCondition.HitRate123 - mean(data4$RaceResultByHorseByTrackCondition.HitRate123)
# data4$RaceResultByHorseByTrackCondition.HitRate123Log <-data4$RaceResultByHorseByTrackCondition.HitRate123Log - mean(data4$RaceResultByHorseByTrackCondition.HitRate123Log)
# data4$RaceResultByHorseByTrackCondition.OddsWin <- data4$RaceResultByHorseByTrackCondition.OddsWin - mean(data4$RaceResultByHorseByTrackCondition.OddsWin)
# data4$RaceResultByHorseByTrackCondition.OddsWinLog <- data4$RaceResultByHorseByTrackCondition.OddsWinLog - mean(data4$RaceResultByHorseByTrackCondition.OddsWinLog)
# data4$RaceResultByHorseByTrackCondition.OddsPlace1 <- data4$RaceResultByHorseByTrackCondition.OddsPlace1 - mean(data4$RaceResultByHorseByTrackCondition.OddsPlace1)
# data4$RaceResultByHorseByTrackCondition.OddsPlace1Log <- data4$RaceResultByHorseByTrackCondition.OddsPlace1Log - mean(data4$RaceResultByHorseByTrackCondition.OddsPlace1Log)
# data4$RaceResultByHorseByTrackCondition.OddsPlace2 <- data4$RaceResultByHorseByTrackCondition.OddsPlace2 - mean(data4$RaceResultByHorseByTrackCondition.OddsPlace2)
# data4$RaceResultByHorseByTrackCondition.OddsPlace2Log <- data4$RaceResultByHorseByTrackCondition.OddsPlace2Log - mean(data4$RaceResultByHorseByTrackCondition.OddsPlace2Log)
# data4$RaceResultByHorseByTrackCondition.OddsWinInverse <- data4$RaceResultByHorseByTrackCondition.OddsWinInverse - mean(data4$RaceResultByHorseByTrackCondition.OddsWinInverse)
# data4$RaceResultByHorseByTrackCondition.OddsWinInverseLog <- data4$RaceResultByHorseByTrackCondition.OddsWinInverseLog - mean(data4$RaceResultByHorseByTrackCondition.OddsWinInverseLog)
# data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1 <- data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1 - mean(data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1)
# data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log <- data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log - mean(data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse1Log)
# data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2 <- data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2 - mean(data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2)
# data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log <- data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log - mean(data4$RaceResultByHorseByTrackCondition.OddsPlaceInverse2Log)
# data4$RaceResultByHorseByTrackCondition.ApprovalRateWin <- data4$RaceResultByHorseByTrackCondition.ApprovalRateWin - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRateWin)
# data4$RaceResultByHorseByTrackCondition.ApprovalRateWinLog <- data4$RaceResultByHorseByTrackCondition.ApprovalRateWinLog - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRateWinLog)
# data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1 <- data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1 - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1)
# data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log <- data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace1Log)
# data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2 <- data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2 - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2)
# data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log <- data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log - mean(data4$RaceResultByHorseByTrackCondition.ApprovalRatePlace2Log)
# data4$RaceResultByHorseByTrackCondition.ExpectedValueWin <- data4$RaceResultByHorseByTrackCondition.ExpectedValueWin - mean(data4$RaceResultByHorseByTrackCondition.ExpectedValueWin)
# data4$RaceResultByHorseByTrackCondition.ExpectedValueWinLog <- data4$RaceResultByHorseByTrackCondition.ExpectedValueWinLog - mean(data4$RaceResultByHorseByTrackCondition.ExpectedValueWinLog)
# data4$RaceResultByHorseByTrackCondition.ExpectedValuePlace <- data4$RaceResultByHorseByTrackCondition.ExpectedValuePlace - mean(data4$RaceResultByHorseByTrackCondition.ExpectedValuePlace)
# data4$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog <- data4$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog - mean(data4$RaceResultByHorseByTrackCondition.ExpectedValuePlaceLog)
#
# data4$RaceResultByHorseByTrackType.RunCount <- data4$RaceResultByHorseByTrackType.RunCount - mean(data4$RaceResultByHorseByTrackType.RunCount)
# data4$RaceResultByHorseByTrackType.RunCountLog <- data4$RaceResultByHorseByTrackType.RunCountLog - mean(data4$RaceResultByHorseByTrackType.RunCountLog)
# data4$RaceResultByHorseByTrackType.HitCount1 <- data4$RaceResultByHorseByTrackType.HitCount1 - mean(data4$RaceResultByHorseByTrackType.HitCount1)
# data4$RaceResultByHorseByTrackType.HitCount1Log <- data4$RaceResultByHorseByTrackType.HitCount1Log - mean(data4$RaceResultByHorseByTrackType.HitCount1Log)
# data4$RaceResultByHorseByTrackType.HitRate1 <- data4$RaceResultByHorseByTrackType.HitRate1 - mean(data4$RaceResultByHorseByTrackType.HitRate1)
# data4$RaceResultByHorseByTrackType.HitRate1Log <- data4$RaceResultByHorseByTrackType.HitRate1Log - mean(data4$RaceResultByHorseByTrackType.HitRate1Log)
# data4$RaceResultByHorseByTrackType.HitCount12 <- data4$RaceResultByHorseByTrackType.HitCount12 - mean(data4$RaceResultByHorseByTrackType.HitCount12)
# data4$RaceResultByHorseByTrackType.HitCount12Log <- data4$RaceResultByHorseByTrackType.HitCount12Log - mean(data4$RaceResultByHorseByTrackType.HitCount12Log)
# data4$RaceResultByHorseByTrackType.HitRate12 <- data4$RaceResultByHorseByTrackType.HitRate12 - mean(data4$RaceResultByHorseByTrackType.HitRate12)
# data4$RaceResultByHorseByTrackType.HitRate12Log <- data4$RaceResultByHorseByTrackType.HitRate12Log - mean(data4$RaceResultByHorseByTrackType.HitRate12Log)
# data4$RaceResultByHorseByTrackType.HitCount123 <- data4$RaceResultByHorseByTrackType.HitCount123 - mean(data4$RaceResultByHorseByTrackType.HitCount123)
# data4$RaceResultByHorseByTrackType.HitCount123Log <- data4$RaceResultByHorseByTrackType.HitCount123Log - mean(data4$RaceResultByHorseByTrackType.HitCount123Log)
# data4$RaceResultByHorseByTrackType.HitRate123 <- data4$RaceResultByHorseByTrackType.HitRate123 - mean(data4$RaceResultByHorseByTrackType.HitRate123)
# data4$RaceResultByHorseByTrackType.HitRate123Log <-data4$RaceResultByHorseByTrackType.HitRate123Log - mean(data4$RaceResultByHorseByTrackType.HitRate123Log)
# data4$RaceResultByHorseByTrackType.OddsWin <- data4$RaceResultByHorseByTrackType.OddsWin - mean(data4$RaceResultByHorseByTrackType.OddsWin)
# data4$RaceResultByHorseByTrackType.OddsWinLog <- data4$RaceResultByHorseByTrackType.OddsWinLog - mean(data4$RaceResultByHorseByTrackType.OddsWinLog)
# data4$RaceResultByHorseByTrackType.OddsPlace1 <- data4$RaceResultByHorseByTrackType.OddsPlace1 - mean(data4$RaceResultByHorseByTrackType.OddsPlace1)
# data4$RaceResultByHorseByTrackType.OddsPlace1Log <- data4$RaceResultByHorseByTrackType.OddsPlace1Log - mean(data4$RaceResultByHorseByTrackType.OddsPlace1Log)
# data4$RaceResultByHorseByTrackType.OddsPlace2 <- data4$RaceResultByHorseByTrackType.OddsPlace2 - mean(data4$RaceResultByHorseByTrackType.OddsPlace2)
# data4$RaceResultByHorseByTrackType.OddsPlace2Log <- data4$RaceResultByHorseByTrackType.OddsPlace2Log - mean(data4$RaceResultByHorseByTrackType.OddsPlace2Log)
# data4$RaceResultByHorseByTrackType.OddsWinInverse <- data4$RaceResultByHorseByTrackType.OddsWinInverse - mean(data4$RaceResultByHorseByTrackType.OddsWinInverse)
# data4$RaceResultByHorseByTrackType.OddsWinInverseLog <- data4$RaceResultByHorseByTrackType.OddsWinInverseLog - mean(data4$RaceResultByHorseByTrackType.OddsWinInverseLog)
# data4$RaceResultByHorseByTrackType.OddsPlaceInverse1 <- data4$RaceResultByHorseByTrackType.OddsPlaceInverse1 - mean(data4$RaceResultByHorseByTrackType.OddsPlaceInverse1)
# data4$RaceResultByHorseByTrackType.OddsPlaceInverse1Log <- data4$RaceResultByHorseByTrackType.OddsPlaceInverse1Log - mean(data4$RaceResultByHorseByTrackType.OddsPlaceInverse1Log)
# data4$RaceResultByHorseByTrackType.OddsPlaceInverse2 <- data4$RaceResultByHorseByTrackType.OddsPlaceInverse2 - mean(data4$RaceResultByHorseByTrackType.OddsPlaceInverse2)
# data4$RaceResultByHorseByTrackType.OddsPlaceInverse2Log <- data4$RaceResultByHorseByTrackType.OddsPlaceInverse2Log - mean(data4$RaceResultByHorseByTrackType.OddsPlaceInverse2Log)
# data4$RaceResultByHorseByTrackType.ApprovalRateWin <- data4$RaceResultByHorseByTrackType.ApprovalRateWin - mean(data4$RaceResultByHorseByTrackType.ApprovalRateWin)
# data4$RaceResultByHorseByTrackType.ApprovalRateWinLog <- data4$RaceResultByHorseByTrackType.ApprovalRateWinLog - mean(data4$RaceResultByHorseByTrackType.ApprovalRateWinLog)
# data4$RaceResultByHorseByTrackType.ApprovalRatePlace1 <- data4$RaceResultByHorseByTrackType.ApprovalRatePlace1 - mean(data4$RaceResultByHorseByTrackType.ApprovalRatePlace1)
# data4$RaceResultByHorseByTrackType.ApprovalRatePlace1Log <- data4$RaceResultByHorseByTrackType.ApprovalRatePlace1Log - mean(data4$RaceResultByHorseByTrackType.ApprovalRatePlace1Log)
# data4$RaceResultByHorseByTrackType.ApprovalRatePlace2 <- data4$RaceResultByHorseByTrackType.ApprovalRatePlace2 - mean(data4$RaceResultByHorseByTrackType.ApprovalRatePlace2)
# data4$RaceResultByHorseByTrackType.ApprovalRatePlace2Log <- data4$RaceResultByHorseByTrackType.ApprovalRatePlace2Log - mean(data4$RaceResultByHorseByTrackType.ApprovalRatePlace2Log)
# data4$RaceResultByHorseByTrackType.ExpectedValueWin <- data4$RaceResultByHorseByTrackType.ExpectedValueWin - mean(data4$RaceResultByHorseByTrackType.ExpectedValueWin)
# data4$RaceResultByHorseByTrackType.ExpectedValueWinLog <- data4$RaceResultByHorseByTrackType.ExpectedValueWinLog - mean(data4$RaceResultByHorseByTrackType.ExpectedValueWinLog)
# data4$RaceResultByHorseByTrackType.ExpectedValuePlace <- data4$RaceResultByHorseByTrackType.ExpectedValuePlace - mean(data4$RaceResultByHorseByTrackType.ExpectedValuePlace)
# data4$RaceResultByHorseByTrackType.ExpectedValuePlaceLog <- data4$RaceResultByHorseByTrackType.ExpectedValuePlaceLog - mean(data4$RaceResultByHorseByTrackType.ExpectedValuePlaceLog)
#
data4$RaceResultByJocky.HonSyokinHeichi <- data4$RaceResultByJocky.HonSyokinHeichi - mean(data4$RaceResultByJocky.HonSyokinHeichi)
data4$RaceResultByJocky.HonSyokinHeichiLog <- data4$RaceResultByJocky.HonSyokinHeichiLog - mean(data4$RaceResultByJocky.HonSyokinHeichiLog)
data4$RaceResultByJocky.HonSyokinSyogai <- data4$RaceResultByJocky.HonSyokinSyogai - mean(data4$RaceResultByJocky.HonSyokinSyogai)
data4$RaceResultByJocky.HonSyokinSyogaiLog <- data4$RaceResultByJocky.HonSyokinSyogaiLog - mean(data4$RaceResultByJocky.HonSyokinSyogaiLog)
#
# data4$RaceResultByJockyByJyo.RunCount <- data4$RaceResultByJockyByJyo.RunCount - mean(data4$RaceResultByJockyByJyo.RunCount)
# data4$RaceResultByJockyByJyo.RunCountLog <- data4$RaceResultByJockyByJyo.RunCountLog - mean(data4$RaceResultByJockyByJyo.RunCountLog)
# data4$RaceResultByJockyByJyo.HitCount1 <- data4$RaceResultByJockyByJyo.HitCount1 - mean(data4$RaceResultByJockyByJyo.HitCount1)
# data4$RaceResultByJockyByJyo.HitCount1Log <- data4$RaceResultByJockyByJyo.HitCount1Log - mean(data4$RaceResultByJockyByJyo.HitCount1Log)
# data4$RaceResultByJockyByJyo.HitRate1 <- data4$RaceResultByJockyByJyo.HitRate1 - mean(data4$RaceResultByJockyByJyo.HitRate1)
# data4$RaceResultByJockyByJyo.HitRate1Log <- data4$RaceResultByJockyByJyo.HitRate1Log - mean(data4$RaceResultByJockyByJyo.HitRate1Log)
# data4$RaceResultByJockyByJyo.HitCount12 <- data4$RaceResultByJockyByJyo.HitCount12 - mean(data4$RaceResultByJockyByJyo.HitCount12)
# data4$RaceResultByJockyByJyo.HitCount12Log <- data4$RaceResultByJockyByJyo.HitCount12Log - mean(data4$RaceResultByJockyByJyo.HitCount12Log)
# data4$RaceResultByJockyByJyo.HitRate12 <- data4$RaceResultByJockyByJyo.HitRate12 - mean(data4$RaceResultByJockyByJyo.HitRate12)
# data4$RaceResultByJockyByJyo.HitRate12Log <- data4$RaceResultByJockyByJyo.HitRate12Log - mean(data4$RaceResultByJockyByJyo.HitRate12Log)
# data4$RaceResultByJockyByJyo.HitCount123 <- data4$RaceResultByJockyByJyo.HitCount123 - mean(data4$RaceResultByJockyByJyo.HitCount123)
# data4$RaceResultByJockyByJyo.HitCount123Log <- data4$RaceResultByJockyByJyo.HitCount123Log - mean(data4$RaceResultByJockyByJyo.HitCount123Log)
# data4$RaceResultByJockyByJyo.HitRate123 <- data4$RaceResultByJockyByJyo.HitRate123 - mean(data4$RaceResultByJockyByJyo.HitRate123)
# data4$RaceResultByJockyByJyo.HitRate123Log <-data4$RaceResultByJockyByJyo.HitRate123Log - mean(data4$RaceResultByJockyByJyo.HitRate123Log)
# data4$RaceResultByJockyByJyo.OddsWin <- data4$RaceResultByJockyByJyo.OddsWin - mean(data4$RaceResultByJockyByJyo.OddsWin)
# data4$RaceResultByJockyByJyo.OddsWinLog <- data4$RaceResultByJockyByJyo.OddsWinLog - mean(data4$RaceResultByJockyByJyo.OddsWinLog)
# data4$RaceResultByJockyByJyo.OddsPlace1 <- data4$RaceResultByJockyByJyo.OddsPlace1 - mean(data4$RaceResultByJockyByJyo.OddsPlace1)
# data4$RaceResultByJockyByJyo.OddsPlace1Log <- data4$RaceResultByJockyByJyo.OddsPlace1Log - mean(data4$RaceResultByJockyByJyo.OddsPlace1Log)
# data4$RaceResultByJockyByJyo.OddsPlace2 <- data4$RaceResultByJockyByJyo.OddsPlace2 - mean(data4$RaceResultByJockyByJyo.OddsPlace2)
# data4$RaceResultByJockyByJyo.OddsPlace2Log <- data4$RaceResultByJockyByJyo.OddsPlace2Log - mean(data4$RaceResultByJockyByJyo.OddsPlace2Log)
# data4$RaceResultByJockyByJyo.OddsWinInverse <- data4$RaceResultByJockyByJyo.OddsWinInverse - mean(data4$RaceResultByJockyByJyo.OddsWinInverse)
# data4$RaceResultByJockyByJyo.OddsWinInverseLog <- data4$RaceResultByJockyByJyo.OddsWinInverseLog - mean(data4$RaceResultByJockyByJyo.OddsWinInverseLog)
# data4$RaceResultByJockyByJyo.OddsPlaceInverse1 <- data4$RaceResultByJockyByJyo.OddsPlaceInverse1 - mean(data4$RaceResultByJockyByJyo.OddsPlaceInverse1)
# data4$RaceResultByJockyByJyo.OddsPlaceInverse1Log <- data4$RaceResultByJockyByJyo.OddsPlaceInverse1Log - mean(data4$RaceResultByJockyByJyo.OddsPlaceInverse1Log)
# data4$RaceResultByJockyByJyo.OddsPlaceInverse2 <- data4$RaceResultByJockyByJyo.OddsPlaceInverse2 - mean(data4$RaceResultByJockyByJyo.OddsPlaceInverse2)
# data4$RaceResultByJockyByJyo.OddsPlaceInverse2Log <- data4$RaceResultByJockyByJyo.OddsPlaceInverse2Log - mean(data4$RaceResultByJockyByJyo.OddsPlaceInverse2Log)
# data4$RaceResultByJockyByJyo.ApprovalRateWin <- data4$RaceResultByJockyByJyo.ApprovalRateWin - mean(data4$RaceResultByJockyByJyo.ApprovalRateWin)
# data4$RaceResultByJockyByJyo.ApprovalRateWinLog <- data4$RaceResultByJockyByJyo.ApprovalRateWinLog - mean(data4$RaceResultByJockyByJyo.ApprovalRateWinLog)
# data4$RaceResultByJockyByJyo.ApprovalRatePlace1 <- data4$RaceResultByJockyByJyo.ApprovalRatePlace1 - mean(data4$RaceResultByJockyByJyo.ApprovalRatePlace1)
# data4$RaceResultByJockyByJyo.ApprovalRatePlace1Log <- data4$RaceResultByJockyByJyo.ApprovalRatePlace1Log - mean(data4$RaceResultByJockyByJyo.ApprovalRatePlace1Log)
# data4$RaceResultByJockyByJyo.ApprovalRatePlace2 <- data4$RaceResultByJockyByJyo.ApprovalRatePlace2 - mean(data4$RaceResultByJockyByJyo.ApprovalRatePlace2)
# data4$RaceResultByJockyByJyo.ApprovalRatePlace2Log <- data4$RaceResultByJockyByJyo.ApprovalRatePlace2Log - mean(data4$RaceResultByJockyByJyo.ApprovalRatePlace2Log)
# data4$RaceResultByJockyByJyo.ExpectedValueWin <- data4$RaceResultByJockyByJyo.ExpectedValueWin - mean(data4$RaceResultByJockyByJyo.ExpectedValueWin)
# data4$RaceResultByJockyByJyo.ExpectedValueWinLog <- data4$RaceResultByJockyByJyo.ExpectedValueWinLog - mean(data4$RaceResultByJockyByJyo.ExpectedValueWinLog)
# data4$RaceResultByJockyByJyo.ExpectedValuePlace <- data4$RaceResultByJockyByJyo.ExpectedValuePlace - mean(data4$RaceResultByJockyByJyo.ExpectedValuePlace)
# data4$RaceResultByJockyByJyo.ExpectedValuePlaceLog <- data4$RaceResultByJockyByJyo.ExpectedValuePlaceLog - mean(data4$RaceResultByJockyByJyo.ExpectedValuePlaceLog)
#
data4$RaceResultByJockyByTrackType.RunCount <- data4$RaceResultByJockyByTrackType.RunCount - mean(data4$RaceResultByJockyByTrackType.RunCount)
data4$RaceResultByJockyByTrackType.RunCountLog <- data4$RaceResultByJockyByTrackType.RunCountLog - mean(data4$RaceResultByJockyByTrackType.RunCountLog)
data4$RaceResultByJockyByTrackType.HitCount1 <- data4$RaceResultByJockyByTrackType.HitCount1 - mean(data4$RaceResultByJockyByTrackType.HitCount1)
data4$RaceResultByJockyByTrackType.HitCount1Log <- data4$RaceResultByJockyByTrackType.HitCount1Log - mean(data4$RaceResultByJockyByTrackType.HitCount1Log)
data4$RaceResultByJockyByTrackType.HitRate1 <- data4$RaceResultByJockyByTrackType.HitRate1 - mean(data4$RaceResultByJockyByTrackType.HitRate1)
data4$RaceResultByJockyByTrackType.HitRate1Log <- data4$RaceResultByJockyByTrackType.HitRate1Log - mean(data4$RaceResultByJockyByTrackType.HitRate1Log)
data4$RaceResultByJockyByTrackType.HitCount12 <- data4$RaceResultByJockyByTrackType.HitCount12 - mean(data4$RaceResultByJockyByTrackType.HitCount12)
data4$RaceResultByJockyByTrackType.HitCount12Log <- data4$RaceResultByJockyByTrackType.HitCount12Log - mean(data4$RaceResultByJockyByTrackType.HitCount12Log)
data4$RaceResultByJockyByTrackType.HitRate12 <- data4$RaceResultByJockyByTrackType.HitRate12 - mean(data4$RaceResultByJockyByTrackType.HitRate12)
data4$RaceResultByJockyByTrackType.HitRate12Log <- data4$RaceResultByJockyByTrackType.HitRate12Log - mean(data4$RaceResultByJockyByTrackType.HitRate12Log)
data4$RaceResultByJockyByTrackType.HitCount123 <- data4$RaceResultByJockyByTrackType.HitCount123 - mean(data4$RaceResultByJockyByTrackType.HitCount123)
data4$RaceResultByJockyByTrackType.HitCount123Log <- data4$RaceResultByJockyByTrackType.HitCount123Log - mean(data4$RaceResultByJockyByTrackType.HitCount123Log)
data4$RaceResultByJockyByTrackType.HitRate123 <- data4$RaceResultByJockyByTrackType.HitRate123 - mean(data4$RaceResultByJockyByTrackType.HitRate123)
data4$RaceResultByJockyByTrackType.HitRate123Log <-data4$RaceResultByJockyByTrackType.HitRate123Log - mean(data4$RaceResultByJockyByTrackType.HitRate123Log)
data4$RaceResultByJockyByTrackType.OddsWin <- data4$RaceResultByJockyByTrackType.OddsWin - mean(data4$RaceResultByJockyByTrackType.OddsWin)
data4$RaceResultByJockyByTrackType.OddsWinLog <- data4$RaceResultByJockyByTrackType.OddsWinLog - mean(data4$RaceResultByJockyByTrackType.OddsWinLog)
data4$RaceResultByJockyByTrackType.OddsPlace1 <- data4$RaceResultByJockyByTrackType.OddsPlace1 - mean(data4$RaceResultByJockyByTrackType.OddsPlace1)
data4$RaceResultByJockyByTrackType.OddsPlace1Log <- data4$RaceResultByJockyByTrackType.OddsPlace1Log - mean(data4$RaceResultByJockyByTrackType.OddsPlace1Log)
data4$RaceResultByJockyByTrackType.OddsPlace2 <- data4$RaceResultByJockyByTrackType.OddsPlace2 - mean(data4$RaceResultByJockyByTrackType.OddsPlace2)
data4$RaceResultByJockyByTrackType.OddsPlace2Log <- data4$RaceResultByJockyByTrackType.OddsPlace2Log - mean(data4$RaceResultByJockyByTrackType.OddsPlace2Log)
data4$RaceResultByJockyByTrackType.OddsWinInverse <- data4$RaceResultByJockyByTrackType.OddsWinInverse - mean(data4$RaceResultByJockyByTrackType.OddsWinInverse)
data4$RaceResultByJockyByTrackType.OddsWinInverseLog <- data4$RaceResultByJockyByTrackType.OddsWinInverseLog - mean(data4$RaceResultByJockyByTrackType.OddsWinInverseLog)
data4$RaceResultByJockyByTrackType.OddsPlaceInverse1 <- data4$RaceResultByJockyByTrackType.OddsPlaceInverse1 - mean(data4$RaceResultByJockyByTrackType.OddsPlaceInverse1)
data4$RaceResultByJockyByTrackType.OddsPlaceInverse1Log <- data4$RaceResultByJockyByTrackType.OddsPlaceInverse1Log - mean(data4$RaceResultByJockyByTrackType.OddsPlaceInverse1Log)
data4$RaceResultByJockyByTrackType.OddsPlaceInverse2 <- data4$RaceResultByJockyByTrackType.OddsPlaceInverse2 - mean(data4$RaceResultByJockyByTrackType.OddsPlaceInverse2)
data4$RaceResultByJockyByTrackType.OddsPlaceInverse2Log <- data4$RaceResultByJockyByTrackType.OddsPlaceInverse2Log - mean(data4$RaceResultByJockyByTrackType.OddsPlaceInverse2Log)
data4$RaceResultByJockyByTrackType.ApprovalRateWin <- data4$RaceResultByJockyByTrackType.ApprovalRateWin - mean(data4$RaceResultByJockyByTrackType.ApprovalRateWin)
data4$RaceResultByJockyByTrackType.ApprovalRateWinLog <- data4$RaceResultByJockyByTrackType.ApprovalRateWinLog - mean(data4$RaceResultByJockyByTrackType.ApprovalRateWinLog)
data4$RaceResultByJockyByTrackType.ApprovalRatePlace1 <- data4$RaceResultByJockyByTrackType.ApprovalRatePlace1 - mean(data4$RaceResultByJockyByTrackType.ApprovalRatePlace1)
data4$RaceResultByJockyByTrackType.ApprovalRatePlace1Log <- data4$RaceResultByJockyByTrackType.ApprovalRatePlace1Log - mean(data4$RaceResultByJockyByTrackType.ApprovalRatePlace1Log)
data4$RaceResultByJockyByTrackType.ApprovalRatePlace2 <- data4$RaceResultByJockyByTrackType.ApprovalRatePlace2 - mean(data4$RaceResultByJockyByTrackType.ApprovalRatePlace2)
data4$RaceResultByJockyByTrackType.ApprovalRatePlace2Log <- data4$RaceResultByJockyByTrackType.ApprovalRatePlace2Log - mean(data4$RaceResultByJockyByTrackType.ApprovalRatePlace2Log)
data4$RaceResultByJockyByTrackType.ExpectedValueWin <- data4$RaceResultByJockyByTrackType.ExpectedValueWin - mean(data4$RaceResultByJockyByTrackType.ExpectedValueWin)
data4$RaceResultByJockyByTrackType.ExpectedValueWinLog <- data4$RaceResultByJockyByTrackType.ExpectedValueWinLog - mean(data4$RaceResultByJockyByTrackType.ExpectedValueWinLog)
data4$RaceResultByJockyByTrackType.ExpectedValuePlace <- data4$RaceResultByJockyByTrackType.ExpectedValuePlace - mean(data4$RaceResultByJockyByTrackType.ExpectedValuePlace)
data4$RaceResultByJockyByTrackType.ExpectedValuePlaceLog <- data4$RaceResultByJockyByTrackType.ExpectedValuePlaceLog - mean(data4$RaceResultByJockyByTrackType.ExpectedValuePlaceLog)
#
data4$RaceResultByTrainer.HonSyokinHeichi <- data4$RaceResultByTrainer.HonSyokinHeichi - mean(data4$RaceResultByTrainer.HonSyokinHeichi)
data4$RaceResultByTrainer.HonSyokinHeichiLog <- data4$RaceResultByTrainer.HonSyokinHeichiLog - mean(data4$RaceResultByTrainer.HonSyokinHeichiLog)
data4$RaceResultByTrainer.HonSyokinSyogai <- data4$RaceResultByTrainer.HonSyokinSyogai - mean(data4$RaceResultByTrainer.HonSyokinSyogai)
data4$RaceResultByTrainer.HonSyokinSyogaiLog <- data4$RaceResultByTrainer.HonSyokinSyogaiLog - mean(data4$RaceResultByTrainer.HonSyokinSyogaiLog)
#
# data4$RaceResultByTrainerByJyo.RunCount <- data4$RaceResultByTrainerByJyo.RunCount - mean(data4$RaceResultByTrainerByJyo.RunCount)
# data4$RaceResultByTrainerByJyo.RunCountLog <- data4$RaceResultByTrainerByJyo.RunCountLog - mean(data4$RaceResultByTrainerByJyo.RunCountLog)
# data4$RaceResultByTrainerByJyo.HitCount1 <- data4$RaceResultByTrainerByJyo.HitCount1 - mean(data4$RaceResultByTrainerByJyo.HitCount1)
# data4$RaceResultByTrainerByJyo.HitCount1Log <- data4$RaceResultByTrainerByJyo.HitCount1Log - mean(data4$RaceResultByTrainerByJyo.HitCount1Log)
# data4$RaceResultByTrainerByJyo.HitRate1 <- data4$RaceResultByTrainerByJyo.HitRate1 - mean(data4$RaceResultByTrainerByJyo.HitRate1)
# data4$RaceResultByTrainerByJyo.HitRate1Log <- data4$RaceResultByTrainerByJyo.HitRate1Log - mean(data4$RaceResultByTrainerByJyo.HitRate1Log)
# data4$RaceResultByTrainerByJyo.HitCount12 <- data4$RaceResultByTrainerByJyo.HitCount12 - mean(data4$RaceResultByTrainerByJyo.HitCount12)
# data4$RaceResultByTrainerByJyo.HitCount12Log <- data4$RaceResultByTrainerByJyo.HitCount12Log - mean(data4$RaceResultByTrainerByJyo.HitCount12Log)
# data4$RaceResultByTrainerByJyo.HitRate12 <- data4$RaceResultByTrainerByJyo.HitRate12 - mean(data4$RaceResultByTrainerByJyo.HitRate12)
# data4$RaceResultByTrainerByJyo.HitRate12Log <- data4$RaceResultByTrainerByJyo.HitRate12Log - mean(data4$RaceResultByTrainerByJyo.HitRate12Log)
# data4$RaceResultByTrainerByJyo.HitCount123 <- data4$RaceResultByTrainerByJyo.HitCount123 - mean(data4$RaceResultByTrainerByJyo.HitCount123)
# data4$RaceResultByTrainerByJyo.HitCount123Log <- data4$RaceResultByTrainerByJyo.HitCount123Log - mean(data4$RaceResultByTrainerByJyo.HitCount123Log)
# data4$RaceResultByTrainerByJyo.HitRate123 <- data4$RaceResultByTrainerByJyo.HitRate123 - mean(data4$RaceResultByTrainerByJyo.HitRate123)
# data4$RaceResultByTrainerByJyo.HitRate123Log <-data4$RaceResultByTrainerByJyo.HitRate123Log - mean(data4$RaceResultByTrainerByJyo.HitRate123Log)
# data4$RaceResultByTrainerByJyo.OddsWin <- data4$RaceResultByTrainerByJyo.OddsWin - mean(data4$RaceResultByTrainerByJyo.OddsWin)
# data4$RaceResultByTrainerByJyo.OddsWinLog <- data4$RaceResultByTrainerByJyo.OddsWinLog - mean(data4$RaceResultByTrainerByJyo.OddsWinLog)
# data4$RaceResultByTrainerByJyo.OddsPlace1 <- data4$RaceResultByTrainerByJyo.OddsPlace1 - mean(data4$RaceResultByTrainerByJyo.OddsPlace1)
# data4$RaceResultByTrainerByJyo.OddsPlace1Log <- data4$RaceResultByTrainerByJyo.OddsPlace1Log - mean(data4$RaceResultByTrainerByJyo.OddsPlace1Log)
# data4$RaceResultByTrainerByJyo.OddsPlace2 <- data4$RaceResultByTrainerByJyo.OddsPlace2 - mean(data4$RaceResultByTrainerByJyo.OddsPlace2)
# data4$RaceResultByTrainerByJyo.OddsPlace2Log <- data4$RaceResultByTrainerByJyo.OddsPlace2Log - mean(data4$RaceResultByTrainerByJyo.OddsPlace2Log)
# data4$RaceResultByTrainerByJyo.OddsWinInverse <- data4$RaceResultByTrainerByJyo.OddsWinInverse - mean(data4$RaceResultByTrainerByJyo.OddsWinInverse)
# data4$RaceResultByTrainerByJyo.OddsWinInverseLog <- data4$RaceResultByTrainerByJyo.OddsWinInverseLog - mean(data4$RaceResultByTrainerByJyo.OddsWinInverseLog)
# data4$RaceResultByTrainerByJyo.OddsPlaceInverse1 <- data4$RaceResultByTrainerByJyo.OddsPlaceInverse1 - mean(data4$RaceResultByTrainerByJyo.OddsPlaceInverse1)
# data4$RaceResultByTrainerByJyo.OddsPlaceInverse1Log <- data4$RaceResultByTrainerByJyo.OddsPlaceInverse1Log - mean(data4$RaceResultByTrainerByJyo.OddsPlaceInverse1Log)
# data4$RaceResultByTrainerByJyo.OddsPlaceInverse2 <- data4$RaceResultByTrainerByJyo.OddsPlaceInverse2 - mean(data4$RaceResultByTrainerByJyo.OddsPlaceInverse2)
# data4$RaceResultByTrainerByJyo.OddsPlaceInverse2Log <- data4$RaceResultByTrainerByJyo.OddsPlaceInverse2Log - mean(data4$RaceResultByTrainerByJyo.OddsPlaceInverse2Log)
# data4$RaceResultByTrainerByJyo.ApprovalRateWin <- data4$RaceResultByTrainerByJyo.ApprovalRateWin - mean(data4$RaceResultByTrainerByJyo.ApprovalRateWin)
# data4$RaceResultByTrainerByJyo.ApprovalRateWinLog <- data4$RaceResultByTrainerByJyo.ApprovalRateWinLog - mean(data4$RaceResultByTrainerByJyo.ApprovalRateWinLog)
# data4$RaceResultByTrainerByJyo.ApprovalRatePlace1 <- data4$RaceResultByTrainerByJyo.ApprovalRatePlace1 - mean(data4$RaceResultByTrainerByJyo.ApprovalRatePlace1)
# data4$RaceResultByTrainerByJyo.ApprovalRatePlace1Log <- data4$RaceResultByTrainerByJyo.ApprovalRatePlace1Log - mean(data4$RaceResultByTrainerByJyo.ApprovalRatePlace1Log)
# data4$RaceResultByTrainerByJyo.ApprovalRatePlace2 <- data4$RaceResultByTrainerByJyo.ApprovalRatePlace2 - mean(data4$RaceResultByTrainerByJyo.ApprovalRatePlace2)
# data4$RaceResultByTrainerByJyo.ApprovalRatePlace2Log <- data4$RaceResultByTrainerByJyo.ApprovalRatePlace2Log - mean(data4$RaceResultByTrainerByJyo.ApprovalRatePlace2Log)
# data4$RaceResultByTrainerByJyo.ExpectedValueWin <- data4$RaceResultByTrainerByJyo.ExpectedValueWin - mean(data4$RaceResultByTrainerByJyo.ExpectedValueWin)
# data4$RaceResultByTrainerByJyo.ExpectedValueWinLog <- data4$RaceResultByTrainerByJyo.ExpectedValueWinLog - mean(data4$RaceResultByTrainerByJyo.ExpectedValueWinLog)
# data4$RaceResultByTrainerByJyo.ExpectedValuePlace <- data4$RaceResultByTrainerByJyo.ExpectedValuePlace - mean(data4$RaceResultByTrainerByJyo.ExpectedValuePlace)
# data4$RaceResultByTrainerByJyo.ExpectedValuePlaceLog <- data4$RaceResultByTrainerByJyo.ExpectedValuePlaceLog - mean(data4$RaceResultByTrainerByJyo.ExpectedValuePlaceLog)
#
data4$RaceResultByTrainerByTrackType.RunCount <- data4$RaceResultByTrainerByTrackType.RunCount - mean(data4$RaceResultByTrainerByTrackType.RunCount)
data4$RaceResultByTrainerByTrackType.RunCountLog <- data4$RaceResultByTrainerByTrackType.RunCountLog - mean(data4$RaceResultByTrainerByTrackType.RunCountLog)
data4$RaceResultByTrainerByTrackType.HitCount1 <- data4$RaceResultByTrainerByTrackType.HitCount1 - mean(data4$RaceResultByTrainerByTrackType.HitCount1)
data4$RaceResultByTrainerByTrackType.HitCount1Log <- data4$RaceResultByTrainerByTrackType.HitCount1Log - mean(data4$RaceResultByTrainerByTrackType.HitCount1Log)
data4$RaceResultByTrainerByTrackType.HitRate1 <- data4$RaceResultByTrainerByTrackType.HitRate1 - mean(data4$RaceResultByTrainerByTrackType.HitRate1)
data4$RaceResultByTrainerByTrackType.HitRate1Log <- data4$RaceResultByTrainerByTrackType.HitRate1Log - mean(data4$RaceResultByTrainerByTrackType.HitRate1Log)
data4$RaceResultByTrainerByTrackType.HitCount12 <- data4$RaceResultByTrainerByTrackType.HitCount12 - mean(data4$RaceResultByTrainerByTrackType.HitCount12)
data4$RaceResultByTrainerByTrackType.HitCount12Log <- data4$RaceResultByTrainerByTrackType.HitCount12Log - mean(data4$RaceResultByTrainerByTrackType.HitCount12Log)
data4$RaceResultByTrainerByTrackType.HitRate12 <- data4$RaceResultByTrainerByTrackType.HitRate12 - mean(data4$RaceResultByTrainerByTrackType.HitRate12)
data4$RaceResultByTrainerByTrackType.HitRate12Log <- data4$RaceResultByTrainerByTrackType.HitRate12Log - mean(data4$RaceResultByTrainerByTrackType.HitRate12Log)
data4$RaceResultByTrainerByTrackType.HitCount123 <- data4$RaceResultByTrainerByTrackType.HitCount123 - mean(data4$RaceResultByTrainerByTrackType.HitCount123)
data4$RaceResultByTrainerByTrackType.HitCount123Log <- data4$RaceResultByTrainerByTrackType.HitCount123Log - mean(data4$RaceResultByTrainerByTrackType.HitCount123Log)
data4$RaceResultByTrainerByTrackType.HitRate123 <- data4$RaceResultByTrainerByTrackType.HitRate123 - mean(data4$RaceResultByTrainerByTrackType.HitRate123)
data4$RaceResultByTrainerByTrackType.HitRate123Log <-data4$RaceResultByTrainerByTrackType.HitRate123Log - mean(data4$RaceResultByTrainerByTrackType.HitRate123Log)
data4$RaceResultByTrainerByTrackType.OddsWin <- data4$RaceResultByTrainerByTrackType.OddsWin - mean(data4$RaceResultByTrainerByTrackType.OddsWin)
data4$RaceResultByTrainerByTrackType.OddsWinLog <- data4$RaceResultByTrainerByTrackType.OddsWinLog - mean(data4$RaceResultByTrainerByTrackType.OddsWinLog)
data4$RaceResultByTrainerByTrackType.OddsPlace1 <- data4$RaceResultByTrainerByTrackType.OddsPlace1 - mean(data4$RaceResultByTrainerByTrackType.OddsPlace1)
data4$RaceResultByTrainerByTrackType.OddsPlace1Log <- data4$RaceResultByTrainerByTrackType.OddsPlace1Log - mean(data4$RaceResultByTrainerByTrackType.OddsPlace1Log)
data4$RaceResultByTrainerByTrackType.OddsPlace2 <- data4$RaceResultByTrainerByTrackType.OddsPlace2 - mean(data4$RaceResultByTrainerByTrackType.OddsPlace2)
data4$RaceResultByTrainerByTrackType.OddsPlace2Log <- data4$RaceResultByTrainerByTrackType.OddsPlace2Log - mean(data4$RaceResultByTrainerByTrackType.OddsPlace2Log)
data4$RaceResultByTrainerByTrackType.OddsWinInverse <- data4$RaceResultByTrainerByTrackType.OddsWinInverse - mean(data4$RaceResultByTrainerByTrackType.OddsWinInverse)
data4$RaceResultByTrainerByTrackType.OddsWinInverseLog <- data4$RaceResultByTrainerByTrackType.OddsWinInverseLog - mean(data4$RaceResultByTrainerByTrackType.OddsWinInverseLog)
data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1 <- data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1 - mean(data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1)
data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log <- data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log - mean(data4$RaceResultByTrainerByTrackType.OddsPlaceInverse1Log)
data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2 <- data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2 - mean(data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2)
data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log <- data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log - mean(data4$RaceResultByTrainerByTrackType.OddsPlaceInverse2Log)
data4$RaceResultByTrainerByTrackType.ApprovalRateWin <- data4$RaceResultByTrainerByTrackType.ApprovalRateWin - mean(data4$RaceResultByTrainerByTrackType.ApprovalRateWin)
data4$RaceResultByTrainerByTrackType.ApprovalRateWinLog <- data4$RaceResultByTrainerByTrackType.ApprovalRateWinLog - mean(data4$RaceResultByTrainerByTrackType.ApprovalRateWinLog)
data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1 <- data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1 - mean(data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1)
data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log <- data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log - mean(data4$RaceResultByTrainerByTrackType.ApprovalRatePlace1Log)
data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2 <- data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2 - mean(data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2)
data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log <- data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log - mean(data4$RaceResultByTrainerByTrackType.ApprovalRatePlace2Log)
data4$RaceResultByTrainerByTrackType.ExpectedValueWin <- data4$RaceResultByTrainerByTrackType.ExpectedValueWin - mean(data4$RaceResultByTrainerByTrackType.ExpectedValueWin)
data4$RaceResultByTrainerByTrackType.ExpectedValueWinLog <- data4$RaceResultByTrainerByTrackType.ExpectedValueWinLog - mean(data4$RaceResultByTrainerByTrackType.ExpectedValueWinLog)
data4$RaceResultByTrainerByTrackType.ExpectedValuePlace <- data4$RaceResultByTrainerByTrackType.ExpectedValuePlace - mean(data4$RaceResultByTrainerByTrackType.ExpectedValuePlace)
data4$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog <- data4$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog - mean(data4$RaceResultByTrainerByTrackType.ExpectedValuePlaceLog)

# print("summarySE")
# jackpot.DataMining.DmTimeDevValueOfRace.sum <-
# summarySE(data4
# measurevar="DataMining.DmTimeDevValueOfRace"
# groupvars=c("Race.JyokenCd5","Race.JyoCd","Race.JyuryoCd")
# )
# jackpot.DataMining.DmTimeDevValueOfRace.sum
