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
# analyzeJyokenCd <- "1"

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
print(paste0(Sys.time(), " --- analyze_glmer.R Start ---"))
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
sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd)
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
print("str(data)=")
str(data, list.len = ncol(data))
print(paste0(Sys.time(), " --- RxSqlServerData Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# rxSummary
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print(paste0(Sys.time(), " --- rxSummary Start ---"))
# rxSummary <- rxSummary(
       # formula = form,
       # data = RxSqlServerData(sqlQuery = sqlQuery, connectionString = sqlConnString),
       # computeContext = RxInSqlServer(connectionString = sqlConnString)
       # )
# print("rxSummary=")
# print(rxSummary)
# print(paste0(Sys.time(), " --- rxSummary Start ---"))

# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- subset Start ---"))
nrow.data.before <- nrow(data)
data <- subset(data, Race.IsAnalyzeNormalPast == 1)
# data<- subset(data, Race.IsAnalyzeNormalPast == 1 & Race.analyzeTrackTypeCd == analyzeTrackTypeCd & Race.analyzeJyokenCd == analyzeJyokenCd & RaceHorse.IsValidRaceHorse == 1)
nrow.data.after <- nrow(data)
nrow.data.diff <- nrow.data.before - nrow.data.after
print("--------------------------------------------------------------------------------")
print(paste0("nrow(data) subset before=" ,nrow.data.before))
print(paste0("nrow(data) subset after =" ,nrow.data.after))
print(paste0("nrow(data) subset diff =" ,nrow.data.diff))
print("--------------------------------------------------------------------------------")
print(paste0(Sys.time(), " --- Subset Finish---"))
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
# glmer
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- glmer Start ---"))
source(paste0("source_logic", "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, ".R"), echo = TRUE, max.deparse.length = Inf)

analyze.results <- glmer(formula
, data = data
, family = binomial
# offset = log(PrevH01RaceHorse.TotalRunCount + 1)
# ,control=lmerControl(
# ,control=glmerControl(
# optimizer = "bobyqa" # Default
# optimizer = "Nelder_Mead"
# optimizer = "optimx", optCtrl=list(method="L-BFGS-B", maxiter=100000)
# optimizer = "optimx", optCtrl=list(method="nlminb", maxiter=100000)
# ,restart_edge = TRUE
# ,boundary.tol = 1e-5
# ,calc.derivs=TRUE
# ,use.last.params=FALSE
# ,sparseX = FALSE
# input checking options
# ,check.nobs.vs.rankZ = "ignore"
# ,check.nobs.vs.nlev = "stop"
# ,check.nobs.vs.nlev = "ignore" #Recoomend
# ,check.nlev.gtreq.5 = "ignore"
# ,check.nlev.gtr.1 = "stop"
# ,check.nlev.gtr.1 = "ignore" #Recoomend
# ,check.nobs.vs.nRE="stop"
# ,check.nobs.vs.nRE="ignore" # Reccomend
# ,check.rankX = c("message+drop.cols", "silent.drop.cols", "warn+drop.cols","stop.deficient", "ignore")
# ,check.scaleX = c("warning","stop","silent.rescale","message+rescale","warn+rescale","ignore")
# ,check.formula.LHS = "stop"

# convergence checking options
# ,check.conv.grad = .makeCC("warning", tol = 2e-3, relTol = NULL)
# ,check.conv.singular = .makeCC(action = "ignore",  tol = 1e-4)
# ,check.conv.hess = .makeCC(action = "warning", tol = 1e-6)

# ,optimizer args
# ,optCtrl = list(maxfun=1000, maxiter=1000)
# )

# ,family = "gaussian"
# ,family = "binomial"
# ,family = "poisson"
# ,method = "REML"
# ,method = "ML"
# ,method = "Laplace"
# ,method = "AGQ" 	#Not Implement
# ,data=data
# ,data = subset(data, Race.IsAnalyzeNormalPast == 1)
)

print("--------------------------------------------------------------------------------")
analyze.results.summary <- summary(analyze.results)
print("analyze.results.summary")
print(analyze.results.summary)
print("--------------------------------------------------------------------------------")

analyze.results.step <- analyze.results

print("--------------------------------------------------------------------------------")
# analyze.results.step <- stepAIC(analyze.results, direction = "both", trace = 0)
# print(paste0("stepAIC(analyze.results)=", analyze.results))
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
analyze.results.step.loglik <- logLik(analyze.results.step)
print(paste0("logLik(analyze.results.step)=", analyze.results.step.loglik))
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
analyze.results.step.aic <- AIC(analyze.results.step)
print(paste0("AIC(analyze.results.step)=", analyze.results.step.aic))
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
print("analyze.results.step=")
print(analyze.results.step)
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
analyze.results.step.summary <- summary(analyze.results.step)
print("analyze.results.step.summary")
print(analyze.results.step.summary)
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
analyze.results.step.fixef <- fixef(analyze.results.step)
print("analyze.results.step.fixef")
print(analyze.results.step.fixef)
print("--------------------------------------------------------------------------------")

print("--------------------------------------------------------------------------------")
analyze.results.step.ranef <- ranef(analyze.results.step)
print("analyze.results.step.ranef")
print(analyze.results.step.ranef)
print("--------------------------------------------------------------------------------")

print(paste0(Sys.time(), " --- glmer Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# rxStepPlot
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0(Sys.time(), " --- rxStepPlot Start ---"))
# graphType <- "rxStepPlot"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps = 9) # Font Size

# print("rxStepPlot=")
# rxStepPlot(analyze.results.step)

# dev.off()
# print(paste0(Sys.time(), " --- rxStepPlot Finish ---"))
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
# analyze.results.anova_type1 <- anova(analyze.results, type = 1)
# print(paste0("analyze.results.anova_type1=", analyze.results.anova_type1))
# analyze.results.anova_type2 <- anova(analyze.results, type = 2)
# print(paste0("analyze.results.anova_type2=", analyze.results.anova_type2))
# analyze.results.anova_type3 <- anova(analyze.results, type = 3)
# print(paste0("analyze.results.anova_type3=", analyze.results.anova_type3))
# AOV
# analyze.results.step.aov <- aov(analyze.results.step)
# print("analyze.results.step.aov=")
# analyze.results.step.aov
# Confint
# analyze.results.step.confint <- confint(analyze.results.step)
# print("analyze.results.step.confint=")
# analyze.results.step.confint
# vif
# analyze.results.step.vif <- vif(analyze.results.step)
# print("analyze.results.step.vif=")
# analyze.results.step.vif
# p-value
# 2 * (1 - pt(abs(t-value), データ個数 - 固定効果の数))
# Fixed Effect
# print("analyze.results.fixef")
# analyze.results.fixef
# Random Effect
# print("analyze.results.ranef")
# analyze.results.ranef
# Collinearity
# analyze.results.step.collinearity <- check_collinearity(analyze.results.step.summary)
# print("analyze.results.step.collinearity=")
# analyze.results.step.collinearity
# Zero Inflation
# analyze.results.step.check_zeroinflation <- check_zeroinflation(analyze.results.step.summary)
# print("analyze.results.step.check_zeroinflation=")
# analyze.results.step.check_zeroinflation
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot glm
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphType <- "plot.analyze.results"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps = 9) # Font Size
# plot(analyze.results, main = "analyze.results", col = "magenta")
# dev.off()
# toc()
# ---------------------------------------------------------------------------------------------------------------------------
# plot step
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# graphType <- "plot.analyze.results.step"
# pdfFilename <- paste(paste0(fileNamePrefixPdf, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, "_", graphType, constColon, constFileExtensionPdf))
# print(paste0("pdfFilename=", pdfFilename))
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps = 9) # Font Size
# plot(analyze.results.step, main = "analyze.results.step", col = "magenta")
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
print(paste0(Sys.time(), " --- analyze_glmer.R Finished ---"))
print(paste0(Sys.time(), " --- log Finish ---"))
sink()
# toc()

print("q...")
 # q("no")
 