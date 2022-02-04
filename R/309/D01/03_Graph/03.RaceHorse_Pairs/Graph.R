# ---------------------------------------------------------------------------------------------------------------------------
# Project Name: Jackpot
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Initialize
# ---------------------------------------------------------------------------------------------------------------------------
source("Source.init.R")
#Start
startTime<-proc.time()
# ---------------------------------------------------------------------------------------------------------------------------
# Declaration
# ---------------------------------------------------------------------------------------------------------------------------
constFileExtensionR<-"R"
constFileExtensionLog<-"log"
constFileExtensionExcel<-"xlsx"
#PDF
constFileExtensionPdf<-"pdf"
constColon<-"."
constUnderScore<-"_"
constSingleQuote<-"'"
constSqlSingleQuote<-"'"
constSqlSpace<-" "
#################################################
sqlViewName1<-"Graph01Pairs"
sqlViewName2<-""
# funcName<-"Step"
# funcName<-"Excel"
funcName<-"Pdf" # PDF
# logicType<-"glm"
# logicType<-"lmer"
# logicType<-"glmer"
#PDF
logicType<-"Graph"
histogramType<-"count"
# histogramType<-"density"
# histogramType<-"percent"
histogramLayout<-c(3, 2)
#################################################
# Query
sqlViewName<- paste0("ViewR308", sqlViewName1, sqlViewName2)
sqlViewName
# Prefix
fileNamePrefixSource<-"source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"
# ---------------------------------------------------------------------------------------------------------------------------
# Log
# ---------------------------------------------------------------------------------------------------------------------------
print("sink...")
logFilename<-paste0(fileNamePrefixLog, constColon, logicType, constColon, funcName, constColon, constFileExtensionLog)
logFilename
sink(logFilename, append = FALSE, split = TRUE)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
sourceFileNameMain<-"library"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)
# ---------------------------------------------------------------------------------------------------------------------------
# RODBC
# ---------------------------------------------------------------------------------------------------------------------------
tic()
sourceFileNameMain<-"rodbc"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)
sql_select<-"SELECT * FROM"
sqlQueryContext<-paste(sql_select, sqlViewName, sep=constSqlSpace)
sqlQueryContext
data1<-sqlQuery(conn1, sqlQueryContext , as.is = FALSE)
odbcClose(conn1)
# str(data1, list.len=ncol(data1))
print("nrow(data1)")
nrow(data1)
data<-data1
# ---------------------------------------------------------------------------------------------------------------------------
# Info
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("nrow(data)")
nrow(data)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# histgram sumamry
# ---------------------------------------------------------------------------------------------------------------------------
# par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます
# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "hist.pairs"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
# pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
# par(ps=9) # フォントサイズ
# pairs(data)
library(psych)
psych::pairs.panels(data)
dev.off()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Save Image
# ---------------------------------------------------------------------------------------------------------------------------
tic()
# save.image(file=FILENAME)
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# sink
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("q...")
# sink(file="abc.doc") #上書き
# sink(file="abc.doc") , append #追記
# sink()
toc()
# ---------------------------------------------------------------------------------------------------------------------------
# Finish Time
# ---------------------------------------------------------------------------------------------------------------------------
finishTime <- proc.time()
procTime <- finishTime - startTime
print("* * * * Time Information * * * * *")
procTime
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print("q...")
# q("no")