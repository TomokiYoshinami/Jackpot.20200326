# -------------------------------------
# RSQLServer
# -------------------------------------
driver <- dbDriver("SQLServer")
url <- "(local);Database=Jackpot_DW;Trusted_Connection=TRUE;"
conn1 <- dbConnect(driver, url)
