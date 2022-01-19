# Dplyr library for data Manipulation 

library(dplyr)

# Select

# Filter



#   Select


# To select variable by Position
select(mtcars,-c(1:3))


# Helper functions that works with Select
select(mtcars,everything()) # This returns all the column in a data frame

select(mtcars,starts_with('dr'))

select(mtcars,ends_with('sec'))

?select


select(mtcars,last_col())


select(mtcars,contains('ar'))



# We can rename a column within select

rename(mtcars,Miles_Per_Gallon=mpg)




# Filter
? Filter
# Logical operators
#(<, <- ,>, >=, !=,  ==, |, & )
filter(mtcars,gear==3) # To select all row where gear == 3

filter(mtcars,gear%in%c(3,4))


filter(mtcars,gear==5)


filter(mtcars,mpg==21|mpg>=21)


mtcars %>% 
  select(everything()) %>% 
  filter(mpg==21|mpg>=21)



starwars
colSums(is.na(starwars))


starwars_data <- starwars %>% drop_na()

dat3 <- starwars %>% na.omit()


colSums(is.na(starwars_data))

starwars %>% filter(!is.na(height))


starwars %>% filter(across(.cols = everything(),.fns = ~!is.na(.)))




# Arrange -----------------------------------------------------------------
# Arrange help us to order our rows in accending order
starwars_data2 %>% arrange(height,mass)

# This help us to arrange rows in Descending order
starwars_data2 %>% arrange(desc(height))





# Group by ----------------------------------------------------------------

starwars_data2 %>% group_by(name) %>% 
  summarise(n=n())


starwars_data2 %>% 
  group_by(name) %>% 
  count(name)


starwars_data2 %>% 
  group_by(hair_color,skin_color) %>% 
  summarise(
    mean_height=mean(height),
    standard_dev=sd(height),
    variance=var(height),
    n()
    ) %>% 
  arrange(mean_height)




# Mutate ------------------------------------------------------------------

# This is used to create new column
starwars_data2 %>% 
  mutate(height_meters=height/100) %>% 
  relocate(height_meters)


# Transmute ---------------------------------------------------------------

# This returns a new column and drop the old colums
starwars_data2 %>% 
  transmute(mass=mass*10,height_meters=height/100)



# Summary of DPLYR Pipeline -----------------------------------------------

starwars %>% 
  select(
    everything()
    ) %>% 
  filter(
    across(
      cols = everything(),
      .fns = ~!is.na(.x)
      )) %>% 
  mutate(
    height_meters=height/100,
    mass=mass*10
  ) %>% 
  group_by(eye_color) %>% 
  summarise(
    mean_height=mean(height_meters),
            n=n()
            ) %>% 
  arrange(mean_height)
