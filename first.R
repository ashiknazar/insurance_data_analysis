library(openxlsx)
data <- read.xlsx("insurance_data.xlsx")
View(data)

install.packages("ggplot2") 
library(ggplot2) 
# Ensure the Renewed column is treated as a factor
data$Renewed <- as.factor(data$Renewed)

# Plot with the correct grouping
ggplot(data, aes(x = Marital.Status, fill = Renewed, group = Renewed)) +
  geom_bar(position = "dodge") +
  labs(x = "Marital Status", y = "Count", fill = "Renewed") +
  theme_minimal()
#D: Divorced M: Married S: Single V: Separated  W: Widowed

