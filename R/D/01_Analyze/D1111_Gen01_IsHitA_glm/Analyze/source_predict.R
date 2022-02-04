print(paste0(Sys.time(),  " --- source_predict.R Start ---"))

# data6$Predict <- predict(jackpot_results, data6)
data6$Predict <- predict(jackpot_results, data6, allow.new.levels = TRUE)

data6$Timestamp01 <- Sys.time()

columnList <- c("RaceHorse.RaceId", "RaceHorse.KettoNum", "Predict", "Timestamp01") 
data7 <- data6[, columnList]

print(paste0(Sys.time(),  " --- source_predict.R Finished ---"))
