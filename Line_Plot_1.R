library(readxl)
growth_curve <- read_excel("Documents/collegeworks/UF MS Microbio/Data Analysis/growth_curve.xlsx", 
                           col_types = c("date", "numeric", "numeric", 
                                         "numeric", "numeric", "numeric", 
                                         "numeric"))

data<- growth_curve[c(4:13),]
colnames(data)<- c("hour", "T1R1", "T1R2", "T1R3", "T2R1", "T2R2", "T2R3" )
Time<- c(0:9)
data<- cbind(Time, data)

library(tidyverse)
data2<- data %>%
  rowwise() %>%
  mutate(T1=mean(c(T1R1, T1R2, T1R3)))%>%
  mutate(T1sd=sd(c(T1R1, T1R2, T1R3)))%>%
  mutate(T2=mean(c(T2R1, T2R2, T2R3)))%>%
  mutate(T2sd=sd(c(T2R1, T2R2, T2R3)))


theme_set(theme_bw())

p<- ggplot(data2, aes(x=Time, y= T1)) +
  geom_errorbar(aes(ymin=T1-T1sd, ymax=T1+T1sd), width=.1) +
  geom_line() +
  geom_point()

p2<- ggplot(data2, aes(x=Time)) +
  geom_line(aes(y=T1), color ="blue") +
  geom_line(aes(y=T2), color ="red") +
  geom_errorbar(aes(ymin=T1-T1sd, ymax=T1+T1sd), width=.1) +
  geom_errorbar(aes(ymin=T2-T2sd, ymax=T2+T2sd), width=.1) +
  geom_point(aes(y=T1), color="blue") +
  geom_point(aes(y=T2), color="red") +
  labs(y= "O.D. (600 nm)") +
  labs(x= "Time (h)")










