##########################################################################################
# Project Name: Jackpot
##########################################################################################
print(paste0(Sys.time(),  " --- analyze_glm.R Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------

 # ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source_init.R", echo=F, max.deparse.length=Inf)
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

# trackTypeCd <- 1
# jyokenCd <- 1

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
sqlViewName2 <- "Gen02"
sqlViewName3 <-  trackTypeCd
sqlViewName4 <-  jyokenCd
# sqlViewName <- paste0(sqlViewName1, sqlViewName2)
sqlViewName <- paste0(sqlViewName1, sqlViewName2, "Type", sqlViewName3, sqlViewName4)
# funcName <- "lmer"
funcName <- "glm"
# funcName <- "glmer"
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
logFilename <- paste(paste0(fileNamePrefixLog, "_analyze_", funcName, "_Type", trackTypeCd, jyokenCd), constFileExtensionLog, sep=constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append=F, type="output", split=TRUE) # sink(logFilename, append=F, type="message", split=TRUE)
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
# Start Time
# ---------------------------------------------------------------------------------------------------------------------------
startTime <- proc.time()
# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
source("source_function.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# RODBC 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
#  source("source_rodbc.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
sqlConnString <- "Driver=SQL Server;Server=(local);Database=Jackpot;Trusted_Connection=true"

sqlWait <- TRUE
sqlConsoleOutput <- F
sqlCompute <- RxInSqlServer(connectionString = sqlConnString, wait = sqlWait, consoleOutput = sqlConsoleOutput)

rxSetComputeContext(sqlCompute)
# rxSetComputeContext("local")
rxGetComputeContext()

sqlQuery <- paste0("SELECT * FROM ", sqlViewName)
inDataSource <- RxSqlServerData(sqlQuery=sqlQuery, connectionString=sqlConnString, stringsAsFactors=T, rowsPerRead=100000000)
rxGetVarInfo(data=inDataSource)
data <- rxImport(inDataSource)
head(data)
objectSize <- object.size(data)
print(paste0("object.size(data) auto=", format(objectSize, units="auto")))
print(paste0("object.size(data) GiB=", format(objectSize, units="GiB")))
print(paste0("object.size(data) MiB=", format(objectSize, units="MiB")))
print(paste0("nrow(data) database=" ,nrow(data)))
print("str(data)=")
str(data, list.len=ncol(data))
# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
data.before <- nrow(data)
data <- subset(data, Race.IsAnalyzeNormalPast == 1 & RaceHorse.IsValidRaceHorse == 1)
# data<- subset(data, Race.IsAnalyzeNormalPast == 1 & Race.TrackTypeCd == trackTypeCd & Race.JyokenCd == jyokenCd & RaceHorse.IsValidRaceHorse == 1)
data.after <- nrow(data)
data.diff <- data.before-data.after
print(paste0("nrow(data) subset before=" ,data.before))
print(paste0("nrow(data) subset after =" ,data.after))
print(paste0("nrow(data) subset diff =" ,data.diff))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# str(data, list.len=ncol(data))
data.before < -nrow(data)
##########################################################################################
# source("source_transform._analyze.R"), echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# source(paste0("source_transform.", sqlViewName2, ".R"), echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
#########################################################################################
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
# source("source_centering.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after cintering=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# str(data, list.len=ncol(data))
# source("source_scale.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after rescale=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# source("source_mean.R", echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
# print(paste0("nrow(data) after mean=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
data.before <- nrow(data)
data <- na.omit(data)
data.after <- nrow(data)
data.diff <- data.before-data.after
print(paste0("nrow(data) na.omit before=" ,data.before))
print(paste0("nrow(data) na.omit after =" ,data.after))
print(paste0("nrow(data) na.omit diff =" ,data.diff))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# glm
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
data <- data
print(paste0("glm nrow(data) input=" ,nrow(data)))
print("str(data)=")
str(data, list.len=ncol(data))

source(paste0("source_logic_", funcName, ".R"), echo=F, max.deparse.length=Inf) # source(sourceFilename, echo=TRUE, max.deparse.length=Inf)
print("jackpot_results_glm=")
print(jackpot_results_glm)
jackpot_results_glm_summary <- summary(jackpot_results_glm)
print("jackpot_results_glm_summary=")
print(jackpot_results_glm_summary)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Step
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("jackpot_results_glm_step <- Step")
jackpot_results_glm_step <- stepAIC(jackpot_results_glm,direction="both", trace=0)
# jackpot_results_glm_step <- step(jackpot_results_glm,direction="both", trace=0)
print("jackpot_results_glm_step=")
print(jackpot_results_glm_step)
jackpot_results_glm_step_summary <- summary(jackpot_results_glm_step)
print("jackpot_results_glm_step_summary=")
print(jackpot_results_glm_step_summary)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Results
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
## anova table the same as of class merMod but with additional F statistics and
## and denominator degrees of freedom and
## p-values calculated based on Satterthwaite's approximations
# jackpot_results_anova_Satterthwaite <- anova(jackpot_results)
# jackpot_results_anova_Satterthwaite
## anova table the same as of class merMod but with additional F statistics and
## denominator degrees of freedom and
## p-values calculated based on Kenward-Roger's approximations
## Not run:
# if(requireNamespace("pbkrtest", quietly=TRUE))
# # jackpot_results_anova <- anova(jackpot_results, ddf="Kenward-Roger")
# # jackpot_results_anova
# Log time nedded
## End(Not run)
## anova table of class
# type 1 anova table with denominator degrees of freedom
# calculated based on Satterthwaite's approximation
## Not run:
# jackpot_results_glm_anova_type1 <- anova(jackpot_results_glm, type=1)
# print(paste0("jackpot_results_glm_anova_type1=", jackpot_results_glm_anova_type1))
# jackpot_results_glm_anova_type2 <- anova(jackpot_results_glm, type=2)
# print(paste0("jackpot_results_glm_anova_type2=", jackpot_results_glm_anova_type2))
# jackpot_results_glm_anova_type3 <- anova(jackpot_results_glm, type=3)
# print(paste0("jackpot_results_glm_anova_type3=", jackpot_results_glm_anova_type3))
# AOV
# jackpot_results_glm_step_aov <- aov(jackpot_results_glm_step)
# print("jackpot_results_glm_step_aov=")
# jackpot_results_glm_step_aov
# Confint
 # jackpot_results_glm_step_confint <- confint(jackpot_results_glm_step)
 # print("jackpot_results_glm_step_confint=")
 # jackpot_results_glm_step_confint
# vif
# jackpot_results_glm_step_vif <- vif(jackpot_results_glm_step)
 # print("jackpot_results_glm_step_vif=")
 # jackpot_results_glm_step_vif
# p-value
# 2 * (1 - pt(abs(t-value), データ個数 - 固定効果の数))
# Fixed Effect
# print("jackpot_results_fixef")
# jackpot_results_fixef
# Random Effect
# print("jackpot_results_ranef")
# jackpot_results_ranef
#Collinearity
# jackpot_results_glm_step_collinearity <- check_collinearity(jackpot_results_glm_step_summary)
# print("jackpot_results_glm_step_collinearity=")
# jackpot_results_glm_step_collinearity
# Zero Inflation
# jackpot_results_glm_step_check_zeroinflation <- check_zeroinflation(jackpot_results_glm_step_summary)
# print("jackpot_results_glm_step_check_zeroinflation=")
# jackpot_results_glm_step_check_zeroinflation
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "plot_jackpot_results_glm"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", funcName, "_Type", trackTypeCd, jyokenCd), graphType, constFileExtensionPdf, sep=constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper="a4r", width=9.5, height=7, pointsize=9)
par(ps=9) # Font Size
plot(jackpot_results_glm, main="jackpot_results_glm", col="magenta")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "plot_jackpot_results_glm_step"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", funcName, "_Type", trackTypeCd, jyokenCd), graphType, constFileExtensionPdf, sep=constColon)
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper="a4r", width=9.5, height=7, pointsize=9)
par(ps=9) # Font Size
plot(jackpot_results_glm_step, main="jackpot_results_glm_step", col="magenta")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("save.image")
rdataFilename <- paste(paste0(fileNamePrefixRData, "_", funcName, "_Type", trackTypeCd, jyokenCd), constFileExtensionRData, sep=constColon)
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
data.final <- nrow(data)
print(paste0("nrow(data) final=" ,data.final))

print("q...")
 # q("no")
 
 print(paste0(Sys.time(),  " --- analyze_glm.R Finished ---"))
 