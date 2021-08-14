install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(janitor)
library(skimr)
library(here)
# clening the enviroment
rm(list= ls())
#loading file
df1<- read.csv("R/Data/2020_05_trip_data.csv")
df2 <- read.csv("R/Data/2020_06_trip_data.csv")
df3 <- read.csv("R/Data/2020_07_trip_data.csv")
df4 <- read.csv("R/Data/202008-divvy-tripdata.csv")
df5 <- read.csv("R/Data/202009-divvy-tripdata.csv")
df6 <- read.csv("R/Data/202010-divvy-tripdata.csv")
df7 <- read.csv("R/Data/202011-divvy-tripdata.csv")
df8 <- read.csv("R/Data/202012-divvy-tripdata.csv")
df9 <- read.csv("R/Data/202101-divvy-tripdata.csv")
df10 <- read.csv("R/Data/202102-divvy-tripdata.csv")
df11 <- read.csv("R/Data/202103-divvy-tripdata.csv")
df12 <- read.csv("R/Data/202104-divvy-tripdata.csv")
#combing the 12 data-frame into single 1 data-frame
bike_data<- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)
# looking for missing data
remove_empty(bike_data, which = c("rows","cols"))
#overview of the bike_data
glimpse(bike_data)
#converting data time to date time
bike_data$started_at <- ymd_hms(bike_data$started_at)
bike_data$ended_at <-ymd_hms(bike_data$ended_at)
#creating hour
#bike_data$started_time <- hour(bike_data$started_at)
#bike_data$ended_time <- hour(bike_data$ended_at)
bike_data$started_hour <- hour(bike_data$started_at)
bike_data$ended_hour <- hour(bike_data$ended_at)
glimpse(bike_data)
remove_empty(bike_data, which = c("rows","cols"))
glimpse(bike_data)
#converting date
bike_data$started_date <- as.Date(bike_data$started_at)
bike_data$ended_date <- as.Date(bike_data$ended_at)
glimpse(bike_data)
#Analyzing
bike_data %>% count(ended_hour, sort = T) %>% 
  ggplot()+geom_line(aes(x=ended_hour,y=n))
