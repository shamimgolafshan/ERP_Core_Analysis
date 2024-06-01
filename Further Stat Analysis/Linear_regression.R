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
# Fit the linear regression model(unstanderilized)
model <- lm(Avg_erp ~ Stimulus + Age + Sex + Handedness, data = data)
summary(model)

#calculate R2
# Convert factors to numeric
data$Sex <- as.numeric(as.factor(data$Sex)) - 1  #  'Male' is 0 and 'Female' is 1
data$Handedness <- as.numeric(as.factor(data$Handedness)) - 1  # 'Right' is 1 and 'Left' is 0
data$Stimulus <- as.numeric(as.factor(data$Stimulus)) - 1  #texture 0 object 1
data$Stimulus_s = scale(data$Stimulus, center = TRUE, scale = TRUE)
data$Age_s = scale(data$Age, center = TRUE, scale = TRUE)
data$Sex_s = scale(data$Sex, center = TRUE, scale = TRUE)
data$Handedness_s = scale(data$Handedness, center = TRUE, scale = TRUE)
model_s <- lm(Avg_erp ~ Stimulus_s + Age_s + Sex_s + Handedness_s, data = data) #standerilized data
summary(model_s)

# Fit the full model
full_model <- lm(Avg_erp ~ Stimulus + Age + Sex + Handedness, data = data)
full_model_r2 <- summary(full_model)$r.squared

# Fit reduced models for each predictor
# For Stimulus
reduced_model_stimulus <- lm(Avg_erp ~ Age + Sex + Handedness, data = data)
reduced_model_r2_stimulus <- summary(reduced_model_stimulus)$r.squared
sr2_stimulus <- full_model_r2 - reduced_model_r2_stimulus

# For Age
reduced_model_age <- lm(Avg_erp ~ Stimulus + Sex + Handedness, data = data)
reduced_model_r2_age <- summary(reduced_model_age)$r.squared
sr2_age <- full_model_r2 - reduced_model_r2_age

# For Sex
reduced_model_sex <- lm(Avg_erp ~ Stimulus + Age + Handedness, data = data)
reduced_model_r2_sex <- summary(reduced_model_sex)$r.squared
sr2_sex <- full_model_r2 - reduced_model_r2_sex

# For Handedness
reduced_model_handedness <- lm(Avg_erp ~ Stimulus + Age + Sex, data = data)
reduced_model_r2_handedness <- summary(reduced_model_handedness)$r.squared
sr2_handedness <- full_model_r2 - reduced_model_r2_handedness

# put sr2 values into a data frame or list for reporting
sr2_values <- list(
  Stimulus = sr2_stimulus,
  Age = sr2_age,
  Sex = sr2_sex,
  Handedness = sr2_handedness
)

print(sr2_values)


#calculate Betas

# Install neccassery packages
install.packages("lm.beta")
std_dev_Avg_erp <- sd(data$Avg_erp)
beta_Stimulus <- coefficients_scaled['Stimulus'] * std_dev_Avg_erp
beta_Sex <- coefficients_scaled['Sex'] * std_dev_Avg_erp
beta_Handedness <- coefficients_scaled['Handedness'] * std_dev_Avg_erp
library(lm.beta)
beta_Age <- coefficients_scaled['Age_scaled']

betas <- c(Intercept = coefficients_scaled['(Intercept)'],
           Stimulus = beta_Stimulus,
           Age = beta_Age,
           Sex = beta_Sex,
           Handedness = beta_Handedness)

# Print the betas
print(betas)


#Correlation matrix
# Convert factors to numeric
data$Sex <- as.numeric(as.factor(data$Sex)) - 1  #'Male' is 0 and 'Female' is 1
data$Handedness <- as.numeric(as.factor(data$Handedness)) - 1  # 'Right' is 1 and 'Left' is 0
data$Stimulus <- as.numeric(as.factor(data$Stimulus)) - 1  #texture 0 object 1
# Calculate correlation matrix including binary variables
cora_matrix <- cor(data[, sapply(data, is.numeric)])
print(cora_matrix)
