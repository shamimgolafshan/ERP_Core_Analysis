#running ANCOVA
# Fit the ANCOVA model
ancova_model <- aov(Avg_erp ~ Stimulus + Age + Sex + Handedness, data = data)
summary(ancova_model)