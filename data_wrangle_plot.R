library(readxl)
library(tidyverse)


Data_Wrangle_Plot_Assmt_3 <- read_excel("Documents/collegeworks/UF MS Microbio/Data Analysis/Data_Wrangle_Plot_Assmt_3.xlsx")
View(Data_Wrangle_Plot_Assmt_3)

Microbial_Curve <- Data_Wrangle_Plot_Assmt_3 %>%
  select(Time_hours, Microbe_1_r1, Microbe_1_r2, Microbe_1_r3,
         Microbe_2_r1, Microbe_2_r2, Microbe_2_r3, Microbe_3_r1, 
         Microbe_3_r2, Microbe_3_r3) %>%
  rowwise() %>%
  mutate(M1 = mean(c(Microbe_1_r1, Microbe_1_r2, Microbe_1_r3))) %>%
  mutate(M1sd = sd(c(Microbe_1_r1, Microbe_1_r2, Microbe_1_r3))) %>%
  mutate(M2 = mean(c(Microbe_2_r1, Microbe_2_r2, Microbe_2_r3))) %>%
  mutate(M2sd = sd(c(Microbe_2_r1, Microbe_2_r2, Microbe_2_r3))) %>%
  mutate(M3 = mean(c(Microbe_3_r1, Microbe_3_r2, Microbe_3_r3))) %>%
  mutate(M3sd = sd(c(Microbe_3_r1, Microbe_3_r2, Microbe_3_r3)))

Microbial_Curve

#Plot
ggplot(data = Microbial_Curve, aes(x = Time_hours)) +
  
#Lines
  geom_line(aes(y= M1), color = "blue") +
  geom_line(aes(y= M2), color = "red") +
  geom_line(aes(y = M3), color = "green") +
              
#Error bars
  geom_errorbar(aes(ymin = M1 - M1sd, ymax = M1 + M1sd), width = .1 ) +
  geom_errorbar(aes(ymin = M2 - M2sd, ymax = M2 + M2sd), width = .1 ) +
  geom_errorbar(aes(ymin = M3 - M3sd, ymax = M3 + M3sd), width = .1 ) +
  
#Points        
  geom_point(aes(y = M1), color = "blue") +
  geom_point(aes(y = M2), color = "red") +
  geom_point(aes(y = M3), color = "green") +
 
#axix labels  
xlab("Time (h)") +
ylab("log No. of cells") 


               
               



