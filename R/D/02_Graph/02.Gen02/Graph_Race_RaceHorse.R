##########################################################################################
# Analyze
##########################################################################################
 # ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source_init.R", echo = FALSE, max.deparse.length = Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Arguments
# ---------------------------------------------------------------------------------------------------------------------------
args <- commandArgs(T)

print(paste0("args=", args))
print(paste0("args[1]=", args[1]))
print(paste0("args[2]=", args[2]))
print(paste0("args[3]=", args[3]))
print(paste0("args[4]=", args[4]))
print(paste0("args[5]=", args[5]))
print(paste0("args[6]=", args[6]))
print(paste0("args[7]=", args[7]))

# analyzeVersion <- as.character(args[1])
# analyzeCategory <- as.character(args[2])
# analyzeType <- as.character(args[3])
# analyzeFamily  <- as.character(args[4])
# analyzeFunc <- as.character(args[5])
# analyzeTrackTypeCd <- as.character(args[6])
# analyzeJyokenCd <- as.character(args[7])

analyzeVersion <- "D1115"
analyzeCategory <- "Graph"
analyzeType <- "Gen01"
analyzeFamily <- "IsHitA"
# analyzeFunc <- "glm"
# analyzeFunc <- "glmer"
# analyzeFunc <- "glmer_offset"
# analyzeFunc <- "glmmML"
# analyzeFunc <- "predict"
analyzeFunc <- "graph"
# analyzeTrackTypeCd <- 1
# analyzeJyokenCd <- "1"

print("--------------------------------------------------------------------------------")
print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzetype = ", analyzeType))
print(paste0("analyzeFamily=", analyzeFamily))
print(paste0("analyzeFunc=", analyzeFunc))
print(paste0("analyzeTrackTypeCd=", analyzeTrackTypeCd))
print(paste0("analyzeJyokenCd=", analyzeJyokenCd))
print("--------------------------------------------------------------------------------")

# ---------------------------------------------------------------------------------------------------------------------------
# Declaration
# ---------------------------------------------------------------------------------------------------------------------------
constFileExtensionRData <- "RData"
constFileExtensionR <- "R"
constFileExtensionLog <- "log"
constFileExtensionExcel <- "xlsx"
constFileExtensionPdf<- "pdf"
constColon <- "."
# constUnderScore <- "_"
# constSingleQuote <- "'"
# constSqlSingleQuote <- "'"
# constSqlSpace <- " "

fileNamePrefixRData <- "RData"
fileNamePrefixSource <- "source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"
# -------------------------------------
# Working Directory
# -------------------------------------
workingDir <- getwd()
print(paste0("workingDir=", workingDir))
# ---------------------------------------------------------------------------------------------------------------------------
# Log Start
# ---------------------------------------------------------------------------------------------------------------------------
logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType), constFileExtensionLog, sep = constColon)
# logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep = constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append = FALSE, type = "output", split = TRUE)
print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, " Start ---"))
# print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, " Start ---"))
print(paste0(Sys.time(), " --- Log Start ---"))
print(paste0(Sys.time(), " --- graph Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeCategory=", analyzeCategory))
print(paste0("analyzetype = ", analyzeType))
print(paste0("analyzeFamily=", analyzeFamily))
print(paste0("analyzeFunc=", analyzeFunc))
print(paste0("analyzeTrackTypeCd=", analyzeTrackTypeCd))
print(paste0("analyzeJyokenCd=", analyzeJyokenCd))
# ---------------------------------------------------------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------------------------------------------------------
# print("options=")
# jackpot_env_options<-options()
# print(jackpot_env_options)
# jackpot_env_version<-version
# print(paste0("version=", jackpot_env_version))
# jackpot_env_getwd <- getwd()
# print(paste0("getwd()=", jackpot_env_getwd))
# jackpot_env_getenv<-Sys.getenv()
# print(paste0("Sys.getenv()=", jackpot_env_getenv))
# jackpot_env_memory.profile<-memory.profile()
# print(paste0("memory.profile()=", jackpot_env_memory.profile))
# jackpot_env_memory.size<-memory.size()
# print(paste0("memory.size()=", jackpot_env_memory.size))
# jackpot_env_memory.limit<-memory.limit()
# print(paste0("memory.limit()=",  jackpot_env_memory.limit))
# ---------------------------------------------------------------------------------------------------------------------------
# Option
# ---------------------------------------------------------------------------------------------------------------------------
# options(stringsAsFactors = FALSE)
# print("options() before=")
# print(options())
# formals(read.table)$as.is <- TRUE
# formals(read.table)$as.is
# formals(read.table)$stringsAsFactors <- F
# formals(read.table)$stringsAsFactors
# print("options() after=")
# print(options())
# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
source("source_function.R", echo = FALSE, max.deparse.length = Inf) 
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo = TRUE, max.deparse.length = Inf) 
# ---------------------------------------------------------------------------------------------------------------------------
# RxSqlServerData
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- RxSqlServerData Start ---"))
# # tic()
# source("source_rodbc.R", echo = FALSE, max.deparse.length = Inf) 
sqlConnString <- "Driver={SQL Server};Server=(local);Database=Jackpot;Trusted_Connection=true"

