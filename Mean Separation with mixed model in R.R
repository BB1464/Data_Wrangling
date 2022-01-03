library(emmeans)
library(lmerTest)
library(multcompView)
library(lme4)
library(nlme)
library(dplyr)

dat <- Oats


model <- lmer(yield~nitro+Variety+(1|Variety),data=dat)
anova(object = model,type = 3,ddf ='Kenward-Roger' )




# Mean Seperation with emmeans --------------------------------------------



lsmeans <- emmeans(model,'Variety')

pairs(lsmeans)


#multcomp::cld(lsmeans,reverse=T,letters=letters,adjust='none')


# install multcomp package in R -------------------------------------------



# Compact Letter display with multcomp package in R -----------------------




multcomp::cld(object = lsmeans,reversed=TRUE,alpha=0.05,Letters=letters,adjust='none')
