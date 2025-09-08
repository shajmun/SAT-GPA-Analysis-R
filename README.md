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

===========================================================================================================================================
                                                                      Dependent variable:                                                  
                    -----------------------------------------------------------------------------------------------------------------------
                                                                          log_cumgpa                                                       
                              (1)                     (2)                     (3)                     (4)                     (5)          
-------------------------------------------------------------------------------------------------------------------------------------------
sat                        0.001***                0.001***                0.001***                0.001***                0.001***        
                            (9.746)                 (9.672)                 (7.797)                 (7.634)                 (7.848)        
                                                                                                                                           
tothrs                                              0.001*                  0.001*                  0.001*                  0.001*         
                                                    (1.631)                 (1.634)                 (1.493)                 (1.489)        
                                                                                                                                           
white                                                                        0.020                   0.010                   0.020         
                                                                            (0.770)                 (0.399)                 (0.758)        
                                                                                                                                           
female                                                                                             0.147***                0.164***        
                                                                                                    (7.771)                 (7.933)        
                                                                                                                                           
football                                                                                                                    0.042*         
                                                                                                                            (1.689)        
                                                                                                                                           
Constant                   0.368***                0.326***                0.333***                0.326***                0.285***        
                            (7.563)                 (5.314)                 (5.349)                 (5.293)                 (4.358)        
                                                                                                                                           
-------------------------------------------------------------------------------------------------------------------------------------------
Observations                  634                     634                     634                     634                     634          
R2                           0.130                   0.136                   0.137                   0.197                   0.202         
Adjusted R2                  0.129                   0.133                   0.132                   0.192                   0.195         
Residual Std. Error    0.236 (df = 632)        0.235 (df = 631)        0.235 (df = 630)        0.227 (df = 629)        0.226 (df = 628)    
F Statistic         94.848*** (df = 1; 632) 49.531*** (df = 2; 631) 33.215*** (df = 3; 630) 38.632*** (df = 4; 629) 31.757*** (df = 5; 628)
===========================================================================================================================================
Note:                                                                                                           *p<0.1; **p<0.05; ***p<0.01

<img width="1612" height="997" alt="image" src="https://github.com/user-attachments/assets/18a4e7b8-47a8-4878-865e-3b59e7e571bf" />


## 5. How to Use This Repository

1.  Clone or download the repository.
2.  Open the `.R` script in RStudio.
3.  Ensure all required packages (`tidyverse`, `wooldridge`, `lmtest`, `sandwich`, `stargazer`) are installed.
4.  Run the script from top to bottom to reproduce the analysis and generate the final table.
