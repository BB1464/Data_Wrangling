
# Import the library ------------------------------------------------------

library(ggplot2)


data("diamonds")

ggplot(data = diamonds,
       mapping = aes(x = price,y = depth,col=cut))+
  geom_point()+
  geom_smooth()+
  facet_grid(~cut)+
  theme(legend.position = '')


ggplot(data=diamonds,aes(x = cut,y = price))+
  geom_boxplot(outlier.colour = 'green',col='blue')




# Import new dataset ------------------------------------------------------

data("mtcars")
View(mtcars)

library(tidyverse)

mtcars_new <- mtcars %>% 
  mutate(across(.cols = c(vs,am,gear,carb),.fns = factor))


mtcars %>% 
  mutate_at(.vars = c('vs','am','gear','carb'),.funs = factor)


ggplot(data = mtcars_new,
       mapping = aes(x = mpg,y = wt,col=vs,shape=am))+
  geom_point()+
  geom_smooth(se=FALSE)+
  labs(y='Weight',x='Miles per gallon',caption = 'Fig 1: Fuel millage of Motor Trends')+
  theme_classic()+
  theme(text = element_text(family = 'serif',face = 'bold',size = 15),plot.title = element_text(hjust = 0.5),
        axis.ticks = element_line(size = 1),
        axis.line = element_line(size = 1))
  

# Bar Plot  ---------------------------------------------------------------

ggplot(data = mtcars_new,mapping = aes(x = gear,y = mpg,fill=carb))+
  geom_col(position = position_dodge())+
  theme_classic()+
  coord_cartesian(expand = c(0,0))


# How to supply manual colors to fill the bar plot


# Histogram and Density Plot ----------------------------------------------

ggplot(data = mtcars_new,
       mapping = aes(x = mpg,fill=am))+
  geom_histogram(binwidth = 1)+
  facet_grid(~gear)



# Density Plot -------------------------------------------------------

ggplot(data = mtcars_new,
       mapping = aes(x = mpg,fill=am))+
  geom_density()+
  theme_classic()+
  coord_cartesian(expand = c(0,0))
