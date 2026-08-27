# Yuvaintern - Week 1 Task
# Data Cleaning and Preliminary Analysis with R
# Dataset: Titanic passenger dataset

# Install packages once if required:
# install.packages(c("dplyr", "ggplot2", "tidyr"))

library(dplyr)
library(ggplot2)
library(tidyr)

# 1. Load the publicly available dataset
url <- "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
titanic <- read.csv(url, stringsAsFactors = FALSE)

# 2. Initial inspection
dim(titanic)
str(titanic)
summary(titanic)

# Missing-value count
colSums(is.na(titanic))

# Duplicate rows
sum(duplicated(titanic))

# 3. Data cleaning
# Convert categorical variables to factors
titanic$Sex <- factor(titanic$Sex)
titanic$Embarked <- factor(titanic$Embarked)

# Impute missing Age with the median
age_median <- median(titanic$Age, na.rm = TRUE)
titanic$Age[is.na(titanic$Age)] <- age_median

# Impute the two missing Embarked values with the mode
mode_embarked <- names(sort(table(titanic$Embarked), decreasing = TRUE))[1]
titanic$Embarked[is.na(titanic$Embarked)] <- mode_embarked

# Cabin has many missing values. Create a Deck variable,
# use U for unknown deck, then remove the original Cabin field.
titanic$Deck <- ifelse(is.na(titanic$Cabin), "U",
                       substr(titanic$Cabin, 1, 1))
titanic$Deck <- factor(titanic$Deck)
titanic$Cabin <- NULL

# 4. Outlier detection using the IQR rule
find_outliers <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr
  which(x < lower | x > upper)
}

fare_outliers <- find_outliers(titanic$Fare)
age_outliers <- find_outliers(titanic$Age)

length(fare_outliers)
length(age_outliers)

# Fare outliers are retained because high fares are plausible
# observations associated with premium tickets, not data-entry errors.

# 5. Normalization / standardization
titanic$Age_scaled <- as.numeric(scale(titanic$Age))
titanic$Fare_scaled <- as.numeric(scale(titanic$Fare))

# 6. Encoding categorical variables
titanic$Sex_encoded <- ifelse(titanic$Sex == "female", 0, 1)

titanic$Embarked_C <- ifelse(titanic$Embarked == "C", 1, 0)
titanic$Embarked_Q <- ifelse(titanic$Embarked == "Q", 1, 0)
titanic$Embarked_S <- ifelse(titanic$Embarked == "S", 1, 0)

# 7. Exploratory analysis
summary(titanic)

# Overall survival
table(titanic$Survived)
prop.table(table(titanic$Survived))

# Survival by sex
sex_survival <- titanic %>%
  group_by(Sex) %>%
  summarise(
    Total = n(),
    Survived = sum(Survived),
    Not_Survived = sum(Survived == 0),
    Survival_Rate = mean(Survived) * 100
  )
print(sex_survival)

# Survival by class
class_survival <- titanic %>%
  group_by(Pclass) %>%
  summarise(
    Total = n(),
    Survived = sum(Survived),
    Not_Survived = sum(Survived == 0),
    Survival_Rate = mean(Survived) * 100
  )
print(class_survival)

# Correlation matrix
numeric_vars <- titanic %>%
  select(Survived, Pclass, Age, SibSp, Parch, Fare)
cor(numeric_vars, use = "complete.obs")

# 8. Visualizations
ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 5, boundary = 0) +
  labs(title = "Age Distribution", x = "Age", y = "Count")

ggplot(titanic, aes(x = Sex, fill = factor(Survived))) +
  geom_bar() +
  labs(title = "Survival by Sex", fill = "Survived")

ggplot(titanic, aes(x = factor(Pclass), y = Fare)) +
  geom_boxplot() +
  labs(title = "Fare Distribution by Passenger Class",
       x = "Passenger Class", y = "Fare")

# 9. Final missing-value check
colSums(is.na(titanic))
