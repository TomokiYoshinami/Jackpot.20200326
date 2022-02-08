##########################################################################################
# Project Name: Jackpot
##########################################################################################
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Declare
# ---------------------------------------------------------------------------------------------------------------------------
constFileExtensionRData <- "RData"
constFileExtensionR <- "R"
constFileExtensionLog <- "log"
constFileExtensionExcel <- "xlsx"
constFileExtensionPdf<- "pdf"
constColon <- "."
# constUnderScore <- "_"
# constSingleQuote <- "'"
# constSqlSingleQuote <- "'"
# constSqlSpace <- " "

fileNamePrefixRData <- "RData"
fileNamePrefixSource <- "source"
fileNamePrefixLog <- "log"
fileNamePrefixExcel <- "excel"
fileNamePrefixPdf <- "pdf"
# ---------------------------------------------------------------------------------------------------------------------------
# Log Start
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(),  " --- predict_glm.R Start ---"))

logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep=constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append=FALSE, type="output", split=TRUE)
print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, " Start ---"))
print("--- Log Start ---")
# ---------------------------------------------------------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------------------------------------------------------
# print("options=")
# jackpot_env_options<-options()
# print(jackpot_env_options)
# jackpot_env_version<-version
# print(paste0("version=", jackpot_env_version))
# jackpot_env_getwd <- getwd()
# print(paste0("getwd()=", jackpot_env_getwd))
# jackpot_env_getenv<-Sys.getenv()
# print(paste0("Sys.getenv()=", jackpot_env_getenv))
# jackpot_env_memory.profile<-memory.profile()
# print(paste0("memory.profile()=", jackpot_env_memory.profile))
# jackpot_env_memory.size<-memory.size()
# print(paste0("memory.size()=", jackpot_env_memory.size))
# jackpot_env_memory.limit<-memory.limit()
# print(paste0("memory.limit()=",  jackpot_env_memory.limit))
# ---------------------------------------------------------------------------------------------------------------------------
# Option
# ---------------------------------------------------------------------------------------------------------------------------
# options(stringsAsFactors=F)
# print("options() before=")
# print(options())
# formals(read.table)$as.is <- T
# formals(read.table)$as.is
# formals(read.table)$stringsAsFactors <- F
# formals(read.table)$stringsAsFactors
# print("options() after=")
# print(options())
# ---------------------------------------------------------------------------------------------------------------------------
# Function
# ---------------------------------------------------------------------------------------------------------------------------
source("source_function.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Load
# ---------------------------------------------------------------------------------------------------------------------------
print("--- Load Start ---")
logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep=constColon)
print("--- Load Finished ---")
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet.nrow.database <- nrow(InputDataSet)
# print(paste0("nrow(InputDataSet) sqlQuery=", InputDataSet.nrow.database))
# print("str(InputDataSet)=")
# print(str(InputDataSet, list.len=ncol(InputDataSet)))
# ---------------------------------------------------------------------------------------------------------------------------
# RevoScaleR
# ---------------------------------------------------------------------------------------------------------------------------
print("--- RevoScaleR Start ---")
# tic()
# source("source_rodbc.R", echo=FALSE, max.deparse.length=Inf) # source(sourceFilename, echo=T, max.deparse.length=Inf)
sqlConnString <- "Driver={SQL Server};Server=(local);Database=Jackpot;Trusted_Connection=true"

sqlWait <- TRUE
sqlConsoleOutput <- FALSE
sqlCompute <- RxInSqlServer(connectionString=sqlConnString, wait=sqlWait, consoleOutput=sqlConsoleOutput)

rxSetComputeContext(sqlCompute)
# rxSetComputeContext("local")
rxGetComputeContext()

# sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, "Predict01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd, " WHERE ([Race.IsPredictedRace]=1 OR @paramsIsPredictedRace IS NULL)")
sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, "Predict01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd, " WHERE [Race.IsPredictedRace]=1")
print(paste0("sqlQuery=", sqlQuery))
rowsPerRead <- 100000000
inDataSource <- RxSqlServerData(sqlQuery=sqlQuery, connectionString=sqlConnString, stringsAsFactors=T, rowsPerRead=rowsPerRead)
rxGetVarInfo(InputDataSet=inDataSource)
InputDataSet <- rxImport(inDataSource)
head(InputDataSet)

objectSize <- object.size(data)
print(paste0("object.size(data) auto=", format(objectSize, units="auto")))
nrow.data.sqlQuery <- nrow(data)
print(paste0("nrow(data) sqlQuery=" ,nrow.data.sqlQuery))
print("str(InputDataSet)=")
str(InputDataSet, list.len=ncol(InputDataSet))
print("--- RevoScaleR Finish ---")
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet subet
# ---------------------------------------------------------------------------------------------------------------------------
nrow.InputDataSet.subset.before <- nrow(InputDataSet)
###############################################################
# InputDataSet <- subset(InputDataSet, Race.IsAnalyzeFullPastAndFuture == 1 & Race.analyzeTrackTypeCd == analyzeTrackTypeCd & Race.analyzeJyokenCd == analyzeJyokenCd)
###############################################################
nrow.InputDataSet.subset.after <- nrow(InputDataSet)
nrow.InputDataSet.subset.diff <- nrow.InputDataSet.subset.before - nrow.InputDataSet.subset.after
print(paste0("nrow(InputDataSet) subset before=", nrow.InputDataSet.subset.before))
print(paste0("nrow(InputDataSet) subset after=", nrow.InputDataSet.subset.after))
print(paste0("nrow(InputDataSet) subset diff=", nrow.InputDataSet.subset.diff))
print(paste0("class(InputDataSet$Race.IsAnalyzeNormalPast)=", class(InputDataSet$Race.IsAnalyzeNormalPast)))
print(paste0("class(InputDataSet$Race.analyzeTrackTypeCd)=", class(InputDataSet$Race.analyzeTrackTypeCd)))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet transform
# ---------------------------------------------------------------------------------------------------------------------------
print("--- Transform Start ---")
nrow.InputDataSet.transform.before <- nrow(InputDataSet)
# source(paste0("source_transform_predict.", analyzeType, ".R"))
print("--- Transform Finished ---")
nrow.InputDataSet.transform.after <- nrow(InputDataSet)
nrow.InputDataSet.transform.diff <- nrow.InputDataSet.transform.before - nrow.InputDataSet.transform.after
print(paste0("nrow(InputDataSet) transaform before=", nrow.InputDataSet.transform.before))
print(paste0("nrow(InputDataSet) transaform after=", nrow.InputDataSet.transform.after))
print(paste0("nrow(InputDataSet) transaform diff=", nrow.InputDataSet.transform.diff))
print("str(InputDataSet)=")
print(str(InputDataSet, list.len=ncol(InputDataSet)))
# print("str(InputDataSet)")
# print(str(InputDataSet, list.len=ncol(InputDataSet)))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet na.omit
# ---------------------------------------------------------------------------------------------------------------------------
InputDataSet.nrow.na.omit.before <- nrow(InputDataSet)
InputDataSet <- na.omit(InputDataSet)
InputDataSet.nrow.na.omit.after <- nrow(InputDataSet)
InputDataSet.nrow.na.omit.diff <- InputDataSet.nrow.na.omit.before - InputDataSet.nrow.na.omit.after
print(paste0("nrow(InputDataSet) na.omit diff #1=" , InputDataSet.nrow.na.omit.diff))
# ---------------------------------------------------------------------------------------------------------------------------
# Predict Start
# ---------------------------------------------------------------------------------------------------------------------------
print("--- Predict Start ---")
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glm 1
# ---------------------------------------------------------------------------------------------------------------------------
if (analyzeFunc  == "glm")
{
print("analyze.results.glm.summary")
print(analyze.results.glm.summary)
print("analyze.results.glm.step.summary")
print(analyze.results.glm.step.summary)
# print("analyze.results.glm.step_aov")
# print(analyze.results.glm.step_aov)
# print("analyze.results.glm.step_vif")
# print(analyze.results.glm.step_vif)
}
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glmer1
# ---------------------------------------------------------------------------------------------------------------------------
if (analyzeFunc  == "glmer")
{
print("analyze.results.glmer")
print(analyze.results.glmer)
print("analyze.results.glmer.fixef")
print(analyze.results.glmer.fixef)
print("analyze.results.glmer_ranef")
print(analyze.results.glmer_ranef)
print("analyze.results.glmer.summary")
print(analyze.results.glmer.summary)
# print("analyze.results.glmer_vif ")
# print(analyze.results.glmer_vif)
}
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.JyoCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$Race.JyoCd)=", levels(data$Race.JyoCd)))
# print(paste0("levels(InputDataSet$Race.JyoCd)=", levels(InputDataSet$Race.JyoCd)))
# Race.JyoCd.Index <- which(!(InputDataSet$Race.JyoCd %in% levels(data$Race.JyoCd)))
# print(paste0("length(Race.JyoCd.Index)=", length(Race.JyoCd.Index)))
# InputDataSet$Race.JyoCd[Race.JyoCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.DistanceType2Cd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$Race.DistanceType2Cd)=", levels(data$Race.DistanceType2Cd)))
# print(paste0("levels(InputDataSet$Race.DistanceType2Cd)=", levels(InputDataSet$Race.DistanceType2Cd)))
# Race.DistanceType2Cd.Index <- which(!(InputDataSet$Race.DistanceType2Cd %in% levels(data$Race.DistanceType2Cd)))
# print(paste0("length(Race.DistanceType2Cd.Index)=", length(Race.DistanceType2Cd.Index)))
# InputDataSet$Race.DistanceType2Cd[Race.DistanceType2Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.JyokenCd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.JyokenCd)=", levels(data$Race.JyokenCd)))
print(paste0("levels(InputDataSet$Race.JyokenCd)=", levels(InputDataSet$Race.JyokenCd)))
Race.JyokenCd.Index <- which(!(InputDataSet$Race.JyokenCd %in% levels(data$Race.JyokenCd)))
print(paste0("length(Race.JyokenCd.Index)=", length(Race.JyokenCd.Index)))
InputDataSet$Race.JyokenCd[Race.JyokenCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.JyoType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$Race.JyoType1Cd)=", levels(data$Race.JyoType1Cd)))
# print(paste0("levels(InputDataSet$Race.JyoType1Cd)=", levels(InputDataSet$Race.JyoType1Cd)))
# Race.JyoType1Cd.Index <- which(!(InputDataSet$Race.JyoType1Cd %in% levels(data$Race.JyoType1Cd)))
# print(paste0("length(Race.JyoType1Cd.Index)=", length(Race.JyoType1Cd.Index)))
# InputDataSet$Race.JyoType1Cd[Race.JyoType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.RaceType0Cd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$Race.RaceType0Cd)=", levels(data$Race.RaceType0Cd)))
# print(paste0("levels(InputDataSet$Race.RaceType0Cd)=", levels(InputDataSet$Race.RaceType0Cd)))
# Race.RaceType0Cd.Index <- which(!(InputDataSet$Race.RaceType0Cd %in% levels(data$Race.RaceType0Cd)))
# print(paste0("length(Race.RaceType0Cd.Index)=", length(Race.RaceType0Cd.Index)))
# InputDataSet$Race.RaceType0Cd[Race.RaceType0Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: Race.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("levels(data$Race.RaceType1Cd)=", levels(data$Race.RaceType1Cd)))
print(paste0("levels(InputDataSet$Race.RaceType1Cd)=", levels(InputDataSet$Race.RaceType1Cd)))
Race.RaceType1Cd.Index <- which(!(InputDataSet$Race.RaceType1Cd %in% levels(data$Race.RaceType1Cd)))
print(paste0("length(Race.RaceType1Cd.Index)=", length(Race.RaceType1Cd.Index)))
InputDataSet$Race.RaceType1Cd[Race.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.KeiroCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$RaceHorse.KeiroCd)=", levels(data$RaceHorse.KeiroCd)))
# print(paste0("levels(InputDataSet$RaceHorse.KeiroCd)=", levels(InputDataSet$RaceHorse.KeiroCd)))
# RaceHorse.KeiroCd.Index <- which(!(InputDataSet$RaceHorse.KeiroCd %in% levels(data$RaceHorse.KeiroCd)))
# print(paste0("length(RaceHorse.KeiroCd.Index)=", length(RaceHorse.KeiroCd.Index)))
# InputDataSet$RaceHorse.KeiroCd[RaceHorse.KeiroCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.MinariCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$RaceHorse.MinaraiCd)=", levels(data$RaceHorse.MinaraiCd)))
# print(paste0("levels(InputDataSet$RaceHorse.MinaraiCd)=", levels(InputDataSet$RaceHorse.MinaraiCd)))
# RaceHorse.MinaraiCd.Index <- which(!(InputDataSet$RaceHorse.MinaraiCd %in% levels(data$RaceHorse.MinaraiCd)))
# print(paste0("length(RaceHorse.MinaraiCd.Index)=", length(RaceHorse.MinaraiCd.Index)))
# InputDataSet$RaceHorse.MinaraiCd[RaceHorse.MinaraiCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.IsHitA
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$RaceHorse.IsHitA)=", levels(data$RaceHorse.IsHitA)))
# print(paste0("levels(InputDataSet$RaceHorse.IsHitA)=", levels(InputDataSet$RaceHorse.IsHitA)))
# RaceHorse.IsHitA.Index <- which(!(InputDataSet$RaceHorse.IsHitA %in% levels(data$RaceHorse.IsHitA)))
# print(paste0("length(RaceHorse.IsHitA.Index)=", length(RaceHorse.IsHitA.Index)))
# InputDataSet$RaceHorse.IsHitA[RaceHorse.IsHitA.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.IsHitB
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$RaceHorse.IsHitB)=", levels(data$RaceHorse.IsHitB)))
# print(paste0("levels(InputDataSet$RaceHorse.IsHitB)=", levels(InputDataSet$RaceHorse.IsHitB)))
# RaceHorse.IsHitB.Index <- which(!(InputDataSet$RaceHorse.IsHitB %in% levels(data$RaceHorse.IsHitB)))
# print(paste0("length(RaceHorse.IsHitB.Index)=", length(RaceHorse.IsHitB.Index)))
# InputDataSet$RaceHorse.IsHitB[RaceHorse.IsHitB.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: RaceHorse.IsHitA
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$RaceHorse.IsHitA)=", levels(data$RaceHorse.IsHitA)))
# print(paste0("levels(InputDataSet$RaceHorse.IsHitA)=", levels(InputDataSet$RaceHorse.IsHitA)))
# RaceHorse.IsHitA.Index <- which(!(InputDataSet$RaceHorse.IsHitA %in% levels(data$RaceHorse.IsHitA)))
# print(paste0("length(RaceHorse.IsHitA.Index)=", length(RaceHorse.IsHitA.Index)))
# InputDataSet$RaceHorse.IsHitA[RaceHorse.IsHitA.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.JyoCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRace.JyoCd)=", levels(data$PrevRace.JyoCd)))
# print(paste0("levels(InputDataSet$PrevRace.JyoCd)=", levels(InputDataSet$PrevRace.JyoCd)))
# PrevRace.JyoCd.Index <- which(!(InputDataSet$PrevRace.JyoCd %in% levels(data$PrevRace.JyoCd)))
# print(paste0("length(PrevRace.JyoCd.Index)=", length(PrevRace.JyoCd.Index)))
# InputDataSet$PrevRace.JyoCd[PrevRace.JyoCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.DistanceType2Cd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRace.DistanceType2Cd)=", levels(data$PrevRace.DistanceType2Cd)))
# print(paste0("levels(InputDataSet$PrevRace.DistanceType2Cd)=", levels(InputDataSet$PrevRace.DistanceType2Cd)))
# PrevRace.DistanceType2Cd.Index <- which(!(InputDataSet$PrevRace.DistanceType2Cd %in% levels(data$PrevRace.DistanceType2Cd)))
# print(paste0("length(PrevRace.DistanceType2Cd.Index)=", length(PrevRace.DistanceType2Cd.Index)))
# InputDataSet$PrevRace.DistanceType2Cd[PrevRace.DistanceType2Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRace.RaceType1Cd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRace.RaceType1Cd)=", levels(data$PrevRace.RaceType1Cd)))
# print(paste0("levels(InputDataSet$PrevRace.RaceType1Cd)=", levels(InputDataSet$PrevRace.RaceType1Cd)))
# PrevRace.RaceType1Cd.Index <- which(!(InputDataSet$PrevRace.RaceType1Cd %in% levels(data$PrevRace.RaceType1Cd)))
# print(paste0("length(PrevRace.RaceType1Cd.Index)=", length(PrevRace.RaceType1Cd.Index)))
# InputDataSet$PrevRace.RaceType1Cd[PrevRace.RaceType1Cd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.KeiroCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRaceHorse.KeiroCd)=", levels(data$PrevRaceHorse.KeiroCd)))
# print(paste0("levels(InputDataSet$PrevRaceHorse.KeiroCd)=", levels(InputDataSet$PrevRaceHorse.KeiroCd)))
# PrevRaceHorse.KeiroCd.Index <- which(!(InputDataSet$PrevRaceHorse.KeiroCd %in% levels(data$PrevRaceHorse.KeiroCd)))
# print(paste0("length(PrevRaceHorse.KeiroCd.Index)=", length(PrevRaceHorse.KeiroCd.Index)))
# InputDataSet$PrevRaceHorse.KeiroCd[PrevRaceHorse.KeiroCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.MinariCd
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRaceHorse.MinaraiCd)=", levels(data$PrevRaceHorse.MinaraiCd)))
# print(paste0("levels(InputDataSet$PrevRaceHorse.MinaraiCd)=", levels(InputDataSet$PrevRaceHorse.MinaraiCd)))
# PrevRaceHorse.MinaraiCd.Index <- which(!(InputDataSet$PrevRaceHorse.MinaraiCd %in% levels(data$PrevRaceHorse.MinaraiCd)))
# print(paste0("length(PrevRaceHorse.MinaraiCd.Index)=", length(PrevRaceHorse.MinaraiCd.Index)))
# InputDataSet$PrevRaceHorse.MinaraiCd[PrevRaceHorse.MinaraiCd.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.IsHitA
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRaceHorse.IsHitA)=", levels(data$PrevRaceHorse.IsHitA)))
# print(paste0("levels(InputDataSet$PrevRaceHorse.IsHitA)=", levels(InputDataSet$PrevRaceHorse.IsHitA)))
# PrevRaceHorse.IsHitA.Index <- which(!(InputDataSet$PrevRaceHorse.IsHitA %in% levels(data$PrevRaceHorse.IsHitA)))
# print(paste0("length(PrevRaceHorse.IsHitA.Index)=", length(PrevRaceHorse.IsHitA.Index)))
# InputDataSet$PrevRaceHorse.IsHitA[PrevRaceHorse.IsHitA.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.IsHitB
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRaceHorse.IsHitB)=", levels(data$PrevRaceHorse.IsHitB)))
# print(paste0("levels(InputDataSet$PrevRaceHorse.IsHitB)=", levels(InputDataSet$PrevRaceHorse.IsHitB)))
# PrevRaceHorse.IsHitB.Index <- which(!(InputDataSet$PrevRaceHorse.IsHitB %in% levels(data$PrevRaceHorse.IsHitB)))
# print(paste0("length(PrevRaceHorse.IsHitB.Index)=", length(PrevRaceHorse.IsHitB.Index)))
# InputDataSet$PrevRaceHorse.IsHitB[PrevRaceHorse.IsHitB.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels: PrevRaceHorse.IsHitA
# ---------------------------------------------------------------------------------------------------------------------------
# print(paste0("levels(data$PrevRaceHorse.IsHitA)=", levels(data$PrevRaceHorse.IsHitA)))
# print(paste0("levels(InputDataSet$PrevRaceHorse.IsHitA)=", levels(InputDataSet$PrevRaceHorse.IsHitA)))
# PrevRaceHorse.IsHitA.Index <- which(!(InputDataSet$PrevRaceHorse.IsHitA %in% levels(data$PrevRaceHorse.IsHitA)))
# print(paste0("length(PrevRaceHorse.IsHitA.Index)=", length(PrevRaceHorse.IsHitA.Index)))
# InputDataSet$PrevRaceHorse.IsHitA[PrevRaceHorse.IsHitA.Index] <- NA
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet na.omit
# ---------------------------------------------------------------------------------------------------------------------------
InputDataSet.nrow.na.omit2.before <- nrow(InputDataSet)
InputDataSet <- na.omit(InputDataSet)
InputDataSet.nrow.na.omit2.after <- nrow(InputDataSet)
InputDataSet.nrow.na.omit2.diff <- InputDataSet.nrow.na.omit2.before - InputDataSet.nrow.na.omit2.after
print(paste0("InputDataSet.na.omit2.diff na.omit after #2=" , InputDataSet.nrow.na.omit2.diff))
# ---------------------------------------------------------------------------------------------------------------------------
# OutputDataSet
# ---------------------------------------------------------------------------------------------------------------------------
columnList1 <- c("RaceHorse.RaceId", "RaceHorse.KettoNum")
OutputDataSet <- InputDataSet[, columnList1]
OutputDataSet$RaceId <- InputDataSet$RaceId
OutputDataSet$KettoNum <- InputDataSet$KettoNum
# OutputDataSet$Timestamp01 <- as.POSIXlt(Sys.time(), tz ="Japan")
# OutputDataSet$Timestamp01 <- Sys.time()
print(paste0("nrow(OutputDataSet) #1=",nrow(OutputDataSet)))
# print("str(OutputDataSet)")
# print(str(OutputDataSet, list.len=ncol(OutputDataSet)))
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glm 2
# ---------------------------------------------------------------------------------------------------------------------------
if (analyzeFunc  == "glm")
{
print(analyze.results.glm.step)
print(analyze.results.glm.step.summary)
# OutputDataSet$PredictValue <- predict(analyze.results.glm.step, newdata=InputDataSet, allow.new.levels=T)
OutputDataSet$PredictValue <- predict(analyze.results.glm.step, newdata=InputDataSet, na.action=na.omit, allow.new.levels=T)
# na.action={na.omit, na.fail, na.exclude, na.pass}
}
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glmer 2
# ---------------------------------------------------------------------------------------------------------------------------
if (analyzeFunc  == "glmer")
{
print(analyze.results.glmer.summary)
# OutputDataSet$PredictValue <- predict(analyze.results.glmer, newdata=InputDataSet, allow.new.levels=T)
OutputDataSet$PredictValue <- predict(analyze.results.glmer, newdata=InputDataSet, na.action=na.omit, allow.new.levels=T)
# na.action={na.omit, na.fail, na.exclude, na.pass}
}
# ---------------------------------------------------------------------------------------------------------------------------
# Predict End
# ---------------------------------------------------------------------------------------------------------------------------
print("--- Predict Finished ---")
# ---------------------------------------------------------------------------------------------------------------------------
# columnList2
# ---------------------------------------------------------------------------------------------------------------------------
# columnList2 <- c("rawnames", "RaceHorse.RaceId", "RaceHorse.KettoNum", "PredictValue", "Timestamp01")
columnList2 <- c("RaceHorse.RaceId", "RaceHorse.KettoNum", "PredictValue")
# ---------------------------------------------------------------------------------------------------------------------------
# OutputDataSet
# ---------------------------------------------------------------------------------------------------------------------------
OutputDataSet <- OutputDataSet[, columnList2]
nrow.OutputDataSet.final <- nrow(OutputDataSet)
print(paste0("nrow(OutputDataSet) final=", nrow.OutputDataSet.final))
# ---------------------------------------------------------------------------------------------------------------------------
# Log
# ---------------------------------------------------------------------------------------------------------------------------
print("--- Log Finished ---")
print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, " Finished ---"))
sink()


print(paste0(Sys.time(),  " --- predict_glm.R Finished ---"))
