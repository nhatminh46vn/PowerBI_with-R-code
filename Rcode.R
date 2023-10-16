#add some libary 
library(tidyverse)
library(plotly)
library(summarytools)
library(GGally)
library(ggExtra)


#load data 
df <- read.csv('500_Person_Gender_Height_Weight_Index.csv')

summary(df)

#Using view from summarytools to visualize data 

dfSummary(df) %>% view()

#Visualization 

p <- ggplot(df, aes(x = Height, y = Weight)) + 
  geom_point(size = 2,color = "blue", alpha = 0.4)

p

p <- p + 
  geom_hline(yintercept = mean(df$Weight), color = "red", size = 2 ) +
  geom_hline(yintercept = mean(df$Weight) + sd(df$Weight), color = "gray", size = 1 ) +
  geom_hline(yintercept = mean(df$Weight) - sd(df$Weight), color = "gray", size = 1 ) +
  geom_vline(xintercept = mean(df$Height), color = "red", size = 2 ) 

p1 <- ggMarginal(p, type = "histogram")
p1

p_reg <-p + geom_smooth(se = F)

ggplotly(p_reg)


p_index <- ggplot(df,aes(x = Height, y = Weight)) +
  geom_point(aes(color = factor(Index)),size = 2) +
  geom_smooth(se = F, aes(color = factor(Index)))

ggplotly(p_index)

