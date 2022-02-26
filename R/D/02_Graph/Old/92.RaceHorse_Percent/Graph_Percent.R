# ---------------------------------------------------------------------------------------------------------------------------
# Project Name: Jackpot
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source.init.R")
#Start
startTime<-proc.time()
# ---------------------------------------------------------------------------------------------------------------------------
# Declaration
# ---------------------------------------------------------------------------------------------------------------------------
constFileExtensionR<-"R"
constFileExtensionLog<-"log"
constFileExtensionExcel<-"xlsx"
#PDF
constFileExtensionPdf<-"pdf"
constColon<-"."
constUnderScore<-"_"
constSingleQuote<-"'"
constSqlSingleQuote<-"'"
constSqlSpace<-" "
#################################################
sqlViewName1<-"Graph01BeforePredict"
sqlViewName2<-""
# funcName<-"Step"
# funcName<-"Excel"
funcName<-"Pdf" # PDF
# logicType<-"glm"
# logicType<-"lmer"
# logicType<-"glmer"
#PDF
logicType<-"Graph"
# histogramType<-"count"
# histogramType<-"density"
histogramType<-"percent"
histogramLayout<-c(3, 2)
#################################################
# Query
sqlViewName<- paste0("ViewR308", sqlViewName1, sqlViewName2)
sqlViewName
# Prefix
fileNamePrefixSource<-"source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"
# ---------------------------------------------------------------------------------------------------------------------------
# Log
# ---------------------------------------------------------------------------------------------------------------------------
print("sink...")
logFilename<-paste0(fileNamePrefixLog, constColon, logicType, constColon, funcName, constColon, constFileExtensionLog)
logFilename
sink(logFilename, append = FALSE, split = TRUE)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
sourceFileNameMain<-"library"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)
# ---------------------------------------------------------------------------------------------------------------------------
# RODBC
# ---------------------------------------------------------------------------------------------------------------------------
tic()
sourceFileNameMain<-"rodbc"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)
sql_select<-"SELECT * FROM"
sqlQueryContext<-paste(sql_select, sqlViewName, sep=constSqlSpace)
sqlQueryContext
data1<-sqlQuery(conn1, sqlQueryContext , as.is = FALSE)
odbcClose(conn1)
# str(data1, list.len=ncol(data1))
print("nrow(data1)")
nrow(data1)
data<-data1
# ---------------------------------------------------------------------------------------------------------------------------
# Info
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("nrow(data)")
nrow(data)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram sumamry
# ---------------------------------------------------------------------------------------------------------------------------
# par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "hist.RaceHorse.Scott"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
hist(data$RaceHorse.JyoCd, main="JyoCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Wakuban, main="Wakuban", breaks = "scott", col = "orange")
hist(data$RaceHorse.Umaban, main="Umaban", breaks = "scott", col = "orange")
hist(data$RaceHorse.UmaKigoCd, main="UmaKigoCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.SexCd, main="SexCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.HinsyuCd, main="HinsyuCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.KeiroCd, main="KeiroCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Barei, main="Barei", breaks = "scott", col = "orange")
hist(data$RaceHorse.TozaiCd, main="TozaiCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Futan, main="Futan", breaks = "scott", col = "orange")
hist(data$RaceHorse.BlinkerCd, main="BlinkerCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.IsBlinker, main="IsBlinker", breaks = "scott", col = "orange")
hist(data$RaceHorse.MinaraiCd, main="MinaraiCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Bataijyu, main="Bataijyu", breaks = "scott", col = "orange")
hist(data$RaceHorse.ZogenSa, main="ZogenSa", breaks = "scott", col = "orange")
hist(data$RaceHorse.NyusenJyuni, main="NyusenJyuni", breaks = "scott", col = "orange")
hist(data$RaceHorse.KakuteiJyuni, main="KakuteiJyuni", breaks = "scott", col = "orange")
hist(data$RaceHorse.Time, main="Time", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni1C, main="Jyuni1C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni2C, main="Jyuni2C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni3C, main="Jyuni3C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni4C, main="Jyuni4C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Odds, main="Odds", breaks = "scott", col = "orange")
hist(data$RaceHorse.RunType, main="RunType", breaks = "scott", col = "orange")
hist(data$RaceHorse.RunNum, main="RunNum", breaks = "scott", col = "orange")
hist(data$RaceHorse.Lifetime, main="Lifetime", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanRatio, main="FutanRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.Speed, main="Speed", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDv, main="SpeedDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByRace, main="SpeedDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByJyoType1, main="SpeedDvByJyoType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType0, main="SpeedDvByRaceType0", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType1, main="SpeedDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeed, main="LastSpeed", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDv, main="LastSpeedDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRace, main="LastSpeedDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByJyoType1, main="LastSpeedDvByJyoType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType0, main="LastSpeedDvByRaceType0", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType1, main="LastSpeedDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDv, main="TimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByRace, main="TimeDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByJyoType1, main="TimeDvByJyoType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType0, main="TimeDvByRaceType0", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType1, main="TimeDvByRaceType1", breaks = "scott", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType2, main="TimeDvByRaceType2", breaks = "scott", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType3, main="TimeDvByRaceType3", breaks = "scott", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType4, main="TimeDvByRaceType4", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDv, main="LastTimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDvByJyoType1, main="LastTimeDvByJyoType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType0, main="LastTimeDvByRaceType0", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType1, main="LastTimeDvByRaceType1", breaks = "scott", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType2, main="LastTimeDvByRaceType2", breaks = "scott", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType3, main="LastTimeDvByRaceType3", breaks = "scott", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType4, main="LastTimeDvByRaceType4", breaks = "scott", col = "orange")
hist(data$RaceHorse.BareiDv, main="BareiDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.BataijyuDv, main="BataijyuDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanDv, main="FutanDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeDv, main="LifetimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanRatioDv, main="FutanRatioDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.PredictValueDvA, main="PredictValueDvA", breaks = "scott", col = "orange")
hist(data$RaceHorse.ExpectedOddsA, main="ExpectedOddsA", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsLog, main="OddsLog", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsRatio, main="OddsRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsLogit, main="OddsLogit", breaks = "scott", col = "orange")
hist(data$RaceHorse.ApprovalRate, main="ApprovalRate", breaks = "scott", col = "orange")
hist(data$RaceHorse.ApprovalRateLog, main="ApprovalRateLog", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeLog, main="LifetimeLog", breaks = "scott", col = "orange")
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "hist.RaceHorse.Sturges"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
hist(data$RaceHorse.JyoCd, main="JyoCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Wakuban, main="Wakuban", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Umaban, main="Umaban", breaks = "sturges", col = "orange")
hist(data$RaceHorse.UmaKigoCd, main="UmaKigoCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SexCd, main="SexCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.HinsyuCd, main="HinsyuCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.KeiroCd, main="KeiroCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Barei, main="Barei", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TozaiCd, main="TozaiCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Futan, main="Futan", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BlinkerCd, main="BlinkerCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.IsBlinker, main="IsBlinker", breaks = "sturges", col = "orange")
hist(data$RaceHorse.MinaraiCd, main="MinaraiCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Bataijyu, main="Bataijyu", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ZogenSa, main="ZogenSa", breaks = "sturges", col = "orange")
hist(data$RaceHorse.NyusenJyuni, main="NyusenJyuni", breaks = "sturges", col = "orange")
hist(data$RaceHorse.KakuteiJyuni, main="KakuteiJyuni", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Time, main="Time", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni1C, main="Jyuni1C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni2C, main="Jyuni2C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni3C, main="Jyuni3C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni4C, main="Jyuni4C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Odds, main="Odds", breaks = "sturges", col = "orange")
hist(data$RaceHorse.RunType, main="RunType", breaks = "sturges", col = "orange")
hist(data$RaceHorse.RunNum, main="RunNum", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Lifetime, main="Lifetime", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanRatio, main="FutanRatio", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Speed, main="Speed", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDv, main="SpeedDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByRace, main="SpeedDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByJyoType1, main="SpeedDvByJyoType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType0, main="SpeedDvByRaceType0", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType1, main="SpeedDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeed, main="LastSpeed", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDv, main="LastSpeedDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRace, main="LastSpeedDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByJyoType1, main="LastSpeedDvByJyoType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType0, main="LastSpeedDvByRaceType0", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType1, main="LastSpeedDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDv, main="TimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByRace, main="TimeDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByJyoType1, main="TimeDvByJyoType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType0, main="TimeDvByRaceType0", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType1, main="TimeDvByRaceType1", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType2, main="TimeDvByRaceType2", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType3, main="TimeDvByRaceType3", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.TimeDvByRaceType4, main="TimeDvByRaceType4", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDv, main="LastTimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDvByJyoType1, main="LastTimeDvByJyoType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType0, main="LastTimeDvByRaceType0", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType1, main="LastTimeDvByRaceType1", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType2, main="LastTimeDvByRaceType2", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType3, main="LastTimeDvByRaceType3", breaks = "sturges", col = "orange")
# hist(data$RaceHorse.LastTimeDvByRaceType4, main="LastTimeDvByRaceType4", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BareiDv, main="BareiDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BataijyuDv, main="BataijyuDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanDv, main="FutanDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LifetimeDv, main="LifetimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanRatioDv, main="FutanRatioDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.PredictValueDvA, main="PredictValueDvA", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ExpectedOddsA, main="ExpectedOddsA", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsLog, main="OddsLog", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsRatio, main="OddsRatio", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsLogit, main="OddsLogit", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ApprovalRate, main="ApprovalRate", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ApprovalRateLog, main="ApprovalRateLog", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LifetimeLog, main="LifetimeLog", breaks = "sturges", col = "orange")
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Base1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.JyoCd, main="JyoCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Wakuban, main="Wakuban", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Umaban, main="Umaban", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.UmaKigoCd, main="UmaKigoCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SexCd, main="SexCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.HinsyuCd, main="HinsyuCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.KeiroCd, main="KeiroCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Barei, main="Barei", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TozaiCd, main="TozaiCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Futan"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Futan, main="Futan", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.JyokenCd, main="Futan by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType0Cd, main="Futan by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType1Cd, main="Futan by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType2Cd, main="Futan by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType3Cd, main="Futan by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType4Cd, main="Futan by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Base2"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BlinkerCd, main="BlinkerCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.IsBlinker, main="IsBlinker", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.MinaraiCd, main="MinaraiCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Bataijyu"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Bataijyu, main="Bataijyu", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.JyokenCd, main="Bataijyu by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.JyoType1Cd, main="Bataijyu by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType0Cd, main="Bataijyu by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType1Cd, main="Bataijyu by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType2Cd, main="Bataijyu by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType3Cd, main="Bataijyu by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType4Cd, main="Bataijyu by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Base3"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.ZogenSa, main="ZogenSa", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.NyusenJyuni, main="NyusenJyuni", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.KakuteiJyuni, main="KakuteiJyuni", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Time"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Time, main="Time", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.Kyori, main="Time by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.JyokenCd, main="Time by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.JyoType1Cd, main="Time by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType0Cd, main="Time by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType1Cd, main="Time by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType2Cd, main="Time by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType3Cd, main="Time by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType4Cd, main="Time by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Base4"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Jyuni1C, main="Jyuni1C", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Jyuni2C, main="Jyuni2C", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Jyuni3C, main="Jyuni3C", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Jyuni4C, main="Jyuni4C", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Odds, main="Odds", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunNum, main="RunNum", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Lifetime, main="Lifetime", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.RunType"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.RunType, main="RunType", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.JyokenCd, main="RunType by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.JyoType1Cd, main="RunType by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType0Cd, main="RunType by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType1Cd, main="RunType by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType2Cd, main="RunType by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType3Cd, main="RunType by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType4Cd, main="RunType by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.FutanRatio"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.FutanRatio, main="FutanRatio", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.JyokenCd, main="FutanRatio by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.JyoType1Cd, main="FutanRatio by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType0Cd, main="FutanRatio by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType1Cd, main="FutanRatio by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType2Cd, main="FutanRatio by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType3Cd, main="FutanRatio by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType4Cd, main="FutanRatio by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Speed"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Speed, main="Speed", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.Kyori, main="Speed by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.JyokenCd, main="Speed by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.JyoType1Cd, main="Speed by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType0Cd, main="Speed by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType1Cd, main="Speed by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType2Cd, main="Speed by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType3Cd, main="Speed by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType4Cd, main="Speed by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.SpeedDvByRace"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByRace, main="SpeedDvByRace", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.Kyori, main="SpeedDvByRace by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.JyokenCd, main="SpeedDvByRace by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.JyoType1Cd, main="SpeedDvByRace by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType0Cd, main="SpeedDvByRace by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType1Cd, main="SpeedDvByRace by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType2Cd, main="SpeedDvByRace by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType3Cd, main="SpeedDvByRace by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType4Cd, main="SpeedDvByRace by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.SpeedDvByJyoType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByJyoType1, main="SpeedDvByJyoType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.Kyori, main="SpeedDvByJyoType1 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.JyokenCd, main="SpeedDvByJyoType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.JyoType1Cd, main="SpeedDvByJyoType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType0Cd, main="SpeedDvByJyoType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType1Cd, main="SpeedDvByJyoType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType2Cd, main="SpeedDvByJyoType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType3Cd, main="SpeedDvByJyoType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType4Cd, main="SpeedDvByJyoType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.SpeedDvByRaceType0"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByRaceType0, main="SpeedDvByRaceType0", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.Kyori, main="SpeedDvByRaceType0 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.JyokenCd, main="SpeedDvByRaceType0 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.JyoType1Cd, main="SpeedDvByRaceType0 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.RaceType0Cd, main="SpeedDvByRaceType0 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.RaceType1Cd, main="SpeedDvByRaceType0 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.RaceType2Cd, main="SpeedDvByRaceType0 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.RaceType3Cd, main="SpeedDvByRaceType0 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType0 | Race.RaceType4Cd, main="SpeedDvByRaceType0 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.SpeedDvByRaceType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByRaceType1, main="SpeedDvByRaceType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.Kyori, main="SpeedDvByRaceType1 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.JyokenCd, main="SpeedDvByRaceType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.JyoType1Cd, main="SpeedDvByRaceType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType0Cd, main="SpeedDvByRaceType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType1Cd, main="SpeedDvByRaceType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType2Cd, main="SpeedDvByRaceType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType3Cd, main="SpeedDvByRaceType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType4Cd, main="SpeedDvByRaceType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastSpeed"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeed, main="LastSpeed", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.JyokenCd, main="LastSpeed by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.JyoType1Cd, main="LastSpeed by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType0Cd, main="LastSpeed by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType1Cd, main="LastSpeed by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType2Cd, main="LastSpeed by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType3Cd, main="LastSpeed by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType4Cd, main="LastSpeed by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByRace"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByRace, main="LastSpeedDvByRace", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.Kyori, main="LastSpeedDvByRace by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.JyokenCd, main="LastSpeedDvByRace by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.JyoType1Cd, main="LastSpeedDvByRace by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType0Cd, main="LastSpeedDvByRace by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType1Cd, main="LastSpeedDvByRace by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType2Cd, main="LastSpeedDvByRace by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType3Cd, main="LastSpeedDvByRace by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType4Cd, main="LastSpeedDvByRace by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByJyoType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByJyoType1, main="LastSpeedDvByJyoType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.Kyori, main="LastSpeedDvByJyoType1 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.JyokenCd, main="LastSpeedDvByJyoType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.JyoType1Cd, main="LastSpeedDvByJyoType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.RaceType0Cd, main="LastSpeedDvByJyoType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.RaceType1Cd, main="LastSpeedDvByJyoType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.RaceType2Cd, main="LastSpeedDvByJyoType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.RaceType3Cd, main="LastSpeedDvByJyoType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByJyoType1 | Race.RaceType4Cd, main="LastSpeedDvByJyoType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByRaceType0"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByRaceType0, main="LastSpeedDvByRaceType0", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.Kyori, main="LastSpeedDvByRaceType0 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.JyokenCd, main="LastSpeedDvByRaceType0 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.JyoType1Cd, main="LastSpeedDvByRaceType0 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.RaceType0Cd, main="LastSpeedDvByRaceType0 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.RaceType1Cd, main="LastSpeedDvByRaceType0 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.RaceType2Cd, main="LastSpeedDvByRaceType0 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.RaceType3Cd, main="LastSpeedDvByRaceType0 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType0 | Race.RaceType4Cd, main="LastSpeedDvByRaceType0 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByRaceType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByRaceType1, main="LastSpeedDvByRaceType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.Kyori, main="LastSpeedDvByRaceType1 by Kyori", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.JyokenCd, main="LastSpeedDvByRaceType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.JyoType1Cd, main="LastSpeedDvByRaceType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType0Cd, main="LastSpeedDvByRaceType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType1Cd, main="LastSpeedDvByRaceType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType2Cd, main="LastSpeedDvByRaceType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType3Cd, main="LastSpeedDvByRaceType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType4Cd, main="LastSpeedDvByRaceType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.OddsLogit"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.OddsLog, main="OddsLog", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsRatio, main="OddsRatio", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit, main="OddsLogit", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.JyokenCd, main="OddsLogit by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.JyoType1Cd, main="OddsLogit by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.RaceType0Cd, main="OddsLogit by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.RaceType1Cd, main="OddsLogit by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.RaceType2Cd, main="OddsLogit by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.RaceType3Cd, main="OddsLogit by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.OddsLogit | Race.RaceType4Cd, main="OddsLogit by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.ApprovalRate, main="ApprovalRate", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.ApprovalRateLog, main="ApprovalRateLog", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LifeTimeLog"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LifetimeLog, main="LifetimeLog", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.JyokenCd, main="LifetimeLog by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.JyoType1Cd, main="LifetimeLog by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType0Cd, main="LifetimeLog by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType1Cd, main="LifetimeLog by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType2Cd, main="LifetimeLog by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType3Cd, main="LifetimeLog by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType4Cd, main="LifetimeLog by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDv"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDv, main="TimeDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.JyokenCd, main="TimeDv by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.JyoType1Cd, main="TimeDv by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType0Cd, main="TimeDv by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType1Cd, main="TimeDv by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType2Cd, main="TimeDv by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType3Cd, main="TimeDv by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType4Cd, main="TimeDv by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByRace"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRace, main="TimeDvByRace", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyokenCd, main="TimeDvByRace by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyoType1Cd, main="TimeDvByRace by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType0Cd, main="TimeDvByRace by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType1Cd, main="TimeDvByRace by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType2Cd, main="TimeDvByRace by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType3Cd, main="TimeDvByRace by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType4Cd, main="TimeDvByRace by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByJyoType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByJyoType1, main="TimeDvByJyoType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.JyokenCd, main="TimeDvByJyoType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.JyoType1Cd, main="TimeDvByJyoType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.RaceType0Cd, main="TimeDvByJyoType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.RaceType1Cd, main="TimeDvByJyoType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.RaceType2Cd, main="TimeDvByJyoType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.RaceType3Cd, main="TimeDvByJyoType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByJyoType1 | Race.RaceType4Cd, main="TimeDvByJyoType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByRaceType0"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRaceType0, main="TimeDvByRaceType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.JyokenCd, main="TimeDvByRaceType0 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.JyoType1Cd, main="TimeDvByRaceType0 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.RaceType0Cd, main="TimeDvByRaceType0 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.RaceType1Cd, main="TimeDvByRaceType0 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.RaceType2Cd, main="TimeDvByRaceType0 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.RaceType3Cd, main="TimeDvByRaceType0 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType0 | Race.RaceType4Cd, main="TimeDvByRaceType0 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByRaceType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRaceType1, main="TimeDvByRaceType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyokenCd, main="TimeDvByRaceType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyoType1Cd, main="TimeDvByRaceType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType0Cd, main="TimeDvByRaceType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType1Cd, main="TimeDvByRaceType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType2Cd, main="TimeDvByRaceType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType3Cd, main="TimeDvByRaceType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType4Cd, main="TimeDvByRaceType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastTimeDv"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastTimeDv, main="LastTimeDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.JyokenCd, main="LastTimeDv by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.JyoType1Cd, main="LastTimeDv by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType0Cd, main="LastTimeDv by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType1Cd, main="LastTimeDv by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType2Cd, main="LastTimeDv by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType3Cd, main="LastTimeDv by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType4Cd, main="LastTimeDv by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByRace"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRace, main="TimeDvByRace", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyokenCd, main="TimeDvByRace by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyoType1Cd, main="TimeDvByRace by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType0Cd, main="TimeDvByRace by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType1Cd, main="TimeDvByRace by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType2Cd, main="TimeDvByRace by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType3Cd, main="TimeDvByRace by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType4Cd, main="TimeDvByRace by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LastTimeDvByJyoType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastTimeDvByJyoType1, main="LastTimeDvByJyoType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.JyokenCd, main="LastTimeDvByJyoType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.JyoType1Cd, main="LastTimeDvByJyoType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType0Cd, main="LastTimeDvByJyoType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType1Cd, main="LastTimeDvByJyoType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType2Cd, main="LastTimeDvByJyoType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType3Cd, main="LastTimeDvByJyoType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType4Cd, main="LastTimeDvByJyoType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.TimeDvByRaceType1"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRaceType1, main="TimeDvByRaceType1", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyokenCd, main="TimeDvByRaceType1 by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyoType1Cd, main="TimeDvByRaceType1 by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType0Cd, main="TimeDvByRaceType1 by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType1Cd, main="TimeDvByRaceType1 by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType2Cd, main="TimeDvByRaceType1 by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType3Cd, main="TimeDvByRaceType1 by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType4Cd, main="TimeDvByRaceType1 by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.Base5"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BareiDv, main="BareiDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanRatioDv, main="FutanRatioDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.SpeedDv, main="SpeedDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LastSpeedDv, main="LastSpeedDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.BataijyuDv"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BataijyuDv, main="BataijyuDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.JyokenCd, main="BataijyuDv by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.JyoType1Cd, main="BataijyuDv by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType0Cd, main="BataijyuDv by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType1Cd, main="BataijyuDv by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType2Cd, main="BataijyuDv by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType3Cd, main="BataijyuDv by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType4Cd, main="BataijyuDv by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.FutanDv"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.FutanDv, main="FutanDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.JyokenCd, main="FutanDv by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.JyoType1Cd, main="FutanDv by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType0Cd, main="FutanDv by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType1Cd, main="FutanDv by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType2Cd, main="FutanDv by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType3Cd, main="FutanDv by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType4Cd, main="FutanDv by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.LifetimeDv"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LifetimeDv, main="LifetimeDv", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.JyokenCd, main="LifetimeDv by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.JyoType1Cd, main="LifetimeDv by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType0Cd, main="LifetimeDv by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType1Cd, main="LifetimeDv by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType2Cd, main="LifetimeDv by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType3Cd, main="LifetimeDv by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType4Cd, main="LifetimeDv by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.RaceHorse.PredictValueDvA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.PredictValueDvA, main="PredictValueDvA", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.JyokenCd, main="PredictValueDvA by JyokenCd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.JyoType1Cd, main="PredictValueDvA by JyoType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType0Cd, main="PredictValueDvA by RaceType0Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType1Cd, main="PredictValueDvA by RaceType1Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType2Cd, main="PredictValueDvA by RaceType2Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType3Cd, main="PredictValueDvA by RaceType3Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType4Cd, main="PredictValueDvA by RaceType4Cd", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
histogram(~ RaceHorse.ExpectedOddsA, main="ExpectedOddsA", data= data, labels=TRUE, type=histogramType, layout=histogramLayout)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="TimeDvByRace vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="TimeDvByRace vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="TimeDvByRace vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.SpeedDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs SpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.SpeedDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs SpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs SpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="TimeDvByRace vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="TimeDvByRace vs LastSpeedDv RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="TimeDvByRace vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="TimeDvByRace vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="TimeDvByRace vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="TimeDvByRace vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="TimeDvByRace vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="TimeDvByRace vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="TimeDvByRace vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs TimeDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="TimeDvByRace vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs TimeDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="TimeDvByRace vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs TimeDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="TimeDvByRace vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.SpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs SpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.SpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs SpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs SpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="SpeedDvByRace vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="SpeedDvByRace vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="SpeedDvByRace vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.SpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs SpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.SpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs SpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs SpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="SpeedDvByJyoType1 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="SpeedDvByJyoType1 vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="SpeedDvByJyoType1 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.SpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs SpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.SpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs SpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs SpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType0 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType0 vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType0 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType0 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.SpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs SpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.SpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs SpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs SpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="SpeedDvByRaceType1 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="SpeedDvByRaceType1 vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="SpeedDvByRaceType1 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRace by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="LastSpeedDvByRace vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRace by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="LastSpeedDvByRace vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRace by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="LastSpeedDvByRace vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LifetimeLog  by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LifetimeLog  by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByJyoType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="LastSpeedDvByJyoType1 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByJyoType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="LastSpeedDvByJyoType1 vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByJyoType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="LastSpeedDvByJyoType1 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs FutanRatioDv  by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs  TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType0 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType0 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType0 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType0 vs RunType vs RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType0 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType0 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType0 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs TimeDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs TimeDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs TimeDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs BataijyuDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs BataijyuDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs BataijyuDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanRatioDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanRatioDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs FutanRatioDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LifetimeLog by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs LifetimeLog by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LifetimeLog by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs LastSpeedDv by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1~ RaceHorse.Umaban | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs Umaban by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs Umaban by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs Umaban by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs ZogenSa by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs ZogenSa by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs ZogenSa by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType1 by JyoType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.RunType | Race.JyoType1Cd, data=data, main="LastSpeedDvByRaceType1 vs RunType by JyoType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType1 by RaceType0Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType0Cd, data=data, main="LastSpeedDvByRaceType1 vs RunType by RaceType0Cd", col="blue", layout = c(3, 2))
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType1 by RaceType1Cd"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main="LastSpeedDvByRaceType1 vs RunType by RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
toc()# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# save.image(file=FILENAME)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# sink
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("q...")
# sink(file="abc.doc") #上書き
# sink(file="abc.doc") , append #追記
# sink()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Finish Time
# ---------------------------------------------------------------------------------------------------------------------------
finishTime <- proc.time()
procTime <- finishTime - startTime
print("* * * * Time Information * * * * *")
procTime
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print("q...")
# q("no")