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

analyzeVersion <- as.character(args[1])
analyzeCategory <- as.character(args[2])
analyzeType <- as.character(args[3])
analyzeFamily  <- as.character(args[4])
analyzeFunc <- as.character(args[5])
analyzeTrackTypeCd <- as.character(args[6])
analyzeJyokenCd <- as.character(args[7])

# analyzeVersion <- "D1115"
# analyzeCategory <- "Analyze"
# analyzeType <- "Gen01"
# analyzeFamily <- "IsHitA"
# analyzeFunc <- "glm"
# analyzeFunc <- "glmer"
# analyzeFunc <- "glmer_offset"
# analyzeFunc <- "glmmML"
# analyzeFunc <- "predict"
# analyzeTrackTypeCd <- 1
# analyzeJyokenCd <- 1

print("--------------------------------------------------------------------------------")
print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeType=", analyzeType))
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
logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep = constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append = FALSE, type = "output", split = TRUE)
print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, " Start ---"))
print(paste0(Sys.time(), " --- Log Start ---"))
print(paste0(Sys.time(), " --- analyze_glm.R Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeCategory=", analyzeCategory))
print(paste0("analyzeType=", analyzeType))
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
# tic()
# source("source_rodbc.R", echo = FALSE, max.deparse.length = Inf) 
sqlConnString <- "Driver={SQL Server};Server=(local);Database=Jackpot;Trusted_Connection=true"

sqlWait <- TRUE
sqlConsoleOutput <- FALSE
sqlCompute <- RxInSqlServer(connectionString = sqlConnString, wait = sqlWait, consoleOutput = sqlConsoleOutput)

# rxSetComputeContext(sqlCompute)
rxSetComputeContext("local")
rxGetComputeContext()

sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd)
print(paste0("sqlQuery=", sqlQuery))
rowsPerRead <- 10000000 # 50000
inDataSource <- RxSqlServerData(sqlQuery = sqlQuery, connectionString = sqlConnString, stringsAsFactors = TRUE, rowsPerRead = rowsPerRead)
rxGetVarInfo(data = inDataSource)
data <- rxImport(inDataSource)
print("head(data)=")
print(head(data))

objectSize <- object.size(data)
print(paste0("object.size(data) auto=", format(objectSize, units = "auto")))
nrow.data.sqlQuery <- nrow(data)
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) RxSqlServerData=" ,nrow.data.sqlQuery))
print("--------------------------------------------------------------------------------")
print("str(data)=")
str(data, list.len = ncol(data))
print(paste0(Sys.time(), " --- RxSqlServerData Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- subset Start ---"))
nrow.data.before <- nrow(data)
data <- subset(data, Race.IsAnalyzeNormalPast == 1 & RaceHorse.IsValidRaceHorse == 1)
# data<- subset(data, Race.IsAnalyzeNormalPast == 1 & Race.analyzeTrackTypeCd == analyzeTrackTypeCd & Race.analyzeJyokenCd == analyzeJyokenCd & RaceHorse.IsValidRaceHorse == 1)
nrow.data.after <- nrow(data)
nrow.data.diff <- nrow.data.before - nrow.data.after
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) subset before=" ,nrow.data.before))
print(paste0("nrow(data) subset after =" ,nrow.data.after))
print(paste0("nrow(data) subset diff =" ,nrow.data.diff))
print("--------------------------------------------------------------------------------")
print(paste0(Sys.time(), " --- subset Finish---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- transform Start ---"))
nrow.data.transform.before <- nrow(data)
##########################################################################################
# source(paste0("source_transform.", analyzeFunc, analyzeType, ".R"), echo = FALSE, max.deparse.length = Inf) 
#########################################################################################
nrow.data.transform.after <- nrow(data)
nrow.data.transform.diff <- nrow.data.transform.before - nrow.data.transform.after
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) transform before=" ,nrow.data.transform.before))
print(paste0("nrow(data) transform after=" ,nrow.data.transform.after))
print(paste0("nrow(data) transform diff=" ,nrow.data.transform.diff))
print("--------------------------------------------------------------------------------")
print("str(data)=")
print(str(data, list.len=ncol(data)))
print(paste0(Sys.time(), " --- transform Finish ---"))
# toc()
# Create Dummy Variable
# tmp <- dummyVars(~., data = data)
# data.dummy <- as.data.frame(predictvalue(tmp, data))
# ---------------------------------------------------------------------------------------------------------------------------
# centering
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- centering Start ---"))
# data <- data
# str(data, list.len = ncol(data))
# source("source_centering.R", echo = FALSE, max.deparse.length = Inf) 
# print("--------------------------------------------------------------------------------")
# print(paste0("nrow(data) after cintering=" ,nrow(data)))
# print("--------------------------------------------------------------------------------")
# print(paste0(Sys.time(), " --- centering Finish ---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# rescale
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- rescale Start ---"))
# data <- data
# str(data, list.len = ncol(data))
# source("source_scale.R", echo = FALSE, max.deparse.length = Inf) 
# print("--------------------------------------------------------------------------------")
# print(paste0("nrow(data) after rescale=" ,nrow(data)))
# print("--------------------------------------------------------------------------------")
# print(paste0(Sys.time(), " --- rescale Finish ---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- mean Start ---"))
# data <- data
# source("source_mean.R", echo = FALSE, max.deparse.length = Inf) 
# print("--------------------------------------------------------------------------------")
# print(paste0("nrow(data) after mean=" ,nrow(data)))
# print("--------------------------------------------------------------------------------")
# toc()
# print(paste0(Sys.time(), " --- mean Finish---"))
# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- na.omit Start ---"))
nrow.data.na.omit.before <- nrow(data)
data <- na.omit(data)
nrow.data.na.omit.after <- nrow(data)
nrow.data.na.omit.diff <- nrow.data.na.omit.before - nrow.data.na.omit.after
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) na.omit before=" ,nrow.data.na.omit.before))
print(paste0("nrow(data) na.omit after =" ,nrow.data.na.omit.after))
print(paste0("nrow(data) na.omit diff =" ,nrow.data.na.omit.diff))
print("--------------------------------------------------------------------------------")
str(data, list.len = ncol(data))
print(paste0(Sys.time(), " --- na.omit Finish ---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# glm
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- glm Start ---"))
# print(paste0(Sys.time(), " --- rxGlm ---"))
# data <- data
# print(paste0("glm nrow(data) input=" ,nrow(data)))
# print("str(data)=")
# source(paste0("source_logic", "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, ".R"), echo = FALSE, max.deparse.length = Inf)

# analyze.results.glm <- glm(form,
# , data = data
# ,family = "gaussian"
# ,family = "binomial"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
# ,data=data
# ,data = subset(data6, Race.IsAnalyzeNormalPast == 1)
# )
# analyze.results.glm.summary <- summary(analyze.results.glm)
# print(analyze.results.glm.summary)
# print(paste0(Sys.time(), " --- glm Finish---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Step
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- step Start ---"))
# analyze.results.glm.step <- Step(analyze.results.glm, d rection = "both", trace = 0)
# analyze.results.glm.step <- stepAIC(analyze.results.glm,d irection = "both", trace = 0)
# analyze.results.glm.step.summary <- summary(analyze.results.glm.step)
# print("analyze.results.glm.step.summary")
# print(analyze.results.glm.step.summary)
# print(paste0(Sys.time(), " --- step Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# rxGlm with rxStepControl
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- rxGlm with rxStepControl Start ---"))
source(paste0("source_logic", "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, ".R"), echo = FALSE, max.deparse.length = Inf)

analyze.results.glm.step.varsel <- rxStepControl(method = "stepwise", scope = form, keepStepCoefs = TRUE)

analyze.results.glm.step <- rxLogit(form,
, data = data
, variableSelection = analyze.results.glm.step.varsel
)

# analyze.results.glm.step <- rxGlm(form,
# , data = data
# , family = binomial(logit)
# , variableSelection = analyze.results.glm.step.varsel
# )

print("analyze.results.glm.step=")
print(analyze.results.glm.step)
analyze.results.glm.step.summary <- summary(analyze.results.glm.step)
print("analyze.results.glm.step.summary")
print(analyze.results.glm.step.summary)
print(paste0(Sys.time(), " --- rxGlm with rxStepControl Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# rxStepPlot
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- rxStepPlot Start ---"))
graphType <- "rxStepPlot"
pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
print(paste0("pdfFilename=", pdfFilename))
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps = 9) # Font Size

print("rxStepPlot=")
rxStepPlot(analyze.results.glm.step)

dev.off()
print(paste0(Sys.time(), " --- rxStepPlot Finish ---"))
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
# if(requireNamespace("pbkrtest", quietly = TRUE))
# # analyze.results.anova <- anova(anayzeResults, ddf = "Kenward-Roger")
# # analyze.results.anova
# Log time nedded
## End(Not run)
## anova table of class
# type 1 anova table with denominator degrees of freedom
# calculated based on Satterthwaite's approximation
## Not run:
# analyze.results.glm.anova_type1 <- anova(analyze.results.glm, type = 1)
# print(paste0("analyze.results.glm.anova_type1=", analyze.results.glm.anova_type1))
# analyze.results.glm.anova_type2 <- anova(analyze.results.glm, type = 2)
# print(paste0("analyze.results.glm.anova_type2=", analyze.results.glm.anova_type2))
# analyze.results.glm.anova_type3 <- anova(analyze.results.glm, type = 3)
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
# Collinearity
# analyze.results.glm.step.collinearity <- check_collinearity(analyze.results.glm.step.summary)
# print("analyze.results.glm.step.collinearity=")
# analyze.results.glm.step.collinearity
# Zero Inflation
# analyze.results.glm.step.check_zeroinflation <- check_zeroinflation(analyze.results.glm.step.summary)
# print("analyze.results.glm.step.check_zeroinflation=")
# analyze.results.glm.step.check_zeroinflation
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot glm
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphType <- "plot.analyze.results.glm"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps = 9) # Font Size
# plot(analyze.results.glm, main = "analyze.results.glm", col = "magenta")
# dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot step
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphType <- "plot.analyze.results.glm.step"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps = 9) # Font Size
# plot(analyze.results.glm.step, main = "analyze.results.glm.step", col = "magenta")
# dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- save.image Start ---"))
print("save.image")
rdataFilename <- paste0(paste0(fileNamePrefixRData, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, constColon, constFileExtensionRData))
print(paste0("rdataFilename=",rdataFilename))
save.image(rdataFilename)
print(paste0(Sys.time(), " --- save.image Finish ---"))
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- final Start ---"))
nrow.data.final <- nrow(data)
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) final=", nrow.data.final))
print("--------------------------------------------------------------------------------")
print(paste0(Sys.time(), " --- final Finish ---"))
 # ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- analyze_glm.R Finished ---"))
print(paste0(Sys.time(), " --- log Finish ---"))
sink()
# toc()

print("q...")
 # q("no")
 