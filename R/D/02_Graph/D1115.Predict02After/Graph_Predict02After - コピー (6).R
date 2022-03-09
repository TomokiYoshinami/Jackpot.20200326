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
graphType <- "Predict02After"
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
hist(data$RaceHorse.PrepHandicap, main = "RaceHorse.PrepHandicap", breaks = "scott", col = "orange")
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
hist(data$RaceHorse.WeightSdv, main = "RaceHorse.WeightSdvRatioSdv", breaks = "scott", col = "orange")
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
graphName <- "hist.RaceHorse.PredictValueA"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$RaceHorse.PredictValueA, main = "RaceHorse.PredictValueA", breaks = "scott", col = "orange")
hist(log(data$RaceHorse.PredictValueA), main = "log(RaceHorse.PredictValueA)", breaks = "scott", col = "orange")
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
hist(data$OddsByWin.RealOdds1, main = "OddsByWin.RealOdds1", breaks = "scott", col = "orange")
hist(data$OddsByWin.Ninki, main = "OddsByWin.Ninki", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsLog1, main = "OddsByWin.OddsLog1", breaks = "scott", col = "orange")
hist(log(data$OddsByWin.Odds1), main = "log(OddsByWin.Odds1)", breaks = "scott", col = "orange")
hist(data$OddsByWin.ApprovalRate1, main = "OddsByWin.ApprovalRate1", breaks = "scott", col = "orange")
hist(data$OddsByWin.RealOddsLog1, main = "OddsByWin.RealOddsLog1", breaks = "scott", col = "orange")
hist(log(data$OddsByWin.RealOdds1), main = "OddsByWin.RealOdds1", breaks = "scott", col = "orange")
hist(data$OddsByWin.RealApprovalRate1, main = "OddsByWin.ApprovalRate1", breaks = "scott", col = "orange")
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
hist(log(data$PredictByWin.PredictValue), main = "log(PredictByWin.PredictValue)", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueNorm, main = "PredictByWin.PredictValueNorm", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueSdv, main = "PredictByWin.PredictValueSdv", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueRank, main = "PredictByWin.PredictValueRank", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueLog, main = "PredictByWin.PredictValueLog", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.AnalyzeD1115Step02Basic"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$AnalyzeD1115Step02Basic.PredictValueA, main = "AnalyzeD1115Step02Basic.PredictValueA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Basic.PredictValueB, main = "AnalyzeD1115Step02Basic.PredictValueB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Basic.PredictValueC, main = "AnalyzeD1115Step02Basic.PredictValueC", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Basic.PredictValueLogitA, main = "AnalyzeD1115Step02Basic.PredictValueLogitA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Basic.PredictValueLogitB, main = "AnalyzeD1115Step02Basic.PredictValueLogitB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Basic.PredictValueLogitC, main = "AnalyzeD1115Step02Basic.PredictValueLogitC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.AnalyzeD1115Step02Gen01"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$AnalyzeD1115Step02Gen01.PredictValueA, main = "AnalyzeD1115Step02Gen01.PredictValueA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen01.PredictValueB, main = "AnalyzeD1115Step02Gen01.PredictValueB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen01.PredictValueC, main = "AnalyzeD1115Step02Gen01.PredictValueC", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen01.PredictValueLogitA, main = "AnalyzeD1115Step02Gen01.PredictValueLogitA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen01.PredictValueLogitB, main = "AnalyzeD1115Step02Gen01.PredictValueLogitB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen01.PredictValueLogitC, main = "AnalyzeD1115Step02Gen01.PredictValueLogitC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.AnalyzeD1115Step02Gen02"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$AnalyzeD1115Step02Gen02.PredictValueA, main = "AnalyzeD1115Step02Gen02.PredictValueA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen02.PredictValueB, main = "AnalyzeD1115Step02Gen02.PredictValueB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen02.PredictValueC, main = "AnalyzeD1115Step02Gen02.PredictValueC", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen02.PredictValueLogitA, main = "AnalyzeD1115Step02Gen02.PredictValueLogitA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen02.PredictValueLogitB, main = "AnalyzeD1115Step02Gen02.PredictValueLogitB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Gen02.PredictValueLogitC, main = "AnalyzeD1115Step02Gen02.PredictValueLogitC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.AnalyzeD1115Step02Horse"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$AnalyzeD1115Step02Horse.PredictValueA, main = "AnalyzeD1115Step02Horse.PredictValueA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Horse.PredictValueB, main = "AnalyzeD1115Step02Horse.PredictValueB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Horse.PredictValueC, main = "AnalyzeD1115Step02Horse.PredictValueC", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Horse.PredictValueLogitA, main = "AnalyzeD1115Step02Horse.PredictValueLogitA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Horse.PredictValueLogitB, main = "AnalyzeD1115Step02Horse.PredictValueLogitB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Horse.PredictValueLogitC, main = "AnalyzeD1115Step02Horse.PredictValueLogitC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.AnalyzeD1115Step02Jockey"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$AnalyzeD1115Step02Jockey.PredictValueA, main = "AnalyzeD1115Step02Jockey.PredictValueA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Jockey.PredictValueB, main = "AnalyzeD1115Step02Jockey.PredictValueB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Jockey.PredictValueC, main = "AnalyzeD1115Step02Jockey.PredictValueC", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Jockey.PredictValueLogitA, main = "AnalyzeD1115Step02Jockey.PredictValueLogitA", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Jockey.PredictValueLogitB, main = "AnalyzeD1115Step02Jockey.PredictValueLogitB", breaks = "scott", col = "orange")
hist(data$AnalyzeD1115Step02Jockey.PredictValueLogitC, main = "AnalyzeD1115Step02Jockey.PredictValueLogitC", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# hist
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.BayesianTrial01"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$BayesianTrial01.PostProbA, main = "BayesianTrial01.PostProbA", breaks = "scott", col = "orange")
hist(data$BayesianTrial01.PostProbNormA, main = "BayesianTrial01.PostProbNormA", breaks = "scott", col = "orange")
hist(data$BayesianTrial01.PostProbSdvA, main = "BayesianTrial01.PostProbSdvA", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA, main = "RaceHorse.PredictValueA", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA | Race.TrackTypeCd, main = "RaceHorse.PredictValueA by Race.TrackTypeCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA | Race.JyokenCd, main = "RaceHorse.PredictValueA by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA | Race.JyoCd, main = "RaceHorse.PredictValueA by Race.JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA | Race.JyoType1Cd, main = "RaceHorse.PredictValueA by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.PredictValueA by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.PredictValueA | Race.RaceType1Cd, main = "RaceHorse.PredictValueA by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.OddsByWin.Ninki"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.Ninki, main = "OddsByWin.Ninki", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1, main = "OddsByWin.OddsLog1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1 by TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1 | Race.TrackTypeCd, main = "OddsByWin.OddsLog1 by Race.TrackTypeCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1 by JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1 | Race.JyokenCd, main = "OddsByWin.OddsLog1 by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.OddsLog1 by JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.OddsLog1 | Race.JyoCd, main = "OddsByWin.OddsLog1 by Race.JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.OddsByWin.ApprovalRate1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.ApprovalRate1, main = "OddsByWin.ApprovalRate1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.RealOddsLog1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.RealOddsLog1, main = "OddsByWin.RealOddsLog1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin.RealApprovalRate1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.RealApprovalRate1, main = "OddsByWin.RealApprovalRate1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace | Race.TrackTypeCd, main = "RaceHorse.FinishTimeSdvByRace by Race.TrackTypeCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace | Race.JyokenCd, main = "RaceHorse.FinishTimeSdvByRace by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace | Race.JyoCd, main = "RaceHorse.FinishTimeSdvByRace by Race.JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.RaceHorse.FinishTimeSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdvByRace | Race.RaceType1Cd, main = "RaceHorse.FinishTimeSdvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.RaceHorse.FinishTimeSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv | Race.TrackTypeCd, main = "RaceHorse.FinishTimeSdv by Race.TrackTypeCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv | Race.JyokenCd, main = "RaceHorse.FinishTimeSdv by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FinishTimeSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FinishTimeSdv | Race.JyoCd, main = "RaceHorse.FinishTimeSdv by Race.JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "histogram.PredictByWin.PredictValue by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue | Race.TrackTypeCd, main = "PredictByWin.PredictValue by Race.TrackTypeCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue | Race.JyokenCd, main = "PredictByWin.PredictValue by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue | Race.JyoCd, main = "PredictByWin.PredictValue by Race.JyoCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
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
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HorseNumRatio | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HorseNumRatio by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.WeightDeltaSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdv ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HorseNumRatio | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HorseNumRatio by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.WeightDeltaSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.WeightDeltaSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.HandicapRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.HandicapRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.TrackTypeCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.TrackTypeCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.TrackTypeCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyokenCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.JyokenCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyokenCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyoCd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.JyoCd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyoCd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# xyplot
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.JyoType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.JyoType1Cd", col = "blue", layout =  histogramLayout)
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
xyplot(RaceHorse.FinishTimeSdvByRace ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.FinishTimeSdvByRace vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
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
 