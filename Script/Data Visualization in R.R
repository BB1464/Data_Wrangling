
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
