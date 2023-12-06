##Q5 script for virology model

#install package dplyr if needed for piping
install.packages("dplyr")

#load package
library(dplyr)

#load data
dsDNA_data <- read.csv("Cui_etal2014.csv")

#PART A
#output number of columns and rows
ncol(dsDNA_data)
nrow(dsDNA_data)

#PART B
#find V and L from data
dsDNA_data <- dsDNA_data %>%
  rename(V = Virion.volume..nm.nm.nm., L = Genome.length..kb.)

#find ln(V) and ln(L) from data
dimension_data <- dsDNA_data %>%
  transmute(L_log = log(L), V_log = log(V))

#PART C
#fit to a linear model
model <- lm(V_log ~ L_log, dimension_data)
summary(model)

#PART D
# plot data on a log-log plot

figure <- ggplot(data = dimension_data, aes(x = L_log, y = V_log))+
  geom_point() +
  geom_smooth(method = lm) +
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (nm3)]") +
  theme_bw()

#print the figure 
figure

#function to find virion volume using model fit parameters
volume <- function(length) {
  alpha = 1.5152
  beta = 1181.8
  return(beta*length^alpha)
}

#calculate estimated volume of dsDNA virus with genome length 300kb
V_300 <- volume(300)
V_300
