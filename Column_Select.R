library(readxl)
library(readr)
library(tidyverse)

UNT20_Table_1 <- read_csv("Documents/collegeworks/UF MS Microbio/Data Analysis/egrid2020_data/UNT20-Table 1.csv")
View(UNT20_Table_1)

UNT20<- UNT20_Table_1 %>% 
  select('Plant state abbreviation', 
         'Unit unadjusted annual SO2 emissions (tons)', 
         'Unit unadjusted annual CO2 emissions (tons)', 
         'Unit unadjusted annual Hg emissions (lbs)')%>%
  filter('Unit unadjusted annual SO2 emissions (tons)' !="NaN",
         'Unit unadjusted annual SO2 emissions (tons)' !="NA" )

is.numeric(UNT20$'Unit unadjusted annual SO2 emissions (tons)')
UNT20$'Unit unadjusted annual SO2 emissions (tons)'<-as.numeric(UNT20$'Unit unadjusted annual SO2 emissions (tons)')

mean_So2 <- UNT20 %>%
  rename(State = 'Plant state abbreviation', 
         SO2 = 'Unit unadjusted annual SO2 emissions (tons)', 
         CO2 ='Unit unadjusted annual CO2 emissions (tons)', 
         Hg='Unit unadjusted annual Hg emissions (lbs)') %>%
  group_by(State) %>%
  summarise('Mean SO2' = mean(SO2, na.rm = TRUE))

