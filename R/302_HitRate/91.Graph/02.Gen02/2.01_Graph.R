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
baseName1<-"AnalyzeExpectedValue01GenF1Total"
baseName2<-"2"

# baseName3<-"01_Step"
# baseName3<-"02_Excel"
baseName3<-"03_Pdf" # PDF

# logicType<-"glm"
# logicType<-"lmer"
# logicType<-"glmer"
#PDF
logicType<-"graph"
#################################################

# Query
sqlViewName<- paste("Z_301_R_01", baseName1, baseName2, sep=constUnderScore)
sqlViewName

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
logFilename<-paste0(fileNamePrefixLog, constColon, baseName2, constColon, logicType, constColon, baseName3, constColon, constFileExtensionLog)
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
data1<-sqlQuery(conn1, sqlQueryContext , as.is = F)
odbcClose(conn1)
# str(data1, list.len=ncol(data1))

print("nrow(data1)")
nrow(data1)

# data2<-data1
data2<-na.omit(data1)
print("nrow(data2)")
nrow(data2)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Transform
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data3<-data2
# str(data3, list.len=ncol(data3))
print("nrow(data3)")
nrow(data3)

sourceFileNameMain<-"transform"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
source(sourceFilename)
toc()

# Create Dummy Variable
# tmp<-dummyVars(~ ., data=data3)
# data3.dummy<-as.data.frame(predictvalue(tmp, data6))
# ---------------------------------------------------------------------------------------------------------------------------
# Centering
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data4<-data3
# str(data4, list.len=ncol(data4))
print("nrow(data4)")
nrow(data4)

sourceFileNameMain<-"centering"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Rescale
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data5<-data4
# str(data5, list.len=ncol(data5))
print("nrow(data5)")
nrow(data5)

sourceFileNameMain<-"scale"
sourceFilename<-paste0(fileNamePrefixSource, constColon, sourceFileNameMain, constColon, constFileExtensionR)
sourceFilename
# source(sourceFilename)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# Info
# ---------------------------------------------------------------------------------------------------------------------------
tic()
data6 <- data5
data6 <- data1
# str(data6, list.len=ncol(data6))
print("nrow(data6)")
nrow(data6)
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# qqmath 
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "qqmath.01.AnalyzeExpectedValue01GenF1Total.PrevHitCountA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevRunCount, distribution = qnorm, col = "cyan")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA, distribution = qnorm, col = "orange")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateA, distribution = qnorm, col = "orange")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountB, distribution = qnorm, col = "green")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateB, distribution = qnorm, col = "green")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountC, distribution = qnorm, col = "yellow")
qqmath(~ data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateC, distribution = qnorm, col = "yellow")

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# qqnorm
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "qqnorm.01.AnalyzeExpectedValue01GenF1Total"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevRunCount, main = "AnalyzeExpectedValue01GenF1Total.PrevRunCount", col = "cyan")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevRunCount, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA, main = "AnalyzeExpectedValue01GenF1Total.PrevHitCountA", col = "orange")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateA, main = "AnalyzeExpectedValue01GenF1Total.PrevHitRateA", col = "orange")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateA, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountB, main = "AnalyzeExpectedValue01GenF1Total.PrevHitCountB", col = "green")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountB, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateB, main = "AnalyzeExpectedValue01GenF1Total.PrevHitRateB", col = "green")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateB, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountC, main = "AnalyzeExpectedValue01GenF1Total.PrevHitCountC", col = "yellow")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountC, col = "red")

qqnorm(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateC, main = "AnalyzeExpectedValue01GenF1Total.PrevHitRateC", col = "yellow")
qqline(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateC, col = "red")

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# hist
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "hist.01"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
# par(mfrow = c(2, 2))
# par(mfcol = c(2, 2))
# par(mfrow = (1, 1)) # 1画面
# par(new = TRUE) # 上書き
# par(mfrow = c(1, 2)) #グラフ表示画面を 1×2 分割します
# plot(res_2, which = 1) ; plot(res_2, which = 2) #目的の図のみを出すこともできます

