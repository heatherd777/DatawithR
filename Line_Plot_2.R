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

data_long <- data2[, -c(2:8, 10, 12)]%>%
  #data_long <- data_long %>%
    gather("Treatment", "ABS",-Time)

T1sd<- as.data.frame(data2[, 10])
colnames(T1sd) <- "sd"
T2sd<- as.data.frame(data2[, 12])
colnames(T2sd) <- "sd"
sd <- rbind(T1sd, T2sd)
data_long <- cbind(data_long, sd)

theme_set(theme_bw())
ggplot(data_long, aes(x=Time, y= ABS, color = Treatment)) +
  geom_errorbar(aes(ymin=ABS-sd, ymax=ABS+sd), width=.1) +
  geom_line() +
  geom_point()+
  labs( y = "O.D. (600 nm)")+
  labs(x = "Time (h)")






