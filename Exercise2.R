library(dplyr)
library(tidyr)


data <- read.csv("titanic_original.csv", as.is = c("boat"))
df <- tbl_df(data)

#
# Change blank embarked variable to S
#
df[df$embarked == "","embarked"] <- "S"

#
#Change NA age variable to mean of age
#

mean.age <- round(mean(df$age, na.rm = TRUE), digits = 0)
df[is.na(df$age), "age"] <- mean.age

#
#Change lifeboat variable to None for missing values
#
df[df$boat == "", "boat"] <- "None"

#
# Add variable has_cabin_number to dataset based upon cabin variable
#
df2 <- mutate(df, has_cabin_number = ifelse(cabin != "", 1, 0))


#
# Output cleaned .csv file
#
write.csv(df2, "titanic_clean.csv")
