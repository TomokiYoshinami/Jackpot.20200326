# -------------------------------------
# Clear
# -------------------------------------
clearConsole = clc = function(){
 # Clear console messages
 cat( "\014" )
}
 
clearPlots = function () {
 # Clear plots
 if( dev.cur() > 1 ) dev.off()
}
 
clearWorkspace = function () {
 # Clear global workspace
 rm( list = ls( envir = globalenv() ), envir = globalenv() )
}
 
clearAll = function(){
 # Clear console, plots, and workspace
 clearConsole()
 clearPlots()
 clearWorkspace()
}

clearAll()

# -------------------------------------
# Initialize
# -------------------------------------
rm(list = ls(all = TRUE))
list = ls(all = TRUE)

# -------------------------------------
# Option
# -------------------------------------
options(scipen = 0)	# 1:e = yes, 0 = e = no
options(digits = 22)
options(digits.sec = 7)
options(max.print = 999999)
options(na.action = "na.fail")

 # for Excel
options( java.parameters = "-Xmx4g" )
 
# -------------------------------------
# Working Directory
# -------------------------------------
print("getwd()")
getwd()
# setwd("Projects")
# getwd()
print("Sys.getenv()")
Sys.getenv()
Sys.getenv("R_USER")
print("setwd()")
# setwd("${R_USER}/GitHub/R/Revolution/Analysis")
dir1<-Sys.getenv("R_USER")
#dir <- "C:/Users/unite/Documents/GitHub/Revo/JackpotRStudio/Analyze"
dir <- getwd()
# dir<-paste(dir1,dir2,sep = "/")
setwd <- setwd(dir)
print("getwd()")
getwd <- getwd()

# -------------------------------------
# Environment
# -------------------------------------
version <- version
print("memory.profile()")
memory.profile <- memory.profile()
print("memory.size()")
memory.size <- memory.size()
print("memory.size(max = TRUE)")
memory.size <- memory.size(max = TRUE)
#print("memory.size(max = FALSE)")
#memory.size(max = FALSE)
#print("memory.size(max = NA)")
#memory.size(max = NA)
print("memory.limit()")
# print("memory.limit(size = 9999)")
# memory.limit(size = 9999)
print("memory.limit(size = NA)")
memory.limit(size = NA)
memory.limit <- memory.limit()
print("gc()")
gc <- gc()
print("sessionInfo()")
sessionInfo <- sessionInfo()
