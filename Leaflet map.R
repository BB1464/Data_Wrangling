library(leaflet)
library(spData)
library(ggplot2)
library(dplyr)

data("world")
class(world)

 
  leaflet(world) %>% 
  addTiles() %>% 
  addPolygons(group = 'name_long',label = ~name_long,highlight=highlightOptions(weight = 5,color ='red',fillOpacity = 0.7,bringToFront = TRUE))

  
# Second Approach  
leaflet(world) %>% 
addTiles() %>% 
addPolygons(color='name_long',group = 'name_long',label = ~name_long,highlight=highlightOptions(weight = 5,color ='red',fillOpacity = 0.7,bringToFront = TRUE))
  
  
  