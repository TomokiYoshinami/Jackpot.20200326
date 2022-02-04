Sys.setenv(LANGUAGE = "CP932")

print(paste0(Sys.time(),  " --- script.R Start ---"))

get_this_filename <- function(){
  tmp_fn <- sys.calls()[[1]]
  fn <- as.character(tmp_fn)[2]

  # Rscript で実行した場合はsys.calls()で取れないので
  # commandArgs()で拾える情報を利用
  if(is.na(fn)){
    fn <- commandArgs()
    idx_file <- grep(pattern = '--file=', fn)
    fn <- gsub('--file=', '', fn[idx_file])
    fn <- gsub('\\./', '', fn)
    fn <- paste0('~/', basename(getwd()), '/', fn)
  }
  return(fn)
}

getwd()
print(paste0("getwd()=", getwd()))

# args <- commandArgs(T) # スクリプトの引数のみを取得
# args <- commandArgs(trailingOnly=TRUE)  #引数受け取り  

# if (length(args) == 2) {
    # for(i in 1:length(args)){
        # eval(parse(text = args))
    # }
# } else {
    # stop()
# }

################################
# コマンドライン引数処理
args <- commandArgs(T)
# args
print(paste0("args=", args))
funcName <- as.character(args[1])
trackTypeCd <- as.character(args[2])
jyokenCd <- as.character(args[3])

# print(paste0("args[1]=", args[1]))
# print(paste0("args[2]=", args[2]))
# print(paste0("args[3]=", args[3]))
# print(paste0("args[4]=", args[4]))
# print(paste0("args[5]=", args[5]))
# print(paste0("args[6]=", args[6]))
# print(paste0("args[7]=", args[7]))

print(paste0("funcName=", funcName))
print(paste0("trackTypeCd=", trackTypeCd))
print(paste0("jyokenCd=", jyokenCd))
################################

# if(funcName == "NA")
# {
	# stop()
# }
# if(trackTypeCd == "NA")
# {
	# stop()
# }
# if(jyokenCd == "NA")
# {
	# stop()
# }

targetType <- paste0(trackTypeCd, jyokenCd)
print(paste0("targetType=", targetType))

wd <- paste0('Analyze')
print(paste0("wd=", wd))
setwd(wd)
getwd()
print(paste0("getwd()=", getwd()))

# args$arg1 <- trackTypeCd
# args$arg2 <- jyokenCd
# print(paste0("args$arg1=", args$arg1))
# print(paste0("args$arg2=", args$arg2))

sourceName <- paste0("analyze_", funcName, ".2.R")
print(paste0("source=", sourceName))
source(sourceName)

print(paste0(Sys.time(),  " --- script.R Finished ---"))
