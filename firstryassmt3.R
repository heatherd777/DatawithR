library(readxl)
library(tidyverse)


Data_Wrangle_Plot_Assmt_3 <- read_excel("Documents/collegeworks/UF MS Microbio/Data Analysis/Data_Wrangle_Plot_Assmt_3.xlsx")
View(Data_Wrangle_Plot_Assmt_3)

Microbial_Curve <- Data_Wrangle_Plot_Assmt_3 %>%
  select(Time_hours, Microbe_1_r1, Microbe_1_r2, Microbe_1_r3,
         Microbe_2_r1, Microbe_2_r2, Microbe_2_r3, Microbe_3_r1, 
         Microbe_3_r2, Microbe_3_r3) %>%
  mutate(
    M1 = sd(c(Microbe_1_r1, Microbe_1_r2, Microbe_1_r3))/sqrt(3),
    M2 = sd(c(Microbe_2_r1, Microbe_2_r2, Microbe_2_r3))/sqrt(3),
    M3 = sd(c(Microbe_3_r1, Microbe_3_r2, Microbe_3_r3))/sqrt(3)
  )
Microbial_Curve

#Microbe 1
ggplot(data = Microbial_Curve) +
  geom_point(aes( x = Time_hours, 
                  y = (Microbe_1_r1 + Microbe_1_r2 + Microbe_1_r3)/3, 
                  color = "Microbe 1" )) + 
  geom_line(aes( x = Time_hours, 
                 y = (Microbe_1_r1 + Microbe_1_r2 + Microbe_1_r3)/3, 
                 color = "Microbe 1")) +
  geom_errorbar((aes(x = Time_hours, ymin = )))
#Microbe 2
  geom_point(aes( x = Time_hours, 
                y = (Microbe_2_r1 + Microbe_2_r2 + Microbe_2_r3)/3, 
                color = "Microbe 2" )) + 
  geom_line(aes( x = Time_hours, 
                 y = (Microbe_2_r1 + Microbe_2_r2 + Microbe_2_r3)/3, 
                 color = "Microbe 2")) +
#Microbe 3
  geom_point(aes( x = Time_hours, 
                  y = (Microbe_3_r1 + Microbe_3_r2 + Microbe_3_r3)/3, 
                  color = "Microbe 3" )) + 
    geom_line(aes( x = Time_hours, 
                   y = (Microbe_3_r1 + Microbe_3_r2 + Microbe_3_r3)/3, 
                   color = "Microbe 3")) +

xlab("Time (h)") +
ylab("log No. of cells") +
scale_color_manual(values = c("Microbe 1" = "blue", 
                              "Microbe 2" = "red", "Microbe 3" = "green"))

               
               



