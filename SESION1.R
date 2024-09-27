search()
if (!require(ggplot)) install.packages("ggplot2")
library(ggplot2)
library(help=ggplot2)
help(diamonds)
data<-diamonds
View(data)
head(data)
tail(data)
str(data)
names(data)
data$price
data$price[270]
data$price[data$price > 18000]
mean(data$price)
max(data$carat)
hist(data$price)
