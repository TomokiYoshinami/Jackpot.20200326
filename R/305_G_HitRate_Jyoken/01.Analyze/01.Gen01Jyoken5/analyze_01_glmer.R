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
sqlViewName1 <- "AnalyzeExpectedValueG01JyokenGen01"
sqlViewName2 <- "Jyoken5"
funcName <- "glmer"
# funcName <- "lmer"
# funcName <- "glm"
# funcName <- "glmer"
# funcName <- "glmer_offset"
# funcName <- "glmmML"
# funcName <- "predict"
########################################

# Query
sqlViewName <- paste0("ViewR301", sqlViewName1, sqlViewName2)
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
data1 <- sqlQuery(channel1, sqlQueryContext , as.is = F)
odbcClose(channel1)
# str(data1, list.len=ncol(data1))

print("nrow(data1)")
nrow(data1)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# na.omit
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# data2 <- data1
data2 <- na.omit(data1)
print("nrow(data2)")
nrow(data2)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data3 <- data2
# str(data3, list.len=ncol(data3))
print("nrow(data3)")
nrow(data3)

sourceFileNameMain <- "transform"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# Create Dummy Variable
# tmp <- dummyVars(~., data=data3)
# data3.dummy <- as.data.frame(predictvalue(tmp, data6))
# ---------------------------------------------------------------------------------------------------------------------------
# Centering
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data4 <- data3
# str(data4, list.len=ncol(data4))
print("nrow(data4)")
nrow(data4)

sourceFileNameMain <- "centering"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data5 <- data4
# str(data5, list.len=ncol(data5))
print("nrow(data5)")
nrow(data5)

sourceFileNameMain <- "scale"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# mean
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data6 <- data5
sourceFileNameMain <- "mean"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("jackpot_results1 <- Main")
data6 <- data5
# str(data6, list.len=ncol(data6))
print("nrow(data6)")
nrow(data6)

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
print("jackpot_results2 <- Step")
# jackpot_results2 <- step(jackpot_results1,direction = "both", trace = 0)
# jackpot_results2 <- step(jackpot_results1)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Results
# ---------------------------------------------------------------------------------------------------------------------------
tic()

#Results
jackpot_results <- jackpot_results1
# jackpot_results <- jackpot_results2

# Fixed Effect
jackpot_results_fixef <- fixef(jackpot_results)

# Random Effect
jackpot_results_ranef <- ranef(jackpot_results)

# Summary
jackpot_results_summary <- summary(jackpot_results)

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------------------------------------------------------
tic()

## anova table the same as of class merMod but with additional F statistics and
## and denominator degrees of freedom and
## p-values calculated based on Satterthwaite's approximations

# jackpot_results_anova_Satterthwaite <- anova(jackpot_results)
# jackpot_results_anova_Satterthwaite

## anova table the same as of class merMod but with additional F statistics and
## denominator degrees of freedom and
## p-values calculated based on Kenward-Roger's approximations
## Not run:

# if(requireNamespace("pbkrtest", quietly = TRUE))
# # jackpot_results_anova <- anova(jackpot_results, ddf = "Kenward-Roger")
# # jackpot_results_anova
# Log time nedded

## End(Not run)
## anova table of class

# type 1 anova table with denominator degrees of freedom
# calculated based on Satterthwaite's approximation
## Not run:
# jackpot_results_anova_type1 <- anova(jackpot_results, type = 1)
# jackpot_results_anova_type1
# jackpot_results_anova_type2 <- anova(jackpot_results, type = 2)
# jackpot_results_anova_type2
# jackpot_results_anova_type3 <- anova(jackpot_results# , type = 3)
# jackpot_results_anova_type3

# AIC
# print("jackpot_results_AIC")
# jackpot_results_AIC <- AIC(jackpot_results)
# jackpot_results_AIC <- AIC(logLik(jackpot_results))
# jackpot_results_AIC

# AOV
# print("jackpot_results_aov")
# jackpot_results_aov <- aov(jackpot_results)
# jackpot_results_aov

# Confint
# print("# jackpot_results_confint")
# jackpot_results_confint <- confint(jackpot_results)
# jackpot_results_confint

# coefficientsficient
# print("jackpot_results_coefficients")
# jackpot_results_coefficients <- coefficients(jackpot_results)
# jackpot_results_coefficients

# vif
# print("jackpot_results_vif")
# jackpot_results_vif <- vif(jackpot_results)
# jackpot_results_vif

# p-value
# 2 * (1 - pt(abs(t-value), データ個数 - 固定効果の数))

# Fixed Effect
print("jackpot_results_fixef")
jackpot_results_fixef

# Random Effect
print("jackpot_results_ranef")
jackpot_results_ranef

# print("jackpot_results_summary")
jackpot_results_summary

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
tic()
sourceFileNameMain <- "rodbc"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

# data.frame(…, row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
# sqlSave(channel, dat, tablename = NULL, append = FALSE, rownames = TRUE, colnames = FALSE, verbose = FALSE, safer = TRUE, addPK = FALSE, typeInfo, varTypes, fast = TRUE, test = FALSE, nastring = NULL)

#getSqlTypeInfo
# getSqlTypeInfo("Microsoft SQL Server")

#fixef
# tableName <- paste(sqlViewName1, "fixef", sep=constUnderScore)
# tableName

# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_fixef), tablename = tableName, safer = FALSE)
# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_fixef), tablename = tableName, safer = FALSE, addPK = TRUE, rownames = TRUE)
# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_fixef), tablename = tableName, safer = FALSE, addPK = TRUE)

#ranef
# for(i in 1: length(jackpot_results_ranef))
# {
	# tableName <- paste(sqlViewName1, "raenf", sprintf("%03d", i), sep=constUnderScore)
	# tableName <- "aaa.bbb"
	# tableName

	# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_ranef[i]), tablename = "aaa.bbb", safer = FALSE)
	# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_ranef[i]), tablename = tableName, safer = FALSE)
	# data1 <- sqlSave(channel = channel1, dat = data.frame(jackpot_results_ranef[i]), tablename = tableName, safer = FALSE, addPK = TRUE)
# }

odbcClose(channel1)
# str(data1, list.len=ncol(data1))

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "plot_01"
pdfFilename <- paste(paste(fileNamePrefixPdf, funcName, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
plot(jackpot_results, main="plot", col="magenta")

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
