# setwd("C:/Users/Alondra/Documents/School/Spring 2020/STAT 3355/Project Stuffs")
deaths <- read.csv("police.deaths.csv")

deaths$day <- factor(deaths$day, labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), 
                     levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), 
                     ordered = TRUE)
# library(ggplot2)
overall <- ggplot(data = deaths) +
  geom_bar(mapping = aes(x = day, fill = ..count..)) +
  labs(title = "Overall") +
  theme(plot.title = element_text(hjust = 0.5, size = 13))

subset <- ggplot(data = deaths) +
  geom_bar(mapping = aes(x = day, fill = ..count..)) +
  labs(title = "Subset") +
  theme(plot.title = element_text(hjust = 0.5, size = 13)) +
  coord_cartesian(ylim=c(2000,3700))

# library(gridExtra)
# library(grid)
grid.arrange(overall, subset, ncol = 2,
             top = textGrob("Police Deaths by Day of Week", 
                            hjust = 0.5,
                            gp = gpar(fontface = "bold")))
