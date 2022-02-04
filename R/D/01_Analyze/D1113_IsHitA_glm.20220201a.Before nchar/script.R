Sys.setenv(LANGUAGE = "CP932")

print(paste0(Sys.time(),  " --- script.R Start ---"))

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
analyzeFunc <- as.character(args[4])
analyzeTrackTypeCd <- as.character(args[5])
analyzeJyokenCd <- as.character(args[6])

print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeType=", analyzeType))
print(paste0("analyzeFunc=", analyzeFunc))
print(paste0("analyzeTrackTypeCd=", analyzeTrackTypeCd))
print(paste0("analyzeJyokenCd=", analyzeJyokenCd))

sourceName <- paste0(analyzeCategory, "_", analyzeFunc, ".R")
print(paste0("source=", sourceName))
source(sourceName)

print(paste0(Sys.time(),  " --- script.R Finished ---"))
