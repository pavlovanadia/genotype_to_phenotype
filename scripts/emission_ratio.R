# This script calculates the ratio of outliers in a dataset relative to the 
# remaining observations, and compares this ratio with the expected ratio of 1:3 

library(dplyr)

# Define the variables
file_path <- "out_count_HP_0.csv" # Specify your dataset name
count <- "gene_count" # Specify the count column name
name <- "HP" # Specify the column containing the name of objects

# Read the data from the file
df <- read.csv(file_path)
df[[count]] <- ifelse(is.na(df[[count]]), 0, df[[count]])

# Sort dataframe by 'name'
df <- df %>% arrange_at(vars(name))

# Create an empty dataframe
stat_chi <- data.frame(name = df[[name]][seq(1, nrow(df)-1, by = 2)])

# Starting the cycle
for (i in seq(1, nrow(df)-1, by = 2)) {
  observed <- c(df[[count]][i], df[[count]][i+1])
  expected <- c(sum(observed) * 0.75, sum(observed) * 0.25)
  expected <- expected / sum(expected)
  result <- chisq.test(observed, p=expected)
  stat_chi$X.squared[which(stat_chi$name == df[[name]][i])] <- result$statistic
  stat_chi$p.value[which(stat_chi$name == df[[name]][i])] <- sprintf("%.5f", result$p.value)
}

# Remove rows with NaN values
stat_chi <- na.omit(stat_chi)

# Printing the results to console
stat_chi # result table