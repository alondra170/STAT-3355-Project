# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
police.deaths <- read.csv("police.deaths.csv")

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

#Load dplyr and ggplot
library(ggplot2)
library(dplyr)


#FIrst Plot
#Filtering dataset to show only top ten most death stricken occupations for police officers
all.states <- filter(police.deaths, position == c("Trooper", "Lieutenant", "K9", "Patrolman", "Sheriff", "Police Officer", "Detective", "Deputy", "Sergeant", "Constable"))

#Plotting Position vs. Police Deaths, in all states
ggplot(all.states) + geom_bar(mapping = aes(
  x = position, fill = position), position = "dodge") +
  ggtitle("Police Deaths by Position in All States") +
  theme(axis.text.x = element_text(angle = 90))


#Second Plot
#Filtering state variable to show only 4 most populous states, and filtering position variable
states <- filter(police.deaths, state == c(" TX", " FL", " NY", " CA"))
States_Position <- filter(states, position == c("Trooper", "Lieutenant", "K9", "Patrolman", "Sheriff", "Police Officer", "Detective", "Deputy", "Sergeant", "Constable"))

#Plotting position vs Police Deaths, in top 4 populous states
ggplot(States_Position) + geom_bar(mapping = aes(
  x = position, fill = position), position = "dodge") +
  ggtitle("Police Deaths by Position in Most Populous States") +
  facet_wrap(~(state)) +
  theme(axis.text.x=element_blank()) +
  theme(axis.text.x = element_text(angle = 90))


  
  