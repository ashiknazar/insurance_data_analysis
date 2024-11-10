# Load necessary libraries
library(readxl)
library(ggplot2)

# Read the data from the Excel file
data <- read_excel('insurance_data.xlsx')

# Create the violin plot
ggplot(data, aes(x = factor(Renewed), y = `Grouped Change in Price`)) +
  geom_violin() +
  labs(title = 'Violin Plot of Grouped Change in Price by Renewal Status',
       x = 'Renewed',
       y = 'Grouped Change in Price') +
  scale_x_discrete(labels = c("0" = "Not Renewed", "1" = "Renewed")) +
  theme_minimal()
