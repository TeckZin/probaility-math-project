# Total number if records length(Admission$Student)

# Mean of SAT
mean(Admission$SAT)

# Median of SAT
median(Admission$SAT)


# Standard Deviation of SAT (sample standard deviation)
sd(Admission$SAT)

# Five number summary
summary(Admission$SAT)

# Histogram:SAT
hist(Admission$SAT)
# if you want to specify the categories by yourself:
hist(Admission$SAT, breaks = 100)
hist(Admission$SAT, breaks = c(800, 1000, 1200, 1400, 1600))
hist(Admission$SAT, breaks = seq(800, 1600, 50))
# modify the names
hist(Admission$SAT, breaks = seq(800, 1600, 50), main = "Histogram", xlab = "SAT")

# Boxplot
boxplot(Admission$SAT)

boxplot(Admission$SAT ~ Admission$Decision)

# Frequency table
table(Admission$Decision)
# we could create an object in R to save the table
Decision_table <- table(Admission$Decision)
Decision_table

# How about the relative frequency table
prop.table(Decision_table)

# Bar chart
barplot(Decision_table)
barplot(table(Admission$Decision))

# pie chart
pie(table(Admission$Decision))
pie(table(Admission$Decision), main = "Decision")

# Contingency table : Display two categorical variables
table(Admission$Decision, Admission$Female)

# Scatter plot: display two continunous variables
plot(Admission$SAT ~ Admission$HSGPA)
# More about scatterplot
library(ggplot2)
ggplot(Admission) +
    aes(x = SAT, y = HSGPA, colour = Decision) +
    geom_point() +
    scale_color_hue()

# selecting data based on conditions
mydata <- subset(Admission, Admission$Decision == "Admit")

mydata2 <- subset(Admission, Admission$Decision == "Admit" & Admission$SAT > 1300) # And "&", Or "|"
