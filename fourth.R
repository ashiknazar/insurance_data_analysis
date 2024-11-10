# Load necessary libraries
install.packages("tidyr") 
install.packages("gridExtra")

library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)

# Read the data from the Excel file
data <- read_excel('insurance_data.xlsx')

# Define categories
categories <- c('Monthly', 'Annual')

# Create a function to generate pie charts for each category
create_pie_chart <- function(df, category) {
  # Filter data for the current category
  filtered_data <- df %>% filter(`Payment Method` == category)
  
  # Count occurrences of Renewed values
  renewed_counts <- filtered_data %>% 
    count(Renewed) %>%
    complete(Renewed = c(0, 1), fill = list(n = 0))
  
  # Create pie chart
  ggplot(renewed_counts, aes(x = "", y = n, fill = factor(Renewed))) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    scale_fill_manual(values = c("lightblue", "lightgreen"), labels = c("0", "1")) +
    labs(title = category, fill = "Renewed") +
    theme_void()
}

# Create a plot layout for multiple pie charts
library(gridExtra)

# Create a list of plots
plots <- lapply(categories, create_pie_chart, df = data)

# Combine plots into one
grid.arrange(grobs = plots, ncol = 2) +
  ggtitle('Pie Charts of Renewed (0 and 1) for Each Payment Method')
