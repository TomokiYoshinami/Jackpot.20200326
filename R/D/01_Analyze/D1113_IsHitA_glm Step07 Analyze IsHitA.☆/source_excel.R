print(paste0(Sys.time(),  " --- source_excel.R Start ---"))
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
const_case_when_Race.DistanceTypeCd <- "WHEN Race.DistanceTypeCd = "
const_case_when_Race.DistanceType2Cd <- "WHEN Race.DistanceType2Cd = "
const_case_when_Race.TrackCd <- "WHEN Race.TrackCd = '"
const_case_when_Race.CourseKubunCd <- "WHEN Race.CourseKubunCd = '"
const_case_when_Race.TenkoCd <- "WHEN Race.TenkoCd = '"
const_case_when_Race.TrackTypeCd <- "WHEN Race.TrackTypeCd = '"
const_case_when_Race.TrackType3Cd <- "WHEN Race.TrackType3Cd = '"
const_case_when_Race.CourseTypeCd <- "WHEN Race.CourseTypeCd = '"
const_case_when_Race.TrackConditionCd <- "WHEN Race.TrackConditionCd = "
const_case_when_Race.JyokenCd <- "WHEN Race.JyokenCd = '"
const_case_when_Race.JyoType1Cd <- "WHEN Race.JyoType1Cd = '"
const_case_when_Race.RaceType0Cd <- "WHEN Race.RaceType0Cd = '"
const_case_when_Race.RaceType1Cd <- "WHEN Race.RaceType1Cd = '"
const_case_when_RaceHorse.Futan <- "WHEN RaceHorse.Futan = "
const_case_when_RaceHorse.JyokenCd <- "WHEN RaceHorse.JyokenCd = '"
const_case_when_RaceHorse.PrevJyoType1Cd <- "WHEN RaceHorse.PrevJyoType1Cd = '"
const_case_when_RaceHorse.PrevRaceType0Cd <- "WHEN RaceHorse.PrevRaceType0Cd = '"
const_case_when_RaceHorse.PrevRaceType1Cd <- "WHEN RaceHorse.PrevRaceType1Cd = '"

