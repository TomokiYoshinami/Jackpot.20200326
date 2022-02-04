# data6$Predict <- predict(jackpot_results, data6)
data6$Predict <- predict(jackpot_results, data6, allow.new.levels = TRUE)

data6$Timestamp01 <- Sys.time()

columnList <- c("RaceHorse.RaceId", "RaceHorse.KettoNum", "Predict", "Timestamp01") 
data7 <- data6[, columnList]
