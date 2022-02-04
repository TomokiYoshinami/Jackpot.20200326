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
sqlViewName1 <- "AnalyzeExpectedValue01Gen01"
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
print("rodbc")
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
print("mean")
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
data6 <- data5
# str(data6, list.len=ncol(data6))
print("nrow(data6)")
nrow(data6)

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
# RODBC 2
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("rodbc")
sourceFileNameMain <- "rodbc"
sourceFilename <- paste(paste(fileNamePrefixSource, sourceFileNameMain, sep=constUnderScore), constFileExtensionR, sep=constColon)
sourceFilename
source(sourceFilename)

# data.frame(…, row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
# sqlSave(channel, dat, tablename = NULL, append = FALSE, rownames = TRUE, colnames = FALSE, verbose = FALSE, safer = TRUE, addPK = FALSE, typeInfo, varTypes, fast = TRUE, test = FALSE, nastring = NULL)
# sqlClear(channel, sqtable, errors = TRUE)

#getSqlTypeInfo
# getSqlTypeInfo("Microsoft SQL Server")

#fixef
tableName <- paste(baseName1, baseName2, "Predict", sep=constUnderScore)
tableName

sqlClear(channel = channel1, tableName, errors = TRUE)
sqlSave(channel = channel1, dat = data7, tablename = tableName, append = TRUE)

odbcClose(channel1)
# str(data1, list.len=ncol(data1))

toc()

# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("plot")
graphType <- "plot_01"
pdfFilename <- paste(paste(fileNamePrefixPdf, baseName2, baseName3, graphType, sep=constUnderScore), constFileExtensionPdf, sep=constColon)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
plot(jackpot_results, main="plot", col="magenta")

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
