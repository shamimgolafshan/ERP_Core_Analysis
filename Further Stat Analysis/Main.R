#running Linear regression
# Load necessary library
library(readr)
library(stats)
# Loading the dataset
data <- read_csv("/Users/shamim/Desktop/Article_Stat/stat.csv")
# Checking structure of the data
str(data)
# Converting categorical variables to factors
data$Stimulus <- as.factor(data$Stimulus)
data$Sex <- as.factor(data$Sex)
data$Handedness <- as.factor(data$Handedness)
# Fit the linear regression model
model <- lm(Avg_erp ~ Stimulus + Age + Sex + Handedness, data = data)
summary(model)


#running ANCOVA
# Fit the ANCOVA model
ancova_model <- aov(Avg_erp ~ Stimulus + Age + Sex + Handedness, data = data)
summary(ancova_model)



#running mixed-effects model
install.packages("Matrix")
library(Matrix)
install.packages("lme4")
library(lme4)
# Fit the mixed-effects model
model <- lmer(Avg_erp ~ Stimulus + Age + Sex + Handedness + (1 | SubID), data = data)
summary(model)

