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
analyzeType <- "Jockey"
analyzeFamily <- "IsHitA"
# analyzeFunc <- "glm"
# analyzeFunc <- "glmer"
# analyzeFunc <- "glmer_offset"
# analyzeFunc <- "glmmML"
# analyzeFunc <- "predict"
analyzeFunc <- "graph"
analyzeTrackTypeCd <- 0
analyzeJyokenCd <- "0"

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

histogramLayout<-c(3, 2)
histogramType<-"count"
# histogramType<-"density"
# histogramType<-"percent"

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
# source("source_function.R", echo = FALSE, max.deparse.length = Inf) 
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
sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType)
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
graphType <- "hist"
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

hist(data$Jockey.TimeDvByRaceAvg, main = "TimeDvByRaceAvg", breaks = "scott", col = "orange")
hist(data$Jockey.TimeDvByRaceMin, main = "TimeDvByRaceMin", breaks = "scott", col = "orange")
hist(data$Jockey.TimeDvByRaceMax, main = "TimeDvByRaceMax", breaks = "scott", col = "orange")
hist(data$Jockey.RunCount, main = "RunCount", breaks = "scott", col = "orange")
hist(data$Jockey.HitCount1, main = "HitCount1", breaks = "scott", col = "orange")
hist(data$Jockey.HitCount2, main = "HitCount2", breaks = "scott", col = "orange")
hist(data$Jockey.HitCount3, main = "HitCount3", breaks = "scott", col = "orange")
hist(data$Jockey.HitCount4, main = "HitCount4", breaks = "scott", col = "orange")
hist(data$Jockey.HitCount5, main = "HitCount5", breaks = "scott", col = "orange")
hist(data$Jockey.HitRate1, main = "HitRate1", breaks = "scott", col = "orange")
hist(data$Jockey.HitRate2, main = "HitRate2", breaks = "scott", col = "orange")
hist(data$Jockey.HitRate3, main = "HitRate3", breaks = "scott", col = "orange")
hist(data$Jockey.HitRate4, main = "HitRate4", breaks = "scott", col = "orange")
hist(data$Jockey.HitRate5, main = "HitRate5", breaks = "scott", col = "orange")

dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.Jockey.TimeDvByRaceAvg"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ Jockey.TimeDvByRaceAvg, main = "Jockey.TimeDvByRaceAvg", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceAvg | Race.JyokenCd, main = "Jockey.TimeDvByRaceAvg by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceAvg | Race.RaceType1Cd, main = "Jockey.TimeDvByRaceAvg by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()

# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.Jockey.TimeDvByRaceMin"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ Jockey.TimeDvByRaceMin, main = "Jockey.TimeDvByRaceMin", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceMin | Race.JyokenCd, main = "Jockey.TimeDvByRaceMin by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceMin | Race.RaceType1Cd, main = "Jockey.TimeDvByRaceMin by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()

# ---------------------------------------------------------------------------------------------------------------------------
# histogram
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "histogram.Jockey.TimeDvByRaceMax"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
histogram(~ Jockey.TimeDvByRaceMax, main = "Jockey.TimeDvByRaceMax", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceMax | Race.JyokenCd, main = "Jockey.TimeDvByRaceMax by Race.JyokenCd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
histogram(~ Jockey.TimeDvByRaceMax | Race.RaceType1Cd, main = "Jockey.TimeDvByRaceMax by Race.RaceType1Cd", data= data, labels = TRUE, type = histogramType, layout = histogramLayout)
dev.off()
# toc()

# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.TimeDvByRaceAvg vs Jockey.TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.TimeDvByRace ~ Jockey.TimeDvByRaceAvg | Race.RaceType1Cd, data=data, main = "RaceHorse.TimeDvByRace vs Jockey.TimeDvByRaceAvg by Race.RaceType1Cd", col = "blue", layout = c(3, 2))
dev.off()
# toc()

# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "xyplot.RaceHorse.IsHitA vs Jockey.TimeDvByRace by Race.RaceType1Cd"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_", graphType), constFileExtensionPdf, sep = constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
xyplot(RaceHorse.IsHitA ~ Jockey.TimeDvByRaceAvg | Race.RaceType1Cd, data=data, main = "RaceHorse.IsHitA vs Jockey.TimeDvByRaceAvg by Race.RaceType1Cd", col = "blue", layout = c(3, 2))
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
 