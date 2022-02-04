# -------------------------------------
# My Function
# -------------------------------------
MyClearConsole = clc = function(){
 # Clear console messages
 cat( "\014" )
}
 
MycCearPlots = function () {
 # Clear plots
 if( dev.cur() > 1 ) dev.off()
}
 
MyClearWorkspace = function () {
 # Clear global workspace
 rm( list = ls( envir = globalenv() ), envir = globalenv() )
}
 
MyClearAll = function(){
 # Clear console, plots, and workspace
 MyClearConsole()
 MyClearPlots()
 MyClearWorkspace()
}

MyClearAll()

# -------------------------------------
# Initialize
# -------------------------------------
rm(list = ls(all = TRUE))
list = ls(all = TRUE)

# object.size(x)
# オブジェクト x のサイズを object_size クラスで返します。実体はバイト数を表す整数です。
# 別の記事で紹介した pkginfo() でも使用しています。
# object_size クラス用の print() のオーバーライドがあり、units 属性で単位を指定できます。units に指定できる値は、"b", "Kb", "Mb", "Gb", "B", "KB", "MB", "GB", "auto" です。
gc <- gc()
# gc(verbose=getOption("verbose"), reset=FALSE)
# ガーベジコレクションを実行します。verbose を TRUE にすると、cons cell, vector の各領域についての統計情報を出力します。reset を TRUE にすると、メモリの最大使用量をリセットします。
# gctorture(on=TRUE)
# on を TRUE にして実行すると、以後メモリを確保しようとする度にガーベジコレクションを実行するようになります。超遅くなります。
# -------------------------------------
# Option
# -------------------------------------
options(digits = 1)
options(digits.sec = 7)
options(max.print = 999999)
# 最大の表示件数
# options(na.action = "na.fail")
options(na.action = "na.omit")
# options(str = strOptions(list.len = 999999))
options(papersize = "a4")
# PostScriptで使用する用紙デフォルトサイズ
options(scipen = 0)	# 1:e=yes, 0: e=no
# 指数表記（1e+05）を変更

 # for Excel
options( java.parameters = "-Xmx4g" )
 
# -------------------------------------
# Environment
# -------------------------------------
memory.profile <- memory.profile()
# cons cell の使用状況を SEXPREC のタイプごとに取得します。
memory.size <- memory.size(max = TRUE) # TRUE, FALSE, NA
# Windows 専用です。現在の使用メモリ量を取得します (max=FALSE)。max を TRUE にすると、OS から報告される割り当て済の最大メモリ量になります。max を NA にすると、メモリ上限量になります。
memory.limit <- memory.limit(size = NA) #NA, MB
# Windows 専用です。メモリ上限量を取得します (size=NA)。size に数値を指定すると、その値を MB として解釈し、メモリ上限量を変更します。
sessionInfo <- sessionInfo()
