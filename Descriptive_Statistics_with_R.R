# Descriptive Statistics with R Programming Language
# By Sherif Sakr, Cairo Egypt, 14 June 2022

# Get the Current Date and Time
Sys.time()

# Get the current workspace directory by using the getwd() function
print(getwd())

# Descriptive Statistics is a set of math used to summarize data.
# It can be distribution, central tendency, and dispersion of data.
# The distribution can be a normal distribution or binomial distribution.
# The central tendency can be mean, median, and mode.
# The dispersion or spreadness can be the range, interquartile range, variance,and standard deviation.

# A data frame is a special list or R object that is multidimensional and is usually used to store 
# data read from an Excel or .CSV file.

# A small set of data: the grades of a 15 students, they range from 0 (failing) to 4 (an A), 
# go up in steps of 2.

# Create a data frame for a set of data
A <- data.frame(student_name = c("John","Mary","George", "Beth", "Sam", "Judy", "Fritz","Kate",
                                 "Dave", "Jenny","Mike", "Sue", "Don", "Ellen", "Orville"), 
                grades = c(3.0, 2.8, 2.8, 2.4, 3.2, 2.8, 1.8, 3.8, 2.6, 3.4, 2.4, 4.0, 3.4, 3.2, 2.2))

# Use the print() method to print output in R programming
print(A)

# Use the typeof() function in R language is used to return the type of data used as the argument
typeof(A)

# Use the class() function in R to return the values of the class attribute of an R object
class(A)

# Use the ncol() function in R language to return the number of columns
ncol(A)

# Use the nrow() function in R language to return the number of row
nrow(A)

# Use the str() function in R Language for compactly displaying the internal structure of a R object
str(A)

# Descriptive Statistics
# Use the summary() function in R language to produce result summaries of various model fitting functions
summary(A)

# Central tendency
# Mode, median, and mean are the most common measures for central tendency.

# The mode
# Mode is the value in data that has the heighest frequency
# R does not have a standard in-built function to calculate mode.
m <- table(A$grades)
print(m)
names(m)[which(m == max(m))]

# The Median
# The median is the middle or midpoint of the data and is also the 50 percentile of the data.
# the median is affected by the outliers and skewness of the data.
# The median can be a better measurement for centrality than the mean if the data is skewed.
median(A$grades)

# The Mean
# The mean is the average of the data.
# It is the sum of all data divided by the number of data points.
mean(A$grades)

# Statistical Dispersion
# Measures of variability are the measures of the spread of the data.
# It can be range, interquartile range, variance, standard deviation, and more.

# Range
# The range is the difference between the larges and smallest points in the data.
range(A$grades)
# Use the min() and max() functions to find the range.
min(A$grades)
max(A$grades)
# To get the difference between the maximum point and minimum point
max(A$grades) - min(A$grades)
# Another way, To get the difference between the maximum point and minimum point
result <- range(A$grades)
diff(result)

# Interquartile Range
# The interquartile range is the measure of the difference between the 75 percentile or third
# quartile and the 25 percentile or first quartile.
# Use the IQR() function to find the interquartile range of a data set in R.
IQR(A$grades)
IQR(A$grades, na.rm = TRUE) # use the na.rm, the logical value to remove the NA values
# Use quantile() function to get the quartiles.
quantile(A$grades) # get all the quartiles
quantile(A$grades, 0.25) # get the first quartile
quantile(A$grades, 0.50) # get the second quartile
quantile(A$grades, 0.75) # get the third quartile

# Variance
# The variance is the average of squared differences from the mean, and it is used to measure
# the spreadness of the data
A$grades
N <- length(A$grades)
N
var(A$grades) * (N - 1) / N

# Standard Deviation
# The standard deviation is the square root of a variance and it measures the spread of the data.
N <- length(A$grades)
N
Variance <- var(A$grades) * (N - 1) / N
# Use the sqrt() function in R language to calculate the mathematical square-root of the value
# passed to it as argument.
sqrt(Variance)
# Use the sd() function to find the standard deviation of a data set
sd(A$grades)


# The Normal Distribution
# Normal distribution is one of the more important theories because nearly all statistical tests
# require the data to be distributed normally. 
# It describes how data looks when plotted.
# Normal distribution is also called the bell-shaped curve.

# use hist() function to compute a histogram of the given data values
# You can plot a distribution in R using the hist() function, 
# breaks shows the number of bars in a histogram
hist(A$grades, breaks = 15)

# In R, there are two functions to create Q-Q plots: qqnorm() and qqline() functions:
# Use qqnorm() function to produce a normal Quantile-Quantile plot of the values in "y".
qqnorm(A$grades)
# Use qqline() function to add a line to a Quantile-Quantile plot.
qqline(A$grades)
# Use qqplot() function to produce a Quantile-Quantile plot of two data sets.

# Use a Shapiro.test() function to test whether the data is normally distributed
# If the p-value ir more than 0.05, you can conclude that the data does not deviate from
# normal distribution.
shapiro.test(A$grades)


# R programming language has four built-in functions to generate normal distribution
# dnorm(x, mean, sd)
# pnorm(x, mean, sd)
# qnorm(p, mean, sd)
# rnorm(n, mean, sd)
# Where, x is a vector of numbers, 
# p is a vector of probabilities,
# n is number of observations (sample size),
# mean is the mean value of the sample data. Its default value is zero,
# sd is the standard deviation. Its default value is one.


# Use the rnorm() function in R to generate a vector of random numbers which are normally distributed
# with 2.92 mean and 0.5787343 standard deviation, I will generate 50 random values from normal distribution.
set.seed(123)
R <- rnorm(50, 2.92, 0.5787343)
R
hist(R, breaks = 15)

# Use the pnorm() function in R is the cumulative distribution function (CDF) which measures
# the probability that a random number X takes a value less than or equal to x.
# X is a normal distribution
# the probability P(X < 1.5)
pnorm(1.5, 2.92, 0.5787343)

# Use the qnorm() function is the inverse of pnorm() function.
# It takes the probability value and gives output which corresponds to the probability value.
# It is useful in finding the percentiles of a normal distribution, which is 0.98.
qnorm(0.98, 2.92, 0.5787343)


# Use the dnorm() function in R to measure density function of distribution
dnorm(0.007071115, 2.92, 0.5787343)


# Modality
# The modality of a distribution can be seen by the number of peaks when plotting the histogram.
hist(A$grades, breaks = 15)

# Skewness
# Skewness is a measure of how symmetric a distribution is and how much the distribution is 
# different from the normal distribution.
# Negative skew is also known as left skewed, and positive skew is also knows as right skewed.

# Kurtosis
# The kurtosis measure is used to see whether a data set is heavy tailed or light tailed.
# high kurtosis means heavy tailed, so there are more outliers in the data.

# To find the kurtosis and skewness in R, you must install the moments package
install.packages("moments")
require(moments)
skewness(A$grades)
kurtosis(A$grades)


# Binomial Distribution
# Binomial distribution has two outcomes, success or failure, and can be thought of as the 
# probability of success or failure in a survey that is repeated various times.
# The number of observation is fixed, and each observation or probability is independent, and 
# the probability of success is the same for all observations.

# R programming language has four built-in functions to generate binomial distribution
# dbinom(x, size, prob, log = FALSE)
# pbinom(q, size, prob, lower.tail = TRUE, log.p = FALSE)
# qbinom(p, size, prob, lower.tail = TRUE, log.p = FALSE)
# rbinom(n, size, prob)
# Where, x,q is a vector of quantiles, 
# p is a vector of probabilities,
# n is number of observations,
# size is number of trails (zero or more),
# prob is probability of success on each trail,
# log, log.p is logical: If TRUE, probabilities p are given as log(p),
# lower.trail is logical: If TRUE (default) probabilities are $P[X \ie x]$, 
# otherwise, $P[X > x]$

# To get the probability mass function, Pr(X = x), of binomial distribution, 
# you can use the dbinom(X, size, prob, log = FALSE) function
dbinom(30, 100, 0.50)

# To get the cumulative distribution function, P(X <= x), of a binomial distribution,
# you can use the pbinom() function
pbinom(30, 100, 0.50)


# To get the p-th quantile of the binomial distribution, you can use the qbinom() function
qbinom(0.3, 100, 0.50)

# To generate random variables from a binomial distribution, you can use the rbinom() function
set.seed(123)
R2 <- rbinom(1000, 100, 0.5)
hist(R2, breaks = 20)


# How to plot a normal distribution in R, with mean = 0, and standard deviation = 1.
# create a sequence of 100 equally spaced numbers between -4 and 4.
x <- seq(-4, 4, length = 100)
# create a vector of values that shows the height of the probability distribution for each value in x.
y <- dnorm(x)
# plot x and y as a scatterplot with connected lines (type = "1") and add an axis with custom labels
plot(x, y, type = "l", lwd = 2, axes = FALSE,main = "Normal Distribution", xlab = " ", ylab = " ")
axis(1, at = -3:3, labels = c("-3s", "-2s","-1s", "mean", "1s", "2s", "3s"))

# Use the curve() function to create a normal distribution, without defining x and y
curve(dnorm, -3.5, 3.5, lwd=2, axes = FALSE, xlab = "", ylab = "")
axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))     
     

# How to make a Histogram with R
# use hist() function to compute a histogram of the given data values
hist(A$grades, main = "Histogram for Student's Degrees", xlab = "Degrees",
     border = "black", col = "green", las = 1, breaks = 5)
# get a density curve to go along with Student's Degrees Histogram
lines(density(A$grades))



# Use the R built-in data set named Faithful (Old Faithful Geyser Data)
# It consists of Waiting time between eruptions and the duration of the eruption for the Old
# Faithful geyser in Yellowstone National Park, Wyoming, USA.
data("faithful") # Load data set
head(faithful) # print the firs 6 rows
tail(faithful) # print the last 6 rows

# Interquartile Range
# The interquartile range of an observation variable is the difference of its upper and lower
# quartiles. It is a measure of how far apart the middle portion of data spreads in value.
# Question
# Find the interquartile range of eruption in the data set named Faithful
# Solution
duration <- faithful$eruptions # the eruption duration
IQR(duration) # apply the IQR() function
# Answer
# The interquartile range of eruption duration is 2.2915 minutes.

# Quartile
# There are several quartiles of an observation variable. 
# The first quartile, or lower quartile, is the value that cuts off the first 25% of the data
# when it is sorted in ascending order. The second quartile, or median, is the value that cuts
# off the first 50%. The third quartile, or upper quartile, is the value that cuts off the 
# first 75%.
# Question
# Find the quartiles of the eruption durations in the data set named faithful.
# Solution
duration <- faithful$eruptions # the eruption duration
quantile(duration) # apply the quantile() function
# Answer
# The first, second and third quartiles of the eruption duration are 2.1627, 
# 4.0000 and 4.4543 minutes respectively.

# Standard Deviation
# The standard deviation of an observation variable is the square root of its variance.
# Question
# Find the standard deviation of the eruption duration in the data set named faithful.
# Solution
duration = faithful$eruptions # the eruption durations 
sd(duration)  # apply the sd() function 
# Answer
# The standard deviation of the eruption duration is 1.1414.

# Variance
# The variance is a numerical measure of how the data values is dispersed around the mean.
# Question
# Find the variance of the eruption duration in the data set named faithful.
# Solution
duration = faithful$eruptions  # the eruption durations 
var(duration)  # apply the var() function 
# Answer
# The variance of the eruption duration is 1.3027.


# Normality Test in R
# Install required R package "dplyr" for data manipulation
install.packages("dplyr")
# Install required R package "ggpubr" for data visualization
install.packages("ggpubr")
# Load required R packages
library(dplyr)
library(ggpubr)
# Use the built-in R data set named ToothGrowth
data("ToothGrowth")
head(ToothGrowth)
# Store the data set in the variable my_data
my_data <- ToothGrowth 
# Display a random sample of 10 rows
set.seed(1234)
dplyr::sample_n(my_data, 10)
# Visual methods for checking normality
# Density plot and Q-Q plot can be used to check normality visually
ggdensity(my_data$len, main = "Density Plot of Tooth length", xlab = "Tooth Length")
ggqqplot(my_data$len)
# Normality test
# Visual inspection, described in the previous section, is usually unreliable.
# It’s possible to use a significance test comparing the sample distribution to a normal one
# in order to ascertain whether data show or not a serious deviation from normality.
# There are several methods for normality test such as Kolmogorov-Smirnov (K-S) normality test
# and Shapiro-Wilk’s test.

# Shapiro-Wilk's method
# Use the R function shapiro.test() to test normality for one variable (univariate)
# If the p-value ir more than 0.05, you can conclude that the data does not deviate from
# normal distribution.
shapiro.test(my_data$len)
# From the output, the p-value > 0.05 implying that the distribution of the data are not 
# significantly different from normal distribution. In other words, we can assume the normality.

# Q-Q Plot
# to check whether two samples are drawn from the same distribution
set.seed(183)
# Normally distributed numbers
x <- rnorm(80, mean = 50, sd = 5)
# Uniformly distributed number
z <- runif(80)
# Compare the numbers samples with rnorm() against normal distribution
qqnorm(x)
qqline(x)
# The same numbers to the 4th power, compared to the normal distribution
qqnorm(x^4)
qqline(x^4)
# Numbers sampled from the flat distribution, compared to normal
qqnorm(z)
qqline(z)


