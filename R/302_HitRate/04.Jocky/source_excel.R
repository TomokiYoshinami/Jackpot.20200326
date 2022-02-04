#----------------------------------------------------------------------------------------------
# Excel
#----------------------------------------------------------------------------------------------

const_1 <- "1"
const_case_when_single_quote <- "' "
const_empty <- ""
const_asterisk <- "*"
const_colon <- ":"
const_square_brackets_open <- "[[]"
const_square_brackets_close <- "[]]"
const_round_brackets_open <- "[(]"
const_round_brackets_close <- "[)]"
const_ope_plus <- "+"
const_ope_multi <- "*"
const_wild_card_Intecept <- "(Intercept)" # Wild Card
const_intecept <- "Intercept"
const_convert_open <- "CONVERT(FLOAT,"
const_convert_close <- ")"
#CASE/END
const_case_case <- "+CASE"
const_case_then <- "THEN "
const_case_then_1st <- ""
const_case_else_null <- "ELSE NULL"
const_case_end <- "END"
# TRUE/FALSE
const_bool_true <- "TRUE"
const_bool_false <- "FALSE"
# WHEN
#----------------------------------------------------------------------------------------------
const_case_when_Race.JyoCd <- "WHEN Race.JyoCd = '"
const_case_when_Race.Jyo2Cd <- "WHEN Race.Jyo2Cd = '"
const_case_when_Race.GradeCd <- "WHEN Race.GradeCd = '"
const_case_when_Race.SyubetuCd <- "WHEN Race.SyubetuCd = '"
const_case_when_Race.KigoCd <- "WHEN Race.KigoCd = '"
const_case_when_Race.JyuryoCd <- "WHEN Race.JyuryoCd = '"
const_case_when_Race.Jyoken5Cd <- "WHEN Race.Jyoken5Cd = '"
const_case_when_Race.Kyori <- "WHEN Race.Kyori = "
const_case_when_Race.TrackCd <- "WHEN Race.TrackCd = '"
const_case_when_Race.CourseKubunCd <- "WHEN Race.CourseKubunCd = '"
const_case_when_Race.TenkoCd <- "WHEN Race.TenkoCd = '"
const_case_when_Race.TrackTypeCd <- "WHEN Race.TrackTypeCd = '"
const_case_when_Race.TrackType3Cd <- "WHEN Race.TrackType3Cd = '"
const_case_when_Race.CourseTypeCd <- "WHEN Race.CourseTypeCd = '"
const_case_when_Race.TrackConditionCd <- "WHEN Race.TrackConditionCd = "
const_case_when_Race.JyokenCd <- "WHEN Race.JyokenCd = '"
const_case_when_Race.JyokenGradeCd <- "WHEN Race.JyokenGradeCd = '"
const_case_when_Race.S38Avg <- "WHEN Race.S38Avg = "
const_case_when_Race.SmileCd <- "WHEN Race.SmileCd = '"
const_case_when_Race.RaceType1Cd <- "WHEN Race.RaceType1Cd = '"
const_case_when_Race.RaceType2Cd <- "WHEN Race.RaceType2Cd = '"
const_case_when_Race.RaceType3Cd <- "WHEN Race.RaceType3Cd = '"
const_case_when_Race.RaceType4Cd <- "WHEN Race.RaceType4Cd = '"
const_case_when_Race.RaceType5Cd <- "WHEN Race.RaceType5Cd = '"
const_case_when_Race.RaceType6Cd <- "WHEN Race.RaceType6Cd = '"
const_case_when_Race.RaceType7Cd <- "WHEN Race.RaceType7Cd = '"
const_case_when_Race.RaceType8Cd <- "WHEN Race.RaceType8Cd = '"
const_case_when_Race.RaceType9Cd <- "WHEN Race.RaceType9Cd = '"
#----------------------------------------------------------------------------------------------
const_case_when_RaceHorse.Futan <- "WHEN RaceHorse.Futan = "
#----------------------------------------------------------------------------------------------
const_case_when_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum <- "WHEN AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum = '"
const_case_when_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum <- "WHEN AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum = '"
const_case_when_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum <- "WHEN AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum = '"
const_case_when_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode <- "WHEN AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode = '"

