# Load necessary libraries
library(readxl)
library(ggplot2)

# Read the data from the Excel file
data <- read_excel('insurance_data.xlsx')

# Create the box plots
ggplot(data, aes(x = factor(Renewed), y = `Grouped Change in Price`)) +
  geom_boxplot() +
  labs(title = 'Box Plot of Grouped Change in Price by Renewal Status',
       x = 'Renewed',
       y = 'Grouped Change in Price') +
  scale_x_discrete(labels = c("0" = "Not Renewed", "1" = "Renewed")) +
  theme_minimal()