const_case_when_PrevRace.JyoCd <- "WHEN PrevRace.JyoCd = '"
const_case_when_PrevRace.Jyo2Cd <- "WHEN PrevRace.Jyo2Cd = '"
const_case_when_PrevRace.GradeCd <- "WHEN PrevRace.GradeCd = '"
const_case_when_PrevRace.SyubetuCd <- "WHEN PrevRace.SyubetuCd = '"
const_case_when_PrevRace.KigoCd <- "WHEN PrevRace.KigoCd = '"
const_case_when_PrevRace.JyuryoCd <- "WHEN PrevRace.JyuryoCd = '"
const_case_when_PrevRace.Jyoken5Cd <- "WHEN PrevRace.Jyoken5Cd = '"
const_case_when_PrevRace.Kyori <- "WHEN PrevRace.Kyori = "
const_case_when_PrevRace.DistanceTypeCd <- "WHEN PrevRace.DistanceTypeCd = "
const_case_when_PrevRace.DistanceType2Cd <- "WHEN PrevRace.DistanceType2Cd = "
const_case_when_PrevRace.TrackCd <- "WHEN PrevRace.TrackCd = '"
const_case_when_PrevRace.CourseKubunCd <- "WHEN PrevRace.CourseKubunCd = '"
const_case_when_PrevRace.TenkoCd <- "WHEN PrevRace.TenkoCd = '"
const_case_when_PrevRace.TrackTypeCd <- "WHEN PrevRace.TrackTypeCd = '"
const_case_when_PrevRace.TrackType3Cd <- "WHEN PrevRace.TrackType3Cd = '"
const_case_when_PrevRace.CourseTypeCd <- "WHEN PrevRace.CourseTypeCd = '"
const_case_when_PrevRace.TrackConditionCd <- "WHEN PrevRace.TrackConditionCd = "
const_case_when_PrevRace.JyokenCd <- "WHEN PrevRace.JyokenCd = '"
const_case_when_PrevRace.JyoType1Cd <- "WHEN PrevRace.JyoType1Cd = '"
const_case_when_PrevRace.RaceType0Cd <- "WHEN PrevRace.RaceType0Cd = '"
const_case_when_PrevRace.RaceType1Cd <- "WHEN PrevRace.RaceType1Cd = '"
const_case_when_PrevRaceHorse.Futan <- "WHEN PrevRaceHorse.Futan = "
const_case_when_PrevRaceHorse.JyokenCd <- "WHEN PrevRaceHorse.JyokenCd = '"
const_case_when_PrevRaceHorse.PrevJyoType1Cd <- "WHEN PrevRaceHorse.PrevJyoType1Cd = '"
const_case_when_PrevRaceHorse.PrevRaceType0Cd <- "WHEN PrevRaceHorse.PrevRaceType0Cd = '"
const_case_when_PrevRaceHorse.PrevRaceType1Cd <- "WHEN PrevRaceHorse.PrevRaceType1Cd = '"

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
if (length(jackpot_results_glmer_fixef)>0)
{
	# Initialize
	var_fixef_matrix <- NULL
	
	# fixefの変数名を抽出し、配列に代入
	var_fixef_length<-length(jackpot_results_glmer_fixef)
	
	# THEN
	var_fixef_line_sql <- const_case_then_1st
	
	for(col in 1: var_fixef_length)
	{
		# if (match(const_wild_card_Intecept,names(jackpot_results_glmer_fixef[col]),nomatch=0) > 0)
		{
			var_fixef_line_name <- names(jackpot_results_glmer_fixef[col])
			var_fixef_line_value <- jackpot_results_glmer_fixef[col]
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
if (length(jackpot_results_glmer_ranef$Race.JyoCd)>0)
{
	# Initialize
	var_ranef_Race.JyoCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.JyoCd)[1]
	var_ranef_Race.JyoCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.JyoCd)[2]
	var_ranef_Race.JyoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyoCd_matrix <- rbind(var_ranef_Race.JyoCd_matrix,var_ranef_Race.JyoCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyoCd_line_when <- paste0(const_case_when_Race.JyoCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$Race.JyoCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.JyoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyoCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.JyoCd[col])
				var_ranef_Race.JyoCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.JyoCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.Jyo2Cd)>0)
{
	# Initialize
	var_ranef_Race.Jyo2Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.Jyo2Cd)[1]
	var_ranef_Race.Jyo2Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.Jyo2Cd)[2]
	var_ranef_Race.Jyo2Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.Jyo2Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.Jyo2Cd_matrix <- rbind(var_ranef_Race.Jyo2Cd_matrix,var_ranef_Race.Jyo2Cd_row_sql)
	
	for (row in 1:var_ranef_Race.Jyo2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Jyo2Cd_line_when <- paste0(const_case_when_Race.Jyo2Cd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$Race.Jyo2Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.Jyo2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Jyo2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.Jyo2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Jyo2Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.Jyo2Cd[col])
				var_ranef_Race.Jyo2Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.Jyo2Cd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.GradeCd)>0)
{
	# Initialize
	var_ranef_Race.GradeCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.GradeCd)[1]
	var_ranef_Race.GradeCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.GradeCd)[2]
	var_ranef_Race.GradeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.GradeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.GradeCd_matrix <- rbind(var_ranef_Race.GradeCd_matrix,var_ranef_Race.GradeCd_row_sql)
	
	for (row in 1:var_ranef_Race.GradeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.GradeCd_line_when <- paste0(const_case_when_Race.GradeCd, rownames(jackpot_results_glmer_ranef$Race.GradeCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.GradeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.GradeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.GradeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.GradeCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.GradeCd[col])
				var_ranef_Race.GradeCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.GradeCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.SyubetuCd)>0)
{
	# Initialize
	var_ranef_Race.SyubetuCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.SyubetuCd)[1]
	var_ranef_Race.SyubetuCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.SyubetuCd)[2]
	var_ranef_Race.SyubetuCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.SyubetuCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.SyubetuCd_matrix <- rbind(var_ranef_Race.SyubetuCd_matrix,var_ranef_Race.SyubetuCd_row_sql)
	
	for (row in 1:var_ranef_Race.SyubetuCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.SyubetuCd_line_when <- paste0(const_case_when_Race.SyubetuCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$Race.SyubetuCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.SyubetuCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.SyubetuCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.SyubetuCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.SyubetuCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.SyubetuCd[col])
				var_ranef_Race.SyubetuCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.SyubetuCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.KigoCd)>0)
{
	# Initialize
	var_ranef_Race.KigoCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.KigoCd)[1]
	var_ranef_Race.KigoCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.KigoCd)[2]
	var_ranef_Race.KigoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.KigoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.KigoCd_matrix <- rbind(var_ranef_Race.KigoCd_matrix,var_ranef_Race.KigoCd_row_sql)
	
	for (row in 1:var_ranef_Race.KigoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.KigoCd_line_when <- paste0(const_case_when_Race.KigoCd, rownames(jackpot_results_glmer_ranef$Race.KigoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.KigoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.KigoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.KigoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.KigoCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.KigoCd[col])
				var_ranef_Race.KigoCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.KigoCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.JyuryoCd)>0)
{
	# Initialize
	var_ranef_Race.JyuryoCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.JyuryoCd)[1]
	var_ranef_Race.JyuryoCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.JyuryoCd)[2]
	var_ranef_Race.JyuryoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyuryoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyuryoCd_matrix <- rbind(var_ranef_Race.JyuryoCd_matrix,var_ranef_Race.JyuryoCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyuryoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyuryoCd_line_when <- paste0(const_case_when_Race.JyuryoCd, rownames(jackpot_results_glmer_ranef$Race.JyuryoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyuryoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyuryoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.JyuryoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyuryoCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.JyuryoCd[col])
				var_ranef_Race.JyuryoCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.JyuryoCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.Jyoken5Cd)>0)
{
	# Initialize
	var_ranef_Race.Jyoken5Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.Jyoken5Cd)[1]
	var_ranef_Race.Jyoken5Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.Jyoken5Cd)[2]
	var_ranef_Race.Jyoken5Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.Jyoken5Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.Jyoken5Cd_matrix <- rbind(var_ranef_Race.Jyoken5Cd_matrix,var_ranef_Race.Jyoken5Cd_row_sql)
	
	for (row in 1:var_ranef_Race.Jyoken5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Jyoken5Cd_line_when <- paste0(const_case_when_Race.Jyoken5Cd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$Race.Jyoken5Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.Jyoken5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Jyoken5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.Jyoken5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Jyoken5Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.Jyoken5Cd[col])
				var_ranef_Race.Jyoken5Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.Jyoken5Cd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.Kyori)>0)
{
	# Initialize
	var_ranef_Race.Kyori_dim_row<-dim(jackpot_results_glmer_ranef$Race.Kyori)[1]
	var_ranef_Race.Kyori_dim_col<-dim(jackpot_results_glmer_ranef$Race.Kyori)[2]
	var_ranef_Race.Kyori_matrix <- NULL
	
	# CASE
	var_ranef_Race.Kyori_row_sql <- cbind(const_case_case)
	var_ranef_Race.Kyori_matrix <- rbind(var_ranef_Race.Kyori_matrix,var_ranef_Race.Kyori_row_sql)
	
	for (row in 1:var_ranef_Race.Kyori_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.Kyori_line_when <- paste0(const_case_when_Race.Kyori, rownames(jackpot_results_glmer_ranef$Race.Kyori)[row])
		
		# Col : THEN
		var_ranef_Race.Kyori_line_then <- const_case_then
		for(col in 1: var_ranef_Race.Kyori_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.Kyori[col]),nomatch=0) > 0)
			{
				var_ranef_Race.Kyori_line_name <- colnames(jackpot_results_glmer_ranef$Race.Kyori[col])
				var_ranef_Race.Kyori_line_value <- as.character(jackpot_results_glmer_ranef$Race.Kyori[row,col])
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
# Random Effects (Race.DistanceTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.DistanceTypeCd)>0)
{
	# Initialize
	var_ranef_Race.DistanceTypeCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.DistanceTypeCd)[1]
	var_ranef_Race.DistanceTypeCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.DistanceTypeCd)[2]
	var_ranef_Race.DistanceTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.DistanceTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.DistanceTypeCd_matrix <- rbind(var_ranef_Race.DistanceTypeCd_matrix,var_ranef_Race.DistanceTypeCd_row_sql)
	
	for (row in 1:var_ranef_Race.DistanceTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.DistanceTypeCd_line_when <- paste0(const_case_when_Race.DistanceTypeCd, rownames(jackpot_results_glmer_ranef$Race.DistanceTypeCd)[row])
		
		# Col : THEN
		var_ranef_Race.DistanceTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.DistanceTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.DistanceTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.DistanceTypeCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.DistanceTypeCd[col])
				var_ranef_Race.DistanceTypeCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.DistanceTypeCd[row,col])
				var_ranef_Race.DistanceTypeCd_line_then <- paste0(var_ranef_Race.DistanceTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.DistanceTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.DistanceTypeCd_line_value)
			}
		}
		# Col
		var_ranef_Race.DistanceTypeCd_line_sql <- paste(var_ranef_Race.DistanceTypeCd_line_when,var_ranef_Race.DistanceTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.DistanceTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.DistanceTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.DistanceTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.DistanceTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.DistanceTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.DistanceTypeCd_line_sql)
		
		# Add Row
		var_ranef_Race.DistanceTypeCd_row_sql <- cbind(var_ranef_Race.DistanceTypeCd_line_sql)
		var_ranef_Race.DistanceTypeCd_matrix <- rbind(var_ranef_Race.DistanceTypeCd_matrix,var_ranef_Race.DistanceTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.DistanceTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.DistanceTypeCd_matrix <- rbind(var_ranef_Race.DistanceTypeCd_matrix,var_ranef_Race.DistanceTypeCd_row_sql)
	
	# END
	var_ranef_Race.DistanceTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_Race.DistanceTypeCd_matrix <- rbind(var_ranef_Race.DistanceTypeCd_matrix,var_ranef_Race.DistanceTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.DistanceTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.DistanceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.DistanceType2Cd)>0)
{
	# Initialize
	var_ranef_Race.DistanceType2Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.DistanceType2Cd)[1]
	var_ranef_Race.DistanceType2Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.DistanceType2Cd)[2]
	var_ranef_Race.DistanceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.DistanceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.DistanceType2Cd_matrix <- rbind(var_ranef_Race.DistanceType2Cd_matrix,var_ranef_Race.DistanceType2Cd_row_sql)
	
	for (row in 1:var_ranef_Race.DistanceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.DistanceType2Cd_line_when <- paste0(const_case_when_Race.DistanceType2Cd, rownames(jackpot_results_glmer_ranef$Race.DistanceType2Cd)[row])
		
		# Col : THEN
		var_ranef_Race.DistanceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.DistanceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.DistanceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.DistanceType2Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.DistanceType2Cd[col])
				var_ranef_Race.DistanceType2Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.DistanceType2Cd[row,col])
				var_ranef_Race.DistanceType2Cd_line_then <- paste0(var_ranef_Race.DistanceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.DistanceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.DistanceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.DistanceType2Cd_line_sql <- paste(var_ranef_Race.DistanceType2Cd_line_when,var_ranef_Race.DistanceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.DistanceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.DistanceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.DistanceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.DistanceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.DistanceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.DistanceType2Cd_line_sql)
		
		# Add Row
		var_ranef_Race.DistanceType2Cd_row_sql <- cbind(var_ranef_Race.DistanceType2Cd_line_sql)
		var_ranef_Race.DistanceType2Cd_matrix <- rbind(var_ranef_Race.DistanceType2Cd_matrix,var_ranef_Race.DistanceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.DistanceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.DistanceType2Cd_matrix <- rbind(var_ranef_Race.DistanceType2Cd_matrix,var_ranef_Race.DistanceType2Cd_row_sql)
	
	# END
	var_ranef_Race.DistanceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.DistanceType2Cd_matrix <- rbind(var_ranef_Race.DistanceType2Cd_matrix,var_ranef_Race.DistanceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.DistanceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.TrackCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.TrackCd)>0)
{
	# Initialize
	var_ranef_Race.TrackCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.TrackCd)[1]
	var_ranef_Race.TrackCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.TrackCd)[2]
	var_ranef_Race.TrackCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackCd_matrix <- rbind(var_ranef_Race.TrackCd_matrix,var_ranef_Race.TrackCd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackCd_line_when <- paste0(const_case_when_Race.TrackCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$Race.TrackCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.TrackCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.TrackCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.TrackCd[col])
				var_ranef_Race.TrackCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.TrackCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.CourseKubunCd)>0)
{
	# Initialize
	var_ranef_Race.CourseKubunCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.CourseKubunCd)[1]
	var_ranef_Race.CourseKubunCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.CourseKubunCd)[2]
	var_ranef_Race.CourseKubunCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.CourseKubunCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.CourseKubunCd_matrix <- rbind(var_ranef_Race.CourseKubunCd_matrix,var_ranef_Race.CourseKubunCd_row_sql)
	
	for (row in 1:var_ranef_Race.CourseKubunCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.CourseKubunCd_line_when <- paste0(const_case_when_Race.CourseKubunCd, rownames(jackpot_results_glmer_ranef$Race.CourseKubunCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.CourseKubunCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.CourseKubunCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.CourseKubunCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.CourseKubunCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.CourseKubunCd[col])
				var_ranef_Race.CourseKubunCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.CourseKubunCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.TenkoCd)>0)
{
	# Initialize
	var_ranef_Race.TenkoCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.TenkoCd)[1]
	var_ranef_Race.TenkoCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.TenkoCd)[2]
	var_ranef_Race.TenkoCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TenkoCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TenkoCd_matrix <- rbind(var_ranef_Race.TenkoCd_matrix,var_ranef_Race.TenkoCd_row_sql)
	
	for (row in 1:var_ranef_Race.TenkoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TenkoCd_line_when <- paste0(const_case_when_Race.TenkoCd, rownames(jackpot_results_glmer_ranef$Race.TenkoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.TenkoCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TenkoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.TenkoCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TenkoCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.TenkoCd[col])
				var_ranef_Race.TenkoCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.TenkoCd[row,col])
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
# Random Effects (Race.TrackType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.TrackType3Cd)>0)
{
	# Initialize
	var_ranef_Race.TrackType3Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.TrackType3Cd)[1]
	var_ranef_Race.TrackType3Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.TrackType3Cd)[2]
	var_ranef_Race.TrackType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackType3Cd_matrix <- rbind(var_ranef_Race.TrackType3Cd_matrix,var_ranef_Race.TrackType3Cd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackType3Cd_line_when <- paste0(const_case_when_Race.TrackType3Cd, rownames(jackpot_results_glmer_ranef$Race.TrackType3Cd)[row])
		
		# Col : THEN
		var_ranef_Race.TrackType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.TrackType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackType3Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.TrackType3Cd[col])
				var_ranef_Race.TrackType3Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.TrackType3Cd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.CourseTypeCd)>0)
{
	# Initialize
	var_ranef_Race.CourseTypeCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.CourseTypeCd)[1]
	var_ranef_Race.CourseTypeCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.CourseTypeCd)[2]
	var_ranef_Race.CourseTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.CourseTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.CourseTypeCd_matrix <- rbind(var_ranef_Race.CourseTypeCd_matrix,var_ranef_Race.CourseTypeCd_row_sql)
	
	for (row in 1:var_ranef_Race.CourseTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.CourseTypeCd_line_when <- paste0(const_case_when_Race.CourseTypeCd, rownames(jackpot_results_glmer_ranef$Race.CourseTypeCd)[row])
		
		# Col : THEN
		var_ranef_Race.CourseTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.CourseTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.CourseTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.CourseTypeCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.CourseTypeCd[col])
				var_ranef_Race.CourseTypeCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.CourseTypeCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.TrackConditionCd)>0)
{
	# Initialize
	var_ranef_Race.TrackConditionCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.TrackConditionCd)[1]
	var_ranef_Race.TrackConditionCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.TrackConditionCd)[2]
	var_ranef_Race.TrackConditionCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.TrackConditionCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.TrackConditionCd_matrix <- rbind(var_ranef_Race.TrackConditionCd_matrix,var_ranef_Race.TrackConditionCd_row_sql)
	
	for (row in 1:var_ranef_Race.TrackConditionCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.TrackConditionCd_line_when <- paste0(const_case_when_Race.TrackConditionCd, rownames(jackpot_results_glmer_ranef$Race.TrackConditionCd)[row])
		
		# Col : THEN
		var_ranef_Race.TrackConditionCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.TrackConditionCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.TrackConditionCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.TrackConditionCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.TrackConditionCd[col])
				var_ranef_Race.TrackConditionCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.TrackConditionCd[row,col])
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
if (length(jackpot_results_glmer_ranef$Race.JyokenCd)>0)
{
	# Initialize
	var_ranef_Race.JyokenCd_dim_row<-dim(jackpot_results_glmer_ranef$Race.JyokenCd)[1]
	var_ranef_Race.JyokenCd_dim_col<-dim(jackpot_results_glmer_ranef$Race.JyokenCd)[2]
	var_ranef_Race.JyokenCd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyokenCd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyokenCd_matrix <- rbind(var_ranef_Race.JyokenCd_matrix,var_ranef_Race.JyokenCd_row_sql)
	
	for (row in 1:var_ranef_Race.JyokenCd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyokenCd_line_when <- paste0(const_case_when_Race.JyokenCd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$Race.JyokenCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyokenCd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyokenCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.JyokenCd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyokenCd_line_name <- colnames(jackpot_results_glmer_ranef$Race.JyokenCd[col])
				var_ranef_Race.JyokenCd_line_value <- as.character(jackpot_results_glmer_ranef$Race.JyokenCd[row,col])
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
# Random Effects (Race.JyoType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.JyoType1Cd)>0)
{
	# Initialize
	var_ranef_Race.JyoType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.JyoType1Cd)[1]
	var_ranef_Race.JyoType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.JyoType1Cd)[2]
	var_ranef_Race.JyoType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.JyoType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.JyoType1Cd_matrix <- rbind(var_ranef_Race.JyoType1Cd_matrix,var_ranef_Race.JyoType1Cd_row_sql)
	
	for (row in 1:var_ranef_Race.JyoType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.JyoType1Cd_line_when <- paste0(const_case_when_Race.JyoType1Cd, rownames(jackpot_results_glmer_ranef$Race.JyoType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.JyoType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.JyoType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.JyoType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.JyoType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.JyoType1Cd[col])
				var_ranef_Race.JyoType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.JyoType1Cd[row,col])
				var_ranef_Race.JyoType1Cd_line_then <- paste0(var_ranef_Race.JyoType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.JyoType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.JyoType1Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.JyoType1Cd_line_sql <- paste(var_ranef_Race.JyoType1Cd_line_when,var_ranef_Race.JyoType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.JyoType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.JyoType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.JyoType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.JyoType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.JyoType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.JyoType1Cd_line_sql)
		
		# Add Row
		var_ranef_Race.JyoType1Cd_row_sql <- cbind(var_ranef_Race.JyoType1Cd_line_sql)
		var_ranef_Race.JyoType1Cd_matrix <- rbind(var_ranef_Race.JyoType1Cd_matrix,var_ranef_Race.JyoType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.JyoType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.JyoType1Cd_matrix <- rbind(var_ranef_Race.JyoType1Cd_matrix,var_ranef_Race.JyoType1Cd_row_sql)
	
	# END
	var_ranef_Race.JyoType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.JyoType1Cd_matrix <- rbind(var_ranef_Race.JyoType1Cd_matrix,var_ranef_Race.JyoType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.JyoType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType0Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.RaceType0Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType0Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.RaceType0Cd)[1]
	var_ranef_Race.RaceType0Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.RaceType0Cd)[2]
	var_ranef_Race.RaceType0Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType0Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType0Cd_matrix <- rbind(var_ranef_Race.RaceType0Cd_matrix,var_ranef_Race.RaceType0Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType0Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType0Cd_line_when <- paste0(const_case_when_Race.RaceType0Cd, rownames(jackpot_results_glmer_ranef$Race.RaceType0Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType0Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType0Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.RaceType0Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType0Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.RaceType0Cd[col])
				var_ranef_Race.RaceType0Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.RaceType0Cd[row,col])
				var_ranef_Race.RaceType0Cd_line_then <- paste0(var_ranef_Race.RaceType0Cd_line_then,const_ope_plus,const_convert_open,var_ranef_Race.RaceType0Cd_line_name,const_convert_close,const_ope_multi,var_ranef_Race.RaceType0Cd_line_value)
			}
		}
		# Col
		var_ranef_Race.RaceType0Cd_line_sql <- paste(var_ranef_Race.RaceType0Cd_line_when,var_ranef_Race.RaceType0Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_Race.RaceType0Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_Race.RaceType0Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_Race.RaceType0Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_Race.RaceType0Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_Race.RaceType0Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_Race.RaceType0Cd_line_sql)
		
		# Add Row
		var_ranef_Race.RaceType0Cd_row_sql <- cbind(var_ranef_Race.RaceType0Cd_line_sql)
		var_ranef_Race.RaceType0Cd_matrix <- rbind(var_ranef_Race.RaceType0Cd_matrix,var_ranef_Race.RaceType0Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_Race.RaceType0Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_Race.RaceType0Cd_matrix <- rbind(var_ranef_Race.RaceType0Cd_matrix,var_ranef_Race.RaceType0Cd_row_sql)
	
	# END
	var_ranef_Race.RaceType0Cd_row_sql <- cbind(const_case_end)
	var_ranef_Race.RaceType0Cd_matrix <- rbind(var_ranef_Race.RaceType0Cd_matrix,var_ranef_Race.RaceType0Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_Race.RaceType0Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (Race.RaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.RaceType1Cd)>0)
{
	# Initialize
	var_ranef_Race.RaceType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$Race.RaceType1Cd)[1]
	var_ranef_Race.RaceType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$Race.RaceType1Cd)[2]
	var_ranef_Race.RaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_Race.RaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_Race.RaceType1Cd_matrix <- rbind(var_ranef_Race.RaceType1Cd_matrix,var_ranef_Race.RaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_Race.RaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_Race.RaceType1Cd_line_when <- paste0(const_case_when_Race.RaceType1Cd, rownames(jackpot_results_glmer_ranef$Race.RaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_Race.RaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_Race.RaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$Race.RaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_Race.RaceType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$Race.RaceType1Cd[col])
				var_ranef_Race.RaceType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$Race.RaceType1Cd[row,col])
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
# Random Effects (RaceHorse.Futan)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$RaceHorse.Futan)>0)
{
	# Initialize
	var_ranef_RaceHorse.Futan_dim_row<-dim(jackpot_results_glmer_ranef$RaceHorse.Futan)[1]
	var_ranef_RaceHorse.Futan_dim_col<-dim(jackpot_results_glmer_ranef$RaceHorse.Futan)[2]
	var_ranef_RaceHorse.Futan_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.Futan_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.Futan_matrix <- rbind(var_ranef_RaceHorse.Futan_matrix,var_ranef_RaceHorse.Futan_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.Futan_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.Futan_line_when <- paste0(const_case_when_RaceHorse.Futan, rownames(jackpot_results_glmer_ranef$RaceHorse.Futan)[row])
		
		# Col : THEN
		var_ranef_RaceHorse.Futan_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.Futan_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$RaceHorse.Futan[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.Futan_line_name <- colnames(jackpot_results_glmer_ranef$RaceHorse.Futan[col])
				var_ranef_RaceHorse.Futan_line_value <- as.character(jackpot_results_glmer_ranef$RaceHorse.Futan[row,col])
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
# Random Effects (RaceHorse.PrevJyokenCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevJyokenCd_dim_row<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd)[1]
	var_ranef_RaceHorse.PrevJyokenCd_dim_col<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd)[2]
	var_ranef_RaceHorse.PrevJyokenCd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_RaceHorse.PrevJyokenCd_matrix,var_ranef_RaceHorse.PrevJyokenCd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevJyokenCd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevJyokenCd_line_when <- paste0(const_case_when_RaceHorse.PrevJyokenCd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevJyokenCd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevJyokenCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevJyokenCd_line_name <- colnames(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd[col])
				var_ranef_RaceHorse.PrevJyokenCd_line_value <- as.character(jackpot_results_glmer_ranef$RaceHorse.PrevJyokenCd[row,col])
				var_ranef_RaceHorse.PrevJyokenCd_line_then <- paste0(var_ranef_RaceHorse.PrevJyokenCd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevJyokenCd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevJyokenCd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevJyokenCd_line_sql <- paste(var_ranef_RaceHorse.PrevJyokenCd_line_when,var_ranef_RaceHorse.PrevJyokenCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevJyokenCd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevJyokenCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevJyokenCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevJyokenCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevJyokenCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevJyokenCd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevJyokenCd_row_sql <- cbind(var_ranef_RaceHorse.PrevJyokenCd_line_sql)
		var_ranef_RaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_RaceHorse.PrevJyokenCd_matrix,var_ranef_RaceHorse.PrevJyokenCd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_RaceHorse.PrevJyokenCd_matrix,var_ranef_RaceHorse.PrevJyokenCd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_RaceHorse.PrevJyokenCd_matrix,var_ranef_RaceHorse.PrevJyokenCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevJyokenCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevJyoType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevJyoType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd)[1]
	var_ranef_RaceHorse.PrevJyoType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd)[2]
	var_ranef_RaceHorse.PrevJyoType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevJyoType1Cd_matrix,var_ranef_RaceHorse.PrevJyoType1Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevJyoType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevJyoType1Cd_line_when <- paste0(const_case_when_RaceHorse.PrevJyoType1Cd, rownames(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevJyoType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevJyoType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevJyoType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd[col])
				var_ranef_RaceHorse.PrevJyoType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$RaceHorse.PrevJyoType1Cd[row,col])
				var_ranef_RaceHorse.PrevJyoType1Cd_line_then <- paste0(var_ranef_RaceHorse.PrevJyoType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevJyoType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevJyoType1Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevJyoType1Cd_line_sql <- paste(var_ranef_RaceHorse.PrevJyoType1Cd_line_when,var_ranef_RaceHorse.PrevJyoType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevJyoType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevJyoType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevJyoType1Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevJyoType1Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevJyoType1Cd_line_sql)
		var_ranef_RaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevJyoType1Cd_matrix,var_ranef_RaceHorse.PrevJyoType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevJyoType1Cd_matrix,var_ranef_RaceHorse.PrevJyoType1Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevJyoType1Cd_matrix,var_ranef_RaceHorse.PrevJyoType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevJyoType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType0Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType0Cd_dim_row<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd)[1]
	var_ranef_RaceHorse.PrevRaceType0Cd_dim_col<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd)[2]
	var_ranef_RaceHorse.PrevRaceType0Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType0Cd_matrix,var_ranef_RaceHorse.PrevRaceType0Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType0Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType0Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType0Cd, rownames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType0Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType0Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType0Cd_line_name <- colnames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd[col])
				var_ranef_RaceHorse.PrevRaceType0Cd_line_value <- as.character(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType0Cd[row,col])
				var_ranef_RaceHorse.PrevRaceType0Cd_line_then <- paste0(var_ranef_RaceHorse.PrevRaceType0Cd_line_then,const_ope_plus,const_convert_open,var_ranef_RaceHorse.PrevRaceType0Cd_line_name,const_convert_close,const_ope_multi,var_ranef_RaceHorse.PrevRaceType0Cd_line_value)
			}
		}
		# Col
		var_ranef_RaceHorse.PrevRaceType0Cd_line_sql <- paste(var_ranef_RaceHorse.PrevRaceType0Cd_line_when,var_ranef_RaceHorse.PrevRaceType0Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_RaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_RaceHorse.PrevRaceType0Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_RaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_RaceHorse.PrevRaceType0Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_RaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_RaceHorse.PrevRaceType0Cd_line_sql)
		
		# Add Row
		var_ranef_RaceHorse.PrevRaceType0Cd_row_sql <- cbind(var_ranef_RaceHorse.PrevRaceType0Cd_line_sql)
		var_ranef_RaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType0Cd_matrix,var_ranef_RaceHorse.PrevRaceType0Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_RaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_RaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType0Cd_matrix,var_ranef_RaceHorse.PrevRaceType0Cd_row_sql)
	
	# END
	var_ranef_RaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_end)
	var_ranef_RaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType0Cd_matrix,var_ranef_RaceHorse.PrevRaceType0Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_RaceHorse.PrevRaceType0Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (RaceHorse.PrevRaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd)>0)
{
	# Initialize
	var_ranef_RaceHorse.PrevRaceType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd)[1]
	var_ranef_RaceHorse.PrevRaceType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd)[2]
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_RaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_RaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_RaceHorse.PrevRaceType1Cd_matrix,var_ranef_RaceHorse.PrevRaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_RaceHorse.PrevRaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_RaceHorse.PrevRaceType1Cd_line_when <- paste0(const_case_when_RaceHorse.PrevRaceType1Cd, rownames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_RaceHorse.PrevRaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_RaceHorse.PrevRaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_RaceHorse.PrevRaceType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd[col])
				var_ranef_RaceHorse.PrevRaceType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$RaceHorse.PrevRaceType1Cd[row,col])
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
# Random Effects (PrevRace.JyoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.JyoCd)>0)
{
	# Initialize
	var_ranef_PrevRace.JyoCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.JyoCd)[1]
	var_ranef_PrevRace.JyoCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.JyoCd)[2]
	var_ranef_PrevRace.JyoCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.JyoCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.JyoCd_matrix <- rbind(var_ranef_PrevRace.JyoCd_matrix,var_ranef_PrevRace.JyoCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.JyoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.JyoCd_line_when <- paste0(const_case_when_PrevRace.JyoCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.JyoCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.JyoCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.JyoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.JyoCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.JyoCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.JyoCd[col])
				var_ranef_PrevRace.JyoCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.JyoCd[row,col])
				var_ranef_PrevRace.JyoCd_line_then <- paste0(var_ranef_PrevRace.JyoCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.JyoCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.JyoCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.JyoCd_line_sql <- paste(var_ranef_PrevRace.JyoCd_line_when,var_ranef_PrevRace.JyoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.JyoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.JyoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.JyoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.JyoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.JyoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.JyoCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.JyoCd_row_sql <- cbind(var_ranef_PrevRace.JyoCd_line_sql)
		var_ranef_PrevRace.JyoCd_matrix <- rbind(var_ranef_PrevRace.JyoCd_matrix,var_ranef_PrevRace.JyoCd_row_sql)
	}
	
	# ELSE NULL
	var_ranef_PrevRace.JyoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.JyoCd_matrix <- rbind(var_ranef_PrevRace.JyoCd_matrix,var_ranef_PrevRace.JyoCd_row_sql)
	
	# END
	var_ranef_PrevRace.JyoCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.JyoCd_matrix <- rbind(var_ranef_PrevRace.JyoCd_matrix,var_ranef_PrevRace.JyoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.JyoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.Jyo2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.Jyo2Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd)[1]
	var_ranef_PrevRace.Jyo2Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd)[2]
	var_ranef_PrevRace.Jyo2Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.Jyo2Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.Jyo2Cd_matrix <- rbind(var_ranef_PrevRace.Jyo2Cd_matrix,var_ranef_PrevRace.Jyo2Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.Jyo2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.Jyo2Cd_line_when <- paste0(const_case_when_PrevRace.Jyo2Cd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.Jyo2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.Jyo2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.Jyo2Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd[col])
				var_ranef_PrevRace.Jyo2Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd[row,col])
				var_ranef_PrevRace.Jyo2Cd_line_then <- paste0(var_ranef_PrevRace.Jyo2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.Jyo2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.Jyo2Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.Jyo2Cd_line_sql <- paste(var_ranef_PrevRace.Jyo2Cd_line_when,var_ranef_PrevRace.Jyo2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.Jyo2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.Jyo2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.Jyo2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.Jyo2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.Jyo2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.Jyo2Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.Jyo2Cd_row_sql <- cbind(var_ranef_PrevRace.Jyo2Cd_line_sql)
		var_ranef_PrevRace.Jyo2Cd_matrix <- rbind(var_ranef_PrevRace.Jyo2Cd_matrix,var_ranef_PrevRace.Jyo2Cd_row_sql)
	}
	
	# ELSE NULL
	var_ranef_PrevRace.Jyo2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.Jyo2Cd_matrix <- rbind(var_ranef_PrevRace.Jyo2Cd_matrix,var_ranef_PrevRace.Jyo2Cd_row_sql)
	
	# END
	var_ranef_PrevRace.Jyo2Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.Jyo2Cd_matrix <- rbind(var_ranef_PrevRace.Jyo2Cd_matrix,var_ranef_PrevRace.Jyo2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.Jyo2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.GradeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.GradeCd)>0)
{
	# Initialize
	var_ranef_PrevRace.GradeCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.GradeCd)[1]
	var_ranef_PrevRace.GradeCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.GradeCd)[2]
	var_ranef_PrevRace.GradeCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.GradeCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.GradeCd_matrix <- rbind(var_ranef_PrevRace.GradeCd_matrix,var_ranef_PrevRace.GradeCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.GradeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.GradeCd_line_when <- paste0(const_case_when_PrevRace.GradeCd, rownames(jackpot_results_glmer_ranef$PrevRace.GradeCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.GradeCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.GradeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.GradeCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.GradeCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.GradeCd[col])
				var_ranef_PrevRace.GradeCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.GradeCd[row,col])
				var_ranef_PrevRace.GradeCd_line_then <- paste0(var_ranef_PrevRace.GradeCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.GradeCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.GradeCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.GradeCd_line_sql <- paste(var_ranef_PrevRace.GradeCd_line_when,var_ranef_PrevRace.GradeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.GradeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.GradeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.GradeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.GradeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.GradeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.GradeCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.GradeCd_row_sql <- cbind(var_ranef_PrevRace.GradeCd_line_sql)
		var_ranef_PrevRace.GradeCd_matrix <- rbind(var_ranef_PrevRace.GradeCd_matrix,var_ranef_PrevRace.GradeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.GradeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.GradeCd_matrix <- rbind(var_ranef_PrevRace.GradeCd_matrix,var_ranef_PrevRace.GradeCd_row_sql)
	
	# END
	var_ranef_PrevRace.GradeCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.GradeCd_matrix <- rbind(var_ranef_PrevRace.GradeCd_matrix,var_ranef_PrevRace.GradeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.GradeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.SyubetuCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.SyubetuCd)>0)
{
	# Initialize
	var_ranef_PrevRace.SyubetuCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.SyubetuCd)[1]
	var_ranef_PrevRace.SyubetuCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.SyubetuCd)[2]
	var_ranef_PrevRace.SyubetuCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.SyubetuCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.SyubetuCd_matrix <- rbind(var_ranef_PrevRace.SyubetuCd_matrix,var_ranef_PrevRace.SyubetuCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.SyubetuCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.SyubetuCd_line_when <- paste0(const_case_when_PrevRace.SyubetuCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.SyubetuCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.SyubetuCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.SyubetuCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.SyubetuCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.SyubetuCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.SyubetuCd[col])
				var_ranef_PrevRace.SyubetuCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.SyubetuCd[row,col])
				var_ranef_PrevRace.SyubetuCd_line_then <- paste0(var_ranef_PrevRace.SyubetuCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.SyubetuCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.SyubetuCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.SyubetuCd_line_sql <- paste(var_ranef_PrevRace.SyubetuCd_line_when,var_ranef_PrevRace.SyubetuCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.SyubetuCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.SyubetuCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.SyubetuCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.SyubetuCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.SyubetuCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.SyubetuCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.SyubetuCd_row_sql <- cbind(var_ranef_PrevRace.SyubetuCd_line_sql)
		var_ranef_PrevRace.SyubetuCd_matrix <- rbind(var_ranef_PrevRace.SyubetuCd_matrix,var_ranef_PrevRace.SyubetuCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.SyubetuCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.SyubetuCd_matrix <- rbind(var_ranef_PrevRace.SyubetuCd_matrix,var_ranef_PrevRace.SyubetuCd_row_sql)
	
	# END
	var_ranef_PrevRace.SyubetuCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.SyubetuCd_matrix <- rbind(var_ranef_PrevRace.SyubetuCd_matrix,var_ranef_PrevRace.SyubetuCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.SyubetuCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.KigoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.KigoCd)>0)
{
	# Initialize
	var_ranef_PrevRace.KigoCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.KigoCd)[1]
	var_ranef_PrevRace.KigoCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.KigoCd)[2]
	var_ranef_PrevRace.KigoCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.KigoCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.KigoCd_matrix <- rbind(var_ranef_PrevRace.KigoCd_matrix,var_ranef_PrevRace.KigoCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.KigoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.KigoCd_line_when <- paste0(const_case_when_PrevRace.KigoCd, rownames(jackpot_results_glmer_ranef$PrevRace.KigoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.KigoCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.KigoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.KigoCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.KigoCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.KigoCd[col])
				var_ranef_PrevRace.KigoCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.KigoCd[row,col])
				var_ranef_PrevRace.KigoCd_line_then <- paste0(var_ranef_PrevRace.KigoCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.KigoCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.KigoCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.KigoCd_line_sql <- paste(var_ranef_PrevRace.KigoCd_line_when,var_ranef_PrevRace.KigoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.KigoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.KigoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.KigoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.KigoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.KigoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.KigoCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.KigoCd_row_sql <- cbind(var_ranef_PrevRace.KigoCd_line_sql)
		var_ranef_PrevRace.KigoCd_matrix <- rbind(var_ranef_PrevRace.KigoCd_matrix,var_ranef_PrevRace.KigoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.KigoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.KigoCd_matrix <- rbind(var_ranef_PrevRace.KigoCd_matrix,var_ranef_PrevRace.KigoCd_row_sql)
	
	# END
	var_ranef_PrevRace.KigoCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.KigoCd_matrix <- rbind(var_ranef_PrevRace.KigoCd_matrix,var_ranef_PrevRace.KigoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.KigoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.JyuryoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.JyuryoCd)>0)
{
	# Initialize
	var_ranef_PrevRace.JyuryoCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.JyuryoCd)[1]
	var_ranef_PrevRace.JyuryoCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.JyuryoCd)[2]
	var_ranef_PrevRace.JyuryoCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.JyuryoCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.JyuryoCd_matrix <- rbind(var_ranef_PrevRace.JyuryoCd_matrix,var_ranef_PrevRace.JyuryoCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.JyuryoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.JyuryoCd_line_when <- paste0(const_case_when_PrevRace.JyuryoCd, rownames(jackpot_results_glmer_ranef$PrevRace.JyuryoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.JyuryoCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.JyuryoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.JyuryoCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.JyuryoCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.JyuryoCd[col])
				var_ranef_PrevRace.JyuryoCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.JyuryoCd[row,col])
				var_ranef_PrevRace.JyuryoCd_line_then <- paste0(var_ranef_PrevRace.JyuryoCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.JyuryoCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.JyuryoCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.JyuryoCd_line_sql <- paste(var_ranef_PrevRace.JyuryoCd_line_when,var_ranef_PrevRace.JyuryoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.JyuryoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.JyuryoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.JyuryoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.JyuryoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.JyuryoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.JyuryoCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.JyuryoCd_row_sql <- cbind(var_ranef_PrevRace.JyuryoCd_line_sql)
		var_ranef_PrevRace.JyuryoCd_matrix <- rbind(var_ranef_PrevRace.JyuryoCd_matrix,var_ranef_PrevRace.JyuryoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.JyuryoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.JyuryoCd_matrix <- rbind(var_ranef_PrevRace.JyuryoCd_matrix,var_ranef_PrevRace.JyuryoCd_row_sql)
	
	# END
	var_ranef_PrevRace.JyuryoCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.JyuryoCd_matrix <- rbind(var_ranef_PrevRace.JyuryoCd_matrix,var_ranef_PrevRace.JyuryoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.JyuryoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.Jyoken5Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.Jyoken5Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd)[1]
	var_ranef_PrevRace.Jyoken5Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd)[2]
	var_ranef_PrevRace.Jyoken5Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.Jyoken5Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.Jyoken5Cd_matrix <- rbind(var_ranef_PrevRace.Jyoken5Cd_matrix,var_ranef_PrevRace.Jyoken5Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.Jyoken5Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.Jyoken5Cd_line_when <- paste0(const_case_when_PrevRace.Jyoken5Cd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.Jyoken5Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.Jyoken5Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.Jyoken5Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd[col])
				var_ranef_PrevRace.Jyoken5Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd[row,col])
				var_ranef_PrevRace.Jyoken5Cd_line_then <- paste0(var_ranef_PrevRace.Jyoken5Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.Jyoken5Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.Jyoken5Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.Jyoken5Cd_line_sql <- paste(var_ranef_PrevRace.Jyoken5Cd_line_when,var_ranef_PrevRace.Jyoken5Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.Jyoken5Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.Jyoken5Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.Jyoken5Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.Jyoken5Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.Jyoken5Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.Jyoken5Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.Jyoken5Cd_row_sql <- cbind(var_ranef_PrevRace.Jyoken5Cd_line_sql)
		var_ranef_PrevRace.Jyoken5Cd_matrix <- rbind(var_ranef_PrevRace.Jyoken5Cd_matrix,var_ranef_PrevRace.Jyoken5Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.Jyoken5Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.Jyoken5Cd_matrix <- rbind(var_ranef_PrevRace.Jyoken5Cd_matrix,var_ranef_PrevRace.Jyoken5Cd_row_sql)
	
	# END
	var_ranef_PrevRace.Jyoken5Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.Jyoken5Cd_matrix <- rbind(var_ranef_PrevRace.Jyoken5Cd_matrix,var_ranef_PrevRace.Jyoken5Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.Jyoken5Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.Kyori)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.Kyori)>0)
{
	# Initialize
	var_ranef_PrevRace.Kyori_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.Kyori)[1]
	var_ranef_PrevRace.Kyori_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.Kyori)[2]
	var_ranef_PrevRace.Kyori_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.Kyori_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.Kyori_matrix <- rbind(var_ranef_PrevRace.Kyori_matrix,var_ranef_PrevRace.Kyori_row_sql)
	
	for (row in 1:var_ranef_PrevRace.Kyori_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.Kyori_line_when <- paste0(const_case_when_PrevRace.Kyori, rownames(jackpot_results_glmer_ranef$PrevRace.Kyori)[row])
		
		# Col : THEN
		var_ranef_PrevRace.Kyori_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.Kyori_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.Kyori[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.Kyori_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.Kyori[col])
				var_ranef_PrevRace.Kyori_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.Kyori[row,col])
				var_ranef_PrevRace.Kyori_line_then <- paste0(var_ranef_PrevRace.Kyori_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.Kyori_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.Kyori_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.Kyori_line_sql <- paste(var_ranef_PrevRace.Kyori_line_when,var_ranef_PrevRace.Kyori_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.Kyori_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.Kyori_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.Kyori_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.Kyori_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.Kyori_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.Kyori_line_sql)
		
		# Add Row
		var_ranef_PrevRace.Kyori_row_sql <- cbind(var_ranef_PrevRace.Kyori_line_sql)
		var_ranef_PrevRace.Kyori_matrix <- rbind(var_ranef_PrevRace.Kyori_matrix,var_ranef_PrevRace.Kyori_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.Kyori_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.Kyori_matrix <- rbind(var_ranef_PrevRace.Kyori_matrix,var_ranef_PrevRace.Kyori_row_sql)
	
	# END
	var_ranef_PrevRace.Kyori_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.Kyori_matrix <- rbind(var_ranef_PrevRace.Kyori_matrix,var_ranef_PrevRace.Kyori_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.Kyori_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.DistanceTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd)>0)
{
	# Initialize
	var_ranef_PrevRace.DistanceTypeCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd)[1]
	var_ranef_PrevRace.DistanceTypeCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd)[2]
	var_ranef_PrevRace.DistanceTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.DistanceTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.DistanceTypeCd_matrix <- rbind(var_ranef_PrevRace.DistanceTypeCd_matrix,var_ranef_PrevRace.DistanceTypeCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.DistanceTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.DistanceTypeCd_line_when <- paste0(const_case_when_PrevRace.DistanceTypeCd, rownames(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.DistanceTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.DistanceTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.DistanceTypeCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd[col])
				var_ranef_PrevRace.DistanceTypeCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd[row,col])
				var_ranef_PrevRace.DistanceTypeCd_line_then <- paste0(var_ranef_PrevRace.DistanceTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.DistanceTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.DistanceTypeCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.DistanceTypeCd_line_sql <- paste(var_ranef_PrevRace.DistanceTypeCd_line_when,var_ranef_PrevRace.DistanceTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.DistanceTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.DistanceTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.DistanceTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.DistanceTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.DistanceTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.DistanceTypeCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.DistanceTypeCd_row_sql <- cbind(var_ranef_PrevRace.DistanceTypeCd_line_sql)
		var_ranef_PrevRace.DistanceTypeCd_matrix <- rbind(var_ranef_PrevRace.DistanceTypeCd_matrix,var_ranef_PrevRace.DistanceTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.DistanceTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.DistanceTypeCd_matrix <- rbind(var_ranef_PrevRace.DistanceTypeCd_matrix,var_ranef_PrevRace.DistanceTypeCd_row_sql)
	
	# END
	var_ranef_PrevRace.DistanceTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.DistanceTypeCd_matrix <- rbind(var_ranef_PrevRace.DistanceTypeCd_matrix,var_ranef_PrevRace.DistanceTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.DistanceTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.DistanceType2Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.DistanceType2Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd)[1]
	var_ranef_PrevRace.DistanceType2Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd)[2]
	var_ranef_PrevRace.DistanceType2Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.DistanceType2Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.DistanceType2Cd_matrix <- rbind(var_ranef_PrevRace.DistanceType2Cd_matrix,var_ranef_PrevRace.DistanceType2Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.DistanceType2Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.DistanceType2Cd_line_when <- paste0(const_case_when_PrevRace.DistanceType2Cd, rownames(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.DistanceType2Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.DistanceType2Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.DistanceType2Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd[col])
				var_ranef_PrevRace.DistanceType2Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd[row,col])
				var_ranef_PrevRace.DistanceType2Cd_line_then <- paste0(var_ranef_PrevRace.DistanceType2Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.DistanceType2Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.DistanceType2Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.DistanceType2Cd_line_sql <- paste(var_ranef_PrevRace.DistanceType2Cd_line_when,var_ranef_PrevRace.DistanceType2Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.DistanceType2Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.DistanceType2Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.DistanceType2Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.DistanceType2Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.DistanceType2Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.DistanceType2Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.DistanceType2Cd_row_sql <- cbind(var_ranef_PrevRace.DistanceType2Cd_line_sql)
		var_ranef_PrevRace.DistanceType2Cd_matrix <- rbind(var_ranef_PrevRace.DistanceType2Cd_matrix,var_ranef_PrevRace.DistanceType2Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.DistanceType2Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.DistanceType2Cd_matrix <- rbind(var_ranef_PrevRace.DistanceType2Cd_matrix,var_ranef_PrevRace.DistanceType2Cd_row_sql)
	
	# END
	var_ranef_PrevRace.DistanceType2Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.DistanceType2Cd_matrix <- rbind(var_ranef_PrevRace.DistanceType2Cd_matrix,var_ranef_PrevRace.DistanceType2Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.DistanceType2Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.TrackCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.TrackCd)>0)
{
	# Initialize
	var_ranef_PrevRace.TrackCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.TrackCd)[1]
	var_ranef_PrevRace.TrackCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.TrackCd)[2]
	var_ranef_PrevRace.TrackCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.TrackCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.TrackCd_matrix <- rbind(var_ranef_PrevRace.TrackCd_matrix,var_ranef_PrevRace.TrackCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.TrackCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.TrackCd_line_when <- paste0(const_case_when_PrevRace.TrackCd,sprintf("%02d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.TrackCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.TrackCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.TrackCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.TrackCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.TrackCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.TrackCd[col])
				var_ranef_PrevRace.TrackCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.TrackCd[row,col])
				var_ranef_PrevRace.TrackCd_line_then <- paste0(var_ranef_PrevRace.TrackCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.TrackCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.TrackCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.TrackCd_line_sql <- paste(var_ranef_PrevRace.TrackCd_line_when,var_ranef_PrevRace.TrackCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.TrackCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.TrackCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.TrackCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.TrackCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.TrackCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.TrackCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.TrackCd_row_sql <- cbind(var_ranef_PrevRace.TrackCd_line_sql)
		var_ranef_PrevRace.TrackCd_matrix <- rbind(var_ranef_PrevRace.TrackCd_matrix,var_ranef_PrevRace.TrackCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.TrackCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.TrackCd_matrix <- rbind(var_ranef_PrevRace.TrackCd_matrix,var_ranef_PrevRace.TrackCd_row_sql)
	
	# END
	var_ranef_PrevRace.TrackCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.TrackCd_matrix <- rbind(var_ranef_PrevRace.TrackCd_matrix,var_ranef_PrevRace.TrackCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.TrackCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.CourseKubunCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd)>0)
{
	# Initialize
	var_ranef_PrevRace.CourseKubunCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd)[1]
	var_ranef_PrevRace.CourseKubunCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd)[2]
	var_ranef_PrevRace.CourseKubunCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.CourseKubunCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.CourseKubunCd_matrix <- rbind(var_ranef_PrevRace.CourseKubunCd_matrix,var_ranef_PrevRace.CourseKubunCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.CourseKubunCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.CourseKubunCd_line_when <- paste0(const_case_when_PrevRace.CourseKubunCd, rownames(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.CourseKubunCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.CourseKubunCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.CourseKubunCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd[col])
				var_ranef_PrevRace.CourseKubunCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd[row,col])
				var_ranef_PrevRace.CourseKubunCd_line_then <- paste0(var_ranef_PrevRace.CourseKubunCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.CourseKubunCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.CourseKubunCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.CourseKubunCd_line_sql <- paste(var_ranef_PrevRace.CourseKubunCd_line_when,var_ranef_PrevRace.CourseKubunCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.CourseKubunCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.CourseKubunCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.CourseKubunCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.CourseKubunCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.CourseKubunCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.CourseKubunCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.CourseKubunCd_row_sql <- cbind(var_ranef_PrevRace.CourseKubunCd_line_sql)
		var_ranef_PrevRace.CourseKubunCd_matrix <- rbind(var_ranef_PrevRace.CourseKubunCd_matrix,var_ranef_PrevRace.CourseKubunCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.CourseKubunCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.CourseKubunCd_matrix <- rbind(var_ranef_PrevRace.CourseKubunCd_matrix,var_ranef_PrevRace.CourseKubunCd_row_sql)
	
	# END
	var_ranef_PrevRace.CourseKubunCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.CourseKubunCd_matrix <- rbind(var_ranef_PrevRace.CourseKubunCd_matrix,var_ranef_PrevRace.CourseKubunCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.CourseKubunCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.TenkoCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.TenkoCd)>0)
{
	# Initialize
	var_ranef_PrevRace.TenkoCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.TenkoCd)[1]
	var_ranef_PrevRace.TenkoCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.TenkoCd)[2]
	var_ranef_PrevRace.TenkoCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.TenkoCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.TenkoCd_matrix <- rbind(var_ranef_PrevRace.TenkoCd_matrix,var_ranef_PrevRace.TenkoCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.TenkoCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.TenkoCd_line_when <- paste0(const_case_when_PrevRace.TenkoCd, rownames(jackpot_results_glmer_ranef$PrevRace.TenkoCd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.TenkoCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.TenkoCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.TenkoCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.TenkoCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.TenkoCd[col])
				var_ranef_PrevRace.TenkoCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.TenkoCd[row,col])
				var_ranef_PrevRace.TenkoCd_line_then <- paste0(var_ranef_PrevRace.TenkoCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.TenkoCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.TenkoCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.TenkoCd_line_sql <- paste(var_ranef_PrevRace.TenkoCd_line_when,var_ranef_PrevRace.TenkoCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.TenkoCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.TenkoCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.TenkoCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.TenkoCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.TenkoCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.TenkoCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.TenkoCd_row_sql <- cbind(var_ranef_PrevRace.TenkoCd_line_sql)
		var_ranef_PrevRace.TenkoCd_matrix <- rbind(var_ranef_PrevRace.TenkoCd_matrix,var_ranef_PrevRace.TenkoCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.TenkoCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.TenkoCd_matrix <- rbind(var_ranef_PrevRace.TenkoCd_matrix,var_ranef_PrevRace.TenkoCd_row_sql)
	
	# END
	var_ranef_PrevRace.TenkoCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.TenkoCd_matrix <- rbind(var_ranef_PrevRace.TenkoCd_matrix,var_ranef_PrevRace.TenkoCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.TenkoCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.TrackTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd)>0)
{
	# Initialize
	var_ranef_PrevRace.TrackTypeCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd)[1]
	var_ranef_PrevRace.TrackTypeCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd)[2]
	var_ranef_PrevRace.TrackTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.TrackTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.TrackTypeCd_matrix <- rbind(var_ranef_PrevRace.TrackTypeCd_matrix,var_ranef_PrevRace.TrackTypeCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.TrackTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.TrackTypeCd_line_when <- paste0(const_case_when_PrevRace.TrackTypeCd, rownames(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.TrackTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.TrackTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.TrackTypeCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd[col])
				var_ranef_PrevRace.TrackTypeCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd[row,col])
				var_ranef_PrevRace.TrackTypeCd_line_then <- paste0(var_ranef_PrevRace.TrackTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.TrackTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.TrackTypeCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.TrackTypeCd_line_sql <- paste(var_ranef_PrevRace.TrackTypeCd_line_when,var_ranef_PrevRace.TrackTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.TrackTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.TrackTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.TrackTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.TrackTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.TrackTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.TrackTypeCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.TrackTypeCd_row_sql <- cbind(var_ranef_PrevRace.TrackTypeCd_line_sql)
		var_ranef_PrevRace.TrackTypeCd_matrix <- rbind(var_ranef_PrevRace.TrackTypeCd_matrix,var_ranef_PrevRace.TrackTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.TrackTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.TrackTypeCd_matrix <- rbind(var_ranef_PrevRace.TrackTypeCd_matrix,var_ranef_PrevRace.TrackTypeCd_row_sql)
	
	# END
	var_ranef_PrevRace.TrackTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.TrackTypeCd_matrix <- rbind(var_ranef_PrevRace.TrackTypeCd_matrix,var_ranef_PrevRace.TrackTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.TrackTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.TrackType3Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.TrackType3Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd)[1]
	var_ranef_PrevRace.TrackType3Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd)[2]
	var_ranef_PrevRace.TrackType3Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.TrackType3Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.TrackType3Cd_matrix <- rbind(var_ranef_PrevRace.TrackType3Cd_matrix,var_ranef_PrevRace.TrackType3Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.TrackType3Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.TrackType3Cd_line_when <- paste0(const_case_when_PrevRace.TrackType3Cd, rownames(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.TrackType3Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.TrackType3Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.TrackType3Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd[col])
				var_ranef_PrevRace.TrackType3Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd[row,col])
				var_ranef_PrevRace.TrackType3Cd_line_then <- paste0(var_ranef_PrevRace.TrackType3Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.TrackType3Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.TrackType3Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.TrackType3Cd_line_sql <- paste(var_ranef_PrevRace.TrackType3Cd_line_when,var_ranef_PrevRace.TrackType3Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.TrackType3Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.TrackType3Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.TrackType3Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.TrackType3Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.TrackType3Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.TrackType3Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.TrackType3Cd_row_sql <- cbind(var_ranef_PrevRace.TrackType3Cd_line_sql)
		var_ranef_PrevRace.TrackType3Cd_matrix <- rbind(var_ranef_PrevRace.TrackType3Cd_matrix,var_ranef_PrevRace.TrackType3Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.TrackType3Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.TrackType3Cd_matrix <- rbind(var_ranef_PrevRace.TrackType3Cd_matrix,var_ranef_PrevRace.TrackType3Cd_row_sql)
	
	# END
	var_ranef_PrevRace.TrackType3Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.TrackType3Cd_matrix <- rbind(var_ranef_PrevRace.TrackType3Cd_matrix,var_ranef_PrevRace.TrackType3Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.TrackType3Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.CourseTypeCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd)>0)
{
	# Initialize
	var_ranef_PrevRace.CourseTypeCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd)[1]
	var_ranef_PrevRace.CourseTypeCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd)[2]
	var_ranef_PrevRace.CourseTypeCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.CourseTypeCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.CourseTypeCd_matrix <- rbind(var_ranef_PrevRace.CourseTypeCd_matrix,var_ranef_PrevRace.CourseTypeCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.CourseTypeCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.CourseTypeCd_line_when <- paste0(const_case_when_PrevRace.CourseTypeCd, rownames(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.CourseTypeCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.CourseTypeCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.CourseTypeCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd[col])
				var_ranef_PrevRace.CourseTypeCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd[row,col])
				var_ranef_PrevRace.CourseTypeCd_line_then <- paste0(var_ranef_PrevRace.CourseTypeCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.CourseTypeCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.CourseTypeCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.CourseTypeCd_line_sql <- paste(var_ranef_PrevRace.CourseTypeCd_line_when,var_ranef_PrevRace.CourseTypeCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.CourseTypeCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.CourseTypeCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.CourseTypeCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.CourseTypeCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.CourseTypeCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.CourseTypeCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.CourseTypeCd_row_sql <- cbind(var_ranef_PrevRace.CourseTypeCd_line_sql)
		var_ranef_PrevRace.CourseTypeCd_matrix <- rbind(var_ranef_PrevRace.CourseTypeCd_matrix,var_ranef_PrevRace.CourseTypeCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.CourseTypeCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.CourseTypeCd_matrix <- rbind(var_ranef_PrevRace.CourseTypeCd_matrix,var_ranef_PrevRace.CourseTypeCd_row_sql)
	
	# END
	var_ranef_PrevRace.CourseTypeCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.CourseTypeCd_matrix <- rbind(var_ranef_PrevRace.CourseTypeCd_matrix,var_ranef_PrevRace.CourseTypeCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.CourseTypeCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.TrackConditionCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd)>0)
{
	# Initialize
	var_ranef_PrevRace.TrackConditionCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd)[1]
	var_ranef_PrevRace.TrackConditionCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd)[2]
	var_ranef_PrevRace.TrackConditionCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.TrackConditionCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.TrackConditionCd_matrix <- rbind(var_ranef_PrevRace.TrackConditionCd_matrix,var_ranef_PrevRace.TrackConditionCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.TrackConditionCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.TrackConditionCd_line_when <- paste0(const_case_when_PrevRace.TrackConditionCd, rownames(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd)[row])
		
		# Col : THEN
		var_ranef_PrevRace.TrackConditionCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.TrackConditionCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.TrackConditionCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd[col])
				var_ranef_PrevRace.TrackConditionCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd[row,col])
				var_ranef_PrevRace.TrackConditionCd_line_then <- paste0(var_ranef_PrevRace.TrackConditionCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.TrackConditionCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.TrackConditionCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.TrackConditionCd_line_sql <- paste(var_ranef_PrevRace.TrackConditionCd_line_when,var_ranef_PrevRace.TrackConditionCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.TrackConditionCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.TrackConditionCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.TrackConditionCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.TrackConditionCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.TrackConditionCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.TrackConditionCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.TrackConditionCd_row_sql <- cbind(var_ranef_PrevRace.TrackConditionCd_line_sql)
		var_ranef_PrevRace.TrackConditionCd_matrix <- rbind(var_ranef_PrevRace.TrackConditionCd_matrix,var_ranef_PrevRace.TrackConditionCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.TrackConditionCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.TrackConditionCd_matrix <- rbind(var_ranef_PrevRace.TrackConditionCd_matrix,var_ranef_PrevRace.TrackConditionCd_row_sql)
	
	# END
	var_ranef_PrevRace.TrackConditionCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.TrackConditionCd_matrix <- rbind(var_ranef_PrevRace.TrackConditionCd_matrix,var_ranef_PrevRace.TrackConditionCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.TrackConditionCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.JyokenCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.JyokenCd)>0)
{
	# Initialize
	var_ranef_PrevRace.JyokenCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.JyokenCd)[1]
	var_ranef_PrevRace.JyokenCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.JyokenCd)[2]
	var_ranef_PrevRace.JyokenCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.JyokenCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.JyokenCd_matrix <- rbind(var_ranef_PrevRace.JyokenCd_matrix,var_ranef_PrevRace.JyokenCd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.JyokenCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.JyokenCd_line_when <- paste0(const_case_when_PrevRace.JyokenCd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRace.JyokenCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.JyokenCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.JyokenCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.JyokenCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.JyokenCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.JyokenCd[col])
				var_ranef_PrevRace.JyokenCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.JyokenCd[row,col])
				var_ranef_PrevRace.JyokenCd_line_then <- paste0(var_ranef_PrevRace.JyokenCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.JyokenCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.JyokenCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.JyokenCd_line_sql <- paste(var_ranef_PrevRace.JyokenCd_line_when,var_ranef_PrevRace.JyokenCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.JyokenCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.JyokenCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.JyokenCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.JyokenCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.JyokenCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.JyokenCd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.JyokenCd_row_sql <- cbind(var_ranef_PrevRace.JyokenCd_line_sql)
		var_ranef_PrevRace.JyokenCd_matrix <- rbind(var_ranef_PrevRace.JyokenCd_matrix,var_ranef_PrevRace.JyokenCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.JyokenCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.JyokenCd_matrix <- rbind(var_ranef_PrevRace.JyokenCd_matrix,var_ranef_PrevRace.JyokenCd_row_sql)
	
	# END
	var_ranef_PrevRace.JyokenCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.JyokenCd_matrix <- rbind(var_ranef_PrevRace.JyokenCd_matrix,var_ranef_PrevRace.JyokenCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.JyokenCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.JyoType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.JyoType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd)[1]
	var_ranef_PrevRace.JyoType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd)[2]
	var_ranef_PrevRace.JyoType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.JyoType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.JyoType1Cd_matrix <- rbind(var_ranef_PrevRace.JyoType1Cd_matrix,var_ranef_PrevRace.JyoType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.JyoType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.JyoType1Cd_line_when <- paste0(const_case_when_PrevRace.JyoType1Cd, rownames(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.JyoType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.JyoType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.JyoType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd[col])
				var_ranef_PrevRace.JyoType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd[row,col])
				var_ranef_PrevRace.JyoType1Cd_line_then <- paste0(var_ranef_PrevRace.JyoType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.JyoType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.JyoType1Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.JyoType1Cd_line_sql <- paste(var_ranef_PrevRace.JyoType1Cd_line_when,var_ranef_PrevRace.JyoType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.JyoType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.JyoType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.JyoType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.JyoType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.JyoType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.JyoType1Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.JyoType1Cd_row_sql <- cbind(var_ranef_PrevRace.JyoType1Cd_line_sql)
		var_ranef_PrevRace.JyoType1Cd_matrix <- rbind(var_ranef_PrevRace.JyoType1Cd_matrix,var_ranef_PrevRace.JyoType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.JyoType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.JyoType1Cd_matrix <- rbind(var_ranef_PrevRace.JyoType1Cd_matrix,var_ranef_PrevRace.JyoType1Cd_row_sql)
	
	# END
	var_ranef_PrevRace.JyoType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.JyoType1Cd_matrix <- rbind(var_ranef_PrevRace.JyoType1Cd_matrix,var_ranef_PrevRace.JyoType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.JyoType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType0Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.RaceType0Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd)[1]
	var_ranef_PrevRace.RaceType0Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd)[2]
	var_ranef_PrevRace.RaceType0Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.RaceType0Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.RaceType0Cd_matrix <- rbind(var_ranef_PrevRace.RaceType0Cd_matrix,var_ranef_PrevRace.RaceType0Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.RaceType0Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.RaceType0Cd_line_when <- paste0(const_case_when_PrevRace.RaceType0Cd, rownames(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.RaceType0Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.RaceType0Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.RaceType0Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd[col])
				var_ranef_PrevRace.RaceType0Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd[row,col])
				var_ranef_PrevRace.RaceType0Cd_line_then <- paste0(var_ranef_PrevRace.RaceType0Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRace.RaceType0Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRace.RaceType0Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRace.RaceType0Cd_line_sql <- paste(var_ranef_PrevRace.RaceType0Cd_line_when,var_ranef_PrevRace.RaceType0Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRace.RaceType0Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRace.RaceType0Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRace.RaceType0Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRace.RaceType0Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRace.RaceType0Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRace.RaceType0Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRace.RaceType0Cd_row_sql <- cbind(var_ranef_PrevRace.RaceType0Cd_line_sql)
		var_ranef_PrevRace.RaceType0Cd_matrix <- rbind(var_ranef_PrevRace.RaceType0Cd_matrix,var_ranef_PrevRace.RaceType0Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRace.RaceType0Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRace.RaceType0Cd_matrix <- rbind(var_ranef_PrevRace.RaceType0Cd_matrix,var_ranef_PrevRace.RaceType0Cd_row_sql)
	
	# END
	var_ranef_PrevRace.RaceType0Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRace.RaceType0Cd_matrix <- rbind(var_ranef_PrevRace.RaceType0Cd_matrix,var_ranef_PrevRace.RaceType0Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRace.RaceType0Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRace.RaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRace.RaceType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd)[1]
	var_ranef_PrevRace.RaceType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd)[2]
	var_ranef_PrevRace.RaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRace.RaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRace.RaceType1Cd_matrix <- rbind(var_ranef_PrevRace.RaceType1Cd_matrix,var_ranef_PrevRace.RaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRace.RaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRace.RaceType1Cd_line_when <- paste0(const_case_when_PrevRace.RaceType1Cd, rownames(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRace.RaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRace.RaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRace.RaceType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd[col])
				var_ranef_PrevRace.RaceType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd[row,col])
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
# Random Effects (PrevRaceHorse.Futan)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.Futan)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.Futan_dim_row<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.Futan)[1]
	var_ranef_PrevRaceHorse.Futan_dim_col<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.Futan)[2]
	var_ranef_PrevRaceHorse.Futan_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.Futan_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.Futan_matrix <- rbind(var_ranef_PrevRaceHorse.Futan_matrix,var_ranef_PrevRaceHorse.Futan_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.Futan_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.Futan_line_when <- paste0(const_case_when_PrevRaceHorse.Futan, rownames(jackpot_results_glmer_ranef$PrevRaceHorse.Futan)[row])
		
		# Col : THEN
		var_ranef_PrevRaceHorse.Futan_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.Futan_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRaceHorse.Futan[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.Futan_line_name <- colnames(jackpot_results_glmer_ranef$PrevRaceHorse.Futan[col])
				var_ranef_PrevRaceHorse.Futan_line_value <- as.character(jackpot_results_glmer_ranef$PrevRaceHorse.Futan[row,col])
				var_ranef_PrevRaceHorse.Futan_line_then <- paste0(var_ranef_PrevRaceHorse.Futan_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.Futan_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.Futan_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.Futan_line_sql <- paste(var_ranef_PrevRaceHorse.Futan_line_when,var_ranef_PrevRaceHorse.Futan_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.Futan_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.Futan_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.Futan_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.Futan_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.Futan_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.Futan_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.Futan_row_sql <- cbind(var_ranef_PrevRaceHorse.Futan_line_sql)
		var_ranef_PrevRaceHorse.Futan_matrix <- rbind(var_ranef_PrevRaceHorse.Futan_matrix,var_ranef_PrevRaceHorse.Futan_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.Futan_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.Futan_matrix <- rbind(var_ranef_PrevRaceHorse.Futan_matrix,var_ranef_PrevRaceHorse.Futan_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.Futan_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.Futan_matrix <- rbind(var_ranef_PrevRaceHorse.Futan_matrix,var_ranef_PrevRaceHorse.Futan_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.Futan_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.PrevJyokenCd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.PrevJyokenCd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd)[1]
	var_ranef_PrevRaceHorse.PrevJyokenCd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd)[2]
	var_ranef_PrevRaceHorse.PrevJyokenCd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyokenCd_matrix,var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.PrevJyokenCd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_when <- paste0(const_case_when_PrevRaceHorse.PrevJyokenCd,sprintf("%03d",as.integer(rownames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd)[row])),const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.PrevJyokenCd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.PrevJyokenCd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd[col])
				var_ranef_PrevRaceHorse.PrevJyokenCd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyokenCd[row,col])
				var_ranef_PrevRaceHorse.PrevJyokenCd_line_then <- paste0(var_ranef_PrevRaceHorse.PrevJyokenCd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.PrevJyokenCd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.PrevJyokenCd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql <- paste(var_ranef_PrevRaceHorse.PrevJyokenCd_line_when,var_ranef_PrevRaceHorse.PrevJyokenCd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql <- cbind(var_ranef_PrevRaceHorse.PrevJyokenCd_line_sql)
		var_ranef_PrevRaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyokenCd_matrix,var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyokenCd_matrix,var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.PrevJyokenCd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyokenCd_matrix,var_ranef_PrevRaceHorse.PrevJyokenCd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.PrevJyokenCd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.PrevJyoType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd)[1]
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd)[2]
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix,var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.PrevJyoType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_when <- paste0(const_case_when_PrevRaceHorse.PrevJyoType1Cd, rownames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.PrevJyoType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd[col])
				var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRaceHorse.PrevJyoType1Cd[row,col])
				var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_then <- paste0(var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql <- paste(var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_when,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.PrevJyoType1Cd_line_sql)
		var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix,var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix,var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix,var_ranef_PrevRaceHorse.PrevJyoType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.PrevJyoType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.PrevRaceType0Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd)[1]
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd)[2]
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.PrevRaceType0Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_when <- paste0(const_case_when_PrevRaceHorse.PrevRaceType0Cd, rownames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.PrevRaceType0Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd[col])
				var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType0Cd[row,col])
				var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_then <- paste0(var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql <- paste(var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_when,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.PrevRaceType0Cd_line_sql)
		var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType0Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.PrevRaceType0Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Random Effects (PrevRaceHorse.PrevRaceType1Cd)
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd)>0)
{
	# Initialize
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_dim_row<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd)[1]
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_dim_col<-dim(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd)[2]
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix <- NULL
	
	# CASE
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_case)
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql)
	
	for (row in 1:var_ranef_PrevRaceHorse.PrevRaceType1Cd_dim_row)
	{
		# Col : WHEN
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_when <- paste0(const_case_when_PrevRaceHorse.PrevRaceType1Cd, rownames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd)[row], const_case_when_single_quote)
		
		# Col : THEN
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_then <- const_case_then
		for(col in 1: var_ranef_PrevRaceHorse.PrevRaceType1Cd_dim_col)
		{
			# if (match(const_wild_card_Intecept,colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd[col]),nomatch=0) > 0)
			{
				var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_name <- colnames(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd[col])
				var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_value <- as.character(jackpot_results_glmer_ranef$PrevRaceHorse.PrevRaceType1Cd[row,col])
				var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_then <- paste0(var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_then,const_ope_plus,const_convert_open,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_name,const_convert_close,const_ope_multi,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_value)
			}
		}
		# Col
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql <- paste(var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_when,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_then)
		
		# Replace (Intercept -> 1)
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_intecept,const_1,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql)
		# Replace (Colon -> Asterisk)
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_colon,const_asterisk,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql)
		# Replace (TRUE -> Empty)
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql <- gsub(const_bool_true,const_empty,var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql)
		
		# Add Row
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql <- cbind(var_ranef_PrevRaceHorse.PrevRaceType1Cd_line_sql)
		var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql)
	}
	# ELSE NULL
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_else_null)
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql)
	
	# END
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql <- cbind(const_case_end)
	var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix <- rbind(var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix,var_ranef_PrevRaceHorse.PrevRaceType1Cd_row_sql)
	
	# SQL
	var_sql_matrix <- rbind(var_sql_matrix,var_ranef_PrevRaceHorse.PrevRaceType1Cd_matrix)
}
#----------------------------------------------------------------------------------------------
# Write to Excel
#----------------------------------------------------------------------------------------------
# workbookオブジェクトの作成
wb <- createWorkbook(type="xlsx")

# SQL
var_sheet_sql<- createSheet(wb,sheet="SQL")
addDataFrame(var_sql_matrix,var_sheet_sql,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)

if (length(jackpot_results_glmer_fixef)>0)
{
# SQL
var_sheet_fixef <- createSheet(wb,sheet="fixef")
addDataFrame(var_fixef_matrix,var_sheet_fixef,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
#----------------------------------------------------------------------------------------------
if (length(jackpot_results_glmer_ranef$Race.JyoCd)>0)
{
# SQL
var_sheet_ranef_Race.JyoCd <- createSheet(wb,sheet="Race.JyoCd")
addDataFrame(var_ranef_Race.JyoCd_matrix,var_sheet_ranef_Race.JyoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.Jyo2Cd)>0)
{
# SQL
var_sheet_ranef_Race.Jyo2Cd <- createSheet(wb,sheet="Race.Jyo2Cd")
addDataFrame(var_ranef_Race.Jyo2Cd_matrix,var_sheet_ranef_Race.Jyo2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.GradeCd)>0)
{
# SQL
var_sheet_ranef_Race.GradeCd <- createSheet(wb,sheet="Race.GradeCd")
addDataFrame(var_ranef_Race.GradeCd_matrix,var_sheet_ranef_Race.GradeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.KigoCd)>0)
{
# SQL
var_sheet_ranef_Race.KigoCd <- createSheet(wb,sheet="Race.KigoCd")
addDataFrame(var_ranef_Race.KigoCd_matrix,var_sheet_ranef_Race.KigoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.JyuryoCd)>0)
{
# SQL
var_sheet_ranef_Race.JyuryoCd <- createSheet(wb,sheet="Race.JyuryoCd")
addDataFrame(var_ranef_Race.JyuryoCd_matrix,var_sheet_ranef_Race.JyuryoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.Jyoken5Cd)>0)
{
# SQL
var_sheet_ranef_Race.Jyoken5Cd <- createSheet(wb,sheet="Race.Jyoken5Cd")
addDataFrame(var_ranef_Race.Jyoken5Cd_matrix,var_sheet_ranef_Race.Jyoken5Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.Kyori)>0)
{
# SQL
var_sheet_ranef_Race.Kyori <- createSheet(wb,sheet="Race.Kyori")
addDataFrame(var_ranef_Race.Kyori_matrix,var_sheet_ranef_Race.Kyori,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.DistanceTypeCd)>0)
{
# SQL
var_sheet_ranef_Race.DistanceTypeCd <- createSheet(wb,sheet="Race.DistanceTypeCd")
addDataFrame(var_ranef_Race.DistanceTypeCd_matrix,var_sheet_ranef_Race.DistanceTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.DistanceType2Cd)>0)
{
# SQL
var_sheet_ranef_Race.DistanceType2Cd <- createSheet(wb,sheet="Race.DistanceType2Cd")
addDataFrame(var_ranef_Race.DistanceType2Cd_matrix,var_sheet_ranef_Race.DistanceType2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.TrackCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackCd <- createSheet(wb,sheet="Race.TrackCd")
addDataFrame(var_ranef_Race.TrackCd_matrix,var_sheet_ranef_Race.TrackCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.CourseKubunCd)>0)
{
# SQL
var_sheet_ranef_Race.CourseKubunCd <- createSheet(wb,sheet="Race.CourseKubunCd")
addDataFrame(var_ranef_Race.CourseKubunCd_matrix,var_sheet_ranef_Race.CourseKubunCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.TenkoCd)>0)
{
# SQL
var_sheet_ranef_Race.TenkoCd <- createSheet(wb,sheet="Race.TenkoCd")
addDataFrame(var_ranef_Race.TenkoCd_matrix,var_sheet_ranef_Race.TenkoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.TrackTypeCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackTypeCd <- createSheet(wb,sheet="Race.TrackTypeCd")
addDataFrame(var_ranef_Race.TrackTypeCd_matrix,var_sheet_ranef_Race.TrackTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.TrackType3Cd)>0)
{
# SQL
var_sheet_ranef_Race.TrackType3Cd <- createSheet(wb,sheet="Race.TrackType3Cd")
addDataFrame(var_ranef_Race.TrackType3Cd_matrix,var_sheet_ranef_Race.TrackType3Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.CourseTypeCd)>0)
{
# SQL
var_sheet_ranef_Race.CourseTypeCd <- createSheet(wb,sheet="Race.CourseTypeCd")
addDataFrame(var_ranef_Race.CourseTypeCd_matrix,var_sheet_ranef_Race.CourseTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.TrackConditionCd)>0)
{
# SQL
var_sheet_ranef_Race.TrackConditionCd <- createSheet(wb,sheet="Race.TrackConditionCd")
addDataFrame(var_ranef_Race.TrackConditionCd_matrix,var_sheet_ranef_Race.TrackConditionCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.JyokenCd)>0)
{
# SQL
var_sheet_ranef_Race.JyokenCd <- createSheet(wb,sheet="Race.JyokenCd")
addDataFrame(var_ranef_Race.JyokenCd_matrix,var_sheet_ranef_Race.JyokenCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.JyoType1Cd)>0)
{
# SQL
var_sheet_ranef_Race.JyoType1Cd <- createSheet(wb,sheet="Race.JyoType1Cd")
addDataFrame(var_ranef_Race.JyoType1Cd_matrix,var_sheet_ranef_Race.JyoType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.RaceType0Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType0Cd <- createSheet(wb,sheet="Race.RaceType0Cd")
addDataFrame(var_ranef_Race.RaceType0Cd_matrix,var_sheet_ranef_Race.RaceType0Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.RaceType1Cd)>0)
{
# SQL
var_sheet_ranef_Race.RaceType1Cd <- createSheet(wb,sheet="Race.RaceType1Cd")
addDataFrame(var_ranef_Race.RaceType1Cd_matrix,var_sheet_ranef_Race.RaceType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$RaceHorse.Futan)>0)
{
# SQL
var_sheet_ranef_RaceHorse.Futan <- createSheet(wb,sheet="RaceHorse.Futan")
addDataFrame(var_ranef_RaceHorse.Futan_matrix,var_sheet_ranef_RaceHorse.Futan,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.PrevJyokenCd)>0)
{
# SQL
var_sheet_ranef_Race.PrevJyokenCd <- createSheet(wb,sheet="Race.PrevJyokenCd")
addDataFrame(var_ranef_Race.PrevJyokenCd_matrix,var_sheet_ranef_Race.PrevJyokenCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.PrevJyoType1Cd)>0)
{
# SQL
var_sheet_ranef_Race.PrevJyoType1Cd <- createSheet(wb,sheet="Race.PrevJyoType1Cd")
addDataFrame(var_ranef_Race.PrevJyoType1Cd_matrix,var_sheet_ranef_Race.PrevJyoType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.PrevRaceType0Cd)>0)
{
# SQL
var_sheet_ranef_Race.PrevRaceType0Cd <- createSheet(wb,sheet="Race.PrevRaceType0Cd")
addDataFrame(var_ranef_Race.PrevRaceType0Cd_matrix,var_sheet_ranef_Race.PrevRaceType0Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$Race.PrevRaceType1Cd)>0)
{
# SQL
var_sheet_ranef_Race.PrevRaceType1Cd <- createSheet(wb,sheet="Race.PrevRaceType1Cd")
addDataFrame(var_ranef_Race.PrevRaceType1Cd_matrix,var_sheet_ranef_Race.PrevRaceType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.JyoCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.JyoCd <- createSheet(wb,sheet="PrevRace.JyoCd")
addDataFrame(var_ranef_PrevRace.JyoCd_matrix,var_sheet_ranef_PrevRace.JyoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.Jyo2Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.Jyo2Cd <- createSheet(wb,sheet="PrevRace.Jyo2Cd")
addDataFrame(var_ranef_PrevRace.Jyo2Cd_matrix,var_sheet_ranef_PrevRace.Jyo2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.GradeCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.GradeCd <- createSheet(wb,sheet="PrevRace.GradeCd")
addDataFrame(var_ranef_PrevRace.GradeCd_matrix,var_sheet_ranef_PrevRace.GradeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.KigoCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.KigoCd <- createSheet(wb,sheet="PrevRace.KigoCd")
addDataFrame(var_ranef_PrevRace.KigoCd_matrix,var_sheet_ranef_PrevRace.KigoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.JyuryoCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.JyuryoCd <- createSheet(wb,sheet="PrevRace.JyuryoCd")
addDataFrame(var_ranef_PrevRace.JyuryoCd_matrix,var_sheet_ranef_PrevRace.JyuryoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.Jyoken5Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.Jyoken5Cd <- createSheet(wb,sheet="PrevRace.Jyoken5Cd")
addDataFrame(var_ranef_PrevRace.Jyoken5Cd_matrix,var_sheet_ranef_PrevRace.Jyoken5Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.Kyori)>0)
{
# SQL
var_sheet_ranef_PrevRace.Kyori <- createSheet(wb,sheet="PrevRace.Kyori")
addDataFrame(var_ranef_PrevRace.Kyori_matrix,var_sheet_ranef_PrevRace.Kyori,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.DistanceTypeCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.DistanceTypeCd <- createSheet(wb,sheet="PrevRace.DistanceTypeCd")
addDataFrame(var_ranef_PrevRace.DistanceTypeCd_matrix,var_sheet_ranef_PrevRace.DistanceTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.DistanceType2Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.DistanceType2Cd <- createSheet(wb,sheet="PrevRace.DistanceType2Cd")
addDataFrame(var_ranef_PrevRace.DistanceType2Cd_matrix,var_sheet_ranef_PrevRace.DistanceType2Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.TrackCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.TrackCd <- createSheet(wb,sheet="PrevRace.TrackCd")
addDataFrame(var_ranef_PrevRace.TrackCd_matrix,var_sheet_ranef_PrevRace.TrackCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.CourseKubunCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.CourseKubunCd <- createSheet(wb,sheet="PrevRace.CourseKubunCd")
addDataFrame(var_ranef_PrevRace.CourseKubunCd_matrix,var_sheet_ranef_PrevRace.CourseKubunCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.TenkoCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.TenkoCd <- createSheet(wb,sheet="PrevRace.TenkoCd")
addDataFrame(var_ranef_PrevRace.TenkoCd_matrix,var_sheet_ranef_PrevRace.TenkoCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.TrackTypeCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.TrackTypeCd <- createSheet(wb,sheet="PrevRace.TrackTypeCd")
addDataFrame(var_ranef_PrevRace.TrackTypeCd_matrix,var_sheet_ranef_PrevRace.TrackTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.TrackType3Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.TrackType3Cd <- createSheet(wb,sheet="PrevRace.TrackType3Cd")
addDataFrame(var_ranef_PrevRace.TrackType3Cd_matrix,var_sheet_ranef_PrevRace.TrackType3Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.CourseTypeCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.CourseTypeCd <- createSheet(wb,sheet="PrevRace.CourseTypeCd")
addDataFrame(var_ranef_PrevRace.CourseTypeCd_matrix,var_sheet_ranef_PrevRace.CourseTypeCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.TrackConditionCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.TrackConditionCd <- createSheet(wb,sheet="PrevRace.TrackConditionCd")
addDataFrame(var_ranef_PrevRace.TrackConditionCd_matrix,var_sheet_ranef_PrevRace.TrackConditionCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.JyokenCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.JyokenCd <- createSheet(wb,sheet="PrevRace.JyokenCd")
addDataFrame(var_ranef_PrevRace.JyokenCd_matrix,var_sheet_ranef_PrevRace.JyokenCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.JyoType1Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.JyoType1Cd <- createSheet(wb,sheet="PrevRace.JyoType1Cd")
addDataFrame(var_ranef_PrevRace.JyoType1Cd_matrix,var_sheet_ranef_PrevRace.JyoType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.RaceType0Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.RaceType0Cd <- createSheet(wb,sheet="PrevRace.RaceType0Cd")
addDataFrame(var_ranef_PrevRace.RaceType0Cd_matrix,var_sheet_ranef_PrevRace.RaceType0Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.RaceType1Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.RaceType1Cd <- createSheet(wb,sheet="PrevRace.RaceType1Cd")
addDataFrame(var_ranef_PrevRace.RaceType1Cd_matrix,var_sheet_ranef_PrevRace.RaceType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRaceHorse.Futan)>0)
{
# SQL
var_sheet_ranef_PrevRaceHorse.Futan <- createSheet(wb,sheet="PrevRaceHorse.Futan")
addDataFrame(var_ranef_PrevRaceHorse.Futan_matrix,var_sheet_ranef_PrevRaceHorse.Futan,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.PrevJyokenCd)>0)
{
# SQL
var_sheet_ranef_PrevRace.PrevJyokenCd <- createSheet(wb,sheet="PrevRace.PrevJyokenCd")
addDataFrame(var_ranef_PrevRace.PrevJyokenCd_matrix,var_sheet_ranef_PrevRace.PrevJyokenCd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.PrevJyoType1Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.PrevJyoType1Cd <- createSheet(wb,sheet="PrevRace.PrevJyoType1Cd")
addDataFrame(var_ranef_PrevRace.PrevJyoType1Cd_matrix,var_sheet_ranef_PrevRace.PrevJyoType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.PrevRaceType0Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.PrevRaceType0Cd <- createSheet(wb,sheet="PrevRace.PrevRaceType0Cd")
addDataFrame(var_ranef_PrevRace.PrevRaceType0Cd_matrix,var_sheet_ranef_PrevRace.PrevRaceType0Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}
if (length(jackpot_results_glmer_ranef$PrevRace.PrevRaceType1Cd)>0)
{
# SQL
var_sheet_ranef_PrevRace.PrevRaceType1Cd <- createSheet(wb,sheet="PrevRace.PrevRaceType1Cd")
addDataFrame(var_ranef_PrevRace.PrevRaceType1Cd_matrix,var_sheet_ranef_PrevRace.PrevRaceType1Cd,col.names=FALSE,row.names=FALSE,startRow=1,startColumn=1)
}

print(paste0(Sys.time(),  " --- source_excel.R Finished ---"))
