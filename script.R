rm(list=ls()) #clear previous stored variable
library(Hmisc) #import library

Data <- read.csv("C:/Users/paruj/Desktop/DA PROJECT/R/Covid 19 using r/COVID19_line_list_data.csv")
describe(Data)

Data$death_dummy = as.integer(Data$death !=0)#cleaning the data death column
sum(Data$death_dummy) / nrow(Data) #DEATH RATE 

#AGE 
#CLAIM IS THAT THE OLDER PEOPLE DIED

dead = subset(Data, death_dummy ==1)
alive = subset(Data, death_dummy ==0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

#RESULT if p-value is less than .05 it will reject null hypothesis
t.test (alive$age, dead$age, alternative = "two.sided", conf.level = .99 )

#gender effected more
men = subset(Data, gender=="male")
alive = subset(Data, gender=="female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

#RESULT if p-value is less than .05 it will reject null hypothesis
t.test (men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = .99 )
