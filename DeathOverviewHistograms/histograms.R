# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
deaths <- read.csv("police.deaths.csv")

# library(ggplot2)
x <- deaths$year
n <- length(x)

# Rice rule
k <- ceiling(2 * n^(1/3))
# BINS = 57

# overall trend of 
ggplot(data = deaths, mapping = aes(x = year, y = ..count..)) +
  geom_histogram(bins = k) + # k = 57: Rice Rule
  labs(title = "Police Deaths: 1791 - 2016") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = c(seq(1800, 2020, by = 20)))



# histogram for showing people deaths to canine deaths over time
# library(dplyr)
# seperating canine deaths
canines <- filter(deaths, canine == TRUE)

# creating bins
x <- canines$year
n <- length(x)
# square-root choice 
k <- ceiling(sqrt(n))
# BINS = 17

# histogram 
ggplot(data = canines, mapping = aes(x = year, y = ..count..)) +
  geom_histogram(bins = k) + # Square Root Choice: Bins = 17
  labs(title = "K-9 Deaths: 1960 - 2016") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = c(seq(1960, 2020, by = 5)))