#----------------------------------------------------------------------------------------------
# 式
# (a0 + ai1 + ai2) + (b0 + bi1 + bi2) * x1 +(c0 + ci1 + ci2) * x2 +(d0) * x3 + (e0) * x4
# a0 + b0 * x1 + c0 * x2 + d0 * x3 + e0 * x4
# + a1 + b1 * x1 + c1 * x2
# + a2 + b2 * x1 + c2 * x2
#----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------
# Init
#----------------------------------------------------------------------------------------------
var_sql_matrix <- NULL
#----------------------------------------------------------------------------------------------
# Fixed Effects
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_fixef)>0)
{
	# Initialize
	var_fixef_matrix <- NULL
	
	# fixefの変数名を抽出し、配列に代入
	var_fixef_length<-length(jackpot_results_fixef)
	
	# THEN
	var_fixef_line_sql <- const_case_then_1st
	
	for(col in 1: var_fixef_length)
	{
		# if (match(const_wild_card_Intecept,names(jackpot_results_fixef[col]),nomatch=0) > 0)
		{
			var_fixef_line_name <- names(jackpot_results_fixef[col])
			var_fixef_line_value <- jackpot_results_fixef[col]
			var_fixef_line_sql <- paste0(var_fixef_line_sql,const_ope_plus,const_convert_open,var_fixef_line_name,const_convert_close,const_ope_multi,var_fixef_line_value)
		}
	}
	
	# Replace (Intercept -> 1)
	var_fixef_line_sql <- gsub(const_intecept,const_1,var_fixef_line_sql)
	# Replace (Colon -> Asterisk)
	var_fixef_line_sql <- gsub(const_colon,const_asterisk,var_fixef_line_sql)
	# Replace (TRUE -> Empty)
	var_fixef_line_sql <- gsub(const_bool_true,const_empty,var_fixef_line_sql)
	
	# Add Row
	var_fixef_row_sql <- cbind(var_fixef_line_sql)
	var_fixef_matrix <- rbind(var_fixef_matrix,var_fixef_row_sql)
	
	# ELSE NULL
	# var_fixef_row_sql <- cbind(const_case_else_null)
	# var_fixef_matrix <- rbind(var_fixef_matrix,var_fixef_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_fixef_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.JyoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.JyoCd)>0)
{
	# Initialize
	var_ranef_Race.JyoCd_dim_row<-dim(jackpot_results_ranef$Race.JyoCd)[1]
	var_ranef_Race.JyoCd_dim_col<-dim(jackpot_results_ranef$Race.JyoCd)[2]
	var_ranef_Race.JyoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyoCd_matrix <- rbind(var_ranef_Race.JyoCd_matrix,var_ranef_Race.JyoCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyoCd_line_when <- paste0(const_case_when_Race.JyoCd,sprintf("%02d",as.integer(rownames(jackpot_results_ranef$Race.JyoCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.JyoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyoCd_line_name <- colnames(jackpot_results_ranef$Race.JyoCd[col])
				var_ranef_Race.JyoCd_line_value <- as.character(jackpot_results_ranef$Race.JyoCd[row,col])
				var_ranef_Race.JyoCd_line_then <- paste0(var_ranef_Race.JyoCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.JyoCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.JyoCd_line_value)
			}
		}
		# Col
		var_ranef_Race.JyoCd_line_sql <- paste(var_ranef_Race.JyoCd_line_when,var_ranef_Race.JyoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.JyoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.JyoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.JyoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.JyoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.JyoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.JyoCd_line_sql)
		
		# Add Row
		var_ranef_Race.JyoCd_row_sql <- cbind(var_ranef_Race.JyoCd_line_sql)
		var_ranef_Race.JyoCd_matrix <- rbind(var_ranef_Race.JyoCd_matrix,var_ranef_Race.JyoCd_row_sql)
	}
	
	# ELSE NULL
	var_ranef_Race.JyoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.JyoCd_matrix <- rbind(var_ranef_Race.JyoCd_matrix,var_ranef_Race.JyoCd_row_sql)
	
	# END
	var_ranef_Race.JyoCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.JyoCd_matrix <- rbind(var_ranef_Race.JyoCd_matrix,var_ranef_Race.JyoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.JyoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.Jyo2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.Jyo2Cd)>0)
{
	# Initialize
	var_ranef_Race.Jyo2Cd_dim_row<-dim(jackpot_results_ranef$Race.Jyo2Cd)[1]
	var_ranef_Race.Jyo2Cd_dim_col<-dim(jackpot_results_ranef$Race.Jyo2Cd)[2]
	var_ranef_Race.Jyo2Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.Jyo2Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.Jyo2Cd_matrix <- rbind(var_ranef_Race.Jyo2Cd_matrix,var_ranef_Race.Jyo2Cd_row_sql)
	
	for (row in 1:var_ranef_Race.Jyo2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Jyo2Cd_line_when <- paste0(const_case_when_Race.Jyo2Cd,sprintf("%03d",as.integer(rownames(jackpot_results_ranef$Race.Jyo2Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.Jyo2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Jyo2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.Jyo2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Jyo2Cd_line_name <- colnames(jackpot_results_ranef$Race.Jyo2Cd[col])
				var_ranef_Race.Jyo2Cd_line_value <- as.character(jackpot_results_ranef$Race.Jyo2Cd[row,col])
				var_ranef_Race.Jyo2Cd_line_then <- paste0(var_ranef_Race.Jyo2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.Jyo2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.Jyo2Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.Jyo2Cd_line_sql <- paste(var_ranef_Race.Jyo2Cd_line_when,var_ranef_Race.Jyo2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.Jyo2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.Jyo2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.Jyo2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.Jyo2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.Jyo2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.Jyo2Cd_line_sql)
		
		# Add Row
		var_ranef_Race.Jyo2Cd_row_sql <- cbind(var_ranef_Race.Jyo2Cd_line_sql)
		var_ranef_Race.Jyo2Cd_matrix <- rbind(var_ranef_Race.Jyo2Cd_matrix,var_ranef_Race.Jyo2Cd_row_sql)
	}
	
	# ELSE NULL
	var_ranef_Race.Jyo2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.Jyo2Cd_matrix <- rbind(var_ranef_Race.Jyo2Cd_matrix,var_ranef_Race.Jyo2Cd_row_sql)
	
	# END
	var_ranef_Race.Jyo2Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.Jyo2Cd_matrix <- rbind(var_ranef_Race.Jyo2Cd_matrix,var_ranef_Race.Jyo2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.Jyo2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.GradeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.GradeCd)>0)
{
	# Initialize
	var_ranef_Race.GradeCd_dim_row<-dim(jackpot_results_ranef$Race.GradeCd)[1]
	var_ranef_Race.GradeCd_dim_col<-dim(jackpot_results_ranef$Race.GradeCd)[2]
	var_ranef_Race.GradeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.GradeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.GradeCd_matrix <- rbind(var_ranef_Race.GradeCd_matrix,var_ranef_Race.GradeCd_row_sql)
	
	for (row in 1:var_ranef_Race.GradeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.GradeCd_line_when <- paste0(const_case_when_Race.GradeCd, rownames(jackpot_results_ranef$Race.GradeCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.GradeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.GradeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.GradeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.GradeCd_line_name <- colnames(jackpot_results_ranef$Race.GradeCd[col])
				var_ranef_Race.GradeCd_line_value <- as.character(jackpot_results_ranef$Race.GradeCd[row,col])
				var_ranef_Race.GradeCd_line_then <- paste0(var_ranef_Race.GradeCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.GradeCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.GradeCd_line_value)
			}
		}
		# Col
		var_ranef_Race.GradeCd_line_sql <- paste(var_ranef_Race.GradeCd_line_when,var_ranef_Race.GradeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.GradeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.GradeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.GradeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.GradeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.GradeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.GradeCd_line_sql)
		
		# Add Row
		var_ranef_Race.GradeCd_row_sql <- cbind(var_ranef_Race.GradeCd_line_sql)
		var_ranef_Race.GradeCd_matrix <- rbind(var_ranef_Race.GradeCd_matrix,var_ranef_Race.GradeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.GradeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.GradeCd_matrix <- rbind(var_ranef_Race.GradeCd_matrix,var_ranef_Race.GradeCd_row_sql)
	
	# END
	var_ranef_Race.GradeCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.GradeCd_matrix <- rbind(var_ranef_Race.GradeCd_matrix,var_ranef_Race.GradeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.GradeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.SyubetuCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.SyubetuCd)>0)
{
	# Initialize
	var_ranef_Race.SyubetuCd_dim_row<-dim(jackpot_results_ranef$Race.SyubetuCd)[1]
	var_ranef_Race.SyubetuCd_dim_col<-dim(jackpot_results_ranef$Race.SyubetuCd)[2]
	var_ranef_Race.SyubetuCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.SyubetuCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.SyubetuCd_matrix <- rbind(var_ranef_Race.SyubetuCd_matrix,var_ranef_Race.SyubetuCd_row_sql)
	
	for (row in 1:var_ranef_Race.SyubetuCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.SyubetuCd_line_when <- paste0(const_case_when_Race.SyubetuCd,sprintf("%02d",as.integer(rownames(jackpot_results_ranef$Race.SyubetuCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.SyubetuCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.SyubetuCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.SyubetuCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.SyubetuCd_line_name <- colnames(jackpot_results_ranef$Race.SyubetuCd[col])
				var_ranef_Race.SyubetuCd_line_value <- as.character(jackpot_results_ranef$Race.SyubetuCd[row,col])
				var_ranef_Race.SyubetuCd_line_then <- paste0(var_ranef_Race.SyubetuCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.SyubetuCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.SyubetuCd_line_value)
			}
		}
		# Col
		var_ranef_Race.SyubetuCd_line_sql <- paste(var_ranef_Race.SyubetuCd_line_when,var_ranef_Race.SyubetuCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.SyubetuCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.SyubetuCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.SyubetuCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.SyubetuCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.SyubetuCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.SyubetuCd_line_sql)
		
		# Add Row
		var_ranef_Race.SyubetuCd_row_sql <- cbind(var_ranef_Race.SyubetuCd_line_sql)
		var_ranef_Race.SyubetuCd_matrix <- rbind(var_ranef_Race.SyubetuCd_matrix,var_ranef_Race.SyubetuCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.SyubetuCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.SyubetuCd_matrix <- rbind(var_ranef_Race.SyubetuCd_matrix,var_ranef_Race.SyubetuCd_row_sql)
	
	# END
	var_ranef_Race.SyubetuCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.SyubetuCd_matrix <- rbind(var_ranef_Race.SyubetuCd_matrix,var_ranef_Race.SyubetuCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.SyubetuCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.KigoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.KigoCd)>0)
{
	# Initialize
	var_ranef_Race.KigoCd_dim_row<-dim(jackpot_results_ranef$Race.KigoCd)[1]
	var_ranef_Race.KigoCd_dim_col<-dim(jackpot_results_ranef$Race.KigoCd)[2]
	var_ranef_Race.KigoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.KigoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.KigoCd_matrix <- rbind(var_ranef_Race.KigoCd_matrix,var_ranef_Race.KigoCd_row_sql)
	
	for (row in 1:var_ranef_Race.KigoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.KigoCd_line_when <- paste0(const_case_when_Race.KigoCd, rownames(jackpot_results_ranef$Race.KigoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.KigoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.KigoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.KigoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.KigoCd_line_name <- colnames(jackpot_results_ranef$Race.KigoCd[col])
				var_ranef_Race.KigoCd_line_value <- as.character(jackpot_results_ranef$Race.KigoCd[row,col])
				var_ranef_Race.KigoCd_line_then <- paste0(var_ranef_Race.KigoCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.KigoCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.KigoCd_line_value)
			}
		}
		# Col
		var_ranef_Race.KigoCd_line_sql <- paste(var_ranef_Race.KigoCd_line_when,var_ranef_Race.KigoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.KigoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.KigoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.KigoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.KigoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.KigoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.KigoCd_line_sql)
		
		# Add Row
		var_ranef_Race.KigoCd_row_sql <- cbind(var_ranef_Race.KigoCd_line_sql)
		var_ranef_Race.KigoCd_matrix <- rbind(var_ranef_Race.KigoCd_matrix,var_ranef_Race.KigoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.KigoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.KigoCd_matrix <- rbind(var_ranef_Race.KigoCd_matrix,var_ranef_Race.KigoCd_row_sql)
	
	# END
	var_ranef_Race.KigoCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.KigoCd_matrix <- rbind(var_ranef_Race.KigoCd_matrix,var_ranef_Race.KigoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.KigoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.JyuryoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.JyuryoCd)>0)
{
	# Initialize
	var_ranef_Race.JyuryoCd_dim_row<-dim(jackpot_results_ranef$Race.JyuryoCd)[1]
	var_ranef_Race.JyuryoCd_dim_col<-dim(jackpot_results_ranef$Race.JyuryoCd)[2]
	var_ranef_Race.JyuryoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyuryoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyuryoCd_matrix <- rbind(var_ranef_Race.JyuryoCd_matrix,var_ranef_Race.JyuryoCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyuryoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyuryoCd_line_when <- paste0(const_case_when_Race.JyuryoCd, rownames(jackpot_results_ranef$Race.JyuryoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyuryoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyuryoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.JyuryoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyuryoCd_line_name <- colnames(jackpot_results_ranef$Race.JyuryoCd[col])
				var_ranef_Race.JyuryoCd_line_value <- as.character(jackpot_results_ranef$Race.JyuryoCd[row,col])
				var_ranef_Race.JyuryoCd_line_then <- paste0(var_ranef_Race.JyuryoCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.JyuryoCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.JyuryoCd_line_value)
			}
		}
		# Col
		var_ranef_Race.JyuryoCd_line_sql <- paste(var_ranef_Race.JyuryoCd_line_when,var_ranef_Race.JyuryoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.JyuryoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.JyuryoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.JyuryoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.JyuryoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.JyuryoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.JyuryoCd_line_sql)
		
		# Add Row
		var_ranef_Race.JyuryoCd_row_sql <- cbind(var_ranef_Race.JyuryoCd_line_sql)
		var_ranef_Race.JyuryoCd_matrix <- rbind(var_ranef_Race.JyuryoCd_matrix,var_ranef_Race.JyuryoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.JyuryoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.JyuryoCd_matrix <- rbind(var_ranef_Race.JyuryoCd_matrix,var_ranef_Race.JyuryoCd_row_sql)
	
	# END
	var_ranef_Race.JyuryoCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.JyuryoCd_matrix <- rbind(var_ranef_Race.JyuryoCd_matrix,var_ranef_Race.JyuryoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.JyuryoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.Jyoken5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.Jyoken5Cd)>0)
{
	# Initialize
	var_ranef_Race.Jyoken5Cd_dim_row<-dim(jackpot_results_ranef$Race.Jyoken5Cd)[1]
	var_ranef_Race.Jyoken5Cd_dim_col<-dim(jackpot_results_ranef$Race.Jyoken5Cd)[2]
	var_ranef_Race.Jyoken5Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.Jyoken5Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.Jyoken5Cd_matrix <- rbind(var_ranef_Race.Jyoken5Cd_matrix,var_ranef_Race.Jyoken5Cd_row_sql)
	
	for (row in 1:var_ranef_Race.Jyoken5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Jyoken5Cd_line_when <- paste0(const_case_when_Race.Jyoken5Cd,sprintf("%03d",as.integer(rownames(jackpot_results_ranef$Race.Jyoken5Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.Jyoken5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Jyoken5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.Jyoken5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Jyoken5Cd_line_name <- colnames(jackpot_results_ranef$Race.Jyoken5Cd[col])
				var_ranef_Race.Jyoken5Cd_line_value <- as.character(jackpot_results_ranef$Race.Jyoken5Cd[row,col])
				var_ranef_Race.Jyoken5Cd_line_then <- paste0(var_ranef_Race.Jyoken5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.Jyoken5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.Jyoken5Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.Jyoken5Cd_line_sql <- paste(var_ranef_Race.Jyoken5Cd_line_when,var_ranef_Race.Jyoken5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.Jyoken5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.Jyoken5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.Jyoken5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.Jyoken5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.Jyoken5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.Jyoken5Cd_line_sql)
		
		# Add Row
		var_ranef_Race.Jyoken5Cd_row_sql <- cbind(var_ranef_Race.Jyoken5Cd_line_sql)
		var_ranef_Race.Jyoken5Cd_matrix <- rbind(var_ranef_Race.Jyoken5Cd_matrix,var_ranef_Race.Jyoken5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.Jyoken5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.Jyoken5Cd_matrix <- rbind(var_ranef_Race.Jyoken5Cd_matrix,var_ranef_Race.Jyoken5Cd_row_sql)
	
	# END
	var_ranef_Race.Jyoken5Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.Jyoken5Cd_matrix <- rbind(var_ranef_Race.Jyoken5Cd_matrix,var_ranef_Race.Jyoken5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.Jyoken5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.Kyori)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.Kyori)>0)
{
	# Initialize
	var_ranef_Race.Kyori_dim_row<-dim(jackpot_results_ranef$Race.Kyori)[1]
	var_ranef_Race.Kyori_dim_col<-dim(jackpot_results_ranef$Race.Kyori)[2]
	var_ranef_Race.Kyori_matrix <- NULL
	
	# CASE
	var_ranef_Race.Kyori_row_sql <- cbind(const_case_case)
	var_ranef_Race.Kyori_matrix <- rbind(var_ranef_Race.Kyori_matrix,var_ranef_Race.Kyori_row_sql)
	
	for (row in 1:var_ranef_Race.Kyori_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Kyori_line_when <- paste0(const_case_when_Race.Kyori, rownames(jackpot_results_ranef$Race.Kyori)[row])
		
		# Col : THEN
		var_ranef_Race.Kyori_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Kyori_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.Kyori[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Kyori_line_name <- colnames(jackpot_results_ranef$Race.Kyori[col])
				var_ranef_Race.Kyori_line_value <- as.character(jackpot_results_ranef$Race.Kyori[row,col])
				var_ranef_Race.Kyori_line_then <- paste0(var_ranef_Race.Kyori_line_then,const_ope_plus,const_convert_open,var_ranef_Race.Kyori_line_name,const_convert_close,const_ope_multi,var_ranef_Race.Kyori_line_value)
			}
		}
		# Col
		var_ranef_Race.Kyori_line_sql <- paste(var_ranef_Race.Kyori_line_when,var_ranef_Race.Kyori_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.Kyori_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.Kyori_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.Kyori_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.Kyori_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.Kyori_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.Kyori_line_sql)
		
		# Add Row
		var_ranef_Race.Kyori_row_sql <- cbind(var_ranef_Race.Kyori_line_sql)
		var_ranef_Race.Kyori_matrix <- rbind(var_ranef_Race.Kyori_matrix,var_ranef_Race.Kyori_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.Kyori_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.Kyori_matrix <- rbind(var_ranef_Race.Kyori_matrix,var_ranef_Race.Kyori_row_sql)
	
	# END
	var_ranef_Race.Kyori_row_sql <- cbind(const_case_end)
	var_ranef_Race.Kyori_matrix <- rbind(var_ranef_Race.Kyori_matrix,var_ranef_Race.Kyori_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.Kyori_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TrackCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.TrackCd)>0)
{
	# Initialize
	var_ranef_Race.TrackCd_dim_row<-dim(jackpot_results_ranef$Race.TrackCd)[1]
	var_ranef_Race.TrackCd_dim_col<-dim(jackpot_results_ranef$Race.TrackCd)[2]
	var_ranef_Race.TrackCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackCd_matrix <- rbind(var_ranef_Race.TrackCd_matrix,var_ranef_Race.TrackCd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackCd_line_when <- paste0(const_case_when_Race.TrackCd,sprintf("%02d",as.integer(rownames(jackpot_results_ranef$Race.TrackCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.TrackCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.TrackCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackCd_line_name <- colnames(jackpot_results_ranef$Race.TrackCd[col])
				var_ranef_Race.TrackCd_line_value <- as.character(jackpot_results_ranef$Race.TrackCd[row,col])
				var_ranef_Race.TrackCd_line_then <- paste0(var_ranef_Race.TrackCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.TrackCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.TrackCd_line_value)
			}
		}
		# Col
		var_ranef_Race.TrackCd_line_sql <- paste(var_ranef_Race.TrackCd_line_when,var_ranef_Race.TrackCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.TrackCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.TrackCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.TrackCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.TrackCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.TrackCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.TrackCd_line_sql)
		
		# Add Row
		var_ranef_Race.TrackCd_row_sql <- cbind(var_ranef_Race.TrackCd_line_sql)
		var_ranef_Race.TrackCd_matrix <- rbind(var_ranef_Race.TrackCd_matrix,var_ranef_Race.TrackCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.TrackCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.TrackCd_matrix <- rbind(var_ranef_Race.TrackCd_matrix,var_ranef_Race.TrackCd_row_sql)
	
	# END
	var_ranef_Race.TrackCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.TrackCd_matrix <- rbind(var_ranef_Race.TrackCd_matrix,var_ranef_Race.TrackCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.TrackCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.CourseKubunCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.CourseKubunCd)>0)
{
	# Initialize
	var_ranef_Race.CourseKubunCd_dim_row<-dim(jackpot_results_ranef$Race.CourseKubunCd)[1]
	var_ranef_Race.CourseKubunCd_dim_col<-dim(jackpot_results_ranef$Race.CourseKubunCd)[2]
	var_ranef_Race.CourseKubunCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.CourseKubunCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.CourseKubunCd_matrix <- rbind(var_ranef_Race.CourseKubunCd_matrix,var_ranef_Race.CourseKubunCd_row_sql)
	
	for (row in 1:var_ranef_Race.CourseKubunCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.CourseKubunCd_line_when <- paste0(const_case_when_Race.CourseKubunCd, rownames(jackpot_results_ranef$Race.CourseKubunCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.CourseKubunCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.CourseKubunCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.CourseKubunCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.CourseKubunCd_line_name <- colnames(jackpot_results_ranef$Race.CourseKubunCd[col])
				var_ranef_Race.CourseKubunCd_line_value <- as.character(jackpot_results_ranef$Race.CourseKubunCd[row,col])
				var_ranef_Race.CourseKubunCd_line_then <- paste0(var_ranef_Race.CourseKubunCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.CourseKubunCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.CourseKubunCd_line_value)
			}
		}
		# Col
		var_ranef_Race.CourseKubunCd_line_sql <- paste(var_ranef_Race.CourseKubunCd_line_when,var_ranef_Race.CourseKubunCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.CourseKubunCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.CourseKubunCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.CourseKubunCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.CourseKubunCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.CourseKubunCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.CourseKubunCd_line_sql)
		
		# Add Row
		var_ranef_Race.CourseKubunCd_row_sql <- cbind(var_ranef_Race.CourseKubunCd_line_sql)
		var_ranef_Race.CourseKubunCd_matrix <- rbind(var_ranef_Race.CourseKubunCd_matrix,var_ranef_Race.CourseKubunCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.CourseKubunCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.CourseKubunCd_matrix <- rbind(var_ranef_Race.CourseKubunCd_matrix,var_ranef_Race.CourseKubunCd_row_sql)
	
	# END
	var_ranef_Race.CourseKubunCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.CourseKubunCd_matrix <- rbind(var_ranef_Race.CourseKubunCd_matrix,var_ranef_Race.CourseKubunCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.CourseKubunCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TenkoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.TenkoCd)>0)
{
	# Initialize
	var_ranef_Race.TenkoCd_dim_row<-dim(jackpot_results_ranef$Race.TenkoCd)[1]
	var_ranef_Race.TenkoCd_dim_col<-dim(jackpot_results_ranef$Race.TenkoCd)[2]
	var_ranef_Race.TenkoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TenkoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TenkoCd_matrix <- rbind(var_ranef_Race.TenkoCd_matrix,var_ranef_Race.TenkoCd_row_sql)
	
	for (row in 1:var_ranef_Race.TenkoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TenkoCd_line_when <- paste0(const_case_when_Race.TenkoCd, rownames(jackpot_results_ranef$Race.TenkoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.TenkoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TenkoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.TenkoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TenkoCd_line_name <- colnames(jackpot_results_ranef$Race.TenkoCd[col])
				var_ranef_Race.TenkoCd_line_value <- as.character(jackpot_results_ranef$Race.TenkoCd[row,col])
				var_ranef_Race.TenkoCd_line_then <- paste0(var_ranef_Race.TenkoCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.TenkoCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.TenkoCd_line_value)
			}
		}
		# Col
		var_ranef_Race.TenkoCd_line_sql <- paste(var_ranef_Race.TenkoCd_line_when,var_ranef_Race.TenkoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.TenkoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.TenkoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.TenkoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.TenkoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.TenkoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.TenkoCd_line_sql)
		
		# Add Row
		var_ranef_Race.TenkoCd_row_sql <- cbind(var_ranef_Race.TenkoCd_line_sql)
		var_ranef_Race.TenkoCd_matrix <- rbind(var_ranef_Race.TenkoCd_matrix,var_ranef_Race.TenkoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.TenkoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.TenkoCd_matrix <- rbind(var_ranef_Race.TenkoCd_matrix,var_ranef_Race.TenkoCd_row_sql)
	
	# END
	var_ranef_Race.TenkoCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.TenkoCd_matrix <- rbind(var_ranef_Race.TenkoCd_matrix,var_ranef_Race.TenkoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.TenkoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TrackTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.TrackTypeCd)>0)
{
	# Initialize
	var_ranef_Race.TrackTypeCd_dim_row<-dim(jackpot_results_ranef$Race.TrackTypeCd)[1]
	var_ranef_Race.TrackTypeCd_dim_col<-dim(jackpot_results_ranef$Race.TrackTypeCd)[2]
	var_ranef_Race.TrackTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackTypeCd_matrix <- rbind(var_ranef_Race.TrackTypeCd_matrix,var_ranef_Race.TrackTypeCd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackTypeCd_line_when <- paste0(const_case_when_Race.TrackTypeCd, rownames(jackpot_results_ranef$Race.TrackTypeCd)[row])
		
		# Col : THEN
		var_ranef_Race.TrackTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.TrackTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackTypeCd_line_name <- colnames(jackpot_results_ranef$Race.TrackTypeCd[col])
				var_ranef_Race.TrackTypeCd_line_value <- as.character(jackpot_results_ranef$Race.TrackTypeCd[row,col])
				var_ranef_Race.TrackTypeCd_line_then <- paste0(var_ranef_Race.TrackTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.TrackTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.TrackTypeCd_line_value)
			}
		}
		# Col
		var_ranef_Race.TrackTypeCd_line_sql <- paste(var_ranef_Race.TrackTypeCd_line_when,var_ranef_Race.TrackTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.TrackTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.TrackTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.TrackTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.TrackTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.TrackTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.TrackTypeCd_line_sql)
		
		# Add Row
		var_ranef_Race.TrackTypeCd_row_sql <- cbind(var_ranef_Race.TrackTypeCd_line_sql)
		var_ranef_Race.TrackTypeCd_matrix <- rbind(var_ranef_Race.TrackTypeCd_matrix,var_ranef_Race.TrackTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.TrackTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.TrackTypeCd_matrix <- rbind(var_ranef_Race.TrackTypeCd_matrix,var_ranef_Race.TrackTypeCd_row_sql)
	
	# END
	var_ranef_Race.TrackTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.TrackTypeCd_matrix <- rbind(var_ranef_Race.TrackTypeCd_matrix,var_ranef_Race.TrackTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.TrackTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TrackType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.TrackType3Cd)>0)
{
	# Initialize
	var_ranef_Race.TrackType3Cd_dim_row<-dim(jackpot_results_ranef$Race.TrackType3Cd)[1]
	var_ranef_Race.TrackType3Cd_dim_col<-dim(jackpot_results_ranef$Race.TrackType3Cd)[2]
	var_ranef_Race.TrackType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackType3Cd_matrix <- rbind(var_ranef_Race.TrackType3Cd_matrix,var_ranef_Race.TrackType3Cd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackType3Cd_line_when <- paste0(const_case_when_Race.TrackType3Cd, rownames(jackpot_results_ranef$Race.TrackType3Cd)[row])
		
		# Col : THEN
		var_ranef_Race.TrackType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.TrackType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackType3Cd_line_name <- colnames(jackpot_results_ranef$Race.TrackType3Cd[col])
				var_ranef_Race.TrackType3Cd_line_value <- as.character(jackpot_results_ranef$Race.TrackType3Cd[row,col])
				var_ranef_Race.TrackType3Cd_line_then <- paste0(var_ranef_Race.TrackType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.TrackType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.TrackType3Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.TrackType3Cd_line_sql <- paste(var_ranef_Race.TrackType3Cd_line_when,var_ranef_Race.TrackType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.TrackType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.TrackType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.TrackType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.TrackType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.TrackType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.TrackType3Cd_line_sql)
		
		# Add Row
		var_ranef_Race.TrackType3Cd_row_sql <- cbind(var_ranef_Race.TrackType3Cd_line_sql)
		var_ranef_Race.TrackType3Cd_matrix <- rbind(var_ranef_Race.TrackType3Cd_matrix,var_ranef_Race.TrackType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.TrackType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.TrackType3Cd_matrix <- rbind(var_ranef_Race.TrackType3Cd_matrix,var_ranef_Race.TrackType3Cd_row_sql)
	
	# END
	var_ranef_Race.TrackType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.TrackType3Cd_matrix <- rbind(var_ranef_Race.TrackType3Cd_matrix,var_ranef_Race.TrackType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.TrackType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.CourseTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.CourseTypeCd)>0)
{
	# Initialize
	var_ranef_Race.CourseTypeCd_dim_row<-dim(jackpot_results_ranef$Race.CourseTypeCd)[1]
	var_ranef_Race.CourseTypeCd_dim_col<-dim(jackpot_results_ranef$Race.CourseTypeCd)[2]
	var_ranef_Race.CourseTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.CourseTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.CourseTypeCd_matrix <- rbind(var_ranef_Race.CourseTypeCd_matrix,var_ranef_Race.CourseTypeCd_row_sql)
	
	for (row in 1:var_ranef_Race.CourseTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.CourseTypeCd_line_when <- paste0(const_case_when_Race.CourseTypeCd, rownames(jackpot_results_ranef$Race.CourseTypeCd)[row])
		
		# Col : THEN
		var_ranef_Race.CourseTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.CourseTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.CourseTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.CourseTypeCd_line_name <- colnames(jackpot_results_ranef$Race.CourseTypeCd[col])
				var_ranef_Race.CourseTypeCd_line_value <- as.character(jackpot_results_ranef$Race.CourseTypeCd[row,col])
				var_ranef_Race.CourseTypeCd_line_then <- paste0(var_ranef_Race.CourseTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.CourseTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.CourseTypeCd_line_value)
			}
		}
		# Col
		var_ranef_Race.CourseTypeCd_line_sql <- paste(var_ranef_Race.CourseTypeCd_line_when,var_ranef_Race.CourseTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.CourseTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.CourseTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.CourseTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.CourseTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.CourseTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.CourseTypeCd_line_sql)
		
		# Add Row
		var_ranef_Race.CourseTypeCd_row_sql <- cbind(var_ranef_Race.CourseTypeCd_line_sql)
		var_ranef_Race.CourseTypeCd_matrix <- rbind(var_ranef_Race.CourseTypeCd_matrix,var_ranef_Race.CourseTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.CourseTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.CourseTypeCd_matrix <- rbind(var_ranef_Race.CourseTypeCd_matrix,var_ranef_Race.CourseTypeCd_row_sql)
	
	# END
	var_ranef_Race.CourseTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.CourseTypeCd_matrix <- rbind(var_ranef_Race.CourseTypeCd_matrix,var_ranef_Race.CourseTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.CourseTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TrackConditionCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.TrackConditionCd)>0)
{
	# Initialize
	var_ranef_Race.TrackConditionCd_dim_row<-dim(jackpot_results_ranef$Race.TrackConditionCd)[1]
	var_ranef_Race.TrackConditionCd_dim_col<-dim(jackpot_results_ranef$Race.TrackConditionCd)[2]
	var_ranef_Race.TrackConditionCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackConditionCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackConditionCd_matrix <- rbind(var_ranef_Race.TrackConditionCd_matrix,var_ranef_Race.TrackConditionCd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackConditionCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackConditionCd_line_when <- paste0(const_case_when_Race.TrackConditionCd, rownames(jackpot_results_ranef$Race.TrackConditionCd)[row])
		
		# Col : THEN
		var_ranef_Race.TrackConditionCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackConditionCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.TrackConditionCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackConditionCd_line_name <- colnames(jackpot_results_ranef$Race.TrackConditionCd[col])
				var_ranef_Race.TrackConditionCd_line_value <- as.character(jackpot_results_ranef$Race.TrackConditionCd[row,col])
				var_ranef_Race.TrackConditionCd_line_then <- paste0(var_ranef_Race.TrackConditionCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.TrackConditionCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.TrackConditionCd_line_value)
			}
		}
		# Col
		var_ranef_Race.TrackConditionCd_line_sql <- paste(var_ranef_Race.TrackConditionCd_line_when,var_ranef_Race.TrackConditionCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.TrackConditionCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.TrackConditionCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.TrackConditionCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.TrackConditionCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.TrackConditionCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.TrackConditionCd_line_sql)
		
		# Add Row
		var_ranef_Race.TrackConditionCd_row_sql <- cbind(var_ranef_Race.TrackConditionCd_line_sql)
		var_ranef_Race.TrackConditionCd_matrix <- rbind(var_ranef_Race.TrackConditionCd_matrix,var_ranef_Race.TrackConditionCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.TrackConditionCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.TrackConditionCd_matrix <- rbind(var_ranef_Race.TrackConditionCd_matrix,var_ranef_Race.TrackConditionCd_row_sql)
	
	# END
	var_ranef_Race.TrackConditionCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.TrackConditionCd_matrix <- rbind(var_ranef_Race.TrackConditionCd_matrix,var_ranef_Race.TrackConditionCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.TrackConditionCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.JyokenCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.JyokenCd)>0)
{
	# Initialize
	var_ranef_Race.JyokenCd_dim_row<-dim(jackpot_results_ranef$Race.JyokenCd)[1]
	var_ranef_Race.JyokenCd_dim_col<-dim(jackpot_results_ranef$Race.JyokenCd)[2]
	var_ranef_Race.JyokenCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyokenCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyokenCd_matrix <- rbind(var_ranef_Race.JyokenCd_matrix,var_ranef_Race.JyokenCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyokenCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyokenCd_line_when <- paste0(const_case_when_Race.JyokenCd,sprintf("%03d",as.integer(rownames(jackpot_results_ranef$Race.JyokenCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyokenCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyokenCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.JyokenCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyokenCd_line_name <- colnames(jackpot_results_ranef$Race.JyokenCd[col])
				var_ranef_Race.JyokenCd_line_value <- as.character(jackpot_results_ranef$Race.JyokenCd[row,col])
				var_ranef_Race.JyokenCd_line_then <- paste0(var_ranef_Race.JyokenCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.JyokenCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.JyokenCd_line_value)
			}
		}
		# Col
		var_ranef_Race.JyokenCd_line_sql <- paste(var_ranef_Race.JyokenCd_line_when,var_ranef_Race.JyokenCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.JyokenCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.JyokenCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.JyokenCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.JyokenCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.JyokenCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.JyokenCd_line_sql)
		
		# Add Row
		var_ranef_Race.JyokenCd_row_sql <- cbind(var_ranef_Race.JyokenCd_line_sql)
		var_ranef_Race.JyokenCd_matrix <- rbind(var_ranef_Race.JyokenCd_matrix,var_ranef_Race.JyokenCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.JyokenCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.JyokenCd_matrix <- rbind(var_ranef_Race.JyokenCd_matrix,var_ranef_Race.JyokenCd_row_sql)
	
	# END
	var_ranef_Race.JyokenCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.JyokenCd_matrix <- rbind(var_ranef_Race.JyokenCd_matrix,var_ranef_Race.JyokenCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.JyokenCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.JyokenGradeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.JyokenGradeCd)>0)
{
	# Initialize
	var_ranef_Race.JyokenGradeCd_dim_row<-dim(jackpot_results_ranef$Race.JyokenGradeCd)[1]
	var_ranef_Race.JyokenGradeCd_dim_col<-dim(jackpot_results_ranef$Race.JyokenGradeCd)[2]
	var_ranef_Race.JyokenGradeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyokenGradeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyokenGradeCd_matrix <- rbind(var_ranef_Race.JyokenGradeCd_matrix,var_ranef_Race.JyokenGradeCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyokenGradeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyokenGradeCd_line_when <- paste0(const_case_when_Race.JyokenGradeCd, rownames(jackpot_results_ranef$Race.JyokenGradeCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyokenGradeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyokenGradeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.JyokenGradeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyokenGradeCd_line_name <- colnames(jackpot_results_ranef$Race.JyokenGradeCd[col])
				var_ranef_Race.JyokenGradeCd_line_value <- as.character(jackpot_results_ranef$Race.JyokenGradeCd[row,col])
				var_ranef_Race.JyokenGradeCd_line_then <- paste0(var_ranef_Race.JyokenGradeCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.JyokenGradeCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.JyokenGradeCd_line_value)
			}
		}
		# Col
		var_ranef_Race.JyokenGradeCd_line_sql <- paste(var_ranef_Race.JyokenGradeCd_line_when,var_ranef_Race.JyokenGradeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.JyokenGradeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.JyokenGradeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.JyokenGradeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.JyokenGradeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.JyokenGradeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.JyokenGradeCd_line_sql)
		
		# Add Row
		var_ranef_Race.JyokenGradeCd_row_sql <- cbind(var_ranef_Race.JyokenGradeCd_line_sql)
		var_ranef_Race.JyokenGradeCd_matrix <- rbind(var_ranef_Race.JyokenGradeCd_matrix,var_ranef_Race.JyokenGradeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.JyokenGradeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.JyokenGradeCd_matrix <- rbind(var_ranef_Race.JyokenGradeCd_matrix,var_ranef_Race.JyokenGradeCd_row_sql)
	
	# END
	var_ranef_Race.JyokenGradeCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.JyokenGradeCd_matrix <- rbind(var_ranef_Race.JyokenGradeCd_matrix,var_ranef_Race.JyokenGradeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.JyokenGradeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.S38Avg)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.S38Avg)>0)
{
	# Initialize
	var_ranef_Race.S38Avg_dim_row<-dim(jackpot_results_ranef$Race.S38Avg)[1]
	var_ranef_Race.S38Avg_dim_col<-dim(jackpot_results_ranef$Race.S38Avg)[2]
	var_ranef_Race.S38Avg_matrix <- NULL
	
	# CASE
	var_ranef_Race.S38Avg_row_sql <- cbind(const_case_case)
	var_ranef_Race.S38Avg_matrix <- rbind(var_ranef_Race.S38Avg_matrix,var_ranef_Race.S38Avg_row_sql)
	
	for (row in 1:var_ranef_Race.S38Avg_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.S38Avg_line_when <- paste0(const_case_when_Race.S38Avg, rownames(jackpot_results_ranef$Race.S38Avg)[row])
		
		# Col : THEN
		var_ranef_Race.S38Avg_line_then <- const_case_then
		for(col in 1: var_ranef_Race.S38Avg_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.S38Avg[col]),nomatch=0) > 0)
			{
				var_ranef_Race.S38Avg_line_name <- colnames(jackpot_results_ranef$Race.S38Avg[col])
				var_ranef_Race.S38Avg_line_value <- as.character(jackpot_results_ranef$Race.S38Avg[row,col])
				var_ranef_Race.S38Avg_line_then <- paste0(var_ranef_Race.S38Avg_line_then,const_ope_plus,const_convert_open,var_ranef_Race.S38Avg_line_name,const_convert_close,const_ope_multi,var_ranef_Race.S38Avg_line_value)
			}
		}
		# Col
		var_ranef_Race.S38Avg_line_sql <- paste(var_ranef_Race.S38Avg_line_when,var_ranef_Race.S38Avg_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.S38Avg_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.S38Avg_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.S38Avg_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.S38Avg_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.S38Avg_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.S38Avg_line_sql)
		
		# Add Row
		var_ranef_Race.S38Avg_row_sql <- cbind(var_ranef_Race.S38Avg_line_sql)
		var_ranef_Race.S38Avg_matrix <- rbind(var_ranef_Race.S38Avg_matrix,var_ranef_Race.S38Avg_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.S38Avg_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.S38Avg_matrix <- rbind(var_ranef_Race.S38Avg_matrix,var_ranef_Race.S38Avg_row_sql)
	
	# END
	var_ranef_Race.S38Avg_row_sql <- cbind(const_case_end)
	var_ranef_Race.S38Avg_matrix <- rbind(var_ranef_Race.S38Avg_matrix,var_ranef_Race.S38Avg_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.S38Avg_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.SmileCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.SmileCd)>0)
{
	# Initialize
	var_ranef_Race.SmileCd_dim_row<-dim(jackpot_results_ranef$Race.SmileCd)[1]
	var_ranef_Race.SmileCd_dim_col<-dim(jackpot_results_ranef$Race.SmileCd)[2]
	var_ranef_Race.SmileCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.SmileCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.SmileCd_matrix <- rbind(var_ranef_Race.SmileCd_matrix,var_ranef_Race.SmileCd_row_sql)
	
	for (row in 1:var_ranef_Race.SmileCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.SmileCd_line_when <- paste0(const_case_when_Race.SmileCd, rownames(jackpot_results_ranef$Race.SmileCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.SmileCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.SmileCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.SmileCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.SmileCd_line_name <- colnames(jackpot_results_ranef$Race.SmileCd[col])
				var_ranef_Race.SmileCd_line_value <- as.character(jackpot_results_ranef$Race.SmileCd[row,col])
				var_ranef_Race.SmileCd_line_then <- paste0(var_ranef_Race.SmileCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.SmileCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.SmileCd_line_value)
			}
		}
		# Col
		var_ranef_Race.SmileCd_line_sql <- paste(var_ranef_Race.SmileCd_line_when,var_ranef_Race.SmileCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.SmileCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.SmileCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.SmileCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.SmileCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.SmileCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.SmileCd_line_sql)
		
		# Add Row
		var_ranef_Race.SmileCd_row_sql <- cbind(var_ranef_Race.SmileCd_line_sql)
		var_ranef_Race.SmileCd_matrix <- rbind(var_ranef_Race.SmileCd_matrix,var_ranef_Race.SmileCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.SmileCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.SmileCd_matrix <- rbind(var_ranef_Race.SmileCd_matrix,var_ranef_Race.SmileCd_row_sql)
	
	# END
	var_ranef_Race.SmileCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.SmileCd_matrix <- rbind(var_ranef_Race.SmileCd_matrix,var_ranef_Race.SmileCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.SmileCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType1Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType1Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType1Cd)[1]
	var_ranef_Race.RaceType1Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType1Cd)[2]
	var_ranef_Race.RaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType1Cd_matrix <- rbind(var_ranef_Race.RaceType1Cd_matrix,var_ranef_Race.RaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType1Cd_line_when <- paste0(const_case_when_Race.RaceType1Cd, rownames(jackpot_results_ranef$Race.RaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType1Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType1Cd[col])
				var_ranef_Race.RaceType1Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType1Cd[row,col])
				var_ranef_Race.RaceType1Cd_line_then <- paste0(var_ranef_Race.RaceType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType1Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType1Cd_line_sql <- paste(var_ranef_Race.RaceType1Cd_line_when,var_ranef_Race.RaceType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType1Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType1Cd_row_sql <- cbind(var_ranef_Race.RaceType1Cd_line_sql)
		var_ranef_Race.RaceType1Cd_matrix <- rbind(var_ranef_Race.RaceType1Cd_matrix,var_ranef_Race.RaceType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType1Cd_matrix <- rbind(var_ranef_Race.RaceType1Cd_matrix,var_ranef_Race.RaceType1Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType1Cd_matrix <- rbind(var_ranef_Race.RaceType1Cd_matrix,var_ranef_Race.RaceType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType2Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType2Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType2Cd)[1]
	var_ranef_Race.RaceType2Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType2Cd)[2]
	var_ranef_Race.RaceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType2Cd_line_when <- paste0(const_case_when_Race.RaceType2Cd, rownames(jackpot_results_ranef$Race.RaceType2Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType2Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType2Cd[col])
				var_ranef_Race.RaceType2Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType2Cd[row,col])
				var_ranef_Race.RaceType2Cd_line_then <- paste0(var_ranef_Race.RaceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType2Cd_line_sql <- paste(var_ranef_Race.RaceType2Cd_line_when,var_ranef_Race.RaceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType2Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType2Cd_row_sql <- cbind(var_ranef_Race.RaceType2Cd_line_sql)
		var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType3Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType3Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType3Cd)[1]
	var_ranef_Race.RaceType3Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType3Cd)[2]
	var_ranef_Race.RaceType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType3Cd_line_when <- paste0(const_case_when_Race.RaceType3Cd, rownames(jackpot_results_ranef$Race.RaceType3Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType3Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType3Cd[col])
				var_ranef_Race.RaceType3Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType3Cd[row,col])
				var_ranef_Race.RaceType3Cd_line_then <- paste0(var_ranef_Race.RaceType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType3Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType3Cd_line_sql <- paste(var_ranef_Race.RaceType3Cd_line_when,var_ranef_Race.RaceType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType3Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType3Cd_row_sql <- cbind(var_ranef_Race.RaceType3Cd_line_sql)
		var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType4Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType4Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType4Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType4Cd)[1]
	var_ranef_Race.RaceType4Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType4Cd)[2]
	var_ranef_Race.RaceType4Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType4Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType4Cd_line_when <- paste0(const_case_when_Race.RaceType4Cd, rownames(jackpot_results_ranef$Race.RaceType4Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType4Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType4Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType4Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType4Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType4Cd[col])
				var_ranef_Race.RaceType4Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType4Cd[row,col])
				var_ranef_Race.RaceType4Cd_line_then <- paste0(var_ranef_Race.RaceType4Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType4Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType4Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType4Cd_line_sql <- paste(var_ranef_Race.RaceType4Cd_line_when,var_ranef_Race.RaceType4Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType4Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType4Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType4Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType4Cd_row_sql <- cbind(var_ranef_Race.RaceType4Cd_line_sql)
		var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType4Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType5Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType5Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType5Cd)[1]
	var_ranef_Race.RaceType5Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType5Cd)[2]
	var_ranef_Race.RaceType5Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType5Cd_line_when <- paste0(const_case_when_Race.RaceType5Cd, rownames(jackpot_results_ranef$Race.RaceType5Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType5Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType5Cd[col])
				var_ranef_Race.RaceType5Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType5Cd[row,col])
				var_ranef_Race.RaceType5Cd_line_then <- paste0(var_ranef_Race.RaceType5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType5Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType5Cd_line_sql <- paste(var_ranef_Race.RaceType5Cd_line_when,var_ranef_Race.RaceType5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType5Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType5Cd_row_sql <- cbind(var_ranef_Race.RaceType5Cd_line_sql)
		var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType6Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType6Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType6Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType6Cd)[1]
	var_ranef_Race.RaceType6Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType6Cd)[2]
	var_ranef_Race.RaceType6Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType6Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType6Cd_line_when <- paste0(const_case_when_Race.RaceType6Cd, rownames(jackpot_results_ranef$Race.RaceType6Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType6Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType6Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType6Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType6Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType6Cd[col])
				var_ranef_Race.RaceType6Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType6Cd[row,col])
				var_ranef_Race.RaceType6Cd_line_then <- paste0(var_ranef_Race.RaceType6Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType6Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType6Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType6Cd_line_sql <- paste(var_ranef_Race.RaceType6Cd_line_when,var_ranef_Race.RaceType6Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType6Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType6Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType6Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType6Cd_row_sql <- cbind(var_ranef_Race.RaceType6Cd_line_sql)
		var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType6Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType7Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType7Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType7Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType7Cd)[1]
	var_ranef_Race.RaceType7Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType7Cd)[2]
	var_ranef_Race.RaceType7Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType7Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType7Cd_line_when <- paste0(const_case_when_Race.RaceType7Cd, rownames(jackpot_results_ranef$Race.RaceType7Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType7Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType7Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType7Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType7Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType7Cd[col])
				var_ranef_Race.RaceType7Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType7Cd[row,col])
				var_ranef_Race.RaceType7Cd_line_then <- paste0(var_ranef_Race.RaceType7Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType7Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType7Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType7Cd_line_sql <- paste(var_ranef_Race.RaceType7Cd_line_when,var_ranef_Race.RaceType7Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType7Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType7Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType7Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType7Cd_row_sql <- cbind(var_ranef_Race.RaceType7Cd_line_sql)
		var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType7Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType8Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType8Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType8Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType8Cd)[1]
	var_ranef_Race.RaceType8Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType8Cd)[2]
	var_ranef_Race.RaceType8Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType8Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType8Cd_line_when <- paste0(const_case_when_Race.RaceType8Cd, rownames(jackpot_results_ranef$Race.RaceType8Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType8Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType8Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType8Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType8Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType8Cd[col])
				var_ranef_Race.RaceType8Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType8Cd[row,col])
				var_ranef_Race.RaceType8Cd_line_then <- paste0(var_ranef_Race.RaceType8Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType8Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType8Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType8Cd_line_sql <- paste(var_ranef_Race.RaceType8Cd_line_when,var_ranef_Race.RaceType8Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType8Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType8Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType8Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType8Cd_row_sql <- cbind(var_ranef_Race.RaceType8Cd_line_sql)
		var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType8Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType9Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.RaceType9Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType9Cd_dim_row<-dim(jackpot_results_ranef$Race.RaceType9Cd)[1]
	var_ranef_Race.RaceType9Cd_dim_col<-dim(jackpot_results_ranef$Race.RaceType9Cd)[2]
	var_ranef_Race.RaceType9Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType9Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType9Cd_line_when <- paste0(const_case_when_Race.RaceType9Cd, rownames(jackpot_results_ranef$Race.RaceType9Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType9Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType9Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$Race.RaceType9Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType9Cd_line_name <- colnames(jackpot_results_ranef$Race.RaceType9Cd[col])
				var_ranef_Race.RaceType9Cd_line_value <- as.character(jackpot_results_ranef$Race.RaceType9Cd[row,col])
				var_ranef_Race.RaceType9Cd_line_then <- paste0(var_ranef_Race.RaceType9Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType9Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType9Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType9Cd_line_sql <- paste(var_ranef_Race.RaceType9Cd_line_when,var_ranef_Race.RaceType9Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType9Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType9Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType9Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType9Cd_row_sql <- cbind(var_ranef_Race.RaceType9Cd_line_sql)
		var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType9Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.Futan)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.Futan)>0)
{
	# Initialize
	var_ranef_RaceHorse.Futan_dim_row<-dim(jackpot_results_ranef$RaceHorse.Futan)[1]
	var_ranef_RaceHorse.Futan_dim_col<-dim(jackpot_results_ranef$RaceHorse.Futan)[2]
	var_ranef_RaceHorse.Futan_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.Futan_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.Futan_matrix <- rbind(var_ranef_RaceHorse.Futan_matrix,var_ranef_RaceHorse.Futan_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.Futan_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.Futan_line_when <- paste0(const_case_when_RaceHorse.Futan, rownames(jackpot_results_ranef$RaceHorse.Futan)[row])
		
		# Col : THEN
		var_ranef_RaceHorse.Futan_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.Futan_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.Futan[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.Futan_line_name <- colnames(jackpot_results_ranef$RaceHorse.Futan[col])
				var_ranef_RaceHorse.Futan_line_value <- as.character(jackpot_results_ranef$RaceHorse.Futan[row,col])
				var_ranef_RaceHorse.Futan_line_then <- paste0(var_ranef_RaceHorse.Futan_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.Futan_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.Futan_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.Futan_line_sql <- paste(var_ranef_RaceHorse.Futan_line_when,var_ranef_RaceHorse.Futan_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.Futan_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.Futan_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.Futan_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.Futan_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.Futan_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.Futan_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.Futan_row_sql <- cbind(var_ranef_RaceHorse.Futan_line_sql)
		var_ranef_RaceHorse.Futan_matrix <- rbind(var_ranef_RaceHorse.Futan_matrix,var_ranef_RaceHorse.Futan_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.Futan_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.Futan_matrix <- rbind(var_ranef_RaceHorse.Futan_matrix,var_ranef_RaceHorse.Futan_row_sql)
	
	# END
	var_ranef_RaceHorse.Futan_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.Futan_matrix <- rbind(var_ranef_RaceHorse.Futan_matrix,var_ranef_RaceHorse.Futan_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.Futan_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType1Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd)[1]
	var_ranef_RaceHorse.PrevRaceType1Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd)[2]
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType1Cd_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType1Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType1Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType1Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd[col])
				var_ranef_RaceHorse.PrevRaceType1Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType1Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType1Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType1Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType1Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType1Cd_line_when,var_ranef_RaceHorse.PrevRaceType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType1Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType1Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType1Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType1Cd_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType1Cd_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType1Cd_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType2Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd)[1]
	var_ranef_RaceHorse.PrevRaceType2Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd)[2]
	var_ranef_RaceHorse.PrevRaceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType2Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType2Cd_matrix,var_ranef_RaceHorse.PrevRaceType2Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType2Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType2Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType2Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd[col])
				var_ranef_RaceHorse.PrevRaceType2Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType2Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType2Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType2Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType2Cd_line_when,var_ranef_RaceHorse.PrevRaceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType2Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType2Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType2Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType2Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType2Cd_matrix,var_ranef_RaceHorse.PrevRaceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType2Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType2Cd_matrix,var_ranef_RaceHorse.PrevRaceType2Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType2Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType2Cd_matrix,var_ranef_RaceHorse.PrevRaceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType3Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd)[1]
	var_ranef_RaceHorse.PrevRaceType3Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd)[2]
	var_ranef_RaceHorse.PrevRaceType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType3Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType3Cd_matrix,var_ranef_RaceHorse.PrevRaceType3Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType3Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType3Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType3Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd[col])
				var_ranef_RaceHorse.PrevRaceType3Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType3Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType3Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType3Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType3Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType3Cd_line_when,var_ranef_RaceHorse.PrevRaceType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType3Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType3Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType3Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType3Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType3Cd_matrix,var_ranef_RaceHorse.PrevRaceType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType3Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType3Cd_matrix,var_ranef_RaceHorse.PrevRaceType3Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType3Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType3Cd_matrix,var_ranef_RaceHorse.PrevRaceType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType4Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType4Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd)[1]
	var_ranef_RaceHorse.PrevRaceType4Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd)[2]
	var_ranef_RaceHorse.PrevRaceType4Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType4Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType4Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType4Cd_matrix,var_ranef_RaceHorse.PrevRaceType4Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType4Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType4Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType4Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType4Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType4Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType4Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd[col])
				var_ranef_RaceHorse.PrevRaceType4Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType4Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType4Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType4Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType4Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType4Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType4Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType4Cd_line_when,var_ranef_RaceHorse.PrevRaceType4Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType4Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType4Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType4Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType4Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType4Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType4Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType4Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType4Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType4Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType4Cd_matrix,var_ranef_RaceHorse.PrevRaceType4Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType4Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType4Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType4Cd_matrix,var_ranef_RaceHorse.PrevRaceType4Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType4Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType4Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType4Cd_matrix,var_ranef_RaceHorse.PrevRaceType4Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType4Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType5Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd)[1]
	var_ranef_RaceHorse.PrevRaceType5Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd)[2]
	var_ranef_RaceHorse.PrevRaceType5Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType5Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType5Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType5Cd_matrix,var_ranef_RaceHorse.PrevRaceType5Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType5Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType5Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType5Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd[col])
				var_ranef_RaceHorse.PrevRaceType5Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType5Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType5Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType5Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType5Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType5Cd_line_when,var_ranef_RaceHorse.PrevRaceType5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType5Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType5Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType5Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType5Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType5Cd_matrix,var_ranef_RaceHorse.PrevRaceType5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType5Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType5Cd_matrix,var_ranef_RaceHorse.PrevRaceType5Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType5Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType5Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType5Cd_matrix,var_ranef_RaceHorse.PrevRaceType5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType6Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType6Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd)[1]
	var_ranef_RaceHorse.PrevRaceType6Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd)[2]
	var_ranef_RaceHorse.PrevRaceType6Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType6Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType6Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType6Cd_matrix,var_ranef_RaceHorse.PrevRaceType6Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType6Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType6Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType6Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType6Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType6Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType6Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd[col])
				var_ranef_RaceHorse.PrevRaceType6Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType6Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType6Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType6Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType6Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType6Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType6Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType6Cd_line_when,var_ranef_RaceHorse.PrevRaceType6Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType6Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType6Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType6Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType6Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType6Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType6Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType6Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType6Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType6Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType6Cd_matrix,var_ranef_RaceHorse.PrevRaceType6Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType6Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType6Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType6Cd_matrix,var_ranef_RaceHorse.PrevRaceType6Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType6Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType6Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType6Cd_matrix,var_ranef_RaceHorse.PrevRaceType6Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType6Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType7Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType7Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd)[1]
	var_ranef_RaceHorse.PrevRaceType7Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd)[2]
	var_ranef_RaceHorse.PrevRaceType7Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType7Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType7Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType7Cd_matrix,var_ranef_RaceHorse.PrevRaceType7Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType7Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType7Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType7Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType7Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType7Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType7Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd[col])
				var_ranef_RaceHorse.PrevRaceType7Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType7Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType7Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType7Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType7Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType7Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType7Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType7Cd_line_when,var_ranef_RaceHorse.PrevRaceType7Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType7Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType7Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType7Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType7Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType7Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType7Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType7Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType7Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType7Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType7Cd_matrix,var_ranef_RaceHorse.PrevRaceType7Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType7Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType7Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType7Cd_matrix,var_ranef_RaceHorse.PrevRaceType7Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType7Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType7Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType7Cd_matrix,var_ranef_RaceHorse.PrevRaceType7Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType7Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType8Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType8Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd)[1]
	var_ranef_RaceHorse.PrevRaceType8Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd)[2]
	var_ranef_RaceHorse.PrevRaceType8Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType8Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType8Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType8Cd_matrix,var_ranef_RaceHorse.PrevRaceType8Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType8Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType8Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType8Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType8Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType8Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType8Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd[col])
				var_ranef_RaceHorse.PrevRaceType8Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType8Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType8Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType8Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType8Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType8Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType8Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType8Cd_line_when,var_ranef_RaceHorse.PrevRaceType8Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType8Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType8Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType8Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType8Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType8Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType8Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType8Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType8Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType8Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType8Cd_matrix,var_ranef_RaceHorse.PrevRaceType8Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType8Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType8Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType8Cd_matrix,var_ranef_RaceHorse.PrevRaceType8Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType8Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType8Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType8Cd_matrix,var_ranef_RaceHorse.PrevRaceType8Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType8Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType9Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType9Cd_dim_row<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd)[1]
	var_ranef_RaceHorse.PrevRaceType9Cd_dim_col<-dim(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd)[2]
	var_ranef_RaceHorse.PrevRaceType9Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType9Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType9Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType9Cd_matrix,var_ranef_RaceHorse.PrevRaceType9Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType9Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType9Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType9Cd, rownames(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType9Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType9Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType9Cd_line_name <- colnames(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd[col])
				var_ranef_RaceHorse.PrevRaceType9Cd_line_value <- as.character(jackpot_results_ranef$RaceHorse.PrevRaceType9Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType9Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType9Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType9Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType9Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType9Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType9Cd_line_when,var_ranef_RaceHorse.PrevRaceType9Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType9Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType9Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType9Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType9Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType9Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType9Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType9Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType9Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType9Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType9Cd_matrix,var_ranef_RaceHorse.PrevRaceType9Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType9Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType9Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType9Cd_matrix,var_ranef_RaceHorse.PrevRaceType9Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType9Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType9Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType9Cd_matrix,var_ranef_RaceHorse.PrevRaceType9Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType9Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.RaceType1Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType1Cd)[1]
	var_ranef_PrevRace.RaceType1Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType1Cd)[2]
	var_ranef_PrevRace.RaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.RaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.RaceType1Cd_matrix <- rbind(var_ranef_PrevRace.RaceType1Cd_matrix,var_ranef_PrevRace.RaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.RaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.RaceType1Cd_line_when <- paste0(const_case_when_PrevRace.RaceType1Cd, rownames(jackpot_results_ranef$PrevRace.RaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.RaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.RaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.RaceType1Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType1Cd[col])
				var_ranef_PrevRace.RaceType1Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType1Cd[row,col])
				var_ranef_PrevRace.RaceType1Cd_line_then <- paste0(var_ranef_PrevRace.RaceType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.RaceType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.RaceType1Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.RaceType1Cd_line_sql <- paste(var_ranef_PrevRace.RaceType1Cd_line_when,var_ranef_PrevRace.RaceType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.RaceType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.RaceType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.RaceType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.RaceType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.RaceType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.RaceType1Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.RaceType1Cd_row_sql <- cbind(var_ranef_PrevRace.RaceType1Cd_line_sql)
		var_ranef_PrevRace.RaceType1Cd_matrix <- rbind(var_ranef_PrevRace.RaceType1Cd_matrix,var_ranef_PrevRace.RaceType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.RaceType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.RaceType1Cd_matrix <- rbind(var_ranef_PrevRace.RaceType1Cd_matrix,var_ranef_PrevRace.RaceType1Cd_row_sql)
	
	# END
	var_ranef_PrevRace.RaceType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.RaceType1Cd_matrix <- rbind(var_ranef_PrevRace.RaceType1Cd_matrix,var_ranef_PrevRace.RaceType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.RaceType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType2Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType2Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType2Cd)[1]
	var_ranef_Race.RaceType2Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType2Cd)[2]
	var_ranef_Race.RaceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType2Cd_line_when <- paste0(const_case_when_Race.RaceType2Cd, rownames(jackpot_results_ranef$PrevRace.RaceType2Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType2Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType2Cd[col])
				var_ranef_Race.RaceType2Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType2Cd[row,col])
				var_ranef_Race.RaceType2Cd_line_then <- paste0(var_ranef_Race.RaceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType2Cd_line_sql <- paste(var_ranef_Race.RaceType2Cd_line_when,var_ranef_Race.RaceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType2Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType2Cd_row_sql <- cbind(var_ranef_Race.RaceType2Cd_line_sql)
		var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType2Cd_matrix <- rbind(var_ranef_Race.RaceType2Cd_matrix,var_ranef_Race.RaceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType3Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType3Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType3Cd)[1]
	var_ranef_Race.RaceType3Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType3Cd)[2]
	var_ranef_Race.RaceType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType3Cd_line_when <- paste0(const_case_when_Race.RaceType3Cd, rownames(jackpot_results_ranef$PrevRace.RaceType3Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType3Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType3Cd[col])
				var_ranef_Race.RaceType3Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType3Cd[row,col])
				var_ranef_Race.RaceType3Cd_line_then <- paste0(var_ranef_Race.RaceType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType3Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType3Cd_line_sql <- paste(var_ranef_Race.RaceType3Cd_line_when,var_ranef_Race.RaceType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType3Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType3Cd_row_sql <- cbind(var_ranef_Race.RaceType3Cd_line_sql)
		var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType3Cd_matrix <- rbind(var_ranef_Race.RaceType3Cd_matrix,var_ranef_Race.RaceType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType4Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType4Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType4Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType4Cd)[1]
	var_ranef_Race.RaceType4Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType4Cd)[2]
	var_ranef_Race.RaceType4Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType4Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType4Cd_line_when <- paste0(const_case_when_Race.RaceType4Cd, rownames(jackpot_results_ranef$PrevRace.RaceType4Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType4Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType4Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType4Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType4Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType4Cd[col])
				var_ranef_Race.RaceType4Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType4Cd[row,col])
				var_ranef_Race.RaceType4Cd_line_then <- paste0(var_ranef_Race.RaceType4Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType4Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType4Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType4Cd_line_sql <- paste(var_ranef_Race.RaceType4Cd_line_when,var_ranef_Race.RaceType4Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType4Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType4Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType4Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType4Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType4Cd_row_sql <- cbind(var_ranef_Race.RaceType4Cd_line_sql)
		var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType4Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType4Cd_matrix <- rbind(var_ranef_Race.RaceType4Cd_matrix,var_ranef_Race.RaceType4Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType4Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType5Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType5Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType5Cd)[1]
	var_ranef_Race.RaceType5Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType5Cd)[2]
	var_ranef_Race.RaceType5Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType5Cd_line_when <- paste0(const_case_when_Race.RaceType5Cd, rownames(jackpot_results_ranef$PrevRace.RaceType5Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType5Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType5Cd[col])
				var_ranef_Race.RaceType5Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType5Cd[row,col])
				var_ranef_Race.RaceType5Cd_line_then <- paste0(var_ranef_Race.RaceType5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType5Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType5Cd_line_sql <- paste(var_ranef_Race.RaceType5Cd_line_when,var_ranef_Race.RaceType5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType5Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType5Cd_row_sql <- cbind(var_ranef_Race.RaceType5Cd_line_sql)
		var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType5Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType5Cd_matrix <- rbind(var_ranef_Race.RaceType5Cd_matrix,var_ranef_Race.RaceType5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType6Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType6Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType6Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType6Cd)[1]
	var_ranef_Race.RaceType6Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType6Cd)[2]
	var_ranef_Race.RaceType6Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType6Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType6Cd_line_when <- paste0(const_case_when_Race.RaceType6Cd, rownames(jackpot_results_ranef$PrevRace.RaceType6Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType6Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType6Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType6Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType6Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType6Cd[col])
				var_ranef_Race.RaceType6Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType6Cd[row,col])
				var_ranef_Race.RaceType6Cd_line_then <- paste0(var_ranef_Race.RaceType6Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType6Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType6Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType6Cd_line_sql <- paste(var_ranef_Race.RaceType6Cd_line_when,var_ranef_Race.RaceType6Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType6Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType6Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType6Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType6Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType6Cd_row_sql <- cbind(var_ranef_Race.RaceType6Cd_line_sql)
		var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType6Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType6Cd_matrix <- rbind(var_ranef_Race.RaceType6Cd_matrix,var_ranef_Race.RaceType6Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType6Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType7Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType7Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType7Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType7Cd)[1]
	var_ranef_Race.RaceType7Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType7Cd)[2]
	var_ranef_Race.RaceType7Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType7Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType7Cd_line_when <- paste0(const_case_when_Race.RaceType7Cd, rownames(jackpot_results_ranef$PrevRace.RaceType7Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType7Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType7Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType7Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType7Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType7Cd[col])
				var_ranef_Race.RaceType7Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType7Cd[row,col])
				var_ranef_Race.RaceType7Cd_line_then <- paste0(var_ranef_Race.RaceType7Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType7Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType7Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType7Cd_line_sql <- paste(var_ranef_Race.RaceType7Cd_line_when,var_ranef_Race.RaceType7Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType7Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType7Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType7Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType7Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType7Cd_row_sql <- cbind(var_ranef_Race.RaceType7Cd_line_sql)
		var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType7Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType7Cd_matrix <- rbind(var_ranef_Race.RaceType7Cd_matrix,var_ranef_Race.RaceType7Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType7Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType8Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType8Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType8Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType8Cd)[1]
	var_ranef_Race.RaceType8Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType8Cd)[2]
	var_ranef_Race.RaceType8Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType8Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType8Cd_line_when <- paste0(const_case_when_Race.RaceType8Cd, rownames(jackpot_results_ranef$PrevRace.RaceType8Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType8Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType8Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType8Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType8Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType8Cd[col])
				var_ranef_Race.RaceType8Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType8Cd[row,col])
				var_ranef_Race.RaceType8Cd_line_then <- paste0(var_ranef_Race.RaceType8Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType8Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType8Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType8Cd_line_sql <- paste(var_ranef_Race.RaceType8Cd_line_when,var_ranef_Race.RaceType8Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType8Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType8Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType8Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType8Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType8Cd_row_sql <- cbind(var_ranef_Race.RaceType8Cd_line_sql)
		var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType8Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType8Cd_matrix <- rbind(var_ranef_Race.RaceType8Cd_matrix,var_ranef_Race.RaceType8Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType8Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType9Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRace.RaceType9Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType9Cd_dim_row<-dim(jackpot_results_ranef$PrevRace.RaceType9Cd)[1]
	var_ranef_Race.RaceType9Cd_dim_col<-dim(jackpot_results_ranef$PrevRace.RaceType9Cd)[2]
	var_ranef_Race.RaceType9Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType9Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType9Cd_line_when <- paste0(const_case_when_Race.RaceType9Cd, rownames(jackpot_results_ranef$PrevRace.RaceType9Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType9Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType9Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRace.RaceType9Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType9Cd_line_name <- colnames(jackpot_results_ranef$PrevRace.RaceType9Cd[col])
				var_ranef_Race.RaceType9Cd_line_value <- as.character(jackpot_results_ranef$PrevRace.RaceType9Cd[row,col])
				var_ranef_Race.RaceType9Cd_line_then <- paste0(var_ranef_Race.RaceType9Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType9Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType9Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType9Cd_line_sql <- paste(var_ranef_Race.RaceType9Cd_line_when,var_ranef_Race.RaceType9Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType9Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType9Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType9Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType9Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType9Cd_row_sql <- cbind(var_ranef_Race.RaceType9Cd_line_sql)
		var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType9Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType9Cd_matrix <- rbind(var_ranef_Race.RaceType9Cd_matrix,var_ranef_Race.RaceType9Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType9Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType1Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd)[1]
	var_ranef_PrevRaceHorse.RaceType1Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd)[2]
	var_ranef_PrevRaceHorse.RaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType1Cd_matrix,var_ranef_PrevRaceHorse.RaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType1Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType1Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType1Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd[col])
				var_ranef_PrevRaceHorse.RaceType1Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType1Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType1Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType1Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType1Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType1Cd_line_when,var_ranef_PrevRaceHorse.RaceType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType1Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType1Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType1Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType1Cd_matrix,var_ranef_PrevRaceHorse.RaceType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType1Cd_matrix,var_ranef_PrevRaceHorse.RaceType1Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType1Cd_matrix,var_ranef_PrevRaceHorse.RaceType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType2Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd)[1]
	var_ranef_PrevRaceHorse.RaceType2Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd)[2]
	var_ranef_PrevRaceHorse.RaceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType2Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType2Cd_matrix,var_ranef_PrevRaceHorse.RaceType2Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType2Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType2Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType2Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd[col])
				var_ranef_PrevRaceHorse.RaceType2Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType2Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType2Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType2Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType2Cd_line_when,var_ranef_PrevRaceHorse.RaceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType2Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType2Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType2Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType2Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType2Cd_matrix,var_ranef_PrevRaceHorse.RaceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType2Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType2Cd_matrix,var_ranef_PrevRaceHorse.RaceType2Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType2Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType2Cd_matrix,var_ranef_PrevRaceHorse.RaceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType3Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd)[1]
	var_ranef_PrevRaceHorse.RaceType3Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd)[2]
	var_ranef_PrevRaceHorse.RaceType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType3Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType3Cd_matrix,var_ranef_PrevRaceHorse.RaceType3Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType3Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType3Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType3Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd[col])
				var_ranef_PrevRaceHorse.RaceType3Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType3Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType3Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType3Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType3Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType3Cd_line_when,var_ranef_PrevRaceHorse.RaceType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType3Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType3Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType3Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType3Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType3Cd_matrix,var_ranef_PrevRaceHorse.RaceType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType3Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType3Cd_matrix,var_ranef_PrevRaceHorse.RaceType3Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType3Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType3Cd_matrix,var_ranef_PrevRaceHorse.RaceType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType4Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType4Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd)[1]
	var_ranef_PrevRaceHorse.RaceType4Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd)[2]
	var_ranef_PrevRaceHorse.RaceType4Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType4Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType4Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType4Cd_matrix,var_ranef_PrevRaceHorse.RaceType4Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType4Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType4Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType4Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType4Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType4Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType4Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd[col])
				var_ranef_PrevRaceHorse.RaceType4Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType4Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType4Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType4Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType4Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType4Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType4Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType4Cd_line_when,var_ranef_PrevRaceHorse.RaceType4Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType4Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType4Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType4Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType4Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType4Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType4Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType4Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType4Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType4Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType4Cd_matrix,var_ranef_PrevRaceHorse.RaceType4Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType4Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType4Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType4Cd_matrix,var_ranef_PrevRaceHorse.RaceType4Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType4Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType4Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType4Cd_matrix,var_ranef_PrevRaceHorse.RaceType4Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType4Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType5Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd)[1]
	var_ranef_PrevRaceHorse.RaceType5Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd)[2]
	var_ranef_PrevRaceHorse.RaceType5Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType5Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType5Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType5Cd_matrix,var_ranef_PrevRaceHorse.RaceType5Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType5Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType5Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType5Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd[col])
				var_ranef_PrevRaceHorse.RaceType5Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType5Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType5Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType5Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType5Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType5Cd_line_when,var_ranef_PrevRaceHorse.RaceType5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType5Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType5Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType5Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType5Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType5Cd_matrix,var_ranef_PrevRaceHorse.RaceType5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType5Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType5Cd_matrix,var_ranef_PrevRaceHorse.RaceType5Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType5Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType5Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType5Cd_matrix,var_ranef_PrevRaceHorse.RaceType5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType6Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType6Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd)[1]
	var_ranef_PrevRaceHorse.RaceType6Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd)[2]
	var_ranef_PrevRaceHorse.RaceType6Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType6Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType6Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType6Cd_matrix,var_ranef_PrevRaceHorse.RaceType6Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType6Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType6Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType6Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType6Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType6Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType6Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd[col])
				var_ranef_PrevRaceHorse.RaceType6Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType6Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType6Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType6Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType6Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType6Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType6Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType6Cd_line_when,var_ranef_PrevRaceHorse.RaceType6Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType6Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType6Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType6Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType6Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType6Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType6Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType6Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType6Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType6Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType6Cd_matrix,var_ranef_PrevRaceHorse.RaceType6Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType6Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType6Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType6Cd_matrix,var_ranef_PrevRaceHorse.RaceType6Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType6Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType6Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType6Cd_matrix,var_ranef_PrevRaceHorse.RaceType6Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType6Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType7Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType7Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd)[1]
	var_ranef_PrevRaceHorse.RaceType7Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd)[2]
	var_ranef_PrevRaceHorse.RaceType7Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType7Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType7Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType7Cd_matrix,var_ranef_PrevRaceHorse.RaceType7Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType7Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType7Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType7Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType7Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType7Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType7Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd[col])
				var_ranef_PrevRaceHorse.RaceType7Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType7Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType7Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType7Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType7Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType7Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType7Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType7Cd_line_when,var_ranef_PrevRaceHorse.RaceType7Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType7Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType7Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType7Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType7Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType7Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType7Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType7Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType7Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType7Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType7Cd_matrix,var_ranef_PrevRaceHorse.RaceType7Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType7Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType7Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType7Cd_matrix,var_ranef_PrevRaceHorse.RaceType7Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType7Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType7Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType7Cd_matrix,var_ranef_PrevRaceHorse.RaceType7Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType7Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType8Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType8Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd)[1]
	var_ranef_PrevRaceHorse.RaceType8Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd)[2]
	var_ranef_PrevRaceHorse.RaceType8Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType8Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType8Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType8Cd_matrix,var_ranef_PrevRaceHorse.RaceType8Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType8Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType8Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType8Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType8Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType8Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType8Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd[col])
				var_ranef_PrevRaceHorse.RaceType8Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType8Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType8Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType8Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType8Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType8Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType8Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType8Cd_line_when,var_ranef_PrevRaceHorse.RaceType8Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType8Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType8Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType8Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType8Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType8Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType8Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType8Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType8Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType8Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType8Cd_matrix,var_ranef_PrevRaceHorse.RaceType8Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType8Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType8Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType8Cd_matrix,var_ranef_PrevRaceHorse.RaceType8Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType8Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType8Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType8Cd_matrix,var_ranef_PrevRaceHorse.RaceType8Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType8Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.RaceType9Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.RaceType9Cd_dim_row<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd)[1]
	var_ranef_PrevRaceHorse.RaceType9Cd_dim_col<-dim(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd)[2]
	var_ranef_PrevRaceHorse.RaceType9Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.RaceType9Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.RaceType9Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType9Cd_matrix,var_ranef_PrevRaceHorse.RaceType9Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.RaceType9Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.RaceType9Cd_line_when <- paste0(const_case_when_PrevRaceHorse.RaceType9Cd, rownames(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.RaceType9Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.RaceType9Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.RaceType9Cd_line_name <- colnames(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd[col])
				var_ranef_PrevRaceHorse.RaceType9Cd_line_value <- as.character(jackpot_results_ranef$PrevRaceHorse.RaceType9Cd[row,col])
				var_ranef_PrevRaceHorse.RaceType9Cd_line_then <- paste0(var_ranef_PrevRaceHorse.RaceType9Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.RaceType9Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.RaceType9Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.RaceType9Cd_line_sql <- paste(var_ranef_PrevRaceHorse.RaceType9Cd_line_when,var_ranef_PrevRaceHorse.RaceType9Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.RaceType9Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.RaceType9Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.RaceType9Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.RaceType9Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.RaceType9Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.RaceType9Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.RaceType9Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.RaceType9Cd_line_sql)
		var_ranef_PrevRaceHorse.RaceType9Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType9Cd_matrix,var_ranef_PrevRaceHorse.RaceType9Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.RaceType9Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.RaceType9Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType9Cd_matrix,var_ranef_PrevRaceHorse.RaceType9Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.RaceType9Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.RaceType9Cd_matrix <- rbind(var_ranef_PrevRaceHorse.RaceType9Cd_matrix,var_ranef_PrevRaceHorse.RaceType9Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.RaceType9Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum)>0)
{
	# Initialize
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_dim_row<-dim(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum)[1]
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_dim_col<-dim(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum)[2]
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix <- NULL
	
	# CASE
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_case)
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql)
	
	for (row in 1:var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_dim_row)
	{
		# Col : WHEN
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_when <- paste0(const_case_when_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum, sprintf("%8d",as.integer(rownames(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum)[row])), const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_then <- const_case_then
		for(col in 1: var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum[col]),nomatch=0) > 0)
			{
				var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_name <- colnames(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum[col])
				var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_value <- as.character(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum[row,col])
				var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_then <- paste0(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_then,const_ope_plus,const_convert_open,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_name,const_convert_close,const_ope_multi,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_value)
			}
		}
		# Col
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql <- paste(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_when,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_intecept,const_1,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_colon,const_asterisk,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_bool_true,const_empty,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql)
		
		# Add Row
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_line_sql)
		var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql)
	}
	# ELSE NULL
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_else_null)
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql)
	
	# END
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_end)
	var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum)>0)
{
	# Initialize
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_dim_row<-dim(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum)[1]
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_dim_col<-dim(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum)[2]
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix <- NULL
	
	# CASE
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_case)
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql)
	
	for (row in 1:var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_dim_row)
	{
		# Col : WHEN
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_when <- paste0(const_case_when_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum, sprintf("%8d",as.integer(rownames(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum)[row])), const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_then <- const_case_then
		for(col in 1: var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum[col]),nomatch=0) > 0)
			{
				var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_name <- colnames(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum[col])
				var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_value <- as.character(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum[row,col])
				var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_then <- paste0(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_then,const_ope_plus,const_convert_open,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_name,const_convert_close,const_ope_multi,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_value)
			}
		}
		# Col
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql <- paste(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_when,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_intecept,const_1,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_colon,const_asterisk,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql <- gsub(const_bool_true,const_empty,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql)
		
		# Add Row
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_line_sql)
		var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql)
	}
	# ELSE NULL
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_else_null)
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql)
	
	# END
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql <- cbind(const_case_end)
	var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum)>0)
{
	# Initialize
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_dim_row<-dim(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum)[1]
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_dim_col<-dim(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum)[2]
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix <- NULL
	
	# CASE
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql <- cbind(const_case_case)
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql)
	
	for (row in 1:var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_dim_row)
	{
		# Col : WHEN
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_when <- paste0(const_case_when_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum, sprintf("%10d",as.integer(rownames(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum)[row])), const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_then <- const_case_then
		for(col in 1: var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum[col]),nomatch=0) > 0)
			{
				var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_name <- colnames(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum[col])
				var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_value <- as.character(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum[row,col])
				var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_then <- paste0(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_then,const_ope_plus,const_convert_open,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_name,const_convert_close,const_ope_multi,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_value)
			}
		}
		# Col
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql <- paste(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_when,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql <- gsub(const_intecept,const_1,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql <- gsub(const_colon,const_asterisk,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql <- gsub(const_bool_true,const_empty,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql)
		
		# Add Row
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql <- cbind(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_line_sql)
		var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql)
	}
	# ELSE NULL
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql <- cbind(const_case_else_null)
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql)
	
	# END
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql <- cbind(const_case_end)
	var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix <- rbind(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode)>0)
{
	# Initialize
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_dim_row<-dim(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode)[1]
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_dim_col<-dim(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode)[2]
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix <- NULL
	
	# CASE
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql <- cbind(const_case_case)
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix <- rbind(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql)
	
	for (row in 1:var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_dim_row)
	{
		# Col : WHEN
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_when <- paste0(const_case_when_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode, sprintf("%05d",as.integer(rownames(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode)[row])), const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_then <- const_case_then
		for(col in 1: var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode[col]),nomatch=0) > 0)
			{
				var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_name <- colnames(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode[col])
				var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_value <- as.character(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode[row,col])
				var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_then <- paste0(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_then,const_ope_plus,const_convert_open,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_name,const_convert_close,const_ope_multi,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_value)
			}
		}
		# Col
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql <- paste(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_when,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql <- gsub(const_intecept,const_1,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql <- gsub(const_colon,const_asterisk,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql <- gsub(const_bool_true,const_empty,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql)
		
		# Add Row
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql <- cbind(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_line_sql)
		var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix <- rbind(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql)
	}
	# ELSE NULL
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql <- cbind(const_case_else_null)
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix <- rbind(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql)
	
	# END
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql <- cbind(const_case_end)
	var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix <- rbind(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix)
}
#----------------------------------------------------------------------------------------------
# Write to Excel
#----------------------------------------------------------------------------------------------
# workbookオブジェクトの作成
wb <- createWorkbook(type="xlsx")

# SQL
var_sheet_sql<- createSheet(wb,sheet="SQL")
addDataFrame(var_sql_matrix,var_sheet_sql,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)

if (length(jackpot_results_fixef)>0)
{
# SQL
var_sheet_fixef <- createSheet(wb,sheet="fixef")
addDataFrame(var_fixef_matrix,var_sheet_fixef,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_ranef$Race.JyoCd)>0)
{
# SQL
var_sheet_ranef_Race.JyoCd <- createSheet(wb,sheet="Race.JyoCd")
addDataFrame(var_ranef_Race.JyoCd_matrix,var_sheet_ranef_Race.JyoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.Jyo2Cd)>0)
{
# SQL
var_sheet_ranef_Race.Jyo2Cd <- createSheet(wb,sheet="Race.Jyo2Cd")
addDataFrame(var_ranef_Race.Jyo2Cd_matrix,var_sheet_ranef_Race.Jyo2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.GradeCd)>0)
{
# SQL
var_sheet_ranef_Race.GradeCd <- createSheet(wb,sheet="Race.GradeCd")
addDataFrame(var_ranef_Race.GradeCd_matrix,var_sheet_ranef_Race.GradeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.KigoCd)>0)
{
# SQL
var_sheet_ranef_Race.KigoCd <- createSheet(wb,sheet="Race.KigoCd")
addDataFrame(var_ranef_Race.KigoCd_matrix,var_sheet_ranef_Race.KigoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.JyuryoCd)>0)
{
# SQL
var_sheet_ranef_Race.JyuryoCd <- createSheet(wb,sheet="Race.JyuryoCd")
addDataFrame(var_ranef_Race.JyuryoCd_matrix,var_sheet_ranef_Race.JyuryoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.Jyoken5Cd)>0)
{
# SQL
var_sheet_ranef_Race.Jyoken5Cd <- createSheet(wb,sheet="Race.Jyoken5Cd")
addDataFrame(var_ranef_Race.Jyoken5Cd_matrix,var_sheet_ranef_Race.Jyoken5Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.Kyori)>0)
{
# SQL
var_sheet_ranef_Race.Kyori <- createSheet(wb,sheet="Race.Kyori")
addDataFrame(var_ranef_Race.Kyori_matrix,var_sheet_ranef_Race.Kyori,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.TrackCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackCd <- createSheet(wb,sheet="Race.TrackCd")
addDataFrame(var_ranef_Race.TrackCd_matrix,var_sheet_ranef_Race.TrackCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.CourseKubunCd)>0)
{
# SQL
var_sheet_ranef_Race.CourseKubunCd <- createSheet(wb,sheet="Race.CourseKubunCd")
addDataFrame(var_ranef_Race.CourseKubunCd_matrix,var_sheet_ranef_Race.CourseKubunCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.TenkoCd)>0)
{
# SQL
var_sheet_ranef_Race.TenkoCd <- createSheet(wb,sheet="Race.TenkoCd")
addDataFrame(var_ranef_Race.TenkoCd_matrix,var_sheet_ranef_Race.TenkoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.TrackTypeCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackTypeCd <- createSheet(wb,sheet="Race.TrackTypeCd")
addDataFrame(var_ranef_Race.TrackTypeCd_matrix,var_sheet_ranef_Race.TrackTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.TrackType3Cd)>0)
{
# SQL
var_sheet_ranef_Race.TrackType3Cd <- createSheet(wb,sheet="Race.TrackType3Cd")
addDataFrame(var_ranef_Race.TrackType3Cd_matrix,var_sheet_ranef_Race.TrackType3Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.CourseTypeCd)>0)
{
# SQL
var_sheet_ranef_Race.CourseTypeCd <- createSheet(wb,sheet="Race.CourseTypeCd")
addDataFrame(var_ranef_Race.CourseTypeCd_matrix,var_sheet_ranef_Race.CourseTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.TrackConditionCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackConditionCd <- createSheet(wb,sheet="Race.TrackConditionCd")
addDataFrame(var_ranef_Race.TrackConditionCd_matrix,var_sheet_ranef_Race.TrackConditionCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.JyokenCd)>0)
{
# SQL
var_sheet_ranef_Race.JyokenCd <- createSheet(wb,sheet="Race.JyokenCd")
addDataFrame(var_ranef_Race.JyokenCd_matrix,var_sheet_ranef_Race.JyokenCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.JyokenGradeCd)>0)
{
# SQL
var_sheet_ranef_Race.JyokenGradeCd <- createSheet(wb,sheet="Race.JyokenGradeCd")
addDataFrame(var_ranef_Race.JyokenGradeCd_matrix,var_sheet_ranef_Race.JyokenGradeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.S38Avg)>0)
{
# SQL
var_sheet_ranef_Race.S38Avg <- createSheet(wb,sheet="Race.S38Avg")
addDataFrame(var_ranef_Race.S38Avg_matrix,var_sheet_ranef_Race.S38Avg,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.SmileCd)>0)
{
# SQL
var_sheet_ranef_Race.SmileCd <- createSheet(wb,sheet="Race.SmileCd")
addDataFrame(var_ranef_Race.SmileCd_matrix,var_sheet_ranef_Race.SmileCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType1Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType1Cd <- createSheet(wb,sheet="Race.RaceType1Cd")
addDataFrame(var_ranef_Race.RaceType1Cd_matrix,var_sheet_ranef_Race.RaceType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType2Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType2Cd <- createSheet(wb,sheet="Race.RaceType2Cd")
addDataFrame(var_ranef_Race.RaceType2Cd_matrix,var_sheet_ranef_Race.RaceType2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType3Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType3Cd <- createSheet(wb,sheet="Race.RaceType3Cd")
addDataFrame(var_ranef_Race.RaceType3Cd_matrix,var_sheet_ranef_Race.RaceType3Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType4Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType4Cd <- createSheet(wb,sheet="Race.RaceType4Cd")
addDataFrame(var_ranef_Race.RaceType4Cd_matrix,var_sheet_ranef_Race.RaceType4Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType5Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType5Cd <- createSheet(wb,sheet="Race.RaceType5Cd")
addDataFrame(var_ranef_Race.RaceType5Cd_matrix,var_sheet_ranef_Race.RaceType5Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType6Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType6Cd <- createSheet(wb,sheet="Race.RaceType6Cd")
addDataFrame(var_ranef_Race.RaceType6Cd_matrix,var_sheet_ranef_Race.RaceType6Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType7Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType7Cd <- createSheet(wb,sheet="Race.RaceType7Cd")
addDataFrame(var_ranef_Race.RaceType7Cd_matrix,var_sheet_ranef_Race.RaceType7Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType8Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType8Cd <- createSheet(wb,sheet="Race.RaceType8Cd")
addDataFrame(var_ranef_Race.RaceType8Cd_matrix,var_sheet_ranef_Race.RaceType8Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$Race.RaceType9Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType9Cd <- createSheet(wb,sheet="Race.RaceType9Cd")
addDataFrame(var_ranef_Race.RaceType9Cd_matrix,var_sheet_ranef_Race.RaceType9Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$RaceHorse.Futan)>0)
{
# SQL
var_sheet_ranef_RaceHorse.Futan <- createSheet(wb,sheet="RaceHorse.Futan")
addDataFrame(var_ranef_RaceHorse.Futan_matrix,var_sheet_ranef_RaceHorse.Futan,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$AnalyzeExpectedValue01Gen01TotalAnalyze)>0)
{
# SQL
var_sheet_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze <- createSheet(wb,sheet="AnalyzeExpectedValue01Gen01TotalAnalyze")
addDataFrame(var_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze.PrevHansyokuNum_matrix,var_sheet_ranef_AnalyzeExpectedValue01Gen01TotalAnalyze,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$AnalyzeExpectedValue01Gen02TotalAnalyze)>0)
{
# SQL
var_sheet_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze <- createSheet(wb,sheet="AnalyzeExpectedValue01Gen02TotalAnalyze")
addDataFrame(var_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze.PrevHansyokuNum_matrix,var_sheet_ranef_AnalyzeExpectedValue01Gen02TotalAnalyze,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$AnalyzeExpectedValue01HorseTotalAnalyze)>0)
{
# SQL
var_sheet_ranef_AnalyzeExpectedValue01HorseTotalAnalyze <- createSheet(wb,sheet="AnalyzeExpectedValue01HorseTotalAnalyze")
addDataFrame(var_ranef_AnalyzeExpectedValue01HorseTotalAnalyze.PrevKettoNum_matrix,var_sheet_ranef_AnalyzeExpectedValue01HorseTotalAnalyze,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_ranef$AnalyzeExpectedValue01JockyTotalAnalyze)>0)
{
# SQL
var_sheet_ranef_AnalyzeExpectedValue01JockyTotalAnalyze <- createSheet(wb,sheet="AnalyzeExpectedValue01JockyTotalAnalyze")
addDataFrame(var_ranef_AnalyzeExpectedValue01JockyTotalAnalyze.PrevKisyuCode_matrix,var_sheet_ranef_AnalyzeExpectedValue01JockyTotalAnalyze,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
