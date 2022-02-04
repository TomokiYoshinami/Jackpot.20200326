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
sqlViewName1<-"Graph01BeforePredict"
sqlViewName2<-""

# funcName<-"Step"
# funcName<-"Excel"
funcName<-"Pdf" # PDF

# logicType<-"glm"
# logicType<-"lmer"
# logicType<-"glmer"
#PDF
logicType<-"Graph"
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
# Function
# ---------------------------------------------------------------------------------------------------------------------------
sourceFileNameMain<-"function"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)

# ---------------------------------------------------------------------------------------------------------------------------
# Log
# ---------------------------------------------------------------------------------------------------------------------------
print("sink...")
logFilename<-paste0(fileNamePrefixLog, constColon, logicType, constColon, funcName, constColon, constFileExtensionLog)
logFilename
sink(logFilename, append = F, split = T)

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
data<-sqlQuery(conn1, sqlQueryContext , as.is = F)
odbcClose(conn1)
# str(data1, list.len=ncol(data1))

print("nrow(data)")
nrow(data)

data6<-data
# ---------------------------------------------------------------------------------------------------------------------------
# Info
# ---------------------------------------------------------------------------------------------------------------------------
tic()
print("nrow(data6)")
nrow(data6)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "hist.Race"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます

hist(data6$Race.JyoCd, main="JyoCd", breaks = "scott", col = "orange")
hist(data6$Race.RaceNum, main="RaceNum", breaks = "scott", col = "orange")
hist(data6$Race.YoubiCd, main="YoubiCd", breaks = "scott", col = "orange")
hist(data6$Race.GradeCd, main="GradeCd", breaks = "scott", col = "orange")
hist(data6$Race.SyubetuCd, main="SyubetuCd", breaks = "scott", col = "orange")
hist(data6$Race.KigoCd, main="KigoCd", breaks = "scott", col = "orange")
hist(data6$Race.JyuryoCd, main="JyuryoCd", breaks = "scott", col = "orange")
hist(data6$Race.Jyoken5Cd, main="Jyoken5Cd", breaks = "scott", col = "orange")
hist(data6$Race.JyokenCd, main="JyokenCd", breaks = "scott", col = "orange")
hist(data6$Race.Kyori, main="Kyori", breaks = "scott", col = "orange")
hist(data6$Race.Kyori, main="Kyori", breaks = seq(950, 4500, 100), col = "blue")
hist(data6$Race.DistanceTypeCd, main="DistanceTypeCd", breaks = "scott", col = "orange")
hist(data6$Race.DistanceType2Cd, main="DistanceType2Cd", breaks = "scott", col = "orange")
hist(data6$Race.TrackCd, main="TrackCd", breaks = "scott", col = "orange")
hist(data6$Race.CourseKubunCd, main="CourseKubunCd", breaks = "scott", col = "orange")
hist(data6$Race.TorokuTosu, main="TorokuTosu", breaks = "scott", col = "orange")
hist(data6$Race.SyussoTosu, main="SyussoTosu", breaks = "scott", col = "orange")
hist(data6$Race.NyusenTosu, main="NyusenTosu", breaks = "scott", col = "orange")
hist(data6$Race.TenkoCd, main="TenkoCd", breaks = "scott", col = "orange")
hist(data6$Race.TrackTypeCd, main="TrackTypeCd", breaks = "scott", col = "orange")
hist(data6$Race.TrackType2Cd, main="TrackType2Cd", breaks = "scott", col = "orange")
hist(data6$Race.TrackType3Cd, main="TrackType3Cd", breaks = "scott", col = "orange")
hist(data6$Race.CourseTypeCd, main="CourseTypeCd", breaks = "scott", col = "orange")
hist(data6$Race.FastestStart3Time, main="FastestStart3Time", breaks = "scott", col = "orange")
hist(data6$Race.FastestStart8Time, main="FastestStart8Time", breaks = "scott", col = "orange")
hist(data6$Race.FastestStart4Time, main="FastestStart4Time", breaks = "scott", col = "orange")
hist(data6$Race.FastestLast3Time, main="FastestLast3Time", breaks = "scott", col = "orange")
hist(data6$Race.FastestLast4Time, main="FastestLast4Time", breaks = "scott", col = "orange")
hist(data6$Race.TrackConditionCd, main="TrackConditionCd", breaks = "scott", col = "orange")


dev.off()
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
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.Race"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)
par(ps=9) # フォントサイズ

histogram(~ Race.JyoCd, main="JyoCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.RaceNum, main="RaceNum", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.YoubiCd, main="YoubiCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.GradeCd, main="GradeCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.SyubetuCd, main="SyubetuCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.KigoCd, main="KigoCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.JyuryoCd, main="JyuryoCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.Jyoken5Cd, main="Jyoken5Cd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.JyokenCd, main="JyokenCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.Kyori, main="Kyori", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.DistanceTypeCd, main="DistanceTypeCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.DistanceType2Cd, main="DistanceType2Cd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TrackCd, main="TrackCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.CourseKubunCd, main="CourseKubunCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TorokuTosu, main="TorokuTosu", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.SyussoTosu, main="SyussoTosu", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.NyusenTosu, main="NyusenTosu", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TenkoCd, main="TenkoCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TrackTypeCd, main="TrackTypeCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TrackType2Cd, main="TrackType2Cd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TrackType3Cd, main="TrackType3Cd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.CourseTypeCd, main="CourseTypeCd", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.FastestStart3Time, main="FastestStart3Time", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.FastestStart8Time, main="FastestStart8Time", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.FastestStart4Time, main="FastestStart4Time", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.FastestLast3Time, main="FastestLast3Time", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.FastestLast4Time, main="FastestLast4Time", data = data6, type = "percent", layout = c(3, 2))
histogram(~ Race.TrackConditionCd, main="TrackConditionCd", data = data6, type = "percent", layout = c(3, 2))

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