print(paste0(Sys.time(), " --- RxInSqlServer Start ---"))
sqlWait <- TRUE
sqlConsoleOutput <- FALSE
sqlCompute <- RxInSqlServer(connectionString = sqlConnString, wait = sqlWait, consoleOutput = sqlConsoleOutput)
print(paste0(Sys.time(), " --- RxInSqlServer Finish ---"))

print(paste0(Sys.time(), " --- rxSetComputeContext Start ---"))
# rxSetComputeContext(sqlCompute)
rxSetComputeContext("local")
rxGetComputeContext()
print(paste0(Sys.time(), " --- rxSetComputeContext Finish ---"))

print(paste0(Sys.time(), " --- RxSqlServerData Start ---"))
sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd)
# sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd, "WHERE 1=0")

print(paste0("sqlQuery=", sqlQuery))
rowsPerRead <- 100000000 # 50000
inDataSource <- RxSqlServerData(sqlQuery = sqlQuery, connectionString = sqlConnString, stringsAsFactors = TRUE, rowsPerRead = rowsPerRead)
print(paste0(Sys.time(), " --- RxSqlServerData Finish ---"))

print(paste0(Sys.time(), " --- rxGetVarInfo Start ---"))
rxGetVarInfo(data = inDataSource)
print(paste0(Sys.time(), " --- rxGetVarInfo Finish---"))

print(paste0(Sys.time(), " --- rxImport Start ---"))
rowsPerRead <- 100000000
data <- rxImport(inDataSource, rowsPerRead = rowsPerRead)
# data <- rxImport(inDataSource)
print(paste0(Sys.time(), " --- rxImport Finish ---"))

# print("head(data)=")
# print(head(data))

objectSize <- object.size(data)
print(paste0("object.size(data) auto=", format(objectSize, units = "auto")))
nrow.data.sqlQuery <- nrow(data)
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) RxSqlServerData=" ,nrow.data.sqlQuery))
print("--------------------------------------------------------------------------------")
# print("str(data)=")
# str(data, list.len = ncol(data))
print(paste0(Sys.time(), " --- RxSqlServerData Finish ---"))

 
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "hist.Race"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます

hist(data$Race.JyoCd, main = "JyoCd", breaks = "scott", col = "orange")
hist(data$Race.RaceNum, main = "RaceNum", breaks = "scott", col = "orange")
hist(data$Race.YoubiCd, main = "YoubiCd", breaks = "scott", col = "orange")
hist(data$Race.GradeCd, main = "GradeCd", breaks = "scott", col = "orange")
hist(data$Race.SyubetuCd, main = "SyubetuCd", breaks = "scott", col = "orange")
hist(data$Race.KigoCd, main = "KigoCd", breaks = "scott", col = "orange")
hist(data$Race.JyuryoCd, main = "JyuryoCd", breaks = "scott", col = "orange")
hist(data$Race.Jyoken5Cd, main = "Jyoken5Cd", breaks = "scott", col = "orange")
hist(data$Race.JyokenCd, main = "JyokenCd", breaks = "scott", col = "orange")
hist(data$Race.Kyori, main = "Kyori", breaks = "scott", col = "orange")
hist(data$Race.Kyori, main = "Kyori", breaks = seq(950, 4500, 100), col = "blue")
hist(data$Race.DistanceTypeCd, main = "DistanceTypeCd", breaks = "scott", col = "orange")
hist(data$Race.DistanceType2Cd, main = "DistanceType2Cd", breaks = "scott", col = "orange")
hist(data$Race.TrackCd, main = "TrackCd", breaks = "scott", col = "orange")
hist(data$Race.CourseKubunCd, main = "CourseKubunCd", breaks = "scott", col = "orange")
hist(data$Race.TorokuTosu, main = "TorokuTosu", breaks = "scott", col = "orange")
hist(data$Race.SyussoTosu, main = "SyussoTosu", breaks = "scott", col = "orange")
hist(data$Race.NyusenTosu, main = "NyusenTosu", breaks = "scott", col = "orange")
hist(data$Race.TenkoCd, main = "TenkoCd", breaks = "scott", col = "orange")
hist(data$Race.TrackTypeCd, main = "TrackTypeCd", breaks = "scott", col = "orange")
hist(data$Race.TrackType2Cd, main = "TrackType2Cd", breaks = "scott", col = "orange")
hist(data$Race.TrackType3Cd, main = "TrackType3Cd", breaks = "scott", col = "orange")
hist(data$Race.CourseTypeCd, main = "CourseTypeCd", breaks = "scott", col = "orange")
hist(data$Race.FastestStart3Time, main = "FastestStart3Time", breaks = "scott", col = "orange")
hist(data$Race.FastestStart8Time, main = "FastestStart8Time", breaks = "scott", col = "orange")
hist(data$Race.FastestStart4Time, main = "FastestStart4Time", breaks = "scott", col = "orange")
hist(data$Race.FastestLast3Time, main = "FastestLast3Time", breaks = "scott", col = "orange")
hist(data$Race.FastestLast4Time, main = "FastestLast4Time", breaks = "scott", col = "orange")
hist(data$Race.TrackConditionCd, main = "TrackConditionCd", breaks = "scott", col = "orange")


