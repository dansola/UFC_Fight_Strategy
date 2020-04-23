library(Boruta)

# Load Data
df <- read.csv("./data/data_tidy.csv", header = TRUE)

# Filter training data
drops <- c("fighter")
df <- df[ , !(names(df) %in% drops)]

# Get feature Imporance for each year
years <- c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019)
for (year in years) {
  # Filter by year and remove date from atributes
  df_train <- subset(df, format(as.Date(date),"%Y")==year)
  df_train <- df_train[ , !(names(df_train) %in% c("date"))]
  
  # Perform test
  boruta_output <- Boruta(Win ~ ., data=na.omit(df_train), doTrace=0, pValue = 0.05)  
  df_boruta <- attStats(boruta_output)
  
  # Sort, add attribute names, year, and rank
  df_boruta <- df_boruta[order(-df_boruta$meanImp), ]
  df_boruta <- cbind(Attribute = rownames(df_boruta), df_boruta)
  df_boruta$year <- rep(year, nrow(df_boruta))
  df_boruta$rank <- seq(1, nrow(df_boruta), 1)
  
  if (year == "2001") {
    df_final <- data.frame(df_boruta)
  } else {
    df_final <- rbind(df_final, df_boruta)
  }

}
# Write to csv
write.csv(df_final, "./data/importance2.csv", row.names = FALSE)



