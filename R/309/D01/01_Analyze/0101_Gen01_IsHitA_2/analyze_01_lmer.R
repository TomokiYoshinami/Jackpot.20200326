# ---------------------------------------------------------------------------------------------------------------------------
# Project Name: Jackpot
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source_init.R")

# ---------------------------------------------------------------------------------------------------------------------------
# Start Time
# ---------------------------------------------------------------------------------------------------------------------------
startTime <- proc.time()

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

########################################
sqlViewName1 <- "ViewR308AnalyzeC0301"
sqlViewName2 <- ""
# funcName <- "glmer"
funcName <- "lmer"
# funcName <- "glm"
# funcName <- "glmer"
# funcName <- "glmer_offset"
# funcName <- "glmmML"
# funcName <- "predict"
########################################

# Query
sqlViewName <- paste0(sqlViewName1, sqlViewName2)
sqlViewName

fileNamePrefixRData <- "RData"
fileNamePrefixSource <- "source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"

# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
sourceFileNameMain <- "function"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

# ---------------------------------------------------------------------------------------------------------------------------
# Log Start
# ---------------------------------------------------------------------------------------------------------------------------
print("start log sink...")
logFilename <- paste(paste(fileNamePrefixLog, funcName, sep=constUnderScore), constFileExtensionLog, sep=constColon)
logFilename
sink(logFilename, append = F, split = T)

# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
sourceFileNameMain <- "library"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

# ---------------------------------------------------------------------------------------------------------------------------
# RODBC 1
# ---------------------------------------------------------------------------------------------------------------------------
tic()
sourceFileNameMain <- "rodbc"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

sqlQueryContext1 <- "SELECT * FROM "
sqlQueryContext2 <- ""
sqlQueryContext <- paste0(sqlQueryContext1, sqlViewName, sqlQueryContext2)
sqlQueryContext
data <- sqlQuery(channel1, sqlQueryContext , as.is = F)
odbcClose(channel1)
# str(data, list.len=ncol(data))

print("nrow(data)")
nrow(data)

# ---------------------------------------------------------------------------------------------------------------------------
# Race.IsAnalyzeNormalPast == 1
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data <- subset(data, data$Race.IsAnalyzeNormalPast == 1)
nrow(data)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data <- data
data <- na.omit(data)
print("nrow(data)")
nrow(data)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data <- data
# str(data, list.len=ncol(data))
print("nrow(data)")
nrow(data)

sourceFileNameMain <- "transform"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)
toc()

# Create Dummy Variable
# tmp <- dummyVars(~., data=data)
# data.dummy <- as.data.frame(predictvalue(tmp, data))
# ---------------------------------------------------------------------------------------------------------------------------
# Centering
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data <- data
# str(data, list.len=ncol(data))
print("nrow(data)")
nrow(data)

sourceFileNameMain <- "centering"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data <- data
# str(data, list.len=ncol(data))
print("nrow(data)")
nrow(data)

sourceFileNameMain <- "scale"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data <- data
print("nrow(data)")
nrow(data)

sourceFileNameMain <- "mean"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("jackpot_results_lmer <- Main")

sourceFileNameMain <- "logic"
# sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, funcName, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, funcName, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Step
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("jackpot_results_lmer2 <- Step")
# jackpot_results_lmer2 <- step(jackpot_results_lmer,direction = "both", trace = 0)
# jackpot_results_lmer2 <- step(jackpot_results_lmer)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Results
# ---------------------------------------------------------------------------------------------------------------------------
tic()

# Fixed Effect
jackpot_results_lmer_fixef <- fixef(jackpot_results_lmer)

# Random Effect
jackpot_results_lmer_ranef <- ranef(jackpot_results_lmer)

# Summary
jackpot_results_lmer_summary <- summary(jackpot_results_lmer)

#Collinearity
jackpot_results_lmer_collinearity <- check_collinearity(jackpot_results_lmer_summary)

#Collinearity
print("jackpot_results_lmer_collinearity")
jackpot_results_lmer_collinearity <- check_collinearity(jackpot_results_lmer_summary)

# Zero Inflation
print("jackpot_results_lmer_check_zeroinflation")
jackpot_results_lmer_check_zeroinflation <- check_zeroinflation(jackpot_results_lmer_summary)

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------------------------------------------------------
tic()

## anova table the same as of class merMod but with additional F statistics and
## and denominator degrees of freedom and
## p-values calculated based on Satterthwaite's approximations

# jackpot_results_lmer_anova_Satterthwaite <- anova(jackpot_results_lmer)
# jackpot_results_lmer_anova_Satterthwaite

## anova table the same as of class merMod but with additional F statistics and
## denominator degrees of freedom and
## p-values calculated based on Kenward-Roger's approximations
## Not run:

# if(requireNamespace("pbkrtest", quietly = TRUE))
# # jackpot_results_lmer_anova <- anova(jackpot_results_lmer, ddf = "Kenward-Roger")
# # jackpot_results_lmer_anova
# Log time nedded

## End(Not run)
## anova table of class

# type 1 anova table with denominator degrees of freedom
# calculated based on Satterthwaite's approximation
## Not run:
# jackpot_results_lmer_anova_type1 <- anova(jackpot_results_lmer, type = 1)
# jackpot_results_lmer_anova_type1
# jackpot_results_lmer_anova_type2 <- anova(jackpot_results_lmer, type = 2)
# jackpot_results_lmer_anova_type2
# jackpot_results_lmer_anova_type3 <- anova(jackpot_results_lmer# , type = 3)
# jackpot_results_lmer_anova_type3

# AIC
# print("jackpot_results_lmer_AIC")
# jackpot_results_lmer_AIC <- AIC(jackpot_results_lmer)
# jackpot_results_lmer_AIC <- AIC(logLik(jackpot_results_lmer))
# jackpot_results_lmer_AIC

# AOV
# print("jackpot_results_lmer_aov")
# jackpot_results_lmer_aov <- aov(jackpot_results_lmer)
# jackpot_results_lmer_aov

# Confint
# print("# jackpot_results_lmer_confint")
# jackpot_results_lmer_confint <- confint(jackpot_results_lmer)
# jackpot_results_lmer_confint

# coefficientsficient
# print("jackpot_results_lmer_coefficients")
# jackpot_results_lmer_coefficients <- coefficients(jackpot_results_lmer)
# jackpot_results_lmer_coefficients

# vif
# print("jackpot_results_lmer_vif")
# jackpot_results_lmer_vif <- vif(jackpot_results_lmer)
# jackpot_results_lmer_vif

# p-value
# 2 * (1 - pt(abs(t-value), データ個数 - 固定効果の数))

# Fixed Effect
print("jackpot_results_lmer_fixef")
jackpot_results_lmer_fixef

# Random Effect
print("jackpot_results_lmer_ranef")
jackpot_results_lmer_ranef

# print("jackpot_results_lmer_summary")
jackpot_results_lmer_summary

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Excel
# ---------------------------------------------------------------------------------------------------------------------------
tic()
sourceFileNameMain <- "excel"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

excelFilename <- paste(paste(fileNamePrefixExcel, funcName, sep=constUnderScore), constFileExtensionExcel, sep=constColon)
excelFilename
saveWorkbook(wb, file=excelFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# RODBC 2
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# sourceFileNameMain <- "rodbc"
# sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
# sourceFilename
# source(sourceFilename)

# data.frame(…, row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
# sqlSave(channel, dat, tablename = NULL, append = FALSE, rownames = TRUE, colnames = FALSE, verbose = FALSE, safer = TRUE, addPK = FALSE, typeInfo, varTypes, fast = TRUE, test = FALSE, nastring = NULL)

#getSqlTypeInfo
# getSqlTypeInfo("Microsoft SQL Server")

#fixef
# tableName <- paste(sqlViewName1, "fixef", sep=constUnderScore)
# tableName

# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_fixef), tablename = tableName, safer = FALSE)
# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_fixef), tablename = tableName, safer = FALSE, addPK = TRUE, rownames = TRUE)
# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_fixef), tablename = tableName, safer = FALSE, addPK = TRUE)

#ranef
# for(i in 1: length(jackpot_results_lmer_ranef))
# {
	# tableName <- paste(sqlViewName1, "raenf", sprintf("%03d", i), sep=constUnderScore)
	# tableName <- "aaa.bbb"
	# tableName

	# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_ranef[i]), tablename = "aaa.bbb", safer = FALSE)
	# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_ranef[i]), tablename = tableName, safer = FALSE)
	# data <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_lmer_ranef[i]), tablename = tableName, safer = FALSE, addPK = TRUE)
# }

# odbcClose(channel1)
# str(data, list.len=ncol(data))

# toc()

# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "plot_jackpot_results_lmer"
pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ

plot(jackpot_results_lmer, main="plot", col="magenta")

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("save.image")
rdataFilename <- paste(paste(fileNamePrefixRData, funcName, sep=constUnderScore), constFileExtensionRData, sep=constColon)
rdataFilename
save.image(rdataFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Finish Time
# ---------------------------------------------------------------------------------------------------------------------------
tic()
finishTime <- proc.time()
procTime <- finishTime - startTime
print("* * * * Time Information * * * * *")
procTime
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("end log sink...")
sink()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print("q...")
# q("no")
