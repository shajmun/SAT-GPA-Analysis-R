# ---
# Title: Analysis of SAT Scores and College GPA
# Author: Shajmun Sakib
# ---

## =================================================================
## SECTION 1: SETUP - LOAD LIBRARIES
## =================================================================
# Note: Install packages once if you don't have them.
# install.packages(c("tidyverse", "wooldridge", "lmtest", "sandwich", "stargazer"))

# Load the libraries for this session
library(tidyverse)
library(wooldridge)
library(lmtest)
library(sandwich)
library(stargazer)

## =================================================================
## SECTION 2: LOAD AND CLEAN DATA
## =================================================================
# Load the gpa3 dataset from the wooldridge package
gpa_data <- gpa3

# The log() of 0 results in -Inf, which causes errors in regression models.
# We create a new, clean dataframe that excludes students with a GPA of 0.
gpa_data_clean <- filter(gpa_data, cumgpa > 0)

## =================================================================
## SECTION 3: EXPLORATORY DATA ANALYSIS (EDA)
## =================================================================
# Create a scatter plot to visualize the relationship between SAT and GPA
scatter_plot <- ggplot(data = gpa_data_clean, aes(x = sat, y = cumgpa)) +
  geom_point(alpha = 0.6) + # `alpha` makes points slightly transparent
  geom_smooth(method = "lm", se = FALSE, color = "blue") + # Add a best-fit line
  labs(
    title = "Relationship Between SAT Scores and College GPA",
    x = "SAT Score",
    y = "Cumulative College GPA"
  ) +
  theme_minimal() # Use a clean, modern theme

scatter_plot

## =================================================================
## SECTION 4: REGRESSION MODELING
## =================================================================
# Create the log-transformed dependent variable for our models
gpa_data_clean$log_cumgpa <- log(gpa_data_clean$cumgpa)

# Estimate the five Ordinary Least Squares (OLS) models from the paper
model1 <- lm(log_cumgpa ~ sat, data = gpa_data_clean)
model2 <- lm(log_cumgpa ~ sat + tothrs, data = gpa_data_clean)
model3 <- lm(log_cumgpa ~ sat + tothrs + white, data = gpa_data_clean)
model4 <- lm(log_cumgpa ~ sat + tothrs + white + female, data = gpa_data_clean)
model5 <- lm(log_cumgpa ~ sat + tothrs + white + female + football, data = gpa_data_clean)

## =================================================================
## SECTION 5: CREATE FINAL REGRESSION TABLE
## =================================================================
# Calculate heteroskedasticity-robust t-values for each model.
# We extract the 3rd column ([ , 3]) from the coeftest output matrix.
robust_t_values <- list(
  coeftest(model1, vcov = vcovHC(model1, type = "HC1"))[, 3],
  coeftest(model2, vcov = vcovHC(model2, type = "HC1"))[, 3],
  coeftest(model3, vcov = vcovHC(model3, type = "HC1"))[, 3],
  coeftest(model4, vcov = vcovHC(model4, type = "HC1"))[, 3],
  coeftest(model5, vcov = vcovHC(model5, type = "HC1"))[, 3]
)

# Generate the final table using stargazer, customized to match the paper
stargazer(
  model1, model2, model3, model4, model5,
  title = "The Predictive Power of SAT Scores on College GPA",
  align = TRUE,
  type = "text",
  se = robust_t_values,        # Replace SEs with our custom list of t-values
  t.auto = FALSE,               # Turn off stargazer's default t-stats
  p.auto = FALSE,               # Turn off stargazer's default p-values
  dep.var.labels = "Log(Cumulative GPA)",
  covariate.labels = c("SAT Score", "Total Study Hours", "White", "Female", "Football Player"),
  notes = "t-statistics in parentheses. Models estimated using OLS with heteroskedasticity-robust standard errors."
)