# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
police.deaths <- read.csv("police.deaths.csv")

# library(dplyr)

# subset of data that contains U.S. territories
deaths.territories <- filter(police.deaths, state == " PR" |
                               state == " TR" |
                               state == " VI" |
                               state == " MP" |
                               state == " GU" |
                               state == " CZ" |
                               state == " AS")

# subset of data that contains U.S. states & special regions
deaths.states <- filter(police.deaths, state != " PR" &
                          state != " TR" &
                          state != " VI" &
                          state != " MP" &
                          state != " GU" &
                          state != " CZ" &
                          state != " AS")