dev.off()
# toc()

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
# tic()
graphType <- "hist.RaceHorse.Scott"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
hist(data$RaceHorse.JyoCd, main = "JyoCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Wakuban, main = "Wakuban", breaks = "scott", col = "orange")
hist(data$RaceHorse.Umaban, main = "Umaban", breaks = "scott", col = "orange")
hist(data$RaceHorse.UmaKigoCd, main = "UmaKigoCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.SexCd, main = "SexCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.HinsyuCd, main = "HinsyuCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.KeiroCd, main = "KeiroCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Barei, main = "Barei", breaks = "scott", col = "orange")
hist(data$RaceHorse.TozaiCd, main = "TozaiCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Futan, main = "Futan", breaks = "scott", col = "orange")
hist(data$RaceHorse.BlinkerCd, main = "BlinkerCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.IsBlinker, main = "IsBlinker", breaks = "scott", col = "orange")
hist(data$RaceHorse.MinaraiCd, main = "MinaraiCd", breaks = "scott", col = "orange")
hist(data$RaceHorse.Bataijyu, main = "Bataijyu", breaks = "scott", col = "orange")
hist(data$RaceHorse.ZogenSa, main = "ZogenSa", breaks = "scott", col = "orange")
hist(data$RaceHorse.NyusenJyuni, main = "NyusenJyuni", breaks = "scott", col = "orange")
hist(data$RaceHorse.KakuteiJyuni, main = "KakuteiJyuni", breaks = "scott", col = "orange")
hist(data$RaceHorse.Time, main = "Time", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni1C, main = "Jyuni1C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni2C, main = "Jyuni2C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni3C, main = "Jyuni3C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Jyuni4C, main = "Jyuni4C", breaks = "scott", col = "orange")
hist(data$RaceHorse.Odds, main = "Odds", breaks = "scott", col = "orange")
hist(data$RaceHorse.RunType, main = "RunType", breaks = "scott", col = "orange")
hist(data$RaceHorse.RunNum, main = "RunNum", breaks = "scott", col = "orange")
hist(data$RaceHorse.Lifetime, main = "Lifetime", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanRatio, main = "FutanRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.Speed, main = "Speed", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDv, main = "SpeedDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByRace, main = "SpeedDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType1, main = "SpeedDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeed, main = "LastSpeed", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDv, main = "LastSpeedDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRace, main = "LastSpeedDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType1, main = "LastSpeedDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDv, main = "TimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByRace, main = "TimeDvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType1, main = "TimeDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDv, main = "LastTimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType1, main = "LastTimeDvByRaceType1", breaks = "scott", col = "orange")
hist(data$RaceHorse.BareiDv, main = "BareiDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.BataijyuDv, main = "BataijyuDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanDv, main = "FutanDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeDv, main = "LifetimeDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.FutanRatioDv, main = "FutanRatioDv", breaks = "scott", col = "orange")
hist(data$RaceHorse.PredictValueDvA, main = "PredictValueDvA", breaks = "scott", col = "orange")
hist(data$RaceHorse.ExpectedOddsA, main = "ExpectedOddsA", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsLog, main = "OddsLog", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsRatio, main = "OddsRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.OddsLogit, main = "OddsLogit", breaks = "scott", col = "orange")
hist(data$RaceHorse.ApprovalRate, main = "ApprovalRate", breaks = "scott", col = "orange")
hist(data$RaceHorse.ApprovalRateLog, main = "ApprovalRateLog", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeLog, main = "LifetimeLog", breaks = "scott", col = "orange")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "hist.RaceHorse.Sturges"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
hist(data$RaceHorse.JyoCd, main = "JyoCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Wakuban, main = "Wakuban", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Umaban, main = "Umaban", breaks = "sturges", col = "orange")
hist(data$RaceHorse.UmaKigoCd, main = "UmaKigoCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SexCd, main = "SexCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.HinsyuCd, main = "HinsyuCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.KeiroCd, main = "KeiroCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Barei, main = "Barei", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TozaiCd, main = "TozaiCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Futan, main = "Futan", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BlinkerCd, main = "BlinkerCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.IsBlinker, main = "IsBlinker", breaks = "sturges", col = "orange")
hist(data$RaceHorse.MinaraiCd, main = "MinaraiCd", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Bataijyu, main = "Bataijyu", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ZogenSa, main = "ZogenSa", breaks = "sturges", col = "orange")
hist(data$RaceHorse.NyusenJyuni, main = "NyusenJyuni", breaks = "sturges", col = "orange")
hist(data$RaceHorse.KakuteiJyuni, main = "KakuteiJyuni", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Time, main = "Time", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni1C, main = "Jyuni1C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni2C, main = "Jyuni2C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni3C, main = "Jyuni3C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Jyuni4C, main = "Jyuni4C", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Odds, main = "Odds", breaks = "sturges", col = "orange")
hist(data$RaceHorse.RunType, main = "RunType", breaks = "sturges", col = "orange")
hist(data$RaceHorse.RunNum, main = "RunNum", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Lifetime, main = "Lifetime", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanRatio, main = "FutanRatio", breaks = "sturges", col = "orange")
hist(data$RaceHorse.Speed, main = "Speed", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDv, main = "SpeedDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByRace, main = "SpeedDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.SpeedDvByRaceType1, main = "SpeedDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeed, main = "LastSpeed", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDv, main = "LastSpeedDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRace, main = "LastSpeedDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastSpeedDvByRaceType1, main = "LastSpeedDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDv, main = "TimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByRace, main = "TimeDvByRace", breaks = "sturges", col = "orange")
hist(data$RaceHorse.TimeDvByRaceType1, main = "TimeDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDv, main = "LastTimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LastTimeDvByRaceType1, main = "LastTimeDvByRaceType1", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BareiDv, main = "BareiDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.BataijyuDv, main = "BataijyuDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanDv, main = "FutanDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LifetimeDv, main = "LifetimeDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.FutanRatioDv, main = "FutanRatioDv", breaks = "sturges", col = "orange")
hist(data$RaceHorse.PredictValueDvA, main = "PredictValueDvA", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ExpectedOddsA, main = "ExpectedOddsA", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsLog, main = "OddsLog", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsRatio, main = "OddsRatio", breaks = "sturges", col = "orange")
hist(data$RaceHorse.OddsLogit, main = "OddsLogit", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ApprovalRate, main = "ApprovalRate", breaks = "sturges", col = "orange")
hist(data$RaceHorse.ApprovalRateLog, main = "ApprovalRateLog", breaks = "sturges", col = "orange")
hist(data$RaceHorse.LifetimeLog, main = "LifetimeLog", breaks = "sturges", col = "orange")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Base1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.JyoCd, main = "JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Wakuban, main = "Wakuban", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Umaban, main = "Umaban", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.UmaKigoCd, main = "UmaKigoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SexCd, main = "SexCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.HinsyuCd, main = "HinsyuCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.KeiroCd, main = "KeiroCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Barei, main = "Barei", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TozaiCd, main = "TozaiCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Futan"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Futan, main = "Futan", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Futan | Race.JyokenCd, main = "Futan by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Futan | Race.RaceType1Cd, main = "Futan by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Base2"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BlinkerCd, main = "BlinkerCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.IsBlinker, main = "IsBlinker", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.MinaraiCd, main = "MinaraiCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Bataijyu"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Bataijyu, main = "Bataijyu", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.JyokenCd, main = "Bataijyu by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Bataijyu | Race.RaceType1Cd, main = "Bataijyu by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Base3"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.ZogenSa, main = "ZogenSa", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.NyusenJyuni, main = "NyusenJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.KakuteiJyuni, main = "KakuteiJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Time"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Time, main = "Time", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Time | Race.Kyori, main = "Time by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Time | Race.JyokenCd, main = "Time by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Time | Race.RaceType1Cd, main = "Time by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Base4"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Jyuni1C, main = "Jyuni1C", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Jyuni2C, main = "Jyuni2C", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Jyuni3C, main = "Jyuni3C", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Jyuni4C, main = "Jyuni4C", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Odds, main = "Odds", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.RunNum, main = "RunNum", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Lifetime, main = "Lifetime", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.RunType"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.RunType, main = "RunType", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.RunType | Race.JyokenCd, main = "RunType by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.RunType | Race.RaceType1Cd, main = "RunType by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.FutanRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.FutanRatio, main = "FutanRatio", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.JyokenCd, main = "FutanRatio by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FutanRatio | Race.RaceType1Cd, main = "FutanRatio by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Speed"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.Speed, main = "Speed", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Speed | Race.Kyori, main = "Speed by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Speed | Race.JyokenCd, main = "Speed by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.Speed | Race.RaceType1Cd, main = "Speed by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.SpeedDvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByRace, main = "SpeedDvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.Kyori, main = "SpeedDvByRace by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.JyokenCd, main = "SpeedDvByRace by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRace | Race.RaceType1Cd, main = "SpeedDvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.SpeedDvByJyoType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByJyoType1, main = "SpeedDvByJyoType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.Kyori, main = "SpeedDvByJyoType1 by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.JyokenCd, main = "SpeedDvByJyoType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByJyoType1 | Race.RaceType1Cd, main = "SpeedDvByJyoType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.SpeedDvByRaceType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.SpeedDvByRaceType1, main = "SpeedDvByRaceType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.Kyori, main = "SpeedDvByRaceType1 by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.JyokenCd, main = "SpeedDvByRaceType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDvByRaceType1 | Race.RaceType1Cd, main = "SpeedDvByRaceType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LastSpeed"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeed, main = "LastSpeed", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.JyokenCd, main = "LastSpeed by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeed | Race.RaceType1Cd, main = "LastSpeed by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByRace, main = "LastSpeedDvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.Kyori, main = "LastSpeedDvByRace by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.JyokenCd, main = "LastSpeedDvByRace by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRace | Race.RaceType1Cd, main = "LastSpeedDvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LastSpeedDvByRaceType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastSpeedDvByRaceType1, main = "LastSpeedDvByRaceType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.Kyori, main = "LastSpeedDvByRaceType1 by Race.Kyori", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.JyokenCd, main = "LastSpeedDvByRaceType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDvByRaceType1 | Race.RaceType1Cd, main = "LastSpeedDvByRaceType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LifeTimeLog"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LifetimeLog, main = "LifetimeLog", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.JyokenCd, main = "LifetimeLog by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LifetimeLog | Race.RaceType1Cd, main = "LifetimeLog by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.TimeDv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDv, main = "TimeDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.JyokenCd, main = "TimeDv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDv | Race.RaceType1Cd, main = "TimeDv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.TimeDvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRace, main = "TimeDvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyokenCd, main = "TimeDvByRace by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType1Cd, main = "TimeDvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.TimeDvByRaceType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRaceType1, main = "TimeDvByRaceType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyokenCd, main = "TimeDvByRaceType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType1Cd, main = "TimeDvByRaceType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LastTimeDv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastTimeDv, main = "LastTimeDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.JyokenCd, main = "LastTimeDv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeDv | Race.RaceType1Cd, main = "LastTimeDv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.TimeDvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRace, main = "TimeDvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.JyokenCd, main = "TimeDvByRace by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRace | Race.RaceType1Cd, main = "TimeDvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LastTimeDvByJyoType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LastTimeDvByJyoType1, main = "LastTimeDvByJyoType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.JyokenCd, main = "LastTimeDvByJyoType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeDvByJyoType1 | Race.RaceType1Cd, main = "LastTimeDvByJyoType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.TimeDvByRaceType1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.TimeDvByRaceType1, main = "TimeDvByRaceType1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.JyokenCd, main = "TimeDvByRaceType1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeDvByRaceType1 | Race.RaceType1Cd, main = "TimeDvByRaceType1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.Base5"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BareiDv, main = "BareiDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FutanRatioDv, main = "FutanRatioDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.SpeedDv, main = "SpeedDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastSpeedDv, main = "LastSpeedDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.BataijyuDv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.BataijyuDv, main = "BataijyuDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.JyokenCd, main = "BataijyuDv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.BataijyuDv | Race.RaceType1Cd, main = "BataijyuDv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.FutanDv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.FutanDv, main = "FutanDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.JyokenCd, main = "FutanDv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FutanDv | Race.RaceType1Cd, main = "FutanDv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.LifetimeDv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.LifetimeDv, main = "LifetimeDv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.JyokenCd, main = "LifetimeDv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LifetimeDv | Race.RaceType1Cd, main = "LifetimeDv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.RaceHorse.PredictValueDvA"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ RaceHorse.PredictValueDvA, main = "PredictValueDvA", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.JyokenCd, main = "PredictValueDvA by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.PredictValueDvA | Race.RaceType1Cd, main = "PredictValueDvA by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.ExpectedOddsA, main = "ExpectedOddsA", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs SpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "TimeDvByRace vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs SpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "SpeedDvByRace vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs SpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "SpeedDvByJyoType1 vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.SpeedDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.SpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs SpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs SpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.SpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "SpeedDvByRaceType1 vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRace ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRace vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs LifetimeLog  by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByJyoType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByJyoType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "LastSpeedDvByJyoType1 vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.TimeDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs TimeDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.BataijyuDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.BataijyuDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs BataijyuDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs FutanDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.FutanRatioDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.FutanRatioDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs FutanRatioDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LifetimeLog vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LifetimeLog | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs LifetimeLog by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.LastSpeedDv vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.LastSpeedDv | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs LastSpeedDv by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.Umaban vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1~ RaceHorse.Umaban | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs Umaban by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.ZogenSa vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs ZogenSa by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.RunType vs LastSpeedDvByRaceType1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.LastSpeedDvByRaceType1 ~ RaceHorse.RunType | Race.RaceType1Cd, data=data, main = "LastSpeedDvByRaceType1 vs RunType by Race.RaceType1Cd", col="blue", layout = c(3, 2))
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# save.image(file=FILENAME)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- log Finish ---"))
print(paste0(Sys.time(), " --- graph Finish ---"))
sink()
# toc()

print("q...")
 # q("no")
 