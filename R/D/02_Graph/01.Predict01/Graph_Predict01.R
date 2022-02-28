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
graphType <- "Predict01"
graphTrackTypeCd <- 0
graphJyokenCd <- "0"
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
# ---------------------------------------------------------------------------------------------------------------------------
# Log Start
# ---------------------------------------------------------------------------------------------------------------------------
logFilename <- paste(paste0(fileNamePrefixLog, "_", graphCategory, "_", graphType), constFileExtensionLog, sep = constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append = FALSE, type = "output", split = TRUE)
print(paste0(Sys.time(),  " --- ", graphVersion, "_", graphCategory,  "_", graphType, " Start ---"))
print(paste0(Sys.time(), " --- Log Start ---"))
print(paste0(Sys.time(), " --- graph Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------
print("--------------------------------------------------------------------------------")
print(paste0("graphVersion=", graphVersion))
print(paste0("graphCategory=", graphCategory))
print(paste0("graphType=", graphType))
print(paste0("graphTrackTypeCd=", graphTrackTypeCd))
print(paste0("graphJyokenCd=", graphJyokenCd))
print("--------------------------------------------------------------------------------")
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
# source("source_function.R", echo = FALSE, max.deparse.length = Inf) 
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo = FALSE, max.deparse.length = Inf) 
# print(paste0("installed.packages=", installed.packages()))
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
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.OddsByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$OddsByWin.Odds1, main = "Odds1", breaks = "scott", col = "orange")
hist(data$OddsByWin.Ninki, main = "Ninki", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsLog1, main = "OddsLog1", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsRatio1, main = "OddsRatio1", breaks = "scott", col = "orange")
hist(data$OddsByWin.OddsLogit1, main = "OddsLogit1", breaks = "scott", col = "orange")
hist(data$OddsByWin.ApprovalRate1, main = "ApprovalRate1", breaks = "scott", col = "orange")
hist(data$OddsByWin.ApprovalRateLog1, main = "ApprovalRateLog1", breaks = "scott", col = "orange")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.PayoffByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$PayoffByWin.IsHit, main = "IsHit", breaks = "scott", col = "orange")
hist(data$PayoffByWin.Ninki, main = "Ninki", breaks = "scott", col = "orange")
hist(data$PayoffByWin.Pay, main = "Pay", breaks = "scott", col = "orange")
hist(data$PayoffByWin.PayLog, main = "PayLog", breaks = "scott", col = "orange")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "hist.PredictByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$PredictByWin.PredictValue, main = "PredictValue", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueNorm, main = "PredictValueNorm", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueDv, main = "PredictValueDv", breaks = "scott", col = "orange")
hist(data$PredictByWin.PredictValueRank, main = "PredictValueRank", breaks = "scott", col = "orange")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.OddsByWin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ OddsByWin.Odds1, main = "OddsByWin.Odds1", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.Ninki | Race.JyoType1Cd, main = "OddsByWin.Ninki by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsLog1 | Race.JyoType1Cd, main = "OddsByWin.OddsLog1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsRatio1 | Race.JyoType1Cd, main = "OddsByWin.OddsRatio1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsLogit1 | Race.JyoType1Cd, main = "OddsByWin.OddsLogit1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.ApprovalRate1 | Race.JyoType1Cd, main = "OddsByWin.ApprovalRate1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.ApprovalRateLog1 | Race.JyoType1Cd, main = "OddsByWin.ApprovalRateLog1 by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.Ninki | Race.RaceType1Cd, main = "OddsByWin.Ninki by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsLog1 | Race.RaceType1Cd, main = "OddsByWin.OddsLog1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, main = "OddsByWin.OddsRatio1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, main = "OddsByWin.OddsLogit1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, main = "OddsByWin.ApprovalRate1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, main = "OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.TimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.TimeSdvByRace, main = "RaceHorse.TimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.TimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeSdvByRace | Race.RaceType1Cd, main = "RaceHorse.TimeSdvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdvByRace, main = "RaceHorse.LastTimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.LastTimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeSdvByRace | Race.RaceType1Cd, main = "RaceHorse.LastTimeSdvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdvByRace"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdvByRace, main = "RaceHorse.FirstTimeSdvByRace", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FirstTimeSdvByRace | Race.JyoType1Cd, main = "RaceHorse.FirstTimeSdvByRace by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FirstTimeSdvByRace | Race.RaceType1Cd, main = "RaceHorse.FirstTimeSdvByRace by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.TimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.TimeSdv, main = "RaceHorse.TimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeSdv | Race.JyoType1Cd, main = "RaceHorse.TimeSdv by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.TimeSdv | Race.RaceType1Cd, main = "RaceHorse.TimeSdv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.LastTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.LastTimeSdv, main = "RaceHorse.LastTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeSdv | Race.JyoType1Cd, main = "RaceHorse.LastTimeSdv by Race.JyoType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.LastTimeSdv | Race.RaceType1Cd, main = "RaceHorse.LastTimeSdv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.RaceHorse.FirstTimeSdv"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ RaceHorse.FirstTimeSdv, main = "RaceHorse.FirstTimeSdv", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ RaceHorse.FirstTimeSdv | Race.RaceType1Cd, main = "RaceHorse.FirstTimeSdv by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.Pay"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.Pay, main = "PayoffByWin.Pay", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PayoffByWin.Pay | RaceHorse.KakuteiJyuni, main = "PayoffByWin.Pay by RaceHorse.KakuteiJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PayoffByWin.Pay | Race.RaceType1Cd, main = "PayoffByWin.Pay by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PayoffByWin.PayLog"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PayoffByWin.PayLog, main = "PayoffByWin.PayLog", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PayoffByWin.PayLog | RaceHorse.KakuteiJyuni, main = "PayoffByWin.PayLog by RaceHorse.KakuteiJyuni", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PayoffByWin.PayLog | Race.RaceType1Cd, main = "PayoffByWin.PayLog by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.PredictByWin.PredictValue"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictByWin.PredictValue, main = "PredictByWin.PredictValue", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PredictByWin.PredictValue | Race.RaceType1Cd, main = "PredictByWin.PredictValue by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.UmabanSdv by Race.JyoType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.UmabanSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.TimeSdvByRace, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.TimeSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.TimeSdvByRace | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.TimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.TimeSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.TimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.TimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.TimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.TimeSdvByRace, data = data, main = "PayoffByWin.Pay vs RaceHorse.TimeSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.TimeSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.BataijyuSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.BataijyuSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.BataijyuSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.BataijyuSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.BataijyuSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.ZogenSa by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.ZogenSa, data = data, main = "PayoffByWin.Pay vs RaceHorse.ZogenSa", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.ZogenSa by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.FutanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.FutanSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.FutanSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.FutanSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.FutanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.Pay vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.Pay ~ RaceHorse.FutanRatioSdv, data = data, main = "PayoffByWin.Pay vs RaceHorse.FutanRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.Pay ~ RaceHorse.FutanRatioSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.Pay vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.TimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.TimeSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.TimeSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.TimeSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.TimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.TimeSdvByRace, data = data, main = "PayoffByWin.PayLog vs RaceHorse.TimeSdvByRace", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.TimeSdvByRace | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.TimeSdvByRace by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.BataijyuSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.BataijyuSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.BataijyuSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.BataijyuSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.BataijyuSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.ZogenSa by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.ZogenSa, data = data, main = "PayoffByWin.PayLog vs RaceHorse.ZogenSa", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.ZogenSa by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.FutanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FutanSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FutanSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FutanSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FutanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.PayoffByWin.PayLog vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FutanRatioSdv, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FutanRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(PayoffByWin.PayLog ~ RaceHorse.FutanRatioSdv | Race.RaceType1Cd, data = data, main = "PayoffByWin.PayLog vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.UmabanSdv, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.BataijyuSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.BataijyuSdv, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.BataijyuSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.BataijyuSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.BataijyuSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.ZogenSa by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.ZogenSa, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.ZogenSa", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.ZogenSa by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.FutanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.FutanSdv, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.FutanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.FutanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.FutanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.FutanRatioSdv, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.FutanRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.FutanRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.TimeSdv vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.TimeSdv vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.TimeSdv vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.Odds1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsRatio1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsLogit1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.ApprovalRate1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.ApprovalRateLog1, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdv ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.UmabanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.UmabanSdv, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.BataijyuSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.BataijyuSdv, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.BataijyuSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.BataijyuSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.BataijyuSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.ZogenSa by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.ZogenSa, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.ZogenSa", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.ZogenSa by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.FutanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.FutanSdv, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.FutanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.FutanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.FutanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.FutanRatioSdv, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.FutanRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.FutanRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.TimeSdvByRace vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.TimeSdvByRace vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.TimeSdvByRace vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.Odds1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsRatio1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsLogit1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.ApprovalRate1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.ApprovalRateLog1, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.TimeSdvByRace ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.TimeSdvByRace vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
###########################################################################################
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.UmabanSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.UmabanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.UmabanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.UmabanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.BataijyuSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.BataijyuSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.BataijyuSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.BataijyuSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.BataijyuSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.ZogenSa by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.ZogenSa, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.ZogenSa", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.ZogenSa | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.ZogenSa by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.FutanSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.FutanSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.FutanRatioSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanRatioSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.FutanRatioSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.FutanRatioSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.LifetimeSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.LifetimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ RaceHorse.LifetimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs RaceHorse.LifetimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs PredictByWin.PredictValue by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ PredictByWin.PredictValue, data = data, main = "RaceHorse.OrderOfFinishSdv vs PredictByWin.PredictValue", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ PredictByWin.PredictValue | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs PredictByWin.PredictValue by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ DataMining.DmTimeSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs DataMining.DmTimeSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ DataMining.DmTimeSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs DataMining.DmTimeSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ DataMiningTaisen.TmScoreSdv, data = data, main = "RaceHorse.OrderOfFinishSdv vs DataMiningTaisen.TmScoreSdv", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ DataMiningTaisen.TmScoreSdv | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs DataMiningTaisen.TmScoreSdv by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.Odds1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.Odds1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.Odds1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.Odds1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.Odds1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsLog1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsRatio1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsRatio1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsRatio1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsRatio1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsLogit1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLogit1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.OddsLogit1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.OddsLogit1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.ApprovalRate1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRate1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.ApprovalRate1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRate1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphName <- "xyplot.RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.ApprovalRateLog1, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRateLog1", col = "blue", layout =  histogramLayout)
xyplot(RaceHorse.OrderOfFinishSdv ~ OddsByWin.ApprovalRateLog1 | Race.RaceType1Cd, data = data, main = "RaceHorse.OrderOfFinishSdv vs OddsByWin.ApprovalRateLog1 by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
dev.off()
# toc()
###########################################################################################
# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphName <- "xyplot.RaceHorse.IsHitA vs OddsByWin.TimeDvByRace by Race.RaceType1Cd"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9)
# xyplot(RaceHorse.IsHitA ~ OddsByWin.TimeDvByRaceAvg | Race.RaceType1Cd, data = data, main = "RaceHorse.IsHitA vs OddsByWin.TimeDvByRaceAvg by Race.RaceType1Cd", col = "blue", layout =  histogramLayout)
# dev.off()
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
 