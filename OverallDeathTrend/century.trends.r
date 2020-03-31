# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
deaths.state <- read.csv("deaths.states.csv")

# 
# CLEANING DATA
# load map data
library(maps)
library(ggplot2)
us_map <- map_data("state")

# cleaning deaths.state to exclude special regions
# library(dplyr)
deaths.state <- deaths.state[-1]
deaths.state <- deaths.state[-1]
deaths.state$state <- as.character(deaths.state$state)
deaths.state.2 <- filter(deaths.state, state != " RR" 
                         & state != " US" 
                         & state != " DC"
                         & state != "")
deaths.state.2$state <- as.factor(deaths.state.2$state)

# # seperating the 19th, 20th, 21st century
death.19.century <- filter(deaths.state.2, year >= 1801 & year <= 1900)
death.20.century <- filter(deaths.state.2, year >= 1901 & year <= 2000)
death.21.century <- filter(deaths.state.2, year >= 2001 & year <= 2016)

# extracting death frequency
deaths.total <- table(deaths.state.2$region)
region <- tolower(levels(deaths.state.2$region))
century.19 <- table(death.19.century$region)
century.20 <- table(death.20.century$region)
century.21 <- table(death.21.century$region)

# creating new df
# used the USArrests data set to quickly create a new df with state names 
death.df <- as.data.frame(cbind(region, deaths.total, 
                                century.19, century.20,
                                century.21))

# join us_map and death.df
us_map <- left_join(us_map, death.df, by = "region")

# convert factors to numeric
us_map$deaths.total <- as.numeric(as.character(us_map$deaths.total))
us_map$century.19 <- as.numeric(as.character(us_map$century.19))
us_map$century.20 <- as.numeric(as.character(us_map$century.20))
us_map$century.21 <- as.numeric(as.character(us_map$century.21))
# 
# PLOTTING
# plot showing the general frequency of police deaths over ~200 years
# first plot
# library(ggthemes)
all.death <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = deaths.total)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "U.S. Police Deaths (1791-2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

# plotting 19th century
death.19 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = century.19)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "U.S. Police Deaths (1801-1900)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

# plotting 20th century
death.20 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = century.20)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "U.S. Police Deaths (1901-2000)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

# plotting 21st century
death.21 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = century.21)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "U.S. Police Deaths (2001 - 2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

# arranging all the plots into one graph
library(gridExtra)
grid.arrange(all.death, death.19, death.20, death.21, ncol = 2)
