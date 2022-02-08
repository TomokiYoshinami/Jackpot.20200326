##########################################################################################
# Predict
##########################################################################################
# ---------------------------------------------------------------------------------------------------------------------------
# Arguments
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Declaration
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
logFilename <- paste(paste0(fileNamePrefixLog, "_", analyzeCategory, "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd), constFileExtensionLog, sep=constColon)
print(paste0("logFilename=", logFilename))
sink(logFilename, append=FALSE, type="output", split=TRUE)
print(paste0(Sys.time(),  " --- ", analyzeVersion, "_", analyzeCategory,  "_", analyzeFunc,"_", analyzeType, "_", analyzeFamily, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, " Start ---"))
print(paste0(Sys.time(), " --- Log Start ---"))
print(paste0(Sys.time(),  " --- predict.R Start ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Parameter
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0("analyzeVersion=", analyzeVersion))
print(paste0("analyzeCategory=", analyzeCategory))
print(paste0("analyzeType=", analyzeType))
print(paste0("analyzeFamily=", analyzeFamily))
print(paste0("analyzeFunc=", analyzeFunc))
print(paste0("analyzeTrackTypeCd=", analyzeTrackTypeCd))
print(paste0("analyzeJyokenCd=", analyzeJyokenCd))
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
source("source_function.R", echo=FALSE, max.deparse.length = Inf) # source(sourceFilename, echo=T, max.deparse.length = Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Library
# ---------------------------------------------------------------------------------------------------------------------------
source("source_library.R", echo=TRUE, max.deparse.length = Inf) # source(sourceFilename, echo=T, max.deparse.length = Inf)
# ---------------------------------------------------------------------------------------------------------------------------
# Load
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- Load Start ---"))
loadFilename <- paste0(paste0(fileNamePrefixRData, "_", "Analyze", "_", analyzeFunc, "_", analyzeType, "_Type", analyzeTrackTypeCd, analyzeJyokenCd, constColon, constFileExtensionRData))
print(paste0("loadFilename=", loadFilename))
load(loadFilename)
print(paste0(Sys.time(), " --- Load Finished ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet.nrow.database <- nrow(InputDataSet)
# print(paste0("nrow(InputDataSet) sqlQuery=", InputDataSet.nrow.database))
# print("str(InputDataSet)=")
# print(str(InputDataSet, list.len = ncol(InputDataSet)))
# ---------------------------------------------------------------------------------------------------------------------------
# RxSqlServerData
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- RxSqlServerData Start ---"))
# tic()
# source("source_rodbc.R", echo=FALSE, max.deparse.length = Inf) # source(sourceFilename, echo=T, max.deparse.length = Inf)
sqlConnString <- "Driver={SQL Server};Server=(local);Database=Jackpot;Trusted_Connection=true"

sqlWait <- TRUE
sqlConsoleOutput <- FALSE
sqlCompute <- RxInSqlServer(connectionString = sqlConnString, wait = sqlWait, consoleOutput = sqlConsoleOutput)

# rxSetComputeContext(sqlCompute)
rxSetComputeContext("local")
rxGetComputeContext()

sqlQuery <- paste0("SELECT * FROM ViewAnalyze", analyzeVersion, analyzeCategory, "01", analyzeType, "Type", analyzeTrackTypeCd, analyzeJyokenCd, " WHERE [Race.IsPredictedRace] = 1")
print(paste0("sqlQuery=", sqlQuery))
rowsPerRead <- 100000 # 50000
inDataSource <- RxSqlServerData(sqlQuery = sqlQuery, connectionString = sqlConnString, stringsAsFactors = TRUE, rowsPerRead = rowsPerRead)
rxGetVarInfo(data = inDataSource)
InputDataSet <- rxImport(inDataSource)
print("head(InputDataSet)=")
print(head(InputDataSet))

objectSize <- object.size(InputDataSet)
print(paste0("object.size(InputDataSet) auto=", format(objectSize, units = "auto")))
nrow.InputDataSet.sqlQuery <- nrow(InputDataSet)
print(paste0("nrow(InputDataSet) RxSqlServerData=" ,nrow.InputDataSet.sqlQuery))
print("str(InputDataSet)=")
str(InputDataSet, list.len = ncol(InputDataSet))
print(paste0(Sys.time(), " --- RxSqlServerData Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet subet
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- subset Start ---"))
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
print(paste0(Sys.time(), " --- subset Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet transform
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- transform Start ---"))
nrow.InputDataSet.transform.before <- nrow(InputDataSet)
# source(paste0("source_transform_predict.", analyzeType, ".R"))
nrow.InputDataSet.transform.after <- nrow(InputDataSet)
nrow.InputDataSet.transform.diff <- nrow.InputDataSet.transform.before - nrow.InputDataSet.transform.after
print(paste0("nrow(InputDataSet) transaform before=", nrow.InputDataSet.transform.before))
print(paste0("nrow(InputDataSet) transaform after=", nrow.InputDataSet.transform.after))
print(paste0("nrow(InputDataSet) transaform diff=", nrow.InputDataSet.transform.diff))
print("str(InputDataSet)=")
print(str(InputDataSet, list.len = ncol(InputDataSet)))
print(paste0(Sys.time(), " --- transform Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet na.omit
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- na.omit Start ---"))
nrow.InputDataSet.na.omit.before <- nrow(InputDataSet)
InputDataSet <- na.omit(InputDataSet)
nrow.InputDataSet.na.omit.after <- nrow(InputDataSet)
nrow.InputDataSet.na.omit.diff <- nrow.InputDataSet.na.omit.before - nrow.InputDataSet.na.omit.after
print(paste0("nrow(InputDataSet) na.omit before=", nrow.InputDataSet.na.omit.before))
print(paste0("nrow(InputDataSet) na.omit after=", nrow.InputDataSet.na.omit.after))
print(paste0("nrow(InputDataSet) na.omit diff=" , nrow.InputDataSet.na.omit.diff))
print(paste0(Sys.time(), " --- na.omit Finish---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet New Levels
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- New Levels Start ---"))
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
# print(paste0("levels(data$Race.JyokenCd)=", levels(data$Race.JyokenCd)))
# print(paste0("levels(InputDataSet$Race.JyokenCd)=", levels(InputDataSet$Race.JyokenCd)))
# Race.JyokenCd.Index <- which(!(InputDataSet$Race.JyokenCd %in% levels(data$Race.JyokenCd)))
# print(paste0("length(Race.JyokenCd.Index)=", length(Race.JyokenCd.Index)))
# InputDataSet$Race.JyokenCd[Race.JyokenCd.Index] <- NA
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
# InputDataSet New Levels
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- New Levels Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet na.omit
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- na.omit Start ---"))
nrow.InputDataSet.na.omit.levels.before <- nrow(InputDataSet)
InputDataSet <- na.omit(InputDataSet)
nrow.InputDataSet.na.omit.levels.after <- nrow(InputDataSet)
nrow.InputDataSet.na.omit.levels.diff <- nrow.InputDataSet.na.omit.levels.before - nrow.InputDataSet.na.omit.levels.after
print(paste0("nrow(InputDataSet) na.omit levels before=", nrow.InputDataSet.na.omit.levels.before))
print(paste0("nrow(InputDataSet) na.omit levels after=", nrow.InputDataSet.na.omit.levels.after))
print(paste0("nrow(InputDataSet) na.omit levels diff=" , nrow.InputDataSet.na.omit.levels.diff))
print(paste0(Sys.time(), " --- na.omit Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glm
# ---------------------------------------------------------------------------------------------------------------------------
# if (analyzeFunc  == "glm")
# print(paste0(Sys.time(), " --- predict (glm) Start ---"))
# {
# print(paste0("analyzeFunc=", analyzeFunc))
# print("analyze.results.glm.summary=")
# print(analyze.results.glm.summary)
# print("analyze.results.glm.step.summary=")
# print(analyze.results.glm.step.summary)
# print("analyze.results.glm.step_aov=")
# print(analyze.results.glm.step_aov)
# print("analyze.results.glm.step_vif=")
# print(analyze.results.glm.step_vif)

# OutputDataSet$PredictValue <- predict(analyze.results.glm.step, newdata=InputDataSet, na.action=na.omit, allow.new.levels=TRUE)
# na.action={na.omit, na.fail, na.exclude, na.pass}
# print(paste0(Sys.time(), " --- predict (glm) Finish ---"))
# }
# ---------------------------------------------------------------------------------------------------------------------------
# InputDataSet: Predict
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- Predict InputDataSet Start ---"))
nrow.InputDataSet.predict <- nrow(InputDataSet)
print(paste0("nrow(InputDataSet) predict=" ,nrow.InputDataSet.predict))
print("str(InputDataSet)=")
str(InputDataSet, list.len = ncol(InputDataSet))
print(paste0(Sys.time(), " --- Predict InputDataSet Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Predict: glmer
# ---------------------------------------------------------------------------------------------------------------------------
# if (analyzeFunc  == "glmer")
# {
# print(paste0(Sys.time(), " --- predict (glmer) Start ---"))
# print(paste0("analyzeFunc=", analyzeFunc))
# print("analyze.results.glmer=")
# print(analyze.results.glmer)
# print("analyze.results.glmer.fixef=")
# print(analyze.results.glmer.fixef)
# print("analyze.results.glmer_ranef=")
# print(analyze.results.glmer_ranef)
# print("analyze.results.glmer.summary=")
# print(analyze.results.glmer.summary)
# print("analyze.results.glmer_vif =)
# print(analyze.results.glmer_vif)

# OutputDataSet$PredictValue <- predict(analyze.results.glmer, newdata=InputDataSet, na.action=na.omit, allow.new.levels=TRUE)
# na.action={na.omit, na.fail, na.exclude, na.pass}
# print(paste0(Sys.time(), " --- predict (glmer) Finish ---"))
# }
# ---------------------------------------------------------------------------------------------------------------------------
# rxPredict: rxGlm
# ---------------------------------------------------------------------------------------------------------------------------
if (analyzeFunc  == "glm")
print(paste0(Sys.time(), " --- rxPredict (glm) Start ---"))
{
print(paste0("analyzeFunc=", analyzeFunc))

PredictDataSet <- data.frame(rxPredict(analyze.results.glm.step, data = InputDataSet, writeModelVars = FALSE))

print(paste0("nrow(PredictDataSet) afte predict=", nrow(PredictDataSet)))
print("str(PredictDataSet)")
print(str(PredictDataSet, list.len = ncol(PredictDataSet)))
print("head(PredictDataSet) afte predict=")
print(head(PredictDataSet))
# na.action={na.omit, na.fail, na.exclude, na.pass}
print(paste0(Sys.time(), " --- rxPredict (glm) Finish ---"))
}
# ---------------------------------------------------------------------------------------------------------------------------
# OutputDataSet: Add Key
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- add key Start ---"))
keyColumnList <- c("RaceHorse.RaceId", "RaceHorse.KettoNum")
OutputDataSet <- InputDataSet[, keyColumnList]
print(paste0("nrow(OutputDataSet) add KeyColmn=", nrow(OutputDataSet)))
print("str(OutputDataSet) after add Key")
print(str(OutputDataSet, list.len = ncol(OutputDataSet)))
print(paste0(Sys.time(), " --- add key Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# OutputDataSet: Add PredictValue
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- add PredictValue Start ---"))

print("str(PredictDataSet) before rename=")
print(paste0("colnames(PredictDataSet)=", colnames(PredictDataSet)))
# Rename for Table Column
colnames(PredictDataSet) <- c("PredictValue")
print("str(PredictDataSet) after rename=")
print(str(PredictDataSet, list.len = ncol(PredictDataSet)))

print("str(OutputDataSet) before cbind=")
print(str(OutputDataSet, list.len = ncol(OutputDataSet)))
OutputDataSet <- cbind(OutputDataSet, PredictDataSet)
print("str(OutputDataSet) after cbind=")
print(str(OutputDataSet, list.len = ncol(OutputDataSet)))

print(paste0(Sys.time(), " --- add PredictValue Finish ---"))
# ---------------------------------------------------------------------------------------------------------------------------
# Final
# ---------------------------------------------------------------------------------------------------------------------------
print(paste0(Sys.time(), " --- final Start ---"))
nrow.OutputDataSet.final <- nrow(OutputDataSet)
print(paste0("nrow(OutputDataSet) final=", nrow.OutputDataSet.final))
print("head(OutputDataSet)=")
print(head(OutputDataSet))
print("str(OutputDataSet)=")
print(str(OutputDataSet, list.len = ncol(OutputDataSet)))
print(paste0(Sys.time(), " --- final Finish ---"))
 # ---------------------------------------------------------------------------------------------------------------------------
# Log End
# ---------------------------------------------------------------------------------------------------------------------------
# tic()
print(paste0(Sys.time(), " --- predict.R Finished ---"))
print(paste0(Sys.time(), " --- log Finish ---"))
sink()
# toc()

print("q...")
 # q("no")
 