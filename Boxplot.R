library(readxl)
data <- read_excel("datasets/preterm_data.xlsx")

library(ggplot2)

new_labels<- c("1"= "Week 1", "2"= "Week 2", "3"="Week 3", "4"="Week 4")

p<- ggplot(preterm_data, aes(x=Phylum, y=Percentage))+
  geom_boxplot(outlier.shape = 2)+
  facet_wrap(~Week, scales="fixed", labeller = labeller(Week=new_labels))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face=c("italic")))+
  labs(y= "Relative abundance (%)")+
  geom_jitter(aes(color = Phylum))+
  theme(legend.position = "none")
  
p


       