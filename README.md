# The Predictive Power of SAT Scores on College GPA

## 1. Project Overview

This project presents the analysis from my undergraduate econometrics term paper on the relationship between students' SAT scores and their cumulative GPA in college. Using a dataset of 732 students, the analysis quantifies the predictive validity of the SAT as an admissions tool while controlling for other demographic and behavioral factors. This repository contains the complete R code used to conduct the analysis from start to finish.

## 2. Data Source

The data is from the `gpa3` dataset, sourced from the `wooldridge` R package, which contains data from Wooldridge's "Introductory Econometrics: A Modern Approach."

## 3. Methodology

The analysis was conducted entirely in R and involved the following key steps:
* **Data Cleaning**: Handled observations with invalid values that caused errors in the log-transformation of the dependent variable.
* **Exploratory Data Analysis (EDA)**: Used `ggplot2` to visualize the relationship between SAT scores and GPA.
* **Regression Modeling**: Estimated five Ordinary Least Squares (OLS) models, starting with a simple regression and progressively adding control variables.
* **Robustness Checks**: Calculated heteroskedasticity-robust standard errors and t-values using the `sandwich` and `lmtest` packages to ensure the validity of the statistical inference, as discussed in my paper.
* **Results Visualization**: Generated a professional regression table to present the final model outputs using the `stargazer` package.

## 4. Key Findings

The analysis confirms that SAT scores are a statistically significant positive predictor of college GPA. Across all models, a higher SAT score is associated with a higher GPA. Additionally, gender and total hours studied were also found to be significant predictors.

*Include your final `stargazer` table or a key plot here.*

## 5. How to Use This Repository

1.  Clone or download the repository.
2.  Open the `.R` script in RStudio.
3.  Ensure all required packages (`tidyverse`, `wooldridge`, `lmtest`, `sandwich`, `stargazer`) are installed.
4.  Run the script from top to bottom to reproduce the analysis and generate the final table.
