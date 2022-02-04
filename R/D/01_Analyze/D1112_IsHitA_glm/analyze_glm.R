##########################################################################################
# Project Name: Jackpot
##########################################################################################
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
constFileExtensionPdf<- "pdf"
constColon <- "."
constUnderScore <- "_"
constSingleQuote <- "'"
constSqlSingleQuote <- "'"
constSqlSpace <- " "

# args
args <- commandArgs(T)

print(paste0("args=", args))
print(paste0("args[1]=", args[1]))
print(paste0("args[2]=", args[2]))
print(paste0("args[3]=", args[3]))
print(paste0("args[4]=", args[4]))
print(paste0("args[5]=", args[5]))
print(paste0("args[6]=", args[6]))
print(paste0("args[7]=", args[7]))

analyzeVersion <- as.character(args[1])
analyzeCategory <- as.character(args[2])
analyzeType <- as.character(args[3])
analyzeFunc <- as.character(args[4])
analyzeTrackTypeCd <- as.character(args[5])
analyzeJyokenCd <- as.character(args[6])

# analyzeVersion <- "D1112"
# analyzeCategory <- "Analyze"
# analyzeType <- "Gen01"
# analyzeFunc <- "glm"
# analyzeFunc <- "glmer_offset"
# analyzeFunc <- "glmmML"
# analyzeFunc <- "predict"
# analyzeTrackTypeCd <- 1
# analyzeJyokenCd <- 1

print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeType=", analyzeType))
print(paste0("analyzeFunc=", analyzeFunc))
print(paste0("analyzeTrackTypeCd=", analyzeTrackTypeCd))
print(paste0("analyzeJyokenCd=", analyzeJyokenCd))

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
print("log sink start")

print(paste0(Sys.time(), " --- analyze_glm.R Start ---"))

logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep=constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append=F, type="output", split=T) # sink(logFilename, append=F, type="message", split=T)
# print("options=")
# anayzeenv_options<- options()
# print(anayzeenv_options)
# anayzeenv_version<- version
# print(paste0("version=", anayzeenv_version))
# anayzeenv_getwd <- getwd()
# print(paste0("getwd()=", anayzeenv_getwd))
# anayzeenv_getenv<- Sys.getenv()
# print(paste0("Sys.getenv()=", anayzeenv_getenv))
# anayzeenv_memory.profile<- memory.profile()
# print(paste0("memory.profile()=", anayzeenv_memory.profile))
# anayzeenv_memory.size<- memory.size()
# print(paste0("memory.size()=", anayzeenv_memory.size))
# anayzeenv_memory.limit<- memory.limit()
# print(paste0("memory.limit()=", anayzeenv_memory.limit))
# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
source("source_function.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# RevoScaleR
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# source("source_rodbc.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
sqlConnString <- "Driver={SQL Server};Server=(local);Database=Jackpot;Trusted_Connection=true"

sqlWait <- TRUE
sqlConsoleOutput <- FALSE
sqlCompute <- RxInSqlServer(connectionString=sqlConnString, wait=sqlWait, consoleOutput=sqlConsoleOutput)

rxSetComputeContext(sqlCompute)
# rxSetComputeContext("local")
rxGetComputeContext()

sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, "Analyze01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd)
print(paste0("sqlQuery=", sqlQuery))
rowsPerRead <- 100000000
inDataSource <- RxSqlServerData(sqlQuery=sqlQuery, connectionString=sqlConnString, stringsAsFactors=T, rowsPerRead=rowsPerRead)
rxGetVarInfo(data=inDataSource)
data <- rxImport(inDataSource)
head(data)

objectSize <- object.size(data)
print(paste0("object.size(data) auto=", format(objectSize, units="auto")))
nrow.data.sqlQuery <- nrow(data)
print(paste0("nrow(data) sqlQuery=" ,nrow.data.sqlQuery))
print("str(data)=")
str(data, list.len=ncol(data))
# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
nrow.data.before <- nrow(data)
data <- subset(data, Race.IsAnalyzeNormalPast == 1 & RaceHorse.IsValidRaceHorse == 1)
# data<- subset(data, Race.IsAnalyzeNormalPast == 1 & Race.analyzeTrackTypeCd == analyzeTrackTypeCd & Race.analyzeJyokenCd == analyzeJyokenCd & RaceHorse.IsValidRaceHorse == 1)
nrow.data.after <- nrow(data)
nrow.data.diff <- nrow.data.before - nrow.data.after
print(paste0("nrow(data) subset before=" ,nrow.data.before))
print(paste0("nrow(data) subset after =" ,nrow.data.after))
print(paste0("nrow(data) subset diff =" ,nrow.data.diff))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
nrow.data.transform.before <- nrow(data)
##########################################################################################
# source(paste0("source_transform.", analyzeFunc, analyzeType, ".R"), echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
#########################################################################################
nrow.data.transform.after <- nrow(data)
nrow.data.transform.diff <- nrow.data.transform.before - nrow.data.transform.after
print(paste0("nrow(data) transform before=" ,nrow.data.transform.before))
print(paste0("nrow(data) transform after=" ,nrow.data.transform.after))
print(paste0("nrow(data) transform diff=" ,nrow.data.transform.diff))
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
# source("source_centering.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# print(paste0("nrow(data) after cintering=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# str(data, list.len=ncol(data))
# source("source_scale.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# print(paste0("nrow(data) after rescale=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# data <- data
# source("source_mean.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# print(paste0("nrow(data) after mean=" ,nrow(data)))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
nrow.data.na.omit.before <- nrow(data)
data <- na.omit(data)
nrow.data.na.omit.after <- nrow(data)
nrow.data.na.omit.diff <- nrow.data.na.omit.before - nrow.data.na.omit.after
print(paste0("nrow(data) na.omit before=" ,nrow.data.na.omit.before))
print(paste0("nrow(data) na.omit after =" ,nrow.data.na.omit.after))
print(paste0("nrow(data) na.omit diff =" ,nrow.data.na.omit.diff))
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
source(paste0("source_logic", "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, ".R"), echo=FALSE, max.deparse.length=Inf)
analyze.results.glm
analyze.results.glm.summary <- summary(analyze.results.glm)
print(analyze.results.glm.summary)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Step
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# analyze.results.glm.step <- Step(analyze.results.glm,direction="both", trace=0)
analyze.results.glm.step <- stepAIC(analyze.results.glm,direction="both", trace=0)
print(analyze.results.glm.step)
# analyze.results.glm.step <- step(analyze.results.glm,direction="both", trace=0)
analyze.results.glm.step.summary <- summary(analyze.results.glm.step)
print(analyze.results.glm.step.summary)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Results
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
## anova table the same as of class merMod but with additional F statistics and
## and denominator degrees of freedom and
## p-values calculated based on Satterthwaite's approximations
# analyze.results.anova_Satterthwaite <- anova(anayzeResults)
# analyze.results.anova_Satterthwaite
## anova table the same as of class merMod but with additional F statistics and
## denominator degrees of freedom and
## p-values calculated based on Kenward-Roger's approximations
## Not run:
# if(requireNamespace("pbkrtest", quietly=T))
# # analyze.results.anova <- anova(anayzeResults, ddf="Kenward-Roger")
# # analyze.results.anova
# Log time nedded
## End(Not run)
## anova table of class
# type 1 anova table with denominator degrees of freedom
# calculated based on Satterthwaite's approximation
## Not run:
# analyze.results.glm.anova_type1 <- anova(analyze.results.glm, type=1)
# print(paste0("analyze.results.glm.anova_type1=", analyze.results.glm.anova_type1))
# analyze.results.glm.anova_type2 <- anova(analyze.results.glm, type=2)
# print(paste0("analyze.results.glm.anova_type2=", analyze.results.glm.anova_type2))
# analyze.results.glm.anova_type3 <- anova(analyze.results.glm, type=3)
# print(paste0("analyze.results.glm.anova_type3=", analyze.results.glm.anova_type3))
# AOV
# analyze.results.glm.step.aov <- aov(analyze.results.glm.step)
# print("analyze.results.glm.step.aov=")
# analyze.results.glm.step.aov
# Confint
 # analyze.results.glm.step.confint <- confint(analyze.results.glm.step)
 # print("analyze.results.glm.step.confint=")
 # analyze.results.glm.step.confint
# vif
# analyze.results.glm.step.vif <- vif(analyze.results.glm.step)
 # print("analyze.results.glm.step.vif=")
 # analyze.results.glm.step.vif
# p-value
# 2 * (1 - pt(abs(t-value), データ個数 - 固定効果の数))
# Fixed Effect
# print("analyze.results.fixef")
# analyze.results.fixef
# Random Effect
# print("analyze.results.ranef")
# analyze.results.ranef
#Collinearity
# analyze.results.glm.step.collinearity <- check_collinearity(analyze.results.glm.step.summary)
# print("analyze.results.glm.step.collinearity=")
# analyze.results.glm.step.collinearity
# Zero Inflation
# analyze.results.glm.step.check_zeroinflation <- check_zeroinflation(analyze.results.glm.step.summary)
# print("analyze.results.glm.step.check_zeroinflation=")
# analyze.results.glm.step.check_zeroinflation
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "plot.analyze.results.glm"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper="a4r", width=9.5, height=7, pointsize=9)
par(ps=9) # Font Size
plot(analyze.results.glm, main="analyze.results.glm", col="magenta")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
graphType <- "plot.analyze.results.glm.step"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper="a4r", width=9.5, height=7, pointsize=9)
par(ps=9) # Font Size
plot(analyze.results.glm.step, main="analyze.results.glm.step", col="magenta")
dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("save.image")
rdataFilename <- paste0(paste0(fileNamePrefixRData, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, constColon, constFileExtensionRData))
print(paste0("rdataFilename=",rdataFilename))
save.image(rdataFilename)
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
nrow.data.final <- nrow(data)
print(paste0("nrow(data) final=" ,nrow.data.final))

print("q...")
 # q("no")
 
 print(paste0(Sys.time(), " --- analyze_glm.R Finished ---"))
 
 # ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print("log sink finish")
sink()
# toc()
