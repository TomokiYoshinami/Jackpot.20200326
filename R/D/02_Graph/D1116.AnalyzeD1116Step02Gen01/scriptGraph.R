Sys.setenv(LANGUAGE = "CP932")

# sink("scriptGraph.log", append = FALSE, type = "output", split = TRUE)

print(paste0(Sys.time(),  " --- scriptGraph.R Start ---"))

args <- commandArgs(trailingOnly = TRUE)

print(paste0("args=", args))
print(paste0("args[1]=", args[1]))
print(paste0("args[2]=", args[2]))
print(paste0("args[3]=", args[3]))
print(paste0("args[4]=", args[4]))
print(paste0("args[5]=", args[5]))
print(paste0("args[6]=", args[6]))
print(paste0("args[7]=", args[7]))

graphVersion <- as.character(args[1])
graphCategory <- as.character(args[2])
graphType <- as.character(args[3])
graphTrackTypeCd <- as.integer(args[4])
graphJyokenCd <- as.character(args[5])

print("--------------------------------------------------------------------------------")
print(paste0("graphVersion=", graphVersion))
print(paste0("graphType=", graphType))
print(paste0("graphTrackTypeCd=", graphTrackTypeCd))
print(paste0("graphJyokenCd=", graphJyokenCd))
print("--------------------------------------------------------------------------------")

sourceName <- paste0(graphCategory, "_", graphType, ".R")
print(paste0("source=", sourceName))
source(sourceName)

print(paste0(Sys.time(),  " --- scriptGraph.R Finished ---"))

# sink()