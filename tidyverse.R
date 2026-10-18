library(readr)
library(tidyverse)
metadata <- read_delim("Documents/collegeworks/UF MS Microbio/Data Analysis/metadata.txt", 
                         delim = "\t", escape_double = FALSE, trim_ws = TRUE)

covid<-metadata %>% 
  select(sample_name, host_age, host_sex) %>%
  filter(host_sex!="not applicable", host_sex!="control sample", host_sex!="not provided")

is.numeric(covid$host_age)
covid$host_age<- as.numeric(covid$host_age)

average_age <- covid %>%
  rename(Age=host_age, Sex=host_sex) %>%
  group_by(Sex) %>% 
  summarise(mean_age=mean(Age, na.rm = TRUE), SD=sd(Age, na.rm= TRUE))
covid %>% count(host_sex)
