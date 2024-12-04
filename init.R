# install.packages("readxl")
# install.packages("ggplot2")
library(readxl)
library(ggplot2)

Stats <- read_excel("Computer_Stats.xlsx")
head(Stats)

print("mean AC_2014_16")
print(mean(Stats$AC_2014_16))

print("mean PP_2014_16")
print(mean(Stats$PP_2014_16))

print("mean AC_2017")
print(mean(Stats$AC_2017))

print("mean PP_2017")
print(mean(Stats$PP_2017))


print("median AC_2014_16")
print(median(Stats$AC_2014_16))

print("median PP_2014_16")
print(median(Stats$PP_2014_16))

print("median AC_2017")
print(median(Stats$AC_2017))

print("median PP_2017")
print(median(Stats$PP_2017))



find_mode <- function(x) {
    uniqx <- unique(x)
    uniqx[which.max(tabulate(match(x, uniqx)))]
}

# Now use it on your data

print("find_mode AC_2014_16")
print(find_mode(Stats$AC_2014_16))

print("find_mode PP_2014_16")
print(find_mode(Stats$PP_2014_16))

print("find_mode AC_2017")
print(find_mode(Stats$AC_2017))

print("find_mode PP_2017")
print(find_mode(Stats$PP_2017))

print("sd AC_2014_16")
print(sd(Stats$AC_2014_16))

print("sd PP_2014_16")
print(sd(Stats$PP_2014_16))

print("sd AC_2017")
print(sd(Stats$AC_2017))

print("sd PP_2017")
print(sd(Stats$PP_2017))




# D. Find proportion of days with PP ≥ 35.4%
good_pp_days <- sum(Stats$PP_2017 >= 35.4)
proportion_good_pp <- good_pp_days / length(Stats$PP_2017)

# E. Among good PP days, find proportion with AC ≤ $330
good_pp_indices <- Stats$PP_2017 >= 35.4
good_ac_among_good_pp <- sum(Stats$AC_2017[good_pp_indices] <= 330)
proportion_good_ac <- good_ac_among_good_pp / sum(good_pp_indices)

# Print results
print("D. Analysis of Profit Percentage:")
print(paste("Proportion of days with PP ≥ 35.4%:", round(proportion_good_pp, 4)))
print(paste("Number of days with PP ≥ 35.4%:", good_pp_days))

print("E. Analysis of Assembly Cost among good PP days:")
print(paste("Proportion of good PP days with AC ≤ $330:", round(proportion_good_ac, 4)))
print(paste("Number of days meeting both conditions:", good_ac_among_good_pp))


n <- length(Stats$AC_2014_16)
sample_mean <- mean(Stats$AC_2014_16)
sample_sd <- sd(Stats$AC_2014_16)

# For 95% confidence level, we use t-value with df = n-1
t_value <- qt(0.975, df = n - 1) # 0.975 because we want two-tailed 95%
# 0.05/2 = 0.025 => 0.95 + 0.025 == 0.975 for one side in two tailed



# Calculate margin of error
margin_of_error <- t_value * (sample_sd / sqrt(n))

# Calculate confidence interval
ci_lower <- sample_mean - margin_of_error
ci_upper <- sample_mean + margin_of_error

# Print results
print("Sample Size:")
print(n)
print("Sample Mean:")
print(sample_mean)
print("Sample Standard Deviation:")
print(sample_sd)
print("Margin of Error:")
print(margin_of_error)
print("95% Confidence Interval:")
print(c(ci_lower, ci_upper))


mean_2014_16 <- mean(Stats$AC_2014_16)
sd_2014_16 <- sd(Stats$AC_2014_16)

# Calculate 2017 sample statistics
mean_2017 <- mean(Stats$AC_2017)
sd_2017 <- sd(Stats$AC_2017)
n_2017 <- length(Stats$AC_2017)

# Perform one-sample t-test
t_test <- t.test(Stats$AC_2017, mu = mean_2014_16)

# Print results
print("2014-2016 Mean (H0):")
print(mean_2014_16)
print("2017 Sample Mean:")
print(mean_2017)
print("Sample Size 2017:")
print(n_2017)
print("T-test results:")
print(t_test)
