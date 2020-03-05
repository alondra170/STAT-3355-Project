# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
police.deaths <- read.csv("clean_data.csv")

# removing redundant columns
police.deaths <- police.deaths[-2]
police.deaths <- police.deaths[-3]

# changing eow to day-of-death
police.deaths$'eow' <- substr(police.deaths$'eow', 6, 8)
names(police.deaths)[names(police.deaths) == 'eow'] <- 'day' 

# shortening date to just be months
police.deaths$'date' <- substr(police.deaths$'date', 6, 7)
names(police.deaths)[names(police.deaths) == 'date'] <- 'month'

# changing police.deaths$day to ordered factor variable
police.deaths$'day' <- as.factor(police.deaths$'day')
police.deaths$'day' <- ordered(police.deaths$'day',
                             levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))

# changing police.deaths$months to ordered factor variable
police.deaths$'month' <- as.factor(police.deaths$'month')
levels(police.deaths$month) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")