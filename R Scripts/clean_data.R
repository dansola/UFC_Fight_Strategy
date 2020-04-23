library(dplyr)

# Remove missing date
df <- read.csv("./data/data.csv", header = TRUE)
df <- df[complete.cases(df), ]

# Drop unrelated reatures
drops <- c("Referee", "location", "title_bout", "weight_class", "no_of_rounds", "B_current_lose_streak",
           "B_current_win_streak", "B_draw", "B_longest_win_streak", "B_losses", "B_total_rounds_fought", "B_total_time_fought.seconds.", 
           "B_total_title_bouts", "B_win_by_Decision_Majority", "B_win_by_Decision_Split", "B_win_by_Decision_Unanimous", "B_win_by_KO.TKO",
           "B_win_by_Submission", "B_win_by_TKO_Doctor_Stoppage", "B_wins", "B_Stance", "B_Height_cms", "B_Reach_cms", "B_Weight_lbs", "R_current_lose_streak",
           "R_current_win_streak", "R_draw", "R_longest_win_streak", "R_losses", "R_total_rounds_fought", "R_total_time_fought.seconds.", 
           "R_total_title_bouts", "R_win_by_Decision_Majority", "R_win_by_Decision_Split", "R_win_by_Decision_Unanimous", "R_win_by_KO.TKO",
           "R_win_by_Submission", "R_win_by_TKO_Doctor_Stoppage", "R_wins", "R_Stance", "R_Height_cms", "R_Reach_cms", "R_Weight_lbs", "B_age", "R_age")
df <- df[ , !(names(df) %in% drops)]

# Create new column names for tidyed data
new_cols <- c()
for (feat in names(df)) {
  
  if (substring(feat, 1, 2) == "R_") {
    new_cols <- c(new_cols, substring(feat, 3))
  }
}
new_cols <- c(new_cols, "date")
new_cols <- c(new_cols, "Win")

# Initialize tidy data
df_tidy <- data.frame(matrix(ncol = 51, nrow = 0))
colnames(df_tidy) <- new_cols

# Fill in rows for Blue fighters
for (j in 1:nrow(df)) {
  
  df_tidy_tmp <- data.frame(matrix(ncol = 51, nrow = 1))
  colnames(df_tidy_tmp) <- new_cols
  
  df_row <- df[j,]
  # Fill in Date
  df_tidy_tmp["date"] <- df_row["date"]
  # Fill in Winner
  if (df_row["Winner"] == "Blue") {
    df_tidy_tmp["Win"] <- 1
  } else {
    df_tidy_tmp["Win"] <- 0
  }
  
  for (i in 1:ncol(df_row)) {
    if (grepl("B_", names(df_row[i]))) {
      df_tidy_tmp[substring(names(df_row[i]), 3)] <- df_row[names(df_row[i])]
    }
  }
  
  df_tidy <- rbind(df_tidy, df_tidy_tmp)
}

# Fill in rows for Red fighters
for (j in 1:nrow(df)) {
  
  df_tidy_tmp <- data.frame(matrix(ncol = 51, nrow = 1))
  colnames(df_tidy_tmp) <- new_cols
  
  df_row <- df[j,]
  # Fill in Date
  df_tidy_tmp["date"] <- df_row["date"]
  # Fill in Winner
  if (df_row["Winner"] == "Red") {
    df_tidy_tmp["Win"] <- 1
  } else {
    df_tidy_tmp["Win"] <- 0
  }
  
  for (i in 1:ncol(df_row)) {
    if (grepl("R_", names(df_row[i]))) {
      df_tidy_tmp[substring(names(df_row[i]), 3)] <- df_row[names(df_row[i])]
    }
  }
  
  df_tidy <- rbind(df_tidy, df_tidy_tmp)
}

write.csv(df_tidy,'./data/data_tidy.csv', row.names = FALSE)


