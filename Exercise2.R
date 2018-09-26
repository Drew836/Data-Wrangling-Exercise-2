library(dplyr)
library(tidyr)


data <- read.csv("titanic_original.csv")
df <- tbl_df(data)
