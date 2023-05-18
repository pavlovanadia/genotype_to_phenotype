# The script performs a pairwise comparison of a numeric metric between groups 
# using the Wilcoxon-Mann-Whitney test, with adjustment for multiple comparisons.

library(stats)

# Set the working directory
setwd("/path/to/your/working/directory")

# Define the variables
file_name <- "constraint.csv" # Specify your dataset name
metric <- "oe_lof_upper" # Specify the metric column name
group_var <- "pleiotropy_HPO" # Specify the grouping variable column name

# Read the data from the file
data <- read.csv(file_name)

# Calculate statistical indicators
test_results <- pairwise.wilcox.test(data[[metric]], 
                                     data[[group_var]], 
                                     p.adjust.method = "bonferroni")

# Group the data according to the grouping indicators
result <- aggregate(data[[metric]], list(data[[group_var]]), function(x) {
  median_val <- median(x, na.rm = TRUE)
  Q1_val <- quantile(x, probs = 0.25, na.rm = TRUE)
  Q3_val <- quantile(x, probs = 0.75, na.rm = TRUE)
  paste0(round(median_val, 2), "(", round(Q1_val, 2), "-", round(Q3_val, 2), ")")
})

# Printing the results to console
test_results # p-values 
result # Q2(Q1-Q3)
