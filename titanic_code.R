setwd("~/Malavika/sbdsc/exercises/DW2")

titanic <- read.csv("titanic_original.csv", header = TRUE)
titanic$embarked <- as.character(titanic$embarked)
idx <- which(titanic$embarked == "")
titanic$embarked[idx] <- "S"

mean_age <- mean(titanic$age, na.rm = TRUE)
idx_na_age <- which(is.na(titanic$age))
titanic$age[idx_na_age] <- round(mean_age)

titanic$boat <- as.character(titanic$boat)
idx_na_boat <- which(titanic$boat == "")
titanic$boat[idx_na_boat] <- "None"

titanic$cabin <- as.character(titanic$cabin)
titanic$cabin[titanic$cabin == ""] <- NA
titanic <- mutate(titanic, has_cabin_number= as.numeric(!is.na(titanic$cabin)))

write.csv(titanic, file = "titanic_clean.csv")
