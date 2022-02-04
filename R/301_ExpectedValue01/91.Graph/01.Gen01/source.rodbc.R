# -------------------------------------
# RODBC
# -------------------------------------
# Connect
#print("conn1 <- odbcConnect...")
#conn1 <- odbcConnect("Jackpot")
#print("odbcGetInfo(conn1)")
# Connect to SQL Server using RODBC

# sqlHost <- "(local)\\MSSQLSERVER2"
sqlHost <- "(local)"
sqlDatabase <- "Jackpot"

# Select
dsnString <- "driver={SQL Server};server=%s;database=%s;trusted_connection=true"
dsn <- sprintf(dsnString, sqlHost, sqlDatabase)
# dsn <- sprintf(dsnString, sqlHost, sqlDatabase,getSqlTypeInfo("Microsoft SQL Server"))

conn1 <- odbcDriverConnect(dsn)

# Close
# odbcGetInfo(conn1)