print(paste0(Sys.time(),  " --- source_rodbc.R Start ---"))

# -------------------------------------
# RODBC
# -------------------------------------
# Connect
#print("channel1 <- odbcConnect...")
#channel1 <- odbcConnect("Jackpot")
#print("odbcGetInfo(channel1)")
# Connect to SQL Server using RODBC

# sqlHost <- "(local)\\MSSQLSERVER2"
sqlHost <- "(local)"
sqlDatabase <- "Jackpot"

# Select
dsnString <- "driver={SQL Server};server=%s;database=%s;trusted_connection=true"
dsn <- sprintf(dsnString, sqlHost, sqlDatabase)
# dsn <- sprintf(dsnString, sqlHost, sqlDatabase,getSqlTypeInfo("Microsoft SQL Server"))
channel <- odbcDriverConnect(dsn)

# Close
# odbcGetInfo(channe1)

print(paste0(Sys.time(),  " --- source_rodbc.R Finished ---"))
