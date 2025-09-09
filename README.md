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

### OLS results — Dependent variable: `log_cumgpa`

| Variable | (1) | (2) | (3) | (4) | (5) |
|---|---:|---:|---:|---:|---:|
| **sat** | 0.001***<br><sub>(9.746)</sub> | 0.001***<br><sub>(9.672)</sub> | 0.001***<br><sub>(7.797)</sub> | 0.001***<br><sub>(7.634)</sub> | 0.001***<br><sub>(7.848)</sub> |
| **tothrs** |  | 0.001*<br><sub>(1.631)</sub> | 0.001*<br><sub>(1.634)</sub> | 0.001*<br><sub>(1.493)</sub> | 0.001*<br><sub>(1.489)</sub> |
| **white** |  |  | 0.020<br><sub>(0.770)</sub> | 0.010<br><sub>(0.399)</sub> | 0.020<br><sub>(0.758)</sub> |
| **female** |  |  |  | 0.147***<br><sub>(7.771)</sub> | 0.164***<br><sub>(7.933)</sub> |
| **football** |  |  |  |  | 0.042*<br><sub>(1.689)</sub> |
| **Constant** | 0.368***<br><sub>(7.563)</sub> | 0.326***<br><sub>(5.314)</sub> | 0.333***<br><sub>(5.349)</sub> | 0.326***<br><sub>(5.293)</sub> | 0.285***<br><sub>(4.358)</sub> |
| **Observations** | **634** | **634** | **634** | **634** | **634** |
| **R²** | **0.130** | **0.136** | **0.137** | **0.197** | **0.202** |
| **Adj. R²** | **0.129** | **0.133** | **0.132** | **0.192** | **0.195** |
| **Residual Std. Error** | **0.236** (df = 632) | **0.235** (df = 631) | **0.235** (df = 630) | **0.227** (df = 629) | **0.226** (df = 628) |
| **F Statistic** | **94.848*** (df = 1; 632) | **49.531*** (df = 2; 631) | **33.215*** (df = 3; 630) | **38.632*** (df = 4; 629) | **31.757*** (df = 5; 628) |

<sub>*p &lt; 0.1; **p &lt; 0.05; ****p &lt; 0.01*</sub>

<img width="1207" height="997" alt="image" src="https://github.com/user-attachments/assets/57da072d-2bae-4c3f-a1db-2c0eabe4f8ba" />



## 5. How to Use This Repository

1.  Clone or download the repository.
2.  Open the `.R` script in RStudio.
3.  Ensure all required packages (`tidyverse`, `wooldridge`, `lmtest`, `sandwich`, `stargazer`) are installed.
4.  Run the script from top to bottom to reproduce the analysis and generate the final table.
