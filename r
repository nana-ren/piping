#TASK: run the code below to get and save the dataset
download.file(url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", destfile = "airline_safety.csv")
#Then you need to name your dataset
airline_safety<- read.csv("airline_safety.csv")

#TASK: take a look at the airline safety data. 
head(airline_safety, 10)
dim(airline_safety)
glimpse(airline_safety)
#TASK: Install and call the dplyr package. 
library(dplyr)

#Let's make a random sample of our data and save it
mysample<-sample_n(airline_safety, size=15, replace = FALSE, weight = NULL, .env = NULL)

#TASK: Save the new sample as a csv file
write.csv(mysample,'file.csv')

#Now let's have some fun with *piping*

#we will use our mysample dataset
#The pipe, %>%, comes from the magrittr package. 
#Packages in the tidyverse (like dplyr) load %>% for you automatically, 
#so you don’t usually load magrittr explicitly.

#Example: Let's try some piping with our mysample data. Note how the dataset name is not repeated in each function
piping<-mysample %>% 
  mutate (seats = avail_seat_km_per_week) %>%
  subset(incidents_85_99 < 24) %>%
  dim()%>%
  print()

#TASK: revise this code chunk using piping

piping<-mysample %>%
  arrange(mysample, airline) %>%
  subset(incidents_85_99 < 25) %>%
  mutate (seats = avail_seat_km_per_week) %>%
  select(incidents_00_14, incidents_85_99) %>%
  summary(mysample) %>%
  print()
  
  
