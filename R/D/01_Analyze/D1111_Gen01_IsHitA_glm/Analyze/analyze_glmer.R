# ---------------------------------------------------------------------------------------------------------------------------
# Project Name: Jackpot
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(),  " --- analyze_glmer.R Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------

 # ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source_init.R", echo=FALSE, max.deparse.length=Inf)
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
# ---------------------------------------------------------------------------------------------------------------------------
# コマンドライン引数処理
args <- commandArgs(T)
# args
print(paste0("args=", args))
funcName <- as.character(args[1])
trackTypeCd <- as.character(args[2])
jyokenCd <- as.character(args[3])

# print(paste0("args[1]=", args[1]))
# print(paste0("args[2]=", args[2]))
# print(paste0("args[3]=", args[3]))
# print(paste0("args[4]=", args[4]))
# print(paste0("args[5]=", args[5]))
# print(paste0("args[6]=", args[6]))
# print(paste0("args[7]=", args[7]))

print(paste0("funcName=", funcName))
print(paste0("trackTypeCd=", trackTypeCd))
print(paste0("jyokenCd=", jyokenCd))
# ---------------------------------------------------------------------------------------------------------------------------
sqlViewName1 <- "ViewAnalyzeD1111Analyze01"
sqlViewName2 <- "Multi"
sqlViewName3 <- trackTypeCd
sqlViewName4 <- jyokenCd
# sqlViewName <- paste0(sqlViewName1, sqlViewName2)
sqlViewName <- paste0(sqlViewName1, sqlViewName2, "Type", sqlViewName3, sqlViewName4)
# funcName <- "lmer"
# funcName <- "glm"
funcName <- "glmer"
# funcName <- "glmer_offset"
# funcName <- "glmmML"
# funcName <- "predict"
# ---------------------------------------------------------------------------------------------------------------------------
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
logFilename <- paste(paste0(fileNamePrefixLog, "_", funcName, "_Type", trackTypeCd, jyokenCd), constFileExtensionLog, sep=constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append=FALSE, type="output", split=TRUE) # sink(logFilename, append=FALSE, type="message", split=TRUE)
# print("options=")
# jackpot_env_options<-options()
# print(jackpot_env_options)
jackpot_env_version<-version
print(paste0("version=", jackpot_env_version))
jackpot_env_getwd <- getwd()
print(paste0("getwd()=", jackpot_env_getwd))
jackpot_env_getenv<-Sys.getenv()
print(paste0("Sys.getenv()=", jackpot_env_getenv))
jackpot_env_memory.profile<-memory.profile()
print(paste0("memory.profile()=", jackpot_env_memory.profile))
jackpot_env_memory.size<-memory.size()
print(paste0("memory.size()=", jackpot_env_memory.size))
jackpot_env_memory.limit<-memory.limit()
print(paste0("memory.limit()=",  jackpot_env_memory.limit))
# ---------------------------------------------------------------------------------------------------------------------------
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
# tic()
source("source_rodbc.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# sqlQueryContext1 <- "SELECT TOP 50000 * FROM "
sqlQueryContext1<- "SELECT * FROM "
sqlQueryContext <- paste0(sqlQueryContext1, sqlViewName)
print(paste0("sqlQueryContext=", sqlQueryContext))
data <- sqlQuery(channel1, sqlQueryContext , as.is=F) # data <- sqlQuery(channel1, sqlQueryContext)
# data <- sqlQuery(channel1, sqlQueryContext , as.is=T) # data <- sqlQuery(channel1, sqlQueryContext)
odbcClose(channel1)
print("object.size(data)=")
print(object.size(data), unit="GiB")
print(object.size(data), unit="MiB")
print(paste0("nrow(data) odbc=" ,nrow(data)))
print("str(data)=")
# str(data)
str(data, list.len=ncol(data))
# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
data.before <- nrow(data)
data <- subset(data, Race.IsAnalyzeNormalPast == 1 & RaceHorse.IsValidRaceHorse == 1)
# data<- subset(data1, Race.IsAnalyzeNormalPast == 1 & Race.TrackTypeCd == trackTypeCd & Race.JyokenCd == jyokenCd & RaceHorse.IsValidRaceHorse == 1)
data.after <- nrow(data)
data.diff <- data.before-data.after
print(paste0("nrow(data) subset before=" ,data.before))
print(paste0("nrow(data) subset after =" ,data.after))
print(paste0("nrow(data) subset diff =" ,data.diff))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
data.before < -nrow(data)
data <- na.omit(data)
data.after < -nrow(data)
data.diff <- data.before-data.after
print(paste0("nrow(data) na.omit before=" ,data.before))
print(paste0("nrow(data) na.omit after=" ,data.after))
print(paste0("nrow(data) na.omit diff=" ,data.diff))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# str(data, list.len=ncol(data))
data.before < -nrow(data)

##########################################################################################
source(paste0("source_transform.", sqlViewName2, ".R"), echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
##########################################################################################
data.after < -nrow(data)
data.diff <- data.before-data.after
print(paste0("nrow(data) transform before=" ,data.before))
print(paste0("nrow(data) transform after=" ,data.after))
print(paste0("nrow(data) transform diff=" ,data.diff))
# toc()
# Create Dummy Variable
# tmp <- dummyVars(~., data=data)
# data.dummy <- as.data.frame(predictvalue(tmp, data))
# ---------------------------------------------------------------------------------------------------------------------------
# Centering
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# str(data, list.len=ncol(data))
# source("source_centering.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after cintering=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# str(data, list.len=ncol(data))
# source("source_scale.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after rescale=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# source("source_mean.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after mean=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# glmer
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
data <- data
print(paste0("glm nrow(data)=" ,nrow(data)))
print("str(data)=")
str(data, list.len=ncol(data))

source(paste0("source_logic_", funcName, ".R"), echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
print("jackpot_results_glmer=")
print(jackpot_results_glmer)
jackpot_results_glmer_summary <- summary(jackpot_results_glmer)
print("jackpot_results_glmer_summary=")
print(jackpot_results_glmer_summary)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Results glmer
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# Fixed Effect
jackpot_results_glmer_fixef <- fixef(jackpot_results_glmer)
print("jackpot_results_glmer_fixef=")
print(jackpot_results_glmer_fixef)
# Random Effect
jackpot_results_glmer_ranef <- ranef(jackpot_results_glmer)
print("jackpot_results_glmer_ranef=")
print(jackpot_results_glmer_ranef)
# vif
jackpot_results_glmer_vif <- vif(jackpot_results_glmer)
 print("jackpot_results_glmer_vif=")
 jackpot_results_glmer_vif
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "plot_jackpot_results_glmer"
pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # Font Size
plot(jackpot_results_glmer, main="jackpot_results_glmer", col="magenta")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Excel
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
source("source_excel.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
excelFilename <- paste(paste(fileNamePrefixExcel, funcName, sep=constUnderScore), constFileExtensionExcel, sep=constColon)
print(paste0("excelFilename=", excelFilename))
saveWorkbook(wb, file=print(paste0("excelFilename=", excelFilename)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot Common
# ---------------------------------------------------------------------------------------------------------------------------
# # tic()
# graphType <- "plot_data"
# pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
# pdfFilename
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9) # Font Size
# plot(data, main="plot", col="magenta")
# dev.off()
# # toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("save.image")
rdataFilename <- paste(paste(fileNamePrefixRData, funcName, sep=constUnderScore), constFileExtensionRData, sep=constColon)
print(paste0("rdataFilename=",rdataFilename))
save.image(rdataFilename)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Finish Time
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
finishTime <- proc.time()
procTime <- finishTime - startTime
procTime
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("log sink finish")
sink()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print("q...")
# q("no")

print(paste0(Sys.time(),  " --- analyze_glmer.R Finished ---"))
