print(paste0(Sys.time(),  " --- source_scale.R Start ---"))

# -------------------------------------
# Scale
# -------------------------------------
# sink("source.scale.log")
dummy <- 0
# dummy <- 0.5
print("Scale...")
#
# data6$Race.JyoCd <- data6$Race.JyoCd
data6$MasterJyo.IsJyoCd_01 <- data6$MasterJyo.IsJyoCd_01 - dummy
data6$MasterJyo.IsJyoCd_02 <- data6$MasterJyo.IsJyoCd_02 - dummy
data6$MasterJyo.IsJyoCd_03 <- data6$MasterJyo.IsJyoCd_03 - dummy
data6$MasterJyo.IsJyoCd_04 <- data6$MasterJyo.IsJyoCd_04 - dummy
data6$MasterJyo.IsJyoCd_05 <- data6$MasterJyo.IsJyoCd_05 - dummy
data6$MasterJyo.IsJyoCd_06 <- data6$MasterJyo.IsJyoCd_06 - dummy
data6$MasterJyo.IsJyoCd_07 <- data6$MasterJyo.IsJyoCd_07 - dummy
data6$MasterJyo.IsJyoCd_08 <- data6$MasterJyo.IsJyoCd_08 - dummy
data6$MasterJyo.IsJyoCd_09 <- data6$MasterJyo.IsJyoCd_09 - dummy
data6$MasterJyo.IsJyoCd_10 <- data6$MasterJyo.IsJyoCd_10 - dummy
# data6$Race.GradeCd <- data6$Race.GradeCd
data6$MasterGrade.IsGradeCd_G1 <- data6$MasterGrade.IsGradeCd_G1 - dummy
data6$MasterGrade.IsGradeCd_G2 <- data6$MasterGrade.IsGradeCd_G2 - dummy
data6$MasterGrade.IsGradeCd_G3 <- data6$MasterGrade.IsGradeCd_G3 - dummy
data6$MasterGrade.IsGradeCd_Jyusyo <- data6$MasterGrade.IsGradeCd_Jyusyo - dummy
data6$MasterGrade.IsGradeCd_Tokubetu <- data6$MasterGrade.IsGradeCd_Tokubetu - dummy
data6$MasterGrade.IsGradeCd_JG1 <- data6$MasterGrade.IsGradeCd_JG1 - dummy
data6$MasterGrade.IsGradeCd_JG2 <- data6$MasterGrade.IsGradeCd_JG2 - dummy
data6$MasterGrade.IsGradeCd_JG3 <- data6$MasterGrade.IsGradeCd_JG3 - dummy
# data6$Race.KigoCd <- data6$Race.KigoCd
# data6$Race.SyubetuCd <- data6$Race.SyubetuCd
data6$MasterSyubetu.IsSyubetu_11 <- data6$MasterSyubetu.IsSyubetu_11 - dummy
data6$MasterSyubetu.IsSyubetu_12 <- data6$MasterSyubetu.IsSyubetu_12 - dummy
data6$MasterSyubetu.IsSyubetu_13 <- data6$MasterSyubetu.IsSyubetu_13 - dummy
data6$MasterSyubetu.IsSyubetu_14 <- data6$MasterSyubetu.IsSyubetu_14 - dummy
data6$MasterSyubetu.IsSyubetu_18 <- data6$MasterSyubetu.IsSyubetu_18 - dummy
data6$MasterSyubetu.IsSyubetu_19 <- data6$MasterSyubetu.IsSyubetu_19 - dummy
data6$MasterSyubetu.IsSyubetu_21 <- data6$MasterSyubetu.IsSyubetu_21 - dummy
data6$MasterSyubetu.IsSyubetu_22 <- data6$MasterSyubetu.IsSyubetu_22 - dummy
data6$MasterSyubetu.IsSyubetu_23 <- data6$MasterSyubetu.IsSyubetu_23 - dummy
data6$MasterSyubetu.IsSyubetu_24 <- data6$MasterSyubetu.IsSyubetu_24 - dummy
# data6$Race.JyuryoCd <- data6$Race.JyuryoCd
data6$MasterJyuryo.IsJyuryoCd_1 <- data6$MasterJyuryo.IsJyuryoCd_1 - dummy
data6$MasterJyuryo.IsJyuryoCd_2 <- data6$MasterJyuryo.IsJyuryoCd_2 - dummy
data6$MasterJyuryo.IsJyuryoCd_3 <- data6$MasterJyuryo.IsJyuryoCd_3 - dummy
data6$MasterJyuryo.IsJyuryoCd_4 <- data6$MasterJyuryo.IsJyuryoCd_4 - dummy
# data6$Race.JyokenCd5 <- data6$Race.JyokenCd5
data6$MasterJyoken5.IsJyokenCd_701 <- data6$MasterJyoken5.IsJyokenCd_701 - dummy
data6$MasterJyoken5.IsJyokenCd_703 <- data6$MasterJyoken5.IsJyokenCd_703 - dummy
data6$MasterJyoken5.IsJyokenCd_005 <- data6$MasterJyoken5.IsJyokenCd_005 - dummy
data6$MasterJyoken5.IsJyokenCd_010 <- data6$MasterJyoken5.IsJyokenCd_010 - dummy
data6$MasterJyoken5.IsJyokenCd_016 <- data6$MasterJyoken5.IsJyokenCd_016 - dummy
data6$MasterJyoken5.IsJyokenCd_999 <- data6$MasterJyoken5.IsJyokenCd_999 - dummy
# data6$Race.Kyori <- data6$Race.Kyori - scale(data6$Race.Kyori)
data6$MasterKyori.IsKyori_1000 <- data6$MasterKyori.IsKyori_1000 - dummy
data6$MasterKyori.IsKyori_1150 <- data6$MasterKyori.IsKyori_1150 - dummy
data6$MasterKyori.IsKyori_1200 <- data6$MasterKyori.IsKyori_1200 - dummy
data6$MasterKyori.IsKyori_1300 <- data6$MasterKyori.IsKyori_1300 - dummy
data6$MasterKyori.IsKyori_1400 <- data6$MasterKyori.IsKyori_1400 - dummy
data6$MasterKyori.IsKyori_1500 <- data6$MasterKyori.IsKyori_1500 - dummy
data6$MasterKyori.IsKyori_1600 <- data6$MasterKyori.IsKyori_1600 - dummy
data6$MasterKyori.IsKyori_1700 <- data6$MasterKyori.IsKyori_1700 - dummy
data6$MasterKyori.IsKyori_1800 <- data6$MasterKyori.IsKyori_1800 - dummy
data6$MasterKyori.IsKyori_1900 <- data6$MasterKyori.IsKyori_1900 - dummy
data6$MasterKyori.IsKyori_2000 <- data6$MasterKyori.IsKyori_2000 - dummy
data6$MasterKyori.IsKyori_2100 <- data6$MasterKyori.IsKyori_2100 - dummy
data6$MasterKyori.IsKyori_2200 <- data6$MasterKyori.IsKyori_2200 - dummy
data6$MasterKyori.IsKyori_2300 <- data6$MasterKyori.IsKyori_2300 - dummy
data6$MasterKyori.IsKyori_2400 <- data6$MasterKyori.IsKyori_2400 - dummy
data6$MasterKyori.IsKyori_2500 <- data6$MasterKyori.IsKyori_2500 - dummy
data6$MasterKyori.IsKyori_2600 <- data6$MasterKyori.IsKyori_2600 - dummy
data6$MasterKyori.IsKyori_2750 <- data6$MasterKyori.IsKyori_2750 - dummy
data6$MasterKyori.IsKyori_2770 <- data6$MasterKyori.IsKyori_2770 - dummy
data6$MasterKyori.IsKyori_2800 <- data6$MasterKyori.IsKyori_2800 - dummy
data6$MasterKyori.IsKyori_2850 <- data6$MasterKyori.IsKyori_2850 - dummy
data6$MasterKyori.IsKyori_2880 <- data6$MasterKyori.IsKyori_2880 - dummy
data6$MasterKyori.IsKyori_2890 <- data6$MasterKyori.IsKyori_2900 - dummy
data6$MasterKyori.IsKyori_2900 <- data6$MasterKyori.IsKyori_2900 - dummy
data6$MasterKyori.IsKyori_2910 <- data6$MasterKyori.IsKyori_2910 - dummy
data6$MasterKyori.IsKyori_2930 <- data6$MasterKyori.IsKyori_2930 - dummy
data6$MasterKyori.IsKyori_2970 <- data6$MasterKyori.IsKyori_2970 - dummy
data6$MasterKyori.IsKyori_3000 <- data6$MasterKyori.IsKyori_3000 - dummy
data6$MasterKyori.IsKyori_3100 <- data6$MasterKyori.IsKyori_3100 - dummy
data6$MasterKyori.IsKyori_3110 <- data6$MasterKyori.IsKyori_3110 - dummy
data6$MasterKyori.IsKyori_3140 <- data6$MasterKyori.IsKyori_3140 - dummy
data6$MasterKyori.IsKyori_3170 <- data6$MasterKyori.IsKyori_3170 - dummy
data6$MasterKyori.IsKyori_3190 <- data6$MasterKyori.IsKyori_3190 - dummy
data6$MasterKyori.IsKyori_3200 <- data6$MasterKyori.IsKyori_3200 - dummy
data6$MasterKyori.IsKyori_3210 <- data6$MasterKyori.IsKyori_3210 - dummy
data6$MasterKyori.IsKyori_3250 <- data6$MasterKyori.IsKyori_3250 - dummy
data6$MasterKyori.IsKyori_3285 <- data6$MasterKyori.IsKyori_3285 - dummy
data6$MasterKyori.IsKyori_3290 <- data6$MasterKyori.IsKyori_3290 - dummy
data6$MasterKyori.IsKyori_3300 <- data6$MasterKyori.IsKyori_3300 - dummy
data6$MasterKyori.IsKyori_3330 <- data6$MasterKyori.IsKyori_3330 - dummy
data6$MasterKyori.IsKyori_3350 <- data6$MasterKyori.IsKyori_3350 - dummy
data6$MasterKyori.IsKyori_3370 <- data6$MasterKyori.IsKyori_3370 - dummy
data6$MasterKyori.IsKyori_3380 <- data6$MasterKyori.IsKyori_3380 - dummy
data6$MasterKyori.IsKyori_3390 <- data6$MasterKyori.IsKyori_3290 - dummy
data6$MasterKyori.IsKyori_3400 <- data6$MasterKyori.IsKyori_3400 - dummy
data6$MasterKyori.IsKyori_3570 <- data6$MasterKyori.IsKyori_3570 - dummy
data6$MasterKyori.IsKyori_3600 <- data6$MasterKyori.IsKyori_3600 - dummy
data6$MasterKyori.IsKyori_3760 <- data6$MasterKyori.IsKyori_3760 - dummy
data6$MasterKyori.IsKyori_3790 <- data6$MasterKyori.IsKyori_3790 - dummy
data6$MasterKyori.IsKyori_3900 <- data6$MasterKyori.IsKyori_3900 - dummy
data6$MasterKyori.IsKyori_3930 <- data6$MasterKyori.IsKyori_3930 - dummy
data6$MasterKyori.IsKyori_4100 <- data6$MasterKyori.IsKyori_4100 - dummy
data6$MasterKyori.IsKyori_4250 <- data6$MasterKyori.IsKyori_4250 - dummy
data6$MasterKyori.IsKyori_4260 <- data6$MasterKyori.IsKyori_4260 - dummy
# data6$Race.CourseKubunCd <- data6$Race.CourseKubunCd
data6$MasterCourseKubun.IsCourseKubun_SP <- data6$MasterCourseKubun.IsCourseKubun_SP - dummy
data6$MasterCourseKubun.IsCourseKubun_A <- data6$MasterCourseKubun.IsCourseKubun_A - dummy
data6$MasterCourseKubun.IsCourseKubun_B <- data6$MasterCourseKubun.IsCourseKubun_B - dummy
data6$MasterCourseKubun.IsCourseKubun_C <- data6$MasterCourseKubun.IsCourseKubun_C - dummy
data6$MasterCourseKubun.IsCourseKubun_D <- data6$MasterCourseKubun.IsCourseKubun_D - dummy
data6$MasterCourseKubun.IsCourseKubun_E <- data6$MasterCourseKubun.IsCourseKubun_E - dummy
# data6$Race.CourseTypeCd <- data6$Race.CourseTypeCd
data6$MasterCourseType.IsCourseTypeCd_1 <- data6$MasterCourseType.IsCourseTypeCd_1 - dummy
data6$MasterCourseType.IsCourseTypeCd_2 <- data6$MasterCourseType.IsCourseTypeCd_2 - dummy
data6$MasterCourseType.IsCourseTypeCd_3 <- data6$MasterCourseType.IsCourseTypeCd_3 - dummy
data6$MasterCourseType.IsCourseTypeCd_4 <- data6$MasterCourseType.IsCourseTypeCd_4 - dummy
# data6$Race.TenkoCd <- data6$Race.TenkoCd
data6$MasterTenko.IsTenkoCd_1 <- data6$MasterTenko.IsTenkoCd_1 - dummy
data6$MasterTenko.IsTenkoCd_2 <- data6$MasterTenko.IsTenkoCd_2 - dummy
data6$MasterTenko.IsTenkoCd_3 <- data6$MasterTenko.IsTenkoCd_3 - dummy
data6$MasterTenko.IsTenkoCd_4 <- data6$MasterTenko.IsTenkoCd_4 - dummy
data6$MasterTenko.IsTenkoCd_5 <- data6$MasterTenko.IsTenkoCd_5 - dummy
data6$MasterTenko.IsTenkoCd_6 <- data6$MasterTenko.IsTenkoCd_6 - dummy
# data6$Race.TrackCd <- data6$Race.TrackCd
data6$MasterTrack.IsTrackCd_Straight <-  data6$MasterTrack.IsTrackCd_Straight - dummy
data6$MasterTrack.IsTrackCd_Left <- data6$MasterTrack.IsTrackCd_Left - dummy
data6$MasterTrack.IsTrackCd_Right <- data6$MasterTrack.IsTrackCd_Right - dummy
data6$MasterTrack.IsTrackCd_10 <- data6$MasterTrack.IsTrackCd_10 - dummy
data6$MasterTrack.IsTrackCd_11 <- data6$MasterTrack.IsTrackCd_11 - dummy
data6$MasterTrack.IsTrackCd_12 <- data6$MasterTrack.IsTrackCd_12 - dummy
data6$MasterTrack.IsTrackCd_13 <- data6$MasterTrack.IsTrackCd_13 - dummy
data6$MasterTrack.IsTrackCd_14 <- data6$MasterTrack.IsTrackCd_14 - dummy
data6$MasterTrack.IsTrackCd_15 <- data6$MasterTrack.IsTrackCd_15 - dummy
data6$MasterTrack.IsTrackCd_16 <- data6$MasterTrack.IsTrackCd_16 - dummy
data6$MasterTrack.IsTrackCd_17 <- data6$MasterTrack.IsTrackCd_17 - dummy
data6$MasterTrack.IsTrackCd_18 <- data6$MasterTrack.IsTrackCd_18 - dummy
data6$MasterTrack.IsTrackCd_19 <- data6$MasterTrack.IsTrackCd_19 - dummy
data6$MasterTrack.IsTrackCd_20 <- data6$MasterTrack.IsTrackCd_20 - dummy
data6$MasterTrack.IsTrackCd_21 <- data6$MasterTrack.IsTrackCd_21 - dummy
data6$MasterTrack.IsTrackCd_22 <- data6$MasterTrack.IsTrackCd_22 - dummy
data6$MasterTrack.IsTrackCd_23 <- data6$MasterTrack.IsTrackCd_23 - dummy
data6$MasterTrack.IsTrackCd_24 <- data6$MasterTrack.IsTrackCd_24 - dummy
data6$MasterTrack.IsTrackCd_25 <- data6$MasterTrack.IsTrackCd_25 - dummy
data6$MasterTrack.IsTrackCd_26 <- data6$MasterTrack.IsTrackCd_26 - dummy
data6$MasterTrack.IsTrackCd_27 <- data6$MasterTrack.IsTrackCd_27 - dummy
data6$MasterTrack.IsTrackCd_28 <- data6$MasterTrack.IsTrackCd_28 - dummy
data6$MasterTrack.IsTrackCd_29 <- data6$MasterTrack.IsTrackCd_29 - dummy
data6$MasterTrack.IsTrackCd_51 <- data6$MasterTrack.IsTrackCd_51 - dummy
data6$MasterTrack.IsTrackCd_52 <- data6$MasterTrack.IsTrackCd_52 - dummy
data6$MasterTrack.IsTrackCd_53 <- data6$MasterTrack.IsTrackCd_53 - dummy
data6$MasterTrack.IsTrackCd_54 <- data6$MasterTrack.IsTrackCd_54 - dummy
data6$MasterTrack.IsTrackCd_55 <- data6$MasterTrack.IsTrackCd_55 - dummy
data6$MasterTrack.IsTrackCd_56 <- data6$MasterTrack.IsTrackCd_56 - dummy
data6$MasterTrack.IsTrackCd_57 <- data6$MasterTrack.IsTrackCd_57 - dummy
data6$MasterTrack.IsTrackCd_58 <- data6$MasterTrack.IsTrackCd_58 - dummy
data6$MasterTrack.IsTrackCd_59 <- data6$MasterTrack.IsTrackCd_59 - dummy
# data6$Race.TrackTypeCd <- data6$Race.TrackTypeCd
data6$MasterTrackType.IsTrackTypeCd_1 <- data6$MasterTrackType.IsTrackTypeCd_1 - dummy
data6$MasterTrackType.IsTrackTypeCd_2 <- data6$MasterTrackType.IsTrackTypeCd_2 - dummy
data6$MasterTrackType.IsTrackTypeCd_3 <- data6$MasterTrackType.IsTrackTypeCd_3 - dummy
data6$MasterTrackType.IsTrackTypeCd_4 <- data6$MasterTrackType.IsTrackTypeCd_4 - dummy
# data6$Race.TrackConditionCd <- data6$Race.TrackConditionCd
data6$MasterTrackCondition.IsTrackConditionCd_1 <- data6$MasterTrackCondition.IsTrackConditionCd_1 - dummy
data6$MasterTrackCondition.IsTrackConditionCd_2 <- data6$MasterTrackCondition.IsTrackConditionCd_2 - dummy
data6$MasterTrackCondition.IsTrackConditionCd_3 <- data6$MasterTrackCondition.IsTrackConditionCd_3 - dummy
data6$MasterTrackCondition.IsTrackConditionCd_4 <- data6$MasterTrackCondition.IsTrackConditionCd_4 - dummy
data6$Race.S3Avg <- scale(data6$Race.S3Avg)
# data6$Race.SyogaiMileTime <- scale(data6$Race.SyogaiMileTime)
# data6$Race.SmileCd <- data6$Race.SmileCd
data6$MasterSmile.IsSmileCd_S <- data6$MasterSmile.IsSmileCd_S - dummy
data6$MasterSmile.IsSmileCd_M <- data6$MasterSmile.IsSmileCd_M - dummy
data6$MasterSmile.IsSmileCd_I <- data6$MasterSmile.IsSmileCd_I - dummy
data6$MasterSmile.IsSmileCd_L <- data6$MasterSmile.IsSmileCd_L - dummy
data6$MasterSmile.IsSmileCd_E <- data6$MasterSmile.IsSmileCd_E - dummy
# data6$RaceHorse.KettoNum <- data6$RaceHorse.KettoNum
data6$RaceHorse.Wakuban <- scale(data6$RaceHorse.Wakuban)
data6$RaceHorse.Umaban <- scale(data6$RaceHorse.Umaban)
data6$RaceHorse.Kakuteijyuni <- scale(data6$RaceHorse.Kakuteijyuni)
data6$RaceHorse.BaTaijyu <- scale(data6$RaceHorse.BaTaijyu)
data6$RaceHorse.ZogenSa <- scale(data6$RaceHorse.ZogenSa)
data6$RaceHorse.ZogenPercent <- scale(data6$RaceHorse.ZogenPercent)
data6$RaceHorse.Futan <- scale(data6$RaceHorse.Futan)
data6$RaceHorse.FutanPercent <- scale(data6$RaceHorse.FutanPercent)
data6$RaceHorse.IsBlinker <- data6$RaceHorse.IsBlinker - dummy
data6$RaceHorse.Barei <- scale(data6$RaceHorse.Barei)
# data6$RaceHorse.TozaiCd <- data6$RaceHorse.TozaiCd
# data6$RaceHorse.ChokyosiCode <- data6$RaceHorse.ChokyosiCode
# data6$RaceHorse.BanusiCode <- scale(data6$RaceHorse.BanusiCode
# data6$RaceHorse.KisyuCode <- scale(data6$RaceHorse.KisyuCode)
data6$RaceHorse.LifeTime <- scale(data6$RaceHorse.LifeTime)
# data6$RaceHorse.SexCd <- data6$RaceHorse.SexCd
data6$MasterSex.IsSexCd_1 <- data6$MasterSex.IsSexCd_1 - dummy
data6$MasterSex.IsSexCd_2 <- data6$MasterSex.IsSexCd_2 - dummy
data6$MasterSex.IsSexCd_3 <- data6$MasterSex.IsSexCd_3 - dummy
# data6$RaceHorse.HinsyuCd <- data6$RaceHorse.HinsyuCd
# data6$RaceHorse.KeiroCd <- data6$RaceHorse.KeiroCd
data6$MasterKeiro.IsKeiroCd_01 <- data6$MasterKeiro.IsKeiroCd_01 - dummy
data6$MasterKeiro.IsKeiroCd_02 <- data6$MasterKeiro.IsKeiroCd_02 - dummy
data6$MasterKeiro.IsKeiroCd_03 <- data6$MasterKeiro.IsKeiroCd_03 - dummy
data6$MasterKeiro.IsKeiroCd_04 <- data6$MasterKeiro.IsKeiroCd_04 - dummy
data6$MasterKeiro.IsKeiroCd_05 <- data6$MasterKeiro.IsKeiroCd_05 - dummy
data6$MasterKeiro.IsKeiroCd_06 <- data6$MasterKeiro.IsKeiroCd_06 - dummy
data6$MasterKeiro.IsKeiroCd_07 <- data6$MasterKeiro.IsKeiroCd_07 - dummy
data6$MasterKeiro.IsKeiroCd_08 <- data6$MasterKeiro.IsKeiroCd_08 - dummy
data6$MasterKeiro.IsKeiroCd_09 <- data6$MasterKeiro.IsKeiroCd_09 - dummy
data6$MasterKeiro.IsKeiroCd_10 <- data6$MasterKeiro.IsKeiroCd_10 - dummy
data6$MasterKeiro.IsKeiroCd_11 <- data6$MasterKeiro.IsKeiroCd_11 - dummy
# data6$RaceHorse.MinaraiCd <- data6$RaceHorse.MinaraiCd
data6$MasterMinarai.IsMinaraiCd_1 - data6$MasterMinarai.IsMinaraiCd_1 - dummy
data6$MasterMinarai.IsMinaraiCd_2 - data6$MasterMinarai.IsMinaraiCd_2 - dummy
data6$MasterMinarai.IsMinaraiCd_3 - data6$MasterMinarai.IsMinaraiCd_3 - dummy
data6$RaceHorse.Time <- scale(data6$RaceHorse.Time)
data6$RaceHorse.L3 <- scale(data6$RaceHorse.L3)
# data6$RaceHorse.TimeDevValueOfAll <- scale(data6$RaceHorse.TimeDevValueOfAll)
# data6$RaceHorse.L3DevValueOfAll <- scale(data6$RaceHorse.L3DevValueOfAll)
data6$RaceHorse.TrainingH4 <- scale(data6$RaceHorse.TrainingH4)
data6$RaceHorse.TrainingH3 <- scale(data6$RaceHorse.TrainingH3)
data6$RaceHorse.TrainingH2 <- scale(data6$RaceHorse.TrainingH2)
data6$RaceHorse.TrainingL4 <- scale(data6$RaceHorse.TrainingL4)
data6$RaceHorse.TrainingL3 <- scale(data6$RaceHorse.TrainingL3)
data6$RaceHorse.TrainingL2 <- scale(data6$RaceHorse.TrainingL2)
data6$RaceHorse.TrainingL1 <- scale(data6$RaceHorse.TrainingL1)
# data6$RaceHorse.Prev1Time <- scale(data6$RaceHorse.Prev1Time)
# data6$RaceHorse.Prev1StdTime <- scale(data6$RaceHorse.Prev1StdTime)
data6$RaceHorse.Ninki <- scale(data6$RaceHorse.Ninki)
data6$MasterNinki.IsNinki_01 <- data6$MasterNinki.IsNinki_01 - dummy
data6$MasterNinki.IsNinki_02 <- data6$MasterNinki.IsNinki_02 - dummy
data6$MasterNinki.IsNinki_03 <- data6$MasterNinki.IsNinki_03 - dummy
data6$MasterNinki.IsNinki_04 <- data6$MasterNinki.IsNinki_04 - dummy
data6$MasterNinki.IsNinki_05 <- data6$MasterNinki.IsNinki_05 - dummy
data6$MasterNinki.IsNinki_06 <- data6$MasterNinki.IsNinki_06 - dummy
data6$MasterNinki.IsNinki_07 <- data6$MasterNinki.IsNinki_07 - dummy
data6$MasterNinki.IsNinki_08 <- data6$MasterNinki.IsNinki_08 - dummy
data6$MasterNinki.IsNinki_09 <- data6$MasterNinki.IsNinki_09 - dummy
data6$MasterNinki.IsNinki_10 <- data6$MasterNinki.IsNinki_10 - dummy
data6$MasterNinki.IsNinki_11 <- data6$MasterNinki.IsNinki_11 - dummy
data6$MasterNinki.IsNinki_12 <- data6$MasterNinki.IsNinki_12 - dummy
data6$MasterNinki.IsNinki_13 <- data6$MasterNinki.IsNinki_13 - dummy
data6$MasterNinki.IsNinki_14 <- data6$MasterNinki.IsNinki_14 - dummy
data6$MasterNinki.IsNinki_15 <- data6$MasterNinki.IsNinki_15 - dummy
data6$MasterNinki.IsNinki_16 <- data6$MasterNinki.IsNinki_16 - dummy
data6$MasterNinki.IsNinki_17 <- data6$MasterNinki.IsNinki_17 - dummy
data6$MasterNinki.IsNinki_18 <- data6$MasterNinki.IsNinki_18 - dummy
# data6$RaceHorse.HaronTimeL4 <- scale(data6$RaceHorse.HaronTimeL4)
data6$RaceHorse.IsHit_1 <- data6$RaceHorse.IsHit_1 - dummy
data6$RaceHorse.IsHit_12 <- data6$RaceHorse.IsHit_12 - dummy
data6$RaceHorse.IsHit_123 <- data6$RaceHorse.IsHit_123 - dummy
data6$RaceHorseBet.PayoffWin <- scale(data6$RaceHorseBet.PayoffWin)
data6$RaceHorseBet.PayoffWinLog <- scale(data6$RaceHorseBet.PayoffWinLog)
data6$RaceHorseBet.PayoffPlace <- scale(data6$RaceHorseBet.PayoffPlace)
data6$RaceHorseBet.PayoffPlaceLog <- scale(data6$RaceHorseBet.PayoffPlaceLog)
#
data6$Odds1ByWin.BetCount <- scale(data6$Odds1ByWin.BetCount)
data6$Odds1ByWin.TotalBetCount <- scale(data6$Odds1ByWin.TotalBetCount)
data6$Odds1ByWin.Odds1 <- scale(data6$Odds1ByWin.Odds1)
data6$Odds1ByWin.Odds1Log <- scale(data6$Odds1ByWin.Odds1Log)
data6$Odds1ByWin.OddsRate1 <- scale(data6$Odds1ByWin.OddsRate1)
data6$Odds1ByWin.OddsInverse1 <- scale(data6$Odds1ByWin.OddsInverse1)
data6$Odds1ByWin.OddsInverse1Log <- scale(data6$Odds1ByWin.OddsInverse1Log)
data6$Odds1ByWin.ApprovalRateWin <- scale(data6$Odds1ByWin.ApprovalRateWin)
data6$Odds1ByWin.ApprovalRateWinLog <- scale(data6$Odds1ByWin.ApprovalRateWinLog)
data6$Odds1ByWin.BetCountLog <- scale(data6$Odds1ByWin.BetCountLog)
data6$Odds1ByWin.TotalBetCountLog <- scale(data6$Odds1ByWin.TotalBetCountLog)
#
# data6$Odds1ByPlace.BetCount <- scale(data6$Odds1ByPlace.BetCount)
# data6$Odds1ByPlace.TotalBetCount <- scale(data6$Odds1ByPlace.TotalBetCount)
data6$Odds1ByPlace.Odds1 <- scale(data6$Odds1ByPlace.Odds1)
data6$Odds1ByPlace.Odds1Log <- scale(data6$Odds1ByPlace.Odds1Log)
data6$Odds1ByPlace.Odds2 <- scale(data6$Odds1ByPlace.Odds2)
data6$Odds1ByPlace.Odds2Log <- scale(data6$Odds1ByPlace.Odds2Log)
data6$Odds1ByPlace.OddsRate1 <- scale(data6$Odds1ByPlace.OddsRate1)
data6$Odds1ByPlace.OddsRate2 <- scale(data6$Odds1ByPlace.OddsRate2)
data6$Odds1ByPlace.OddsInverse1 <- scale(data6$Odds1ByPlace.OddsInverse1)
data6$Odds1ByPlace.OddsInverse1Log <- scale(data6$Odds1ByPlace.OddsInverse1Log)
data6$Odds1ByPlace.OddsInverse2 <- scale(data6$Odds1ByPlace.OddsInverse2)
data6$Odds1ByPlace.OddsInverse2Log <- scale(data6$Odds1ByPlace.OddsInverse2Log)
data6$Odds1ByPlace.ApprovalRatePlace1 <- scale(data6$Odds1ByPlace.ApprovalRatePlace1)
data6$Odds1ByPlace.ApprovalRatePlace1Log <- scale(data6$Odds1ByPlace.ApprovalRatePlace1Log)
data6$Odds1ByPlace.ApprovalRatePlace2 <- scale(data6$Odds1ByPlace.ApprovalRatePlace2)
data6$Odds1ByPlace.ApprovalRatePlace2Log <- scale(data6$Odds1ByPlace.ApprovalRatePlace2Log)
#
data6$DataMining.DmTime <- scale(data6$DataMining.DmTime)
data6$DataMining.DmTimeP <- scale(data6$DataMining.DmTimeP)
data6$DataMining.DmTimeM <- scale(data6$DataMining.DmTimeM)
data6$DataMining.DmTimeDevValueOfRace <- scale(data6$DataMining.DmTimeDevValueOfRace)
#
data6$DataMiningTaisen.TmScore <- scale(data6$DataMiningTaisen.TmScore)
data6$DataMiningTaisen.TmScoreDevValueOfRace <- scale(data6$DataMiningTaisen.TmScoreDevValueOfRace)
#
data6$RaceResultByBanusi.HonSyokinTotal <- scale(data6$RaceResultByBanusi.HonSyokinTotal)
data6$RaceResultByBanusi.HonSyokinTotalLog <- scale(data6$RaceResultByBanusi.HonSyokinTotalLog)
data6$RaceResultByBanusi.FukaSyokin <- scale(data6$RaceResultByBanusi.FukaSyokin)
data6$RaceResultByBanusi.FukaSyokinLog <- scale(data6$RaceResultByBanusi.FukaSyokinLog)
#
data6$RaceResultByBanusiByTotal.RunCount <- scale(data6$RaceResultByBanusiByTotal.RunCount)
data6$RaceResultByBanusiByTotal.RunCountLog <- scale(data6$RaceResultByBanusiByTotal.RunCountLog)
data6$RaceResultByBanusiByTotal.HitCount1 <- scale(data6$RaceResultByBanusiByTotal.HitCount1)
data6$RaceResultByBanusiByTotal.HitCount1Log <- scale(data6$RaceResultByBanusiByTotal.HitCount1Log)
data6$RaceResultByBanusiByTotal.HitRate1 <- scale(data6$RaceResultByBanusiByTotal.HitRate1)
data6$RaceResultByBanusiByTotal.HitRate1Log <- scale(data6$RaceResultByBanusiByTotal.HitRate1Log)
data6$RaceResultByBanusiByTotal.HitCount2 <- scale(data6$RaceResultByBanusiByTotal.HitCount2)
data6$RaceResultByBanusiByTotal.HitCount2Log <- scale(data6$RaceResultByBanusiByTotal.HitCount2Log)
data6$RaceResultByBanusiByTotal.HitRate2 <- scale(data6$RaceResultByBanusiByTotal.HitRate2)
data6$RaceResultByBanusiByTotal.HitRate2Log <- scale(data6$RaceResultByBanusiByTotal.HitRate2Log)
data6$RaceResultByBanusiByTotal.HitCount3 <- scale(data6$RaceResultByBanusiByTotal.HitCount3)
data6$RaceResultByBanusiByTotal.HitCount3Log <- scale(data6$RaceResultByBanusiByTotal.HitCount3Log)
data6$RaceResultByBanusiByTotal.HitRate3 <- scale(data6$RaceResultByBanusiByTotal.HitRate3)
data6$RaceResultByBanusiByTotal.HitRate3Log <- scale(data6$RaceResultByBanusiByTotal.HitRate3Log)
data6$RaceResultByBanusiByTotal.HitCount4 <- scale(data6$RaceResultByBanusiByTotal.HitCount4)
data6$RaceResultByBanusiByTotal.HitCount4Log <- scale(data6$RaceResultByBanusiByTotal.HitCount4Log)
data6$RaceResultByBanusiByTotal.HitRate4 <- scale(data6$RaceResultByBanusiByTotal.HitRate4)
data6$RaceResultByBanusiByTotal.HitRate4Log <- scale(data6$RaceResultByBanusiByTotal.HitRate4Log)
data6$RaceResultByBanusiByTotal.HitCount5 <- scale(data6$RaceResultByBanusiByTotal.HitCount5)
data6$RaceResultByBanusiByTotal.HitCount5Log <- scale(data6$RaceResultByBanusiByTotal.HitCount5Log)
data6$RaceResultByBanusiByTotal.HitRate5 <- scale(data6$RaceResultByBanusiByTotal.HitRate5)
data6$RaceResultByBanusiByTotal.HitRate5Log <- scale(data6$RaceResultByBanusiByTotal.HitRate5Log)
data6$RaceResultByBanusiByTotal.HitCount6 <- scale(data6$RaceResultByBanusiByTotal.HitCount6)
data6$RaceResultByBanusiByTotal.HitCount6Log <- scale(data6$RaceResultByBanusiByTotal.HitCount6Log)
data6$RaceResultByBanusiByTotal.HitRate6 <- scale(data6$RaceResultByBanusiByTotal.HitRate6)
data6$RaceResultByBanusiByTotal.HitRate6Log <- scale(data6$RaceResultByBanusiByTotal.HitRate6Log)
data6$RaceResultByBanusiByTotal.HitCount12 <- scale(data6$RaceResultByBanusiByTotal.HitCount12)
data6$RaceResultByBanusiByTotal.HitCount12Log <- scale(data6$RaceResultByBanusiByTotal.HitCount12Log)
data6$RaceResultByBanusiByTotal.HitRate12 <- scale(data6$RaceResultByBanusiByTotal.HitRate12)
data6$RaceResultByBanusiByTotal.HitRate12Log <- scale(data6$RaceResultByBanusiByTotal.HitRate12Log)
data6$RaceResultByBanusiByTotal.HitCount123 <- scale(data6$RaceResultByBanusiByTotal.HitCount123)
data6$RaceResultByBanusiByTotal.HitCount123Log <- scale(data6$RaceResultByBanusiByTotal.HitCount123Log)
data6$RaceResultByBanusiByTotal.HitRate123 <- scale(data6$RaceResultByBanusiByTotal.HitRate123)
data6$RaceResultByBanusiByTotal.HitRate123Log <- scale(data6$RaceResultByBanusiByTotal.HitRate123Log)
#
data6$RaceResultByBreeder.HonSyokinTotal <- data6$RaceResultByBreeder.HonSyokinTotal - scale(data6$RaceResultByBreeder.HonSyokinTotal)
data6$RaceResultByBreeder.HonSyokinTotalLog <- data6$RaceResultByBreeder.HonSyokinTotalLog - scale(data6$RaceResultByBreeder.HonSyokinTotalLog)
data6$RaceResultByBreeder.FukaSyokin <- data6$RaceResultByBreeder.FukaSyokin - scale(data6$RaceResultByBreeder.FukaSyokin)
data6$RaceResultByBreeder.FukaSyokinLog <- data6$RaceResultByBreeder.FukaSyokinLog - scale(data6$RaceResultByBreeder.FukaSyokinLog)
#
data6$RaceResultByBreederByTotal.RunCount <- scale(data6$RaceResultByBreederByTotal.RunCount)
data6$RaceResultByBreederByTotal.RunCountLog <- scale(data6$RaceResultByBreederByTotal.RunCountLog)
data6$RaceResultByBreederByTotal.HitCount1 <- scale(data6$RaceResultByBreederByTotal.HitCount1)
data6$RaceResultByBreederByTotal.HitCount1Log <- scale(data6$RaceResultByBreederByTotal.HitCount1Log)
data6$RaceResultByBreederByTotal.HitRate1 <- scale(data6$RaceResultByBreederByTotal.HitRate1)
data6$RaceResultByBreederByTotal.HitRate1Log <- scale(data6$RaceResultByBreederByTotal.HitRate1Log)
data6$RaceResultByBreederByTotal.HitCount2 <- scale(data6$RaceResultByBreederByTotal.HitCount2)
data6$RaceResultByBreederByTotal.HitCount2Log <- scale(data6$RaceResultByBreederByTotal.HitCount2Log)
data6$RaceResultByBreederByTotal.HitRate2 <- scale(data6$RaceResultByBreederByTotal.HitRate2)
data6$RaceResultByBreederByTotal.HitRate2Log <- scale(data6$RaceResultByBreederByTotal.HitRate2Log)
data6$RaceResultByBreederByTotal.HitCount3 <- scale(data6$RaceResultByBreederByTotal.HitCount3)
data6$RaceResultByBreederByTotal.HitCount3Log <- scale(data6$RaceResultByBreederByTotal.HitCount3Log)
data6$RaceResultByBreederByTotal.HitRate3 <- scale(data6$RaceResultByBreederByTotal.HitRate3)
data6$RaceResultByBreederByTotal.HitRate3Log <- scale(data6$RaceResultByBreederByTotal.HitRate3Log)
data6$RaceResultByBreederByTotal.HitCount4 <- scale(data6$RaceResultByBreederByTotal.HitCount4)
data6$RaceResultByBreederByTotal.HitCount4Log <- scale(data6$RaceResultByBreederByTotal.HitCount4Log)
data6$RaceResultByBreederByTotal.HitRate4 <- scale(data6$RaceResultByBreederByTotal.HitRate4)
data6$RaceResultByBreederByTotal.HitRate4Log <- scale(data6$RaceResultByBreederByTotal.HitRate4Log)
data6$RaceResultByBreederByTotal.HitCount5 <- scale(data6$RaceResultByBreederByTotal.HitCount5)
data6$RaceResultByBreederByTotal.HitCount5Log <- scale(data6$RaceResultByBreederByTotal.HitCount5Log)
data6$RaceResultByBreederByTotal.HitRate5 <- scale(data6$RaceResultByBreederByTotal.HitRate5)
data6$RaceResultByBreederByTotal.HitRate5Log <- scale(data6$RaceResultByBreederByTotal.HitRate5Log)
data6$RaceResultByBreederByTotal.HitCount6 <- scale(data6$RaceResultByBreederByTotal.HitCount6)
data6$RaceResultByBreederByTotal.HitCount6Log <- scale(data6$RaceResultByBreederByTotal.HitCount6Log)
data6$RaceResultByBreederByTotal.HitRate6 <- scale(data6$RaceResultByBreederByTotal.HitRate6)
data6$RaceResultByBreederByTotal.HitRate6Log <- scale(data6$RaceResultByBreederByTotal.HitRate6Log)
data6$RaceResultByBreederByTotal.HitCount12 <- scale(data6$RaceResultByBreederByTotal.HitCount12)
data6$RaceResultByBreederByTotal.HitCount12Log <- scale(data6$RaceResultByBreederByTotal.HitCount12Log)
data6$RaceResultByBreederByTotal.HitRate12 <- scale(data6$RaceResultByBreederByTotal.HitRate12)
data6$RaceResultByBreederByTotal.HitRate12Log <- scale(data6$RaceResultByBreederByTotal.HitRate12Log)
data6$RaceResultByBreederByTotal.HitCount123 <- scale(data6$RaceResultByBreederByTotal.HitCount123)
data6$RaceResultByBreederByTotal.HitCount123Log <- scale(data6$RaceResultByBreederByTotal.HitCount123Log)
data6$RaceResultByBreederByTotal.HitRate123 <- scale(data6$RaceResultByBreederByTotal.HitRate123)
data6$RaceResultByBreederByTotal.HitRate123Log <- scale(data6$RaceResultByBreederByTotal.HitRate123Log)#
#
data6$RaceResultByHorse.RuikeiHonsyoHeiti <- scale(data6$RaceResultByHorse.RuikeiHonsyoHeiti)
data6$RaceResultByHorse.RuikeiHonsyoHeitiLog <- scale(data6$RaceResultByHorse.RuikeiHonsyoHeitiLog)
data6$RaceResultByHorse.RuikeiHonsyoSyogai <- scale(data6$RaceResultByHorse.RuikeiHonsyoSyogai)
data6$RaceResultByHorse.RuikeiHonsyoSyogaiLog <- scale(data6$RaceResultByHorse.RuikeiHonsyoSyogaiLog)
#
data6$RaceResultByHorseByRunningStyle.RunningStyleAvg <- scale(data6$RaceResultByHorseByRunningStyle.RunningStyleAvg)
data6$RaceResultByHorseByRunningStyle.HitRate1 <- scale(data6$RaceResultByHorseByRunningStyle.HitRate1)
data6$RaceResultByHorseByRunningStyle.HitRate1Log <- scale(data6$RaceResultByHorseByRunningStyle.HitRate1Log)
data6$RaceResultByHorseByRunningStyle.HitRate2 <- scale(data6$RaceResultByHorseByRunningStyle.HitRate2)
data6$RaceResultByHorseByRunningStyle.HitRate2Log <- scale(data6$RaceResultByHorseByRunningStyle.HitRate2Log)
data6$RaceResultByHorseByRunningStyle.HitRate3 <- scale(data6$RaceResultByHorseByRunningStyle.HitRate3)
data6$RaceResultByHorseByRunningStyle.HitRate3Log <- scale(data6$RaceResultByHorseByRunningStyle.HitRate3Log)
data6$RaceResultByHorseByRunningStyle.HitRate4 <- scale(data6$RaceResultByHorseByRunningStyle.HitRate4)
data6$RaceResultByHorseByRunningStyle.HitRate4Log <- scale(data6$RaceResultByHorseByRunningStyle.HitRate4Log)
#
data6$RaceResultByHorseByTotal.RunCount <- scale(data6$RaceResultByHorseByTotal.RunCount)
data6$RaceResultByHorseByTotal.RunCountLog <- scale(data6$RaceResultByHorseByTotal.RunCountLog)
data6$RaceResultByHorseByTotal.HitCount1 <- scale(data6$RaceResultByHorseByTotal.HitCount1)
data6$RaceResultByHorseByTotal.HitCount1Log <- scale(data6$RaceResultByHorseByTotal.HitCount1Log)
data6$RaceResultByHorseByTotal.HitRate1 <- scale(data6$RaceResultByHorseByTotal.HitRate1)
data6$RaceResultByHorseByTotal.HitRate1Log <- scale(data6$RaceResultByHorseByTotal.HitRate1Log)
data6$RaceResultByHorseByTotal.HitCount2 <- scale(data6$RaceResultByHorseByTotal.HitCount2)
data6$RaceResultByHorseByTotal.HitCount2Log <- scale(data6$RaceResultByHorseByTotal.HitCount2Log)
data6$RaceResultByHorseByTotal.HitRate2 <- scale(data6$RaceResultByHorseByTotal.HitRate2)
data6$RaceResultByHorseByTotal.HitRate2Log <- scale(data6$RaceResultByHorseByTotal.HitRate2Log)
data6$RaceResultByHorseByTotal.HitCount3 <- scale(data6$RaceResultByHorseByTotal.HitCount3)
data6$RaceResultByHorseByTotal.HitCount3Log <- scale(data6$RaceResultByHorseByTotal.HitCount3Log)
data6$RaceResultByHorseByTotal.HitRate3 <- scale(data6$RaceResultByHorseByTotal.HitRate3)
data6$RaceResultByHorseByTotal.HitRate3Log <- scale(data6$RaceResultByHorseByTotal.HitRate3Log)
data6$RaceResultByHorseByTotal.HitCount4 <- scale(data6$RaceResultByHorseByTotal.HitCount4)
data6$RaceResultByHorseByTotal.HitCount4Log <- scale(data6$RaceResultByHorseByTotal.HitCount4Log)
data6$RaceResultByHorseByTotal.HitRate4 <- scale(data6$RaceResultByHorseByTotal.HitRate4)
data6$RaceResultByHorseByTotal.HitRate4Log <- scale(data6$RaceResultByHorseByTotal.HitRate4Log)
data6$RaceResultByHorseByTotal.HitCount5 <- scale(data6$RaceResultByHorseByTotal.HitCount5)
data6$RaceResultByHorseByTotal.HitCount5Log <- scale(data6$RaceResultByHorseByTotal.HitCount5Log)
data6$RaceResultByHorseByTotal.HitRate5 <- scale(data6$RaceResultByHorseByTotal.HitRate5)
data6$RaceResultByHorseByTotal.HitRate5Log <- scale(data6$RaceResultByHorseByTotal.HitRate5Log)
data6$RaceResultByHorseByTotal.HitCount6 <- scale(data6$RaceResultByHorseByTotal.HitCount6)
data6$RaceResultByHorseByTotal.HitCount6Log <- scale(data6$RaceResultByHorseByTotal.HitCount6Log)
data6$RaceResultByHorseByTotal.HitRate6 <- scale(data6$RaceResultByHorseByTotal.HitRate6)
data6$RaceResultByHorseByTotal.HitRate6Log <- scale(data6$RaceResultByHorseByTotal.HitRate6Log)
data6$RaceResultByHorseByTotal.HitCount12 <- scale(data6$RaceResultByHorseByTotal.HitCount12)
data6$RaceResultByHorseByTotal.HitCount12Log <- scale(data6$RaceResultByHorseByTotal.HitCount12Log)
data6$RaceResultByHorseByTotal.HitRate12 <- scale(data6$RaceResultByHorseByTotal.HitRate12)
data6$RaceResultByHorseByTotal.HitRate12Log <- scale(data6$RaceResultByHorseByTotal.HitRate12Log)
data6$RaceResultByHorseByTotal.HitCount123 <- scale(data6$RaceResultByHorseByTotal.HitCount123)
data6$RaceResultByHorseByTotal.HitCount123Log <- scale(data6$RaceResultByHorseByTotal.HitCount123Log)
data6$RaceResultByHorseByTotal.HitRate123 <- scale(data6$RaceResultByHorseByTotal.HitRate123)
data6$RaceResultByHorseByTotal.HitRate123Log <- scale(data6$RaceResultByHorseByTotal.HitRate123Log)
data6$RaceResultByHorseByTotal.RaceCount <- scale(data6$RaceResultByHorseByTotal.RaceCount)
data6$RaceResultByHorseByTotal.OddsWinAvg <- scale(data6$RaceResultByHorseByTotal.OddsWinAvg)
data6$RaceResultByHorseByTotal.OddsWinLogAvg <- scale(data6$RaceResultByHorseByTotal.OddsWinLogAvg)
data6$RaceResultByHorseByTotal.OddsPlace1Avg <- scale(data6$RaceResultByHorseByTotal.OddsPlace1Avg)
data6$RaceResultByHorseByTotal.OddsPlace1LogAvg <- scale(data6$RaceResultByHorseByTotal.OddsPlace1LogAvg)
data6$RaceResultByHorseByTotal.OddsPlace2Avg <- scale(data6$RaceResultByHorseByTotal.OddsPlace2Avg)
data6$RaceResultByHorseByTotal.OddsPlace2LogAvg <- scale(data6$RaceResultByHorseByTotal.OddsPlace2LogAvg)
data6$RaceResultByHorseByTotal.OddsWinInverseAvg <- scale(data6$RaceResultByHorseByTotal.OddsWinInverseAvg)
data6$RaceResultByHorseByTotal.OddsWinInverseLogAvg <- scale(data6$RaceResultByHorseByTotal.OddsWinInverseLogAvg)
data6$RaceResultByHorseByTotal.OddsPlaceInverse1Avg <- scale(data6$RaceResultByHorseByTotal.OddsPlaceInverse1Avg)
data6$RaceResultByHorseByTotal.OddsPlaceInverse1LogAvg <- scale(data6$RaceResultByHorseByTotal.OddsPlaceInverse1LogAvg)
data6$RaceResultByHorseByTotal.OddsPlaceInverse2Avg <- scale(data6$RaceResultByHorseByTotal.OddsPlaceInverse2Avg)
data6$RaceResultByHorseByTotal.OddsPlaceInverse2LogAvg <- scale(data6$RaceResultByHorseByTotal.OddsPlaceInverse2LogAvg)
data6$RaceResultByHorseByTotal.ApprovalRateWinAvg <- scale(data6$RaceResultByHorseByTotal.ApprovalRateWinAvg)
data6$RaceResultByHorseByTotal.ApprovalRateWinLogAvg <- scale(data6$RaceResultByHorseByTotal.ApprovalRateWinLogAvg)
data6$RaceResultByHorseByTotal.ApprovalRatePlace1Avg <- scale(data6$RaceResultByHorseByTotal.ApprovalRatePlace1Avg)
data6$RaceResultByHorseByTotal.ApprovalRatePlace1LogAvg <- scale(data6$RaceResultByHorseByTotal.ApprovalRatePlace1LogAvg)
data6$RaceResultByHorseByTotal.ApprovalRatePlace2Avg <- scale(data6$RaceResultByHorseByTotal.ApprovalRatePlace2Avg)
data6$RaceResultByHorseByTotal.ApprovalRatePlace2LogAvg <- scale(data6$RaceResultByHorseByTotal.ApprovalRatePlace2LogAvg)
data6$RaceResultByHorseByTotal.ExpectedValueWinAvg <- scale(data6$RaceResultByHorseByTotal.ExpectedValueWinAvg)
data6$RaceResultByHorseByTotal.ExpectedValueWinLogAvg <- scale(data6$RaceResultByHorseByTotal.ExpectedValueWinLogAvg)
data6$RaceResultByHorseByTotal.ExpectedValuePlaceAvg <- scale(data6$RaceResultByHorseByTotal.ExpectedValuePlaceAvg)
data6$RaceResultByHorseByTotal.ExpectedValuePlaceLogAvg <- scale(data6$RaceResultByHorseByTotal.ExpectedValuePlaceLogAvg)
data6$RaceResultByHorseByTotal.TimeDevValueOfAllAvg <- scale(data6$RaceResultByHorseByTotal.TimeDevValueOfAllAvg)
data6$RaceResultByHorseByTotal.TimeDevValueOfAllMax <- scale(data6$RaceResultByHorseByTotal.TimeDevValueOfAllMax)
data6$RaceResultByHorseByTotal.TimeDevValueOfAllMin <- scale(data6$RaceResultByHorseByTotal.TimeDevValueOfAllMin)
data6$RaceResultByHorseByTotal.L3DevValueOfAllAvg <- scale(data6$RaceResultByHorseByTotal.L3DevValueOfAllAvg)
data6$RaceResultByHorseByTotal.L3DevValueOfAllMax <- scale(data6$RaceResultByHorseByTotal.L3DevValueOfAllMax)
data6$RaceResultByHorseByTotal.L3DevValueOfAllMin <- scale(data6$RaceResultByHorseByTotal.L3DevValueOfAllMin)
#
data6$RaceResultByJocky.HonSyokinHeichi <- scale(data6$RaceResultByJocky.HonSyokinHeichi)
data6$RaceResultByJocky.HonSyokinHeichiLog <- scale(data6$RaceResultByJocky.HonSyokinHeichiLog)
data6$RaceResultByJocky.HonSyokinSyogai <- scale(data6$RaceResultByJocky.HonSyokinSyogai)
data6$RaceResultByJocky.HonSyokinSyogaiLog <- scale(data6$RaceResultByJocky.HonSyokinSyogaiLog)
#
data6$RaceResultByJockyByTrackType.RunCount <- scale(data6$RaceResultByJockyByTrackType.RunCount)
data6$RaceResultByJockyByTrackType.RunCountLog <- scale(data6$RaceResultByJockyByTrackType.RunCountLog)
data6$RaceResultByJockyByTrackType.HitCount1 <- scale(data6$RaceResultByJockyByTrackType.HitCount1)
data6$RaceResultByJockyByTrackType.HitCount1Log <- scale(data6$RaceResultByJockyByTrackType.HitCount1Log)
data6$RaceResultByJockyByTrackType.HitRate1 <- scale(data6$RaceResultByJockyByTrackType.HitRate1)
data6$RaceResultByJockyByTrackType.HitRate1Log <- scale(data6$RaceResultByJockyByTrackType.HitRate1Log)
data6$RaceResultByJockyByTrackType.HitCount2 <- scale(data6$RaceResultByJockyByTrackType.HitCount2)
data6$RaceResultByJockyByTrackType.HitCount2Log <- scale(data6$RaceResultByJockyByTrackType.HitCount2Log)
data6$RaceResultByJockyByTrackType.HitRate2 <- scale(data6$RaceResultByJockyByTrackType.HitRate2)
data6$RaceResultByJockyByTrackType.HitRate2Log <- scale(data6$RaceResultByJockyByTrackType.HitRate2Log)
data6$RaceResultByJockyByTrackType.HitCount3 <- scale(data6$RaceResultByJockyByTrackType.HitCount3)
data6$RaceResultByJockyByTrackType.HitCount3Log <- scale(data6$RaceResultByJockyByTrackType.HitCount3Log)
data6$RaceResultByJockyByTrackType.HitRate3 <- scale(data6$RaceResultByJockyByTrackType.HitRate3)
data6$RaceResultByJockyByTrackType.HitRate3Log <- scale(data6$RaceResultByJockyByTrackType.HitRate3Log)
data6$RaceResultByJockyByTrackType.HitCount4 <- scale(data6$RaceResultByJockyByTrackType.HitCount4)
data6$RaceResultByJockyByTrackType.HitCount4Log <- scale(data6$RaceResultByJockyByTrackType.HitCount4Log)
data6$RaceResultByJockyByTrackType.HitRate4 <- scale(data6$RaceResultByJockyByTrackType.HitRate4)
data6$RaceResultByJockyByTrackType.HitRate4Log <- scale(data6$RaceResultByJockyByTrackType.HitRate4Log)
data6$RaceResultByJockyByTrackType.HitCount5 <- scale(data6$RaceResultByJockyByTrackType.HitCount5)
data6$RaceResultByJockyByTrackType.HitCount5Log <- scale(data6$RaceResultByJockyByTrackType.HitCount5Log)
data6$RaceResultByJockyByTrackType.HitRate5 <- scale(data6$RaceResultByJockyByTrackType.HitRate5)
data6$RaceResultByJockyByTrackType.HitRate5Log <- scale(data6$RaceResultByJockyByTrackType.HitRate5Log)
data6$RaceResultByJockyByTrackType.HitCount6 <- scale(data6$RaceResultByJockyByTrackType.HitCount6)
data6$RaceResultByJockyByTrackType.HitCount6Log <- scale(data6$RaceResultByJockyByTrackType.HitCount6Log)
data6$RaceResultByJockyByTrackType.HitRate6 <- scale(data6$RaceResultByJockyByTrackType.HitRate6)
data6$RaceResultByJockyByTrackType.HitRate6Log <- scale(data6$RaceResultByJockyByTrackType.HitRate6Log)
data6$RaceResultByJockyByTrackType.HitCount12 <- scale(data6$RaceResultByJockyByTrackType.HitCount12)
data6$RaceResultByJockyByTrackType.HitCount12Log <- scale(data6$RaceResultByJockyByTrackType.HitCount12Log)
data6$RaceResultByJockyByTrackType.HitRate12 <- scale(data6$RaceResultByJockyByTrackType.HitRate12)
data6$RaceResultByJockyByTrackType.HitRate12Log <- scale(data6$RaceResultByJockyByTrackType.HitRate12Log)
data6$RaceResultByJockyByTrackType.HitCount123 <- scale(data6$RaceResultByJockyByTrackType.HitCount123)
data6$RaceResultByJockyByTrackType.HitCount123Log <- scale(data6$RaceResultByJockyByTrackType.HitCount123Log)
data6$RaceResultByJockyByTrackType.HitRate123 <- scale(data6$RaceResultByJockyByTrackType.HitRate123)
data6$RaceResultByJockyByTrackType.HitRate123Log <- scale(data6$RaceResultByJockyByTrackType.HitRate123Log)
#
data6$RaceResultByTrainer.HonSyokinHeichi <- scale(data6$RaceResultByTrainer.HonSyokinHeichi)
data6$RaceResultByTrainer.HonSyokinHeichiLog <- scale(data6$RaceResultByTrainer.HonSyokinHeichiLog)
data6$RaceResultByTrainer.HonSyokinSyogai <- scale(data6$RaceResultByTrainer.HonSyokinSyogai)
data6$RaceResultByTrainer.HonSyokinSyogaiLog <- scale(data6$RaceResultByTrainer.HonSyokinSyogaiLog)
#
data6$RaceResultByTrainerByTrackType.RunCount <- scale(data6$RaceResultByTrainerByTrackType.RunCount)
data6$RaceResultByTrainerByTrackType.RunCountLog <- scale(data6$RaceResultByTrainerByTrackType.RunCountLog)
data6$RaceResultByTrainerByTrackType.HitCount1 <- scale(data6$RaceResultByTrainerByTrackType.HitCount1)
data6$RaceResultByTrainerByTrackType.HitCount1Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount1Log)
data6$RaceResultByTrainerByTrackType.HitRate1 <- scale(data6$RaceResultByTrainerByTrackType.HitRate1)
data6$RaceResultByTrainerByTrackType.HitRate1Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate1Log)
data6$RaceResultByTrainerByTrackType.HitCount2 <- scale(data6$RaceResultByTrainerByTrackType.HitCount2)
data6$RaceResultByTrainerByTrackType.HitCount2Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount2Log)
data6$RaceResultByTrainerByTrackType.HitRate2 <- scale(data6$RaceResultByTrainerByTrackType.HitRate2)
data6$RaceResultByTrainerByTrackType.HitRate2Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate2Log)
data6$RaceResultByTrainerByTrackType.HitCount3 <- scale(data6$RaceResultByTrainerByTrackType.HitCount3)
data6$RaceResultByTrainerByTrackType.HitCount3Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount3Log)
data6$RaceResultByTrainerByTrackType.HitRate3 <- scale(data6$RaceResultByTrainerByTrackType.HitRate3)
data6$RaceResultByTrainerByTrackType.HitRate3Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate3Log)
data6$RaceResultByTrainerByTrackType.HitCount4 <- scale(data6$RaceResultByTrainerByTrackType.HitCount4)
data6$RaceResultByTrainerByTrackType.HitCount4Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount4Log)
data6$RaceResultByTrainerByTrackType.HitRate4 <- scale(data6$RaceResultByTrainerByTrackType.HitRate4)
data6$RaceResultByTrainerByTrackType.HitRate4Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate4Log)
data6$RaceResultByTrainerByTrackType.HitCount5 <- scale(data6$RaceResultByTrainerByTrackType.HitCount5)
data6$RaceResultByTrainerByTrackType.HitCount5Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount5Log)
data6$RaceResultByTrainerByTrackType.HitRate5 <- scale(data6$RaceResultByTrainerByTrackType.HitRate5)
data6$RaceResultByTrainerByTrackType.HitRate5Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate5Log)
data6$RaceResultByTrainerByTrackType.HitCount6 <- scale(data6$RaceResultByTrainerByTrackType.HitCount6)
data6$RaceResultByTrainerByTrackType.HitCount6Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount6Log)
data6$RaceResultByTrainerByTrackType.HitRate6 <- scale(data6$RaceResultByTrainerByTrackType.HitRate6)
data6$RaceResultByTrainerByTrackType.HitRate6Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate6Log)
data6$RaceResultByTrainerByTrackType.HitCount12 <- scale(data6$RaceResultByTrainerByTrackType.HitCount12)
data6$RaceResultByTrainerByTrackType.HitCount12Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount12Log)
data6$RaceResultByTrainerByTrackType.HitRate12 <- scale(data6$RaceResultByTrainerByTrackType.HitRate12)
data6$RaceResultByTrainerByTrackType.HitRate12Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate12Log)
data6$RaceResultByTrainerByTrackType.HitCount123 <- scale(data6$RaceResultByTrainerByTrackType.HitCount123)
data6$RaceResultByTrainerByTrackType.HitCount123Log <- scale(data6$RaceResultByTrainerByTrackType.HitCount123Log)
data6$RaceResultByTrainerByTrackType.HitRate123 <- scale(data6$RaceResultByTrainerByTrackType.HitRate123)
data6$RaceResultByTrainerByTrackType.HitRate123Log <- scale(data6$RaceResultByTrainerByTrackType.HitRate123Log)
#
data6$RaceResultOfChildrenByTotal01.RunCount <- scale(data6$RaceResultOfChildrenByTotal01.RunCount)
data6$RaceResultOfChildrenByTotal01.RunCountLog <- scale(data6$RaceResultOfChildrenByTotal01.RunCountLog)
data6$RaceResultOfChildrenByTotal01.HitCount1 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount1)
data6$RaceResultOfChildrenByTotal01.HitCount1Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount1Log)
data6$RaceResultOfChildrenByTotal01.HitRate1 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate1)
data6$RaceResultOfChildrenByTotal01.HitRate1Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate1Log)
data6$RaceResultOfChildrenByTotal01.HitCount2 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount2)
data6$RaceResultOfChildrenByTotal01.HitCount2Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount2Log)
data6$RaceResultOfChildrenByTotal01.HitRate2 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate2)
data6$RaceResultOfChildrenByTotal01.HitRate2Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate2Log)
data6$RaceResultOfChildrenByTotal01.HitCount3 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount3)
data6$RaceResultOfChildrenByTotal01.HitCount3Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount3Log)
data6$RaceResultOfChildrenByTotal01.HitRate3 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate3)
data6$RaceResultOfChildrenByTotal01.HitRate3Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate3Log)
data6$RaceResultOfChildrenByTotal01.HitCount4 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount4)
data6$RaceResultOfChildrenByTotal01.HitCount4Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount4Log)
data6$RaceResultOfChildrenByTotal01.HitRate4 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate4)
data6$RaceResultOfChildrenByTotal01.HitRate4Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate4Log)
data6$RaceResultOfChildrenByTotal01.HitCount5 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount5)
data6$RaceResultOfChildrenByTotal01.HitCount5Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount5Log)
data6$RaceResultOfChildrenByTotal01.HitRate5 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate5)
data6$RaceResultOfChildrenByTotal01.HitRate5Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate5Log)
data6$RaceResultOfChildrenByTotal01.HitCount6 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount6)
data6$RaceResultOfChildrenByTotal01.HitCount6Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount6Log)
data6$RaceResultOfChildrenByTotal01.HitRate6 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate6)
data6$RaceResultOfChildrenByTotal01.HitRate6Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate6Log)
data6$RaceResultOfChildrenByTotal01.HitCount12 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount12)
data6$RaceResultOfChildrenByTotal01.HitCount12Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount12Log)
data6$RaceResultOfChildrenByTotal01.HitRate12 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate12)
data6$RaceResultOfChildrenByTotal01.HitRate12Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate12Log)
data6$RaceResultOfChildrenByTotal01.HitCount123 <- scale(data6$RaceResultOfChildrenByTotal01.HitCount123)
data6$RaceResultOfChildrenByTotal01.HitCount123Log <- scale(data6$RaceResultOfChildrenByTotal01.HitCount123Log)
data6$RaceResultOfChildrenByTotal01.HitRate123 <- scale(data6$RaceResultOfChildrenByTotal01.HitRate123)
data6$RaceResultOfChildrenByTotal01.HitRate123Log <- scale(data6$RaceResultOfChildrenByTotal01.HitRate123Log)
data6$RaceResultOfChildrenByTotal01.RaceCount <- scale(data6$RaceResultOfChildrenByTotal01.RaceCount)
data6$RaceResultOfChildrenByTotal01.OddsWinAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsWinAvg)
data6$RaceResultOfChildrenByTotal01.OddsWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsWinLogAvg)
data6$RaceResultOfChildrenByTotal01.OddsPlace1Avg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlace1Avg)
data6$RaceResultOfChildrenByTotal01.OddsPlace1LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlace1LogAvg)
data6$RaceResultOfChildrenByTotal01.OddsPlace2Avg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlace2Avg)
data6$RaceResultOfChildrenByTotal01.OddsPlace2LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlace2LogAvg)
data6$RaceResultOfChildrenByTotal01.OddsWinInverseAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsWinInverseAvg)
data6$RaceResultOfChildrenByTotal01.OddsWinInverseLogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsWinInverseLogAvg)
data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse1Avg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse1Avg)
data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse1LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse1LogAvg)
data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse2Avg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse2Avg)
data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse2LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.OddsPlaceInverse2LogAvg)
data6$RaceResultOfChildrenByTotal01.ApprovalRateWinAvg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRateWinAvg)
data6$RaceResultOfChildrenByTotal01.ApprovalRateWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRateWinLogAvg)
data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace1Avg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace1Avg)
data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace1LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace1LogAvg)
data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace2Avg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace2Avg)
data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace2LogAvg <- scale(data6$RaceResultOfChildrenByTotal01.ApprovalRatePlace2LogAvg)
data6$RaceResultOfChildrenByTotal01.ExpectedValueWinAvg <- scale(data6$RaceResultOfChildrenByTotal01.ExpectedValueWinAvg)
data6$RaceResultOfChildrenByTotal01.ExpectedValueWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal01.ExpectedValueWinLogAvg)
data6$RaceResultOfChildrenByTotal01.ExpectedValuePlaceAvg <- scale(data6$RaceResultOfChildrenByTotal01.ExpectedValuePlaceAvg)
data6$RaceResultOfChildrenByTotal01.ExpectedValuePlaceLogAvg <- scale(data6$RaceResultOfChildrenByTotal01.ExpectedValuePlaceLogAvg)
data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllAvg <- scale(data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllAvg)
data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllMax <- scale(data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllMax)
data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllMin <- scale(data6$RaceResultOfChildrenByTotal01.TimeDevValueOfAllMin)
data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllAvg <- scale(data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllAvg)
data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllMax <- scale(data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllMax)
data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllMin <- scale(data6$RaceResultOfChildrenByTotal01.L3DevValueOfAllMin)
#
data6$RaceResultOfChildrenByTotal02.RunCount <- scale(data6$RaceResultOfChildrenByTotal02.RunCount)
data6$RaceResultOfChildrenByTotal02.RunCountLog <- scale(data6$RaceResultOfChildrenByTotal02.RunCountLog)
data6$RaceResultOfChildrenByTotal02.HitCount1 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount1)
data6$RaceResultOfChildrenByTotal02.HitCount1Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount1Log)
data6$RaceResultOfChildrenByTotal02.HitRate1 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate1)
data6$RaceResultOfChildrenByTotal02.HitRate1Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate1Log)
data6$RaceResultOfChildrenByTotal02.HitCount2 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount2)
data6$RaceResultOfChildrenByTotal02.HitCount2Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount2Log)
data6$RaceResultOfChildrenByTotal02.HitRate2 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate2)
data6$RaceResultOfChildrenByTotal02.HitRate2Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate2Log)
data6$RaceResultOfChildrenByTotal02.HitCount3 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount3)
data6$RaceResultOfChildrenByTotal02.HitCount3Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount3Log)
data6$RaceResultOfChildrenByTotal02.HitRate3 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate3)
data6$RaceResultOfChildrenByTotal02.HitRate3Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate3Log)
data6$RaceResultOfChildrenByTotal02.HitCount4 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount4)
data6$RaceResultOfChildrenByTotal02.HitCount4Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount4Log)
data6$RaceResultOfChildrenByTotal02.HitRate4 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate4)
data6$RaceResultOfChildrenByTotal02.HitRate4Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate4Log)
data6$RaceResultOfChildrenByTotal02.HitCount5 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount5)
data6$RaceResultOfChildrenByTotal02.HitCount5Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount5Log)
data6$RaceResultOfChildrenByTotal02.HitRate5 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate5)
data6$RaceResultOfChildrenByTotal02.HitRate5Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate5Log)
data6$RaceResultOfChildrenByTotal02.HitCount6 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount6)
data6$RaceResultOfChildrenByTotal02.HitCount6Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount6Log)
data6$RaceResultOfChildrenByTotal02.HitRate6 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate6)
data6$RaceResultOfChildrenByTotal02.HitRate6Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate6Log)
data6$RaceResultOfChildrenByTotal02.HitCount12 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount12)
data6$RaceResultOfChildrenByTotal02.HitCount12Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount12Log)
data6$RaceResultOfChildrenByTotal02.HitRate12 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate12)
data6$RaceResultOfChildrenByTotal02.HitRate12Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate12Log)
data6$RaceResultOfChildrenByTotal02.HitCount123 <- scale(data6$RaceResultOfChildrenByTotal02.HitCount123)
data6$RaceResultOfChildrenByTotal02.HitCount123Log <- scale(data6$RaceResultOfChildrenByTotal02.HitCount123Log)
data6$RaceResultOfChildrenByTotal02.HitRate123 <- scale(data6$RaceResultOfChildrenByTotal02.HitRate123)
data6$RaceResultOfChildrenByTotal02.HitRate123Log <- scale(data6$RaceResultOfChildrenByTotal02.HitRate123Log)
data6$RaceResultOfChildrenByTotal02.RaceCount <- scale(data6$RaceResultOfChildrenByTotal02.RaceCount)
data6$RaceResultOfChildrenByTotal02.OddsWinAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsWinAvg)
data6$RaceResultOfChildrenByTotal02.OddsWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsWinLogAvg)
data6$RaceResultOfChildrenByTotal02.OddsPlace1Avg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlace1Avg)
data6$RaceResultOfChildrenByTotal02.OddsPlace1LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlace1LogAvg)
data6$RaceResultOfChildrenByTotal02.OddsPlace2Avg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlace2Avg)
data6$RaceResultOfChildrenByTotal02.OddsPlace2LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlace2LogAvg)
data6$RaceResultOfChildrenByTotal02.OddsWinInverseAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsWinInverseAvg)
data6$RaceResultOfChildrenByTotal02.OddsWinInverseLogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsWinInverseLogAvg)
data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse1Avg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse1Avg)
data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse1LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse1LogAvg)
data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse2Avg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse2Avg)
data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse2LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.OddsPlaceInverse2LogAvg)
data6$RaceResultOfChildrenByTotal02.ApprovalRateWinAvg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRateWinAvg)
data6$RaceResultOfChildrenByTotal02.ApprovalRateWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRateWinLogAvg)
data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace1Avg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace1Avg)
data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace1LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace1LogAvg)
data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace2Avg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace2Avg)
data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace2LogAvg <- scale(data6$RaceResultOfChildrenByTotal02.ApprovalRatePlace2LogAvg)
data6$RaceResultOfChildrenByTotal02.ExpectedValueWinAvg <- scale(data6$RaceResultOfChildrenByTotal02.ExpectedValueWinAvg)
data6$RaceResultOfChildrenByTotal02.ExpectedValueWinLogAvg <- scale(data6$RaceResultOfChildrenByTotal02.ExpectedValueWinLogAvg)
data6$RaceResultOfChildrenByTotal02.ExpectedValuePlaceAvg <- scale(data6$RaceResultOfChildrenByTotal02.ExpectedValuePlaceAvg)
data6$RaceResultOfChildrenByTotal02.ExpectedValuePlaceLogAvg <- scale(data6$RaceResultOfChildrenByTotal02.ExpectedValuePlaceLogAvg)
data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllAvg <- scale(data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllAvg)
data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllMax <- scale(data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllMax)
data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllMin <- scale(data6$RaceResultOfChildrenByTotal02.TimeDevValueOfAllMin)
data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllAvg <- scale(data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllAvg)
data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllMax <- scale(data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllMax)
data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllMin <- scale(data6$RaceResultOfChildrenByTotal02.L3DevValueOfAllMin)
#
data6$RaceResultOfJockyByTotal.RunCount <- scale(data6$RaceResultOfJockyByTotal.RunCount)
data6$RaceResultOfJockyByTotal.RunCountLog <- scale(data6$RaceResultOfJockyByTotal.RunCountLog)
data6$RaceResultOfJockyByTotal.HitCount1 <- scale(data6$RaceResultOfJockyByTotal.HitCount1)
data6$RaceResultOfJockyByTotal.HitCount1Log <- scale(data6$RaceResultOfJockyByTotal.HitCount1Log)
data6$RaceResultOfJockyByTotal.HitRate1 <- scale(data6$RaceResultOfJockyByTotal.HitRate1)
data6$RaceResultOfJockyByTotal.HitRate1Log <- scale(data6$RaceResultOfJockyByTotal.HitRate1Log)
data6$RaceResultOfJockyByTotal.HitCount2 <- scale(data6$RaceResultOfJockyByTotal.HitCount2)
data6$RaceResultOfJockyByTotal.HitCount2Log <- scale(data6$RaceResultOfJockyByTotal.HitCount2Log)
data6$RaceResultOfJockyByTotal.HitRate2 <- scale(data6$RaceResultOfJockyByTotal.HitRate2)
data6$RaceResultOfJockyByTotal.HitRate2Log <- scale(data6$RaceResultOfJockyByTotal.HitRate2Log)
data6$RaceResultOfJockyByTotal.HitCount3 <- scale(data6$RaceResultOfJockyByTotal.HitCount3)
data6$RaceResultOfJockyByTotal.HitCount3Log <- scale(data6$RaceResultOfJockyByTotal.HitCount3Log)
data6$RaceResultOfJockyByTotal.HitRate3 <- scale(data6$RaceResultOfJockyByTotal.HitRate3)
data6$RaceResultOfJockyByTotal.HitRate3Log <- scale(data6$RaceResultOfJockyByTotal.HitRate3Log)
data6$RaceResultOfJockyByTotal.HitCount4 <- scale(data6$RaceResultOfJockyByTotal.HitCount4)
data6$RaceResultOfJockyByTotal.HitCount4Log <- scale(data6$RaceResultOfJockyByTotal.HitCount4Log)
data6$RaceResultOfJockyByTotal.HitRate4 <- scale(data6$RaceResultOfJockyByTotal.HitRate4)
data6$RaceResultOfJockyByTotal.HitRate4Log <- scale(data6$RaceResultOfJockyByTotal.HitRate4Log)
data6$RaceResultOfJockyByTotal.HitCount5 <- scale(data6$RaceResultOfJockyByTotal.HitCount5)
data6$RaceResultOfJockyByTotal.HitCount5Log <- scale(data6$RaceResultOfJockyByTotal.HitCount5Log)
data6$RaceResultOfJockyByTotal.HitRate5 <- scale(data6$RaceResultOfJockyByTotal.HitRate5)
data6$RaceResultOfJockyByTotal.HitRate5Log <- scale(data6$RaceResultOfJockyByTotal.HitRate5Log)
data6$RaceResultOfJockyByTotal.HitCount6 <- scale(data6$RaceResultOfJockyByTotal.HitCount6)
data6$RaceResultOfJockyByTotal.HitCount6Log <- scale(data6$RaceResultOfJockyByTotal.HitCount6Log)
data6$RaceResultOfJockyByTotal.HitRate6 <- scale(data6$RaceResultOfJockyByTotal.HitRate6)
data6$RaceResultOfJockyByTotal.HitRate6Log <- scale(data6$RaceResultOfJockyByTotal.HitRate6Log)
data6$RaceResultOfJockyByTotal.HitCount12 <- scale(data6$RaceResultOfJockyByTotal.HitCount12)
data6$RaceResultOfJockyByTotal.HitCount12Log <- scale(data6$RaceResultOfJockyByTotal.HitCount12Log)
data6$RaceResultOfJockyByTotal.HitRate12 <- scale(data6$RaceResultOfJockyByTotal.HitRate12)
data6$RaceResultOfJockyByTotal.HitRate12Log <- scale(data6$RaceResultOfJockyByTotal.HitRate12Log)
data6$RaceResultOfJockyByTotal.HitCount123 <- scale(data6$RaceResultOfJockyByTotal.HitCount123)
data6$RaceResultOfJockyByTotal.HitCount123Log <- scale(data6$RaceResultOfJockyByTotal.HitCount123Log)
data6$RaceResultOfJockyByTotal.HitRate123 <- scale(data6$RaceResultOfJockyByTotal.HitRate123)
data6$RaceResultOfJockyByTotal.HitRate123Log <- scale(data6$RaceResultOfJockyByTotal.HitRate123Log)
data6$RaceResultOfJockyByTotal.RaceCount <- scale(data6$RaceResultOfJockyByTotal.RaceCount)
data6$RaceResultOfJockyByTotal.OddsWinAvg <- scale(data6$RaceResultOfJockyByTotal.OddsWinAvg)
data6$RaceResultOfJockyByTotal.OddsWinLogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsWinLogAvg)
data6$RaceResultOfJockyByTotal.OddsPlace1Avg <- scale(data6$RaceResultOfJockyByTotal.OddsPlace1Avg)
data6$RaceResultOfJockyByTotal.OddsPlace1LogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsPlace1LogAvg)
data6$RaceResultOfJockyByTotal.OddsPlace2Avg <- scale(data6$RaceResultOfJockyByTotal.OddsPlace2Avg)
data6$RaceResultOfJockyByTotal.OddsPlace2LogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsPlace2LogAvg)
data6$RaceResultOfJockyByTotal.OddsWinInverseAvg <- scale(data6$RaceResultOfJockyByTotal.OddsWinInverseAvg)
data6$RaceResultOfJockyByTotal.OddsWinInverseLogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsWinInverseLogAvg)
data6$RaceResultOfJockyByTotal.OddsPlaceInverse1Avg <- scale(data6$RaceResultOfJockyByTotal.OddsPlaceInverse1Avg)
data6$RaceResultOfJockyByTotal.OddsPlaceInverse1LogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsPlaceInverse1LogAvg)
data6$RaceResultOfJockyByTotal.OddsPlaceInverse2Avg <- scale(data6$RaceResultOfJockyByTotal.OddsPlaceInverse2Avg)
data6$RaceResultOfJockyByTotal.OddsPlaceInverse2LogAvg <- scale(data6$RaceResultOfJockyByTotal.OddsPlaceInverse2LogAvg)
data6$RaceResultOfJockyByTotal.ApprovalRateWinAvg <- scale(data6$RaceResultOfJockyByTotal.ApprovalRateWinAvg)
data6$RaceResultOfJockyByTotal.ApprovalRateWinLog <- scale(data6$RaceResultOfJockyByTotal.ApprovalRateWinLogAvg)
data6$RaceResultOfJockyByTotal.ApprovalRatePlace1Avg <- scale(data6$RaceResultOfJockyByTotal.ApprovalRatePlace1Avg)
data6$RaceResultOfJockyByTotal.ApprovalRatePlace1LogAvg <- scale(data6$RaceResultOfJockyByTotal.ApprovalRatePlace1LogAvg)
data6$RaceResultOfJockyByTotal.ApprovalRatePlace2Avg <- scale(data6$RaceResultOfJockyByTotal.ApprovalRatePlace2Avg)
data6$RaceResultOfJockyByTotal.ApprovalRatePlace2LogAvg <- scale(data6$RaceResultOfJockyByTotal.ApprovalRatePlace2LogAvg)
data6$RaceResultOfJockyByTotal.ExpectedValueWinAvg <- scale(data6$RaceResultOfJockyByTotal.ExpectedValueWinAvg)
data6$RaceResultOfJockyByTotal.ExpectedValueWinLogAvg <- scale(data6$RaceResultOfJockyByTotal.ExpectedValueWinLogAvg)
data6$RaceResultOfJockyByTotal.ExpectedValuePlaceAvg <- scale(data6$RaceResultOfJockyByTotal.ExpectedValuePlaceAvg)
data6$RaceResultOfJockyByTotal.ExpectedValuePlaceLogAvg <- scale(data6$RaceResultOfJockyByTotal.ExpectedValuePlaceLogAvg)
data6$RaceResultOfJockyByTotal.TimeDevValueOfAllAvg <- scale(data6$RaceResultOfJockyByTotal.TimeDevValueOfAllAvg)
data6$RaceResultOfJockyByTotal.TimeDevValueOfAllMax <- scale(data6$RaceResultOfJockyByTotal.TimeDevValueOfAllMax)
data6$RaceResultOfJockyByTotal.TimeDevValueOfAllMin <- scale(data6$RaceResultOfJockyByTotal.TimeDevValueOfAllMin)
data6$RaceResultOfJockyByTotal.L3DevValueOfAllAvg <- scale(data6$RaceResultOfJockyByTotal.L3DevValueOfAllAvg)
data6$RaceResultOfJockyByTotal.L3DevValueOfAllMax <- scale(data6$RaceResultOfJockyByTotal.L3DevValueOfAllMax)
data6$RaceResultOfJockyByTotal.L3DevValueOfAllMin <- scale(data6$RaceResultOfJockyByTotal.L3DevValueOfAllMin)
# print("summarySE")
# jackpot.DataMining.DmTimeDevValueOfRace.sum <-
# summarySE(data4
# measurevar="DataMining.DmTimeDevValueOfRace"
# groupvars=c("Race.JyokenCd5","Race.JyoCd","Race.JyuryoCd")
# )
# sumamry(data6)
# sink()

print(paste0(Sys.time(),  " --- source_scale.R Finished ---"))
