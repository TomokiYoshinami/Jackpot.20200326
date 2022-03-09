######################################################################
# Analyze
######################################################################
# -------------------------------------------------------------------------------------------------------
# Initialize
# -------------------------------------------------------------------------------------------------------
source("Source_init.R", echo = FALSE, max.deparse.length = Inf)
# -------------------------------------------------------------------------------------------------------
# Arguments
# -------------------------------------------------------------------------------------------------------
args <- commandArgs(T)
print(paste0("args=", args))
print(paste0("args[1]=", args[1]))
print(paste0("args[2]=", args[2]))
print(paste0("args[3]=", args[3]))
print(paste0("args[4]=", args[4]))
print(paste0("args[5]=", args[5]))
print(paste0("args[6]=", args[6]))
print(paste0("args[7]=", args[7]))
graphVersion <- as.character(args[1])
graphCategory <- as.character(args[2])
graphType <- as.character(args[3])
graphTrackTypeCd <- as.character(args[4])
graphJyokenCd <- as.character(args[5])
print("--------------------------------------------------------------------------------")
print(paste0("graphVersion=", graphVersion))
print(paste0("graphCategory=", graphCategory))
print(paste0("graphType=", graphType))
print(paste0("graphTrackTypeCd=", graphTrackTypeCd))
print(paste0("graphJyokenCd=", graphJyokenCd))
print("--------------------------------------------------------------------------------")
graphVersion <- "D1115"
graphCategory <- "Graph"
graphType <- "Predict01Before"
graphTrackTypeCd <- 0
graphJyokenCd <- "0"
# -------------------------------------------------------------------------------------------------------
# Declaration
# -------------------------------------------------------------------------------------------------------
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
histogramLayout <-c(1, 1)
# histogramLayout <-c(3, 2)
# histogramType <-"count"
# histogramType<-"density"
histogramType<-"percent"
# -------------------------------------
# Working Directory
# -------------------------------------
workingDir <- getwd()
print(paste0("workingDir=", workingDir))
# -------------------------------------------------------------------------------------------------------
# Log Start
# -------------------------------------------------------------------------------------------------------
logFilename <- paste(paste0(fileNamePrefixLog, "_", graphCategory, "_", graphType), constFileExtensionLog, sep = constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append = FALSE, type = "output", split = TRUE)
print(paste0(Sys.time(),  " --- ", graphVersion, "_", graphCategory,  "_", graphType, " Start ---"))
print(paste0(Sys.time(), " --- Log Start ---"))
print(paste0(Sys.time(), " --- graph Start ---"))
# -------------------------------------------------------------------------------------------------------
# Parameter
# -------------------------------------------------------------------------------------------------------
print("--------------------------------------------------------------------------------")
print(paste0("graphVersion=", graphVersion))
print(paste0("graphCategory=", graphCategory))
print(paste0("graphType=", graphType))
print(paste0("graphTrackTypeCd=", graphTrackTypeCd))
print(paste0("graphJyokenCd=", graphJyokenCd))
print("--------------------------------------------------------------------------------")
# -------------------------------------------------------------------------------------------------------
# Environment
# -------------------------------------------------------------------------------------------------------
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
# -------------------------------------------------------------------------------------------------------
# Option
# -------------------------------------------------------------------------------------------------------
# options(stringsAsFactors = FALSE)
# print("options() before=")
# print(options())
# formals(read.table)$as.is <- TRUE
# formals(read.table)$as.is
# formals(read.table)$stringsAsFactors <- F
# formals(read.table)$stringsAsFactors
# print("options() after=")
# print(options())
# -------------------------------------------------------------------------------------------------------
# Function
# -------------------------------------------------------------------------------------------------------
# source("source_function.R", echo = FALSE, max.deparse.length = Inf) 
# -------------------------------------------------------------------------------------------------------
# Library
# -------------------------------------------------------------------------------------------------------
source("source_library.R", echo = FALSE, max.deparse.length = Inf) 
# print(paste0("installed.packages=", installed.packages()))
# -------------------------------------------------------------------------------------------------------
# RxSqlServerData
# -------------------------------------------------------------------------------------------------------
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
sqlQuery <- paste0("SELECT * FROM ViewAnalyze", graphVersion, graphCategory, "01", graphType)
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
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
# graphName <- "hist.OddsByWin"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9)
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
# hist(data$OddsByWin.Odds1, main = "Odds1", breaks = "scott", col = "orange")
# hist(data$OddsByWin.Ninki, main = "Ninki", breaks = "scott", col = "orange")
# hist(data$OddsByWin.OddsLog1, main = "OddsLog1", breaks = "scott", col = "orange")
# hist(data$OddsByWin.OddsRatio1, main = "OddsRatio1", breaks = "scott", col = "orange")
# hist(data$OddsByWin.OddsLogit1, main = "OddsLogit1", breaks = "scott", col = "orange")
# hist(data$OddsByWin.ApprovalRate1, main = "ApprovalRate1", breaks = "scott", col = "orange")
# hist(data$OddsByWin.ApprovalRateLog1, main = "ApprovalRateLog1", breaks = "scott", col = "orange")
# dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.FinishTime"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.FinishTime, main = "RaceHorse.FinishTime", breaks = "scott", col = "orange")
hist(data$RaceHorse.FinishTimeSdvByRace, main = "RaceHorse.FinishTimeSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.FinishTimeSdv, main = "RaceHorse.FinishTimeSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.FirstTime"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.FirstTime, main = "RaceHorse.FirstTime", breaks = "scott", col = "orange")
hist(data$RaceHorse.FirstTimeSdvByRace, main = "RaceHorse.FirstTimeSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.FirstTimeSdv, main = "RaceHorse.FirstTimeSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.LastTime"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.LastTime, main = "RaceHorse.LastTime", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeSdvByRace, main = "RaceHorse.LastTimeSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.LastTimeSdv, main = "RaceHorse.LastTimeSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepHorseNumRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepHorseNumRatio, main = "RaceHorse.PrepHorseNumRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHorseNumRatioSdvByRace, main = "RaceHorse.PrepHorseNumRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHorseNumRatioSdv, main = "RaceHorse.PrepHorseNumRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepWeight"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepWeight, main = "RaceHorse.PrepWeight", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightSdvByRace, main = "RaceHorse.PrepWeightSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightSdv, main = "RaceHorse.PrepWeightRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepWeightDelta"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepWeightDelta, main = "RaceHorse.PrepWeightDelta", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightDeltaSdvByRace, main = "RaceHorse.PrepWeightDeltaSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightDeltaSdv, main = "RaceHorse.PrepWeightDeltaSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepWeightDeltaRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepWeightDeltaRatio, main = "RaceHorse.PrepWeightDeltaRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightDeltaRatioSdvByRace, main = "RaceHorse.PrepWeightDeltaRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepWeightDeltaRatioSdv, main = "RaceHorse.PrepWeightDeltaRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepHandicap"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepHandicap, main = "RaceHorse.PrepHandicapRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHandicapSdvByRace, main = "RaceHorse.PrepHandicapSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHandicapSdv, main = "RaceHorse.PrepHandicapSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepHandicapRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepHandicapRatio, main = "RaceHorse.PrepHandicapRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHandicapRatioSdvByRace, main = "RaceHorse.PrepHandicapRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepHandicapRatioSdv, main = "RaceHorse.PrepHandicapRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PrepLifetime"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PrepLifetime, main = "RaceHorse.PrepLifetime", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepLifetimeSdvByRace, main = "RaceHorse.PrepLifetimeSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.PrepLifetimeSdv, main = "RaceHorse.PrepLifetimeSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.HorseNumRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.HorseNumRatio, main = "RaceHorse.HorseNumRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.HorseNumRatioSdvByRace, main = "RaceHorse.HorseNumRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.HorseNumRatioSdv, main = "RaceHorse.HorseNumRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.Weight"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.Weight, main = "RaceHorse.Weight", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightSdvByRace, main = "RaceHorse.WeightSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightSdv, main = "RaceHorse.WeightRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.WeightDelta"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.WeightDelta, main = "RaceHorse.WeightDelta", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightDeltaSdvByRace, main = "RaceHorse.WeightDeltaSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightDeltaSdv, main = "RaceHorse.WeightDeltaSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.WeightDeltaRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.WeightDeltaRatio, main = "RaceHorse.WeightDeltaRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightDeltaRatioSdvByRace, main = "RaceHorse.WeightDeltaRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.WeightDeltaRatioSdv, main = "RaceHorse.WeightDeltaRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.Handicap"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.Handicap, main = "RaceHorse.HandicapRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.HandicapSdvByRace, main = "RaceHorse.HandicapSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.HandicapSdv, main = "RaceHorse.HandicapSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.HandicapRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.HandicapRatio, main = "RaceHorse.HandicapRatio", breaks = "scott", col = "orange")
hist(data$RaceHorse.HandicapRatioSdvByRace, main = "RaceHorse.HandicapRatioSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.HandicapRatioSdv, main = "RaceHorse.HandicapRatioSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.Lifetime"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.Lifetime, main = "RaceHorse.Lifetime", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeSdvByRace, main = "RaceHorse.LifetimeSdvByRace", breaks = "scott", col = "orange")
hist(data$RaceHorse.LifetimeSdv, main = "RaceHorse.LifetimeSdv", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.RaceHorse.PredictValue"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PredictValueA, main = "RaceHorse.PredictValueA", breaks = "scott", col = "orange")
hist(data$RaceHorse.PredictValueB, main = "RaceHorse.PredictValueB", breaks = "scott", col = "orange")
hist(data$RaceHorse.PredictValueC, main = "RaceHorse.PredictValueC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.OddsByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$OddsByWin.Odds1, main = "OddsByWin.Odds1", breaks = "scott", col = "orange")
hist(data$OddsByWin.Ninki, main = "OddsByWin.Ninki", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsLog1, main = "OddsByWin.OddsLog1", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsRatio1, main = "OddsByWin.OddsRatio1", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsLogit1, main = "OddsByWin.OddsLogit1", breaks = "scott", col = "orange")
hist(data$OddsByWin.ApprovalRate1, main = "OddsByWin.ApprovalRate1", breaks = "scott", col = "orange")
hist(data$OddsByWin.ApprovalRateLog1, main = "OddsByWin.ApprovalRateLog1", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.PayoffByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$PayoffByWin.IsHit, main = "PayoffByWin.IsHit", breaks = "scott", col = "orange")
hist(data$PayoffByWin.Ninki, main = "PayoffByWin.Ninki", breaks = "scott", col = "orange")
hist(data$PayoffByWin.Pay, main = "PayoffByWin.Pay", breaks = "scott", col = "orange")
hist(data$PayoffByWin.PayLog, main = "PayoffByWin.PayLog", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.PredictByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$PredictByWin.PredictValue, main = "PredictByWin.PredictValue", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueNorm, main = "PredictByWin.PredictValueNorm", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueSdv, main = "PredictByWin.PredictValueSdv", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueRank, main = "PredictByWin.PredictValueRank", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueLog, main = "PredictByWin.PredictValueLog", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.Odds1, main = "OddsByWin.Odds1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.Ninki by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.Ninki | Race.JyoType1Cd, main = "OddsByWin.Ninki by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1 | Race.JyoType1Cd, main = "OddsByWin.OddsLog1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsRatio1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsRatio1 | Race.JyoType1Cd, main = "OddsByWin.OddsRatio1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLogit1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLogit1 | Race.JyoType1Cd, main = "OddsByWin.OddsLogit1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.ApprovalRate1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.ApprovalRate1 | Race.JyoType1Cd, main = "OddsByWin.ApprovalRate1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.ApprovalRateLog1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.ApprovalRateLog1 | Race.JyoType1Cd, main = "OddsByWin.ApprovalRateLog1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.Ninki by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.Ninki | Race.RaceType1Cd, main = "OddsByWin.Ninki by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1 | Race.RaceType1Cd, main = "OddsByWin.OddsLog1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, main = "OddsByWin.OddsRatio1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, main = "OddsByWin.OddsLogit1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, main = "OddsByWin.ApprovalRate1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, main = "OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace, main = "RaceHorse.FinishTimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.FinishTimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdvByRace, main = "RaceHorse.LastTimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdvByRace by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.LastTimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdvByRace, main = "RaceHorse.FirstTimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdvByRace by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.FirstTimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv, main = "RaceHorse.FinishTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv | Race.JyoType1Cd, main = "RaceHorse.FinishTimeSdv by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv | Race.RaceType1Cd, main = "RaceHorse.FinishTimeSdv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdv, main = "RaceHorse.LastTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdv | Race.JyoType1Cd, main = "RaceHorse.LastTimeSdv by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdv | Race.RaceType1Cd, main = "RaceHorse.LastTimeSdv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdv, main = "RaceHorse.FirstTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdv, main = "RaceHorse.FirstTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FirstTimeSdv | Race.JyoType1Cd, main = "RaceHorse.FirstTimeSdv by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.Pay"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.Pay, main = "PayoffByWin.Pay", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.Pay by RaceHorse.KakuteiJyuni"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.Pay | RaceHorse.KakuteiJyuni, main = "PayoffByWin.Pay by RaceHorse.KakuteiJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.Pay by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.Pay | Race.RaceType1Cd, main = "PayoffByWin.Pay by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.PayLog"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.PayLog, main = "PayoffByWin.PayLog", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.PayLog by RaceHorse.KakuteiJyuni"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.PayLog, main = "PayoffByWin.PayLog", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PayoffByWin.PayLog | RaceHorse.KakuteiJyuni, main = "PayoffByWin.PayLog by RaceHorse.KakuteiJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.PayLog by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.PayLog | Race.RaceType1Cd, main = "PayoffByWin.PayLog by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue, main = "PredictByWin.PredictValue", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue, main = "PredictByWin.PredictValue", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PredictByWin.PredictValue | Race.JyoType1Cd, main = "PredictByWin.PredictValue by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue | Race.RaceType1Cd, main = "PredictByWin.PredictValue by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.FinishTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.FinishTimeSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.FinishTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.FinishTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.FinishTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.FirstTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.FirstTimeSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.FirstTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.FirstTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.FirstTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.LastTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.LastTimeSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.LastTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.LastTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.LastTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.WeightSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightSdvByRace, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.WeightDelta by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightDelta, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightDelta", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightDelta | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightDelta by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.HandicapSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapSdvByRace, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.HandicapRatioSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapRatioSdvByRace, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapRatioSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapRatioSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapRatioSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.WeightSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.WeightDelta by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightDelta, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightDelta", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.WeightDelta | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.WeightDelta by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.HandicapSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapRatioSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.LifetimeSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ PredictByWin.PredictValue, data = data, main = "PayoffByWin.Pay vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.Odds1, data = data, main = "PayoffByWin.Pay vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsLog1, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ DataMining.DmTimeSdv, data = data, main = "PayoffByWin.Pay vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ DataMiningTaisen.TmScoreSdv, data = data, main = "PayoffByWin.Pay vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsRatio1, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsLogit1, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.ApprovalRate1, data = data, main = "PayoffByWin.Pay vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ OddsByWin.ApprovalRateLog1, data = data, main = "PayoffByWin.Pay vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.FinishTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FinishTimeSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FinishTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FinishTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FinishTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.FirstTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FirstTimeSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FirstTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FirstTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FirstTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.LastTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.LastTimeSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.LastTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.LastTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.LastTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.WeightSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightSdvByRace, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightDeltaSdvByRace, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightDeltaSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.HandicapSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapSdvByRace, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapRatioSdvByRace, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapRatioSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.WeightSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightDeltaSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.WeightDeltaSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.HandicapSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapRatioSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.LifetimeSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ PredictByWin.PredictValue, data = data, main = "PayoffByWin.PayLog vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.Odds1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsLog1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ DataMining.DmTimeSdv, data = data, main = "PayoffByWin.PayLog vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ DataMiningTaisen.TmScoreSdv, data = data, main = "PayoffByWin.PayLog vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsRatio1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsLogit1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.ApprovalRate1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ OddsByWin.ApprovalRateLog1, data = data, main = "PayoffByWin.PayLog vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.UmabanSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDelta by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDelta, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDelta", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDelta | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDelta by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.Odds1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsRatio1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLogit1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.ApprovalRate1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.ApprovalRateLog1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.UmabanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.UmabanSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDelta by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDelta, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDelta", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDelta | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDelta by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.Odds1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsRatio1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLogit1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.ApprovalRate1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.ApprovalRateLog1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
#######################################################################
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
# graphName <- "xyplot.RaceHorse.IsHitA vs OddsByWin.TimeDvByRace by Race.RaceType1Cd"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9)
# xyplot(RaceHorse.IsHitA ~ OddsByWin.TimeDvByRaceAvg | Race.RaceType1Cd, data = data, main = "RaceHorse.IsHitA vs OddsByWin.TimeDvByRaceAvg by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
# dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# Save Image
# -------------------------------------------------------------------------------------------------------
# tic()
# save.image(file=FILENAME)
# toc()
# -------------------------------------------------------------------------------------------------------
# Log End
# -------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- log Finish ---"))
print(paste0(Sys.time(), " --- graph Finish ---"))
sink()
# toc()
print("q...")
 # q("no")
 