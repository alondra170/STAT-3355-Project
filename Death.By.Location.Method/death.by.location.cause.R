# importing excel file
# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
deaths.state <- read.csv("deaths.states.csv")

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

# seperating the 20th, 21th century
death.20.century <- filter(deaths.state.2, year >= 1901 & year <= 2000)
death.21.century <- filter(deaths.state.2, year >= 2001 & year <= 2016)

# extracting death frequency
region <- tolower(levels(deaths.state.2$region))

# showing changes in deaths by state by method of death
# gunfire 20th -> 21st century
gun.20.century <- table(death.20.century$region[which(death.20.century$cause_short == "Gunfire")])
gun.21.century <- table(death.21.century$region[which(death.21.century$cause_short == "Gunfire")])

# automobile accidents
auto.20.century <- table(death.20.century$region[which(death.20.century$cause_short == "Automobile accident")])
auto.21.century <- table(death.21.century$region[which(death.21.century$cause_short == "Automobile accident")])

# heart attack
heart.20.century <- table(death.20.century$region[which(death.20.century$cause_short == "Heart attack")])
heart.21.century <- table(death.21.century$region[which(death.21.century$cause_short == "Heart attack")])

# vehicle pursuit
pursuit.20.century <- table(death.20.century$region[which(death.20.century$cause_short == "Vehicle pursuit")])
pursuit.21.century <- table(death.21.century$region[which(death.21.century$cause_short == "Vehicle pursuit")])

# set up data frame that will hold all the counts/frequencies
death.cause <- as.data.frame(cbind(region, 
                                   gun.20.century, gun.21.century,
                                   auto.20.century, auto.21.century,
                                   heart.20.century, heart.21.century,
                                   pursuit.20.century, pursuit.21.century))

# reset and merge map
us_map <- map_data("state")
us_map <- left_join(us_map, death.cause, by = "region")

# convert to numeric
us_map$gun.20.century <- as.numeric(as.character(us_map$gun.20.century))
us_map$gun.21.century <- as.numeric(as.character(us_map$gun.21.century))
us_map$auto.20.century <- as.numeric(as.character(us_map$auto.20.century))
us_map$auto.21.century <- as.numeric(as.character(us_map$auto.21.century))
us_map$heart.20.century <- as.numeric(as.character(us_map$heart.20.century))
us_map$heart.21.century <- as.numeric(as.character(us_map$heart.21.century))
us_map$pursuit.20.century <- as.numeric(as.character(us_map$pursuit.20.century))
us_map$pursuit.21.century <- as.numeric(as.character(us_map$pursuit.21.century))

# mapping deaths by gun 20 -> 21st century
library(gridExtra)
gun.20 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = gun.20.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Gunfire (1901 - 2000)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

gun.21 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = gun.21.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Gunfire (2001 - 2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

grid.arrange(gun.20, gun.21, ncol = 2)
# 0R
# grid.arrange(gun.20, gun.21, ncol = 1)


# mapping deaths by auto accident 20 -> 21st century
# library(gridExtra)
auto.20 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = auto.20.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Auto Accident (1901 - 2000)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

auto.21 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = auto.21.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Auto Accident (2001 - 2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

grid.arrange(auto.20, auto.21, ncol = 2)
# 0R
# grid.arrange(auto.20, auto.21, ncol = 1)


# mapping deaths by heart attack 20 -> 21st century
# library(gridExtra)
heart.20 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = heart.20.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Heart Attack (1901 - 2000)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

heart.21 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = heart.21.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Heart Attack (2001 - 2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

grid.arrange(heart.20, heart.21, ncol = 2)
# 0R
# grid.arrange(gun.20, gun.21, ncol = 1)


# mapping deaths by vehicular pursuit 20 -> 21st century
# library(gridExtra)
pursuit.20 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = pursuit.20.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Vehicle Pursuit (1901 - 2000)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

pursuit.21 <- ggplot(us_map, mapping = aes(x = long, y = lat, group = group)) + 
  geom_polygon(mapping = aes(fill = pursuit.21.century)) +
  coord_quickmap() +
  scale_fill_gradient(low = "white", high = "darkgreen", name = "Deaths") +
  labs(title = "Police Deaths by Vehicle Pursuit (2001 - 2016)") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())

grid.arrange(pursuit.20, pursuit.21, ncol = 2)
# 0R
# grid.arrange(gun.20, gun.21, ncol = 1)