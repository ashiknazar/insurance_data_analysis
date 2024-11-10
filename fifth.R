# Load necessary libraries
library(readxl)
library(ggplot2)

# Read the data from the Excel file
data <- read_excel('insurance_data.xlsx')

# Create the count plot
ggplot(data, aes(x = `Payment Method`, fill = factor(Renewed))) +
  geom_bar(position = "dodge") +
  labs(title = 'Count of Renewed by Payment Method',
       x = 'Payment Method',
       y = 'Count',
       fill = 'Renewed') +
  scale_fill_manual(values = c("lightblue", "lightgreen"), labels = c("0" = "Not Renewed", "1" = "Renewed")) +
  theme_minimal()
