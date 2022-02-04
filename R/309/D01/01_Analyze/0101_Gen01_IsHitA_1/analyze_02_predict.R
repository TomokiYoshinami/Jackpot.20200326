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
# funcName <- "lmer"
# funcName <- "glm"
# funcName <- "glmer"
# funcName <- "glmer_offset"
# funcName <- "glmmML"
funcName <- "predict"
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
logFilename <- paste(paste(fileNamePrefixLog, baseName2, baseName3, sep=constUnderScore), constFileExtensionLog, sep=constColon)
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
# Load Image
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("load image")
rdataFilename <- paste(paste(fileNamePrefixRData, baseName2, sep=constUnderScore), constFileExtensionRData, sep=constColon)
rdataFilename
load(rdataFilename)
toc()

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
# Predict
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("Predict")

sourceFileNameMain <- "predict"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)
toc()

# merge(x, y, by, by.x, by.y, all, all.x, all.y)
# x: データフレーム　	
# y: データフレーム　	
# by: 結合キーを指定するベクトル　	
# by.x: データフレームXの結合キーを指定するベクトル, Default: by
# by.y: データフレームYの結合キーを指定するベクトル, Default: by
# all: 両方のデータを残すか指定する真偽値, Default: FALSE
# all.x: データフレームXのデータを残すか指定する真偽値, Default: all
# all.y: データフレームXのデータを残すか指定する真偽値, Default: all

# ---------------------------------------------------------------------------------------------------------------------------
# Results
# ---------------------------------------------------------------------------------------------------------------------------
tic()

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# RODBC 2
# ---------------------------------------------------------------------------------------------------------------------------
# tic()

# print("rodbc")
# sourceFileNameMain <- "rodbc"
# sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
# sourceFilename
# source(sourceFilename)

# data.frame(…, row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
# sqlSave(channel, dat, tablename = NULL, append = FALSE, rownames = TRUE, colnames = FALSE, verbose = FALSE, safer = TRUE, addPK = FALSE, typeInfo, varTypes, fast = TRUE, test = FALSE, nastring = NULL)
# sqlClear(channel, sqtable, errors = TRUE)

#getSqlTypeInfo
# getSqlTypeInfo("Microsoft SQL Server")

#fixef
# tableName <- paste(baseName1, baseName2, "Predict", sep=constUnderScore)
# tableName

# sqlClear(channel = channel1, tableName, errors = TRUE)
# sqlSave(channel = channel1, dat = data7, tablename = tableName, append = TRUE)

# odbcClose(channel1)
# str(data, list.len=ncol(data))

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("plot")
graphType <- "plot_jackpot_results_predict"
pdfFilename <- paste(paste(fileNamePrefixPdf, baseName2, baseName3, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
plot(jackpot_results_predict, main="plot", col="magenta")

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
# print("save.image")
# rdataFilename <- paste(paste(fileNamePrefixRData, baseName2, sep=constUnderScore), constFileExtensionRData, sep=constColon)
# rdataFilename
# save.image(rdataFilename)
# toc()

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
