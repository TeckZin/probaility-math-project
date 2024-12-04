# README

## Overview
This project involves statistical analysis and visualization of data from an Excel file named `Computer_Stats.xlsx`. The analysis is performed using R with the following main steps:

1. Loading and inspecting the data.
2. Calculating descriptive statistics (mean, median, mode, standard deviation) for specific columns.
3. Performing a proportion analysis on certain conditions.
4. Conducting a confidence interval analysis for a key column.
5. Performing a one-sample t-test to compare means.

## Requirements
To run the code, you need R and the following packages installed:

```R
install.packages("readxl")
install.packages("ggplot2")
```

## How to Run the Script
1. Ensure the file `Computer_Stats.xlsx` is in the same directory as the script.
2. Open the R script file (e.g., `init.R`) in your R environment.
3. Run the script to generate the analysis results.

## Script Details

### Libraries Used
- `readxl`: To read Excel files.
- `ggplot2`: For data visualization (not explicitly used in the current script).

### Steps in the Script

1. **Read Data**: Load the data from `Computer_Stats.xlsx` into an R data frame.
    ```R
    Stats <- read_excel("Computer_Stats.xlsx")
    head(Stats)
    ```

2. **Descriptive Statistics**:
   - Calculate mean, median, mode, and standard deviation for the columns `AC_2014_16`, `PP_2014_16`, `AC_2017`, `PP_2017`.
   - Example:
     ```R
     print(mean(Stats$AC_2014_16))
     print(median(Stats$AC_2014_16))
     ```

   - Custom function for mode:
     ```R
     find_mode <- function(x) {
         uniqx <- unique(x)
         uniqx[which.max(tabulate(match(x, uniqx)))]
     }
     print(find_mode(Stats$AC_2014_16))
     ```

3. **Proportion Analysis**:
   - Proportion of days with `PP_2017 >= 35.4%`.
   - Among those days, proportion with `AC_2017 <= $330`.
   - Example:
     ```R
     good_pp_days <- sum(Stats$PP_2017 >= 35.4)
     proportion_good_pp <- good_pp_days / length(Stats$PP_2017)
     ```

4. **Confidence Interval Calculation**:
   - Compute a 95% confidence interval for `AC_2014_16`.
   - Example:
     ```R
     n <- length(Stats$AC_2014_16)
     t_value <- qt(0.975, df = n - 1)
     margin_of_error <- t_value * (sd(Stats$AC_2014_16) / sqrt(n))
     ci_lower <- mean(Stats$AC_2014_16) - margin_of_error
     ci_upper <- mean(Stats$AC_2014_16) + margin_of_error
     ```

5. **T-Test**:
   - Perform a one-sample t-test to compare the mean of `AC_2017` to the mean of `AC_2014_16`.
   - Example:
     ```R
     t_test <- t.test(Stats$AC_2017, mu = mean(Stats$AC_2014_16))
     print(t_test)
     ```

## Output
The script outputs the results for each analysis step, including descriptive statistics, proportions, confidence intervals, and t-test results.

## Notes
- Ensure the column names in the Excel file match those used in the script.
- Modify the script as needed to adapt to any changes in the data structure or additional analyses.

## Example Results
Example outputs include:
- Mean and median of `AC_2014_16`.
- Proportion of days with high `PP_2017` and low `AC_2017`.
- 95% confidence interval for `AC_2014_16`.
- T-test results comparing `AC_2017` to `AC_2014_16`.