hist(data6$AnalyzeExpectedValue01GenF1Total.PrevRunCount, breaks = "scott", col = "cyan")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA, breaks = "scott", col = "orange")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateA, breaks = "scott", col = "orange")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountB, breaks = "scott", col = "green")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateB, breaks = "scott", col = "green")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountC, breaks = "scott", col = "yellow")
hist(data6$AnalyzeExpectedValue01GenF1Total.PrevHitRateC, breaks = "scott", col = "yellow")

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
graphType <- "histogram.01.AnalyzeExpectedValue01GenF1Total.PrevRunCount"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
histogram(~ AnalyzeExpectedValue01GenF1Total.PrevRunCount | AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum, main="PrevHansyokuNum", data = data6, type = "percent", layout = c(3, 2))

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.02.AnalyzeExpectedValue01GenF1Total.PrevHitCountA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
histogram(~ AnalyzeExpectedValue01GenF1Total.PrevHitCountA | AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum, main="PrevHansyokuNum", data = data6, type = "percent", layout = c(3, 2))

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# histgram
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "histogram.03.AnalyzeExpectedValue01GenF1Total.PrevHitRateA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
histogram(~ AnalyzeExpectedValue01GenF1Total.PrevHitRateA | AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum, main="PrevHansyokuNum", data = data6, type = "percent", layout = c(3, 2))

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# plot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "plot.01.AnalyzeExpectedValue01GenF1Total"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
plot(data6$AnalyzeExpectedValue01GenF1Total.PrevRunCount, data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA, main="plot", col="green")

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# ggplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "ggplot.01.AnalyzeExpectedValue01GenF1Total"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ

ggplot0 <- ggplot(data = data6, mapping = aes(x = AnalyzeExpectedValue01GenF1Total.PrevRunCount, y = AnalyzeExpectedValue01GenF1Total.PrevHitCountA, color=data6$AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum))
ggplot1 <- ggplot0 + layer(geom = "point", stat = "identity", position = "identity")
ggplot2 <- ggplot1 + geom_point() # 散布図
ggplot3 <- ggplot2 + geom_smooth(method = "lm") # 回帰直線

# + scale_y_continuous(limits = c(0, 7)) # デフォルトを作っておく
# + theme_bw() # 白黒系テーマを当ててみる
# + labs(title = "タイトルだよー", subtitle = "サブタイトルだよー", caption = "図のキャプションだよーだよー", x = "えっくすじくだよー", y = "わいじくだよー", color = "からーだよー")
# + facet_grid(rows = vars(Species)) # 行数や列数を指定する場合
# + coord_flip() # 横軸と縦軸を入れ替える場合はcoord_flipを当てる

ggplot3

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# xyplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "xyplot.01.AnalyzeExpectedValue01GenF1Total.PrevHitCountA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
xyplot(
AnalyzeExpectedValue01GenF1Total.PrevHitCountA ~ AnalyzeExpectedValue01GenF1Total.PrevRunCount, 
data=data6, 
groups=data6$AnalyzeExpectedValue01GenF1Total.PrevRuncount, 
# groups=data6$AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum, 
scales = "free", 
# layout = c(2, 2), 
# auto.key=T, 	# T:凡例あり F:凡例なし
# as.table=T, 
grid = TRUE, 
 panel = function(x, y) {
 panel.xyplot(x, y)
 panel.abline(lm(y~ x), col='blue')
 }
)

dev.off()
toc()

# data = parent.frame(), 
# panel = if (is.null(groups)) "panel.xyplot" else "panel.superpose", 
# allow.multiple, 
# outer, 
# aspect = "fill", 
# as.table = FALSE, 
# between, 
# groups, 
# key, 
# auto.key = FALSE, 
# legend, 
# layout, 
# main, 
# page, 
# par.strip.text, 
# prepanel, 
# scales, 
# skip, 
# strip = "strip.default", 
# sub, 
# xlab, 
# xlim, 
# ylab, 
# ylim, 
# drop.unused.levels, 
# par.settings, 
# perm.cond, 
# index.cond, 
# ..., 
# default.scales, 
# panel.groups = "panel.xyplot", 
# subscripts, 
# subset

# ---------------------------------------------------------------------------------------------------------------------------
# barplot 
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "barplot.01.AnalyzeExpectedValue01GenF1Total.PrevHitCountA"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
barplot(height=data6$AnalyzeExpectedValue01GenF1Total.PrevHitCountA
# , width=c(1, 2, 3, 5, 8) # 各項目の棒の太さの指定
# , space=c(2, 5) # 棒と棒との間隔の指定．行列形式のデータを"beside=T"で読み込んだ場合はベクトルの最初の数値でグループ内の棒の間隔，次の数値でグループ間の棒の間隔の指定．
# , names.arg=c("a", "b", "c") # 各項目の名前の指定
# , legend.text=c("foo", "bar, "baz") # 凡例の指定
, beside=T # 行列形式のデータを読み込んだ際，"T"の場合は並列棒グラフ，"F"の場合は積み上げ棒グラフを描画
# , horiz=T # TかFにて垂直棒グラフか水平グラフかの指定
# , density=20 # 棒グラフの斜線の濃さの指定．数値またはベクトルにて指定
# , angle=c(30, 45, 60 # "density"で指定した斜線の角度の指定．数値またはベクトルにて指定
, col=c("red", "blue", "yellow") # 棒の色の指定
# , border=F # 棒の枠線の有無の指定
# , main="タイトル" # グラフのタイトルの指定
# , sub="サブタイトル" # グラフのサブタイトルの指定
# , xlab="Entry" # X軸のラベルの指定
# , ylab="Value" # Y軸のラベルの指定
# , xlim=c(0, 10) # X軸の表示範囲の指定．ベクトルで指定
# , ylim=c(0, 10) # X軸の表示範囲の指定．ベクトルで指定
# , log="y" # "x"または"y"または"xy"を指定することで，指定した軸を対数軸にて表示する
# , axis.lty=1 # X軸の表示スタイルを指定
# , las=1 # 軸目盛および各項目の表示スタイルを指定．0，1，2，3の数値で指定．デフォルトでは全軸の項目ラベル (目盛) は各軸に対して平行．las=1 を指定すると，各項目 (目盛) が全て水平に位置し Excel と同じになる．
# , font.main=15 # グラフのタイトルのフォントの指定
# , font.sub=2 # サブタイトルのフォントの指定
# , font.lab=15 # 軸ラベルのフォントの指定
# , font=15 # 軸項目および目盛のフォントの指定
# , cex.main=4 #	グラフのタイトルのフォントサイズの指定
# , cex.sub=1 # サブタイトルのフォントサイズの指定
# , cex.lab=1.6 # 軸ラベルのフォントサイズの指定
# , cex.names=1.2 # 軸項目のフォントサイズの指定
# cex.axis=1.2 # 目盛のフォントサイズの指定	
)

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# densityplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "densityplot.01.AnalyzeExpectedValue01GenF1Total.PrevRunCount"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
densityplot(~ AnalyzeExpectedValue01GenF1Total.PrevRunCount | AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum
, data = data6
, layout = c(3, 2)
# , n = 50 # number of points at which density is to be evaluated
# , plot.points = TRUE # logical specifying whether the x values should be plotted.
# , ref = FALSE # logical specifying whether a reference x-axis should be drawn.
)

dev.off()
toc()

# ---------------------------------------------------------------------------------------------------------------------------
# bwplot
# ---------------------------------------------------------------------------------------------------------------------------
tic()
graphType <- "bwplot.01.AnalyzeExpectedValue01GenF1Total.PrevRunCount"
pdfFilename<-paste0(fileNamePrefixPdf, constColon, baseName2, constColon, logicType, constColon, graphType, constColon, constFileExtensionPdf)
pdfFilename
pdf(pdfFilename, paper = "a4r", width = 9.5, height = 7, pointsize = 9)

par(ps=9) # フォントサイズ
bwplot(AnalyzeExpectedValue01GenF1Total.PrevRunCount~ AnalyzeExpectedValue01GenF1Total.PrevHansyokuNum, main="PrevHansyokuNum", data = data6, layout = c(3, 2))

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

