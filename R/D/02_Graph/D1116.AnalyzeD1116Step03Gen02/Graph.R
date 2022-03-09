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
graphVersion <- "D1116"
graphCategory <- "Graph"
graphType <- "AnalyzeD1116Step03Gen02"
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
# sqlQuery <- paste0("SELECT * FROM ViewAnalyze", graphVersion, graphCategory, "01", graphType)
sqlQuery <- paste0("SELECT PredictValueA, PredictValueLogitA FROM AnalyzeD1116Step03Gen02")
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
graphName <- "hist.AnalyzeD1116Step03Gen02"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
hist(data$PredictValueA, main = "PredictValueA", breaks = "scott", col = "orange")
hist(log(data$PredictValueA), main = "log(PredictValueA)", breaks = "scott", col = "orange")
hist(data$PredictValuelogitA, main = "PredictValueLogitA", breaks = "scott", col = "orange")
hist(log(data$PredictValuelogitA), main = "log(PredictValueLogitA)", breaks = "scott", col = "orange")
dev.off()
# toc()
# -------------------------------------------------------------------------------------------------------
# histogram
# -------------------------------------------------------------------------------------------------------
# tic()
graphName <- "histogram.AnalyzeD1116Step03Gen02"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", graphCategory, "_", graphType, "_", graphName), constFileExtensionPdf, sep = constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9)
histogram(~ PredictValueA, main = "PredictValueA", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ log(PredictValueA), main = "log(PredictValueA)", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ PredictValueLogitA, main = "PredictValueLogitA", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ log(PredictValueLogitA), main = "log(PredictValueLogitA)", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
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
 