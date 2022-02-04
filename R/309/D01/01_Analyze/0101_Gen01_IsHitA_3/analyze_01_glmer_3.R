# ---------------------------------------------------------------------------------------------------------------------------
# Project Name: Jackpot
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source_init.R", echo=TRUE, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Declaration
# ---------------------------------------------------------------------------------------------------------------------------
constFileExtensionRData <- "RData"
constFileExtensionR <- "R"
constFileExtensionLog <- "log"
constFileExtensionExcel <- "xlsx"
constFileExtensionPdf<-"pdf"
constColon <- "."
constUnderScore <- "_"
constSingleQuote <- "'"
constSqlSingleQuote <- "'"
constSqlSpace <- " "
################################################################################
sqlViewName1 <- "ViewR309AnalyzeD0101"
sqlViewName2 <- "Gen01"
sqlViewName <- paste0(sqlViewName1, sqlViewName2)
sqlViewName
trackTypeCd <- 3
# funcName <- "lmer"
# funcName <- "glm"
funcName <- "glmer"
# funcName <- "glmer_offset"
# funcName <- "glmmML"
# funcName <- "predict"
################################################################################
fileNamePrefixRData <- "RData"
fileNamePrefixSource <- "source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"
# -------------------------------------
# Working Directory
# -------------------------------------
# setwd("${R_USER}/GitHub/R/Revolution/Analysis")
# jackpot_dir1<-Sys.getenv("R_USER")
#jackpot_dir <- "C:/Users/unite/Documents/GitHub/Revo/JackpotRStudio/Analyze"
jackpot_dir <- getwd()
# jackpot_dir<-paste(dir1,dir2,sep="/")
 setwd(jackpot_dir)
# ---------------------------------------------------------------------------------------------------------------------------
# Log Start
# ---------------------------------------------------------------------------------------------------------------------------
print("log sink start")
logFilename <- paste(paste(fileNamePrefixLog, funcName, trackTypeCd, sep=constUnderScore), constFileExtensionLog, sep=constColon)
logFilename
sink(logFilename, append=FALSE, type="output", split=TRUE) # sink(logFilename, append=FALSE, type="message", split=TRUE)
# print("options=")
# jackpot_env_options<-options()
# print(jackpot_env_options)
print("version=")
jackpot_env_version<-version
print(jackpot_env_version)
print("getwd()=")
jackpot_env_getwd <- getwd()
print(jackpot_env_getwd)
print("Sys.getenv()=")
jackpot_env_getenv<-Sys.getenv()
print(jackpot_env_getenv)
print("memory.profile()=")
jackpot_env_memory.profile<-memory.profile()
print(jackpot_env_memory.profile)
print("memory.size()=")
jackpot_env_memory.size<-memory.size()
print(jackpot_env_memory.size)
print("memory.limit()=")
jackpot_env_memory.limit<-memory.limit()
print(jackpot_env_memory.limit)# ---------------------------------------------------------------------------------------------------------------------------
# Start Time
# ---------------------------------------------------------------------------------------------------------------------------
startTime <- proc.time()
# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
source("source_function.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# RODBC 1
# ---------------------------------------------------------------------------------------------------------------------------
tic()
source("source_rodbc.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# sqlQueryContext1 <- "SELECT TOP 50000 * FROM "
sqlQueryContext1<- "SELECT * FROM "
sqlQueryContext <- paste0(sqlQueryContext1, sqlViewName)
sqlQueryContext
data1 <- sqlQuery(channel1, sqlQueryContext , as.is=T) # data1 <- sqlQuery(channel1, sqlQueryContext)
odbcClose(channel1)
print(paste0("sqlQuery nrow(data)=" ,nrow(data1)))
print("str(data1)=")
# str(data1)
str(data1, list.len=ncol(data1))
# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data2 <- subset(data1, Race.IsAnalyzeNormalPast == 1 & Race.TrackTypeCd == trackTypeCd & RaceHorse.IsValidRaceHorse == 1)
data2.diff <- nrow(data1)-nrow(data2)
print(paste0("nrow(data2) after subset=" ,nrow(data2)))
print(paste0("nrow(data2,diff) after subset=" ,data2.diff))
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data3 <- data2
data3 <- na.omit(data2)
data3.diff <- nrow(data2)-nrow(data3)
print(paste0("nrow(data3) after na.omit=" ,nrow(data3)))
print(paste0("nrow(data3,diff) after na.omit=" ,data3.diff))
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data4 <- data3
# str(data4, list.len=ncol(data4))
##########################################################################################
source(paste0("source_transform.", sqlViewName2, ".R"), echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
##########################################################################################
print(paste0("nrow(data4) after transform=" ,nrow(data4)))
toc()
# Create Dummy Variable
# tmp <- dummyVars(~., data=data)
# data.dummy <- as.data.frame(predictvalue(tmp, data))
# ---------------------------------------------------------------------------------------------------------------------------
# Centering
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data5 <- data4
# str(data5, list.len=ncol(data5))
# source("source_centering.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data5) after cintering=" ,nrow(data5)))
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data6 <- data5
# str(data6, list.len=ncol(data6))
# source("source_scale.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data6) after rescale=" ,nrow(data6)))
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data7 <- data6
# source("source_mean.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data7) after mean=" ,nrow(data7)))
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# glmer
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data <- data7
data <- data4
print(paste0("nrow(data) before analyze=" ,nrow(data)))
print("str(data)=")
str(data, list.len=ncol(data))
source(paste0("source_logic_", funcName, ".R"), echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
print("jackpot_results_glmer=")
jackpot_results_glmer
jackpot_results_glmer_summary <- summary(jackpot_results_glmer)
print("jackpot_results_glmer_summary=")
jackpot_results_glmer_summary
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Results glmer
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# Fixed Effect
jackpot_results_glmer_fixef <- fixef(jackpot_results_glmer)
print("jackpot_results_glmer_fixef=")
jackpot_results_glmer_fixef
# Random Effect
jackpot_results_glmer_ranef <- ranef(jackpot_results_glmer)
print("jackpot_results_glmer_ranef=")
jackpot_results_glmer_ranef
# vif
jackpot_results_glmer_vif <- vif(jackpot_results_glmer)
 print("jackpot_results_glmer_vif=")
 jackpot_results_glmer_vif
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "plot_jackpot_results_glmer"
pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # Font Size
plot(jackpot_results_glmer, main="jackpot_results_glmer", col="magenta")
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Excel
# ---------------------------------------------------------------------------------------------------------------------------
tic()
source("source_excel.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
excelFilename <- paste(paste(fileNamePrefixExcel, funcName, sep=constUnderScore), constFileExtensionExcel, sep=constColon)
excelFilename
saveWorkbook(wb, file=excelFilename)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot Common
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphType <- "plot_data"
# pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
# pdfFilename
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9) # Font Size
# plot(data, main="plot", col="magenta")
# dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("save.image")
rdataFilename <- paste(paste(fileNamePrefixRData, funcName, trackTypeCd, sep=constUnderScore), constFileExtensionRData, sep=constColon)
rdataFilename
save.image(rdataFilename)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Finish Time
# ---------------------------------------------------------------------------------------------------------------------------
tic()
finishTime <- proc.time()
procTime <- finishTime - startTime
procTime
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("log sink finish")
sink()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print("q...")
# q("no")