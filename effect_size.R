#create variables from data, inputting vectors
#create a dataframe from data
#transform data from wide to long format
#make a boxplot
#add a p-value to boxplot
#perform a normality test to see if data is normally distributed
#added extra data points
#effect size is the size of difference of 2 groups, overlap = effect size
#full overlap is zero effect, no overlap is large effect size
#perform a power analysis

Glucose<- c(3.9, 4.0, 3.8)
Glycerol<- c(1, 1.1, 0.9)
b<- as.data.frame(cbind(Glucose, Glycerol))

library(tidyverse)

long<- gather(b, key = Treatments, value = Measurement, Glucose:Glycerol)
View(long)
theme_set(theme_bw())

plot<- ggplot(long, aes(x=Treatments, y=Measurement, fill=Treatments))+
  geom_boxplot(outlier.shape = 2)+
  #facet_wrap(~Week, scales="fixed", labeller = labeller(Week=new_labels))+
  #theme(axis.text.x = element_text(angle = 45, hjust = 1, face=c("italic")))+
  labs(y= "Oil Spreading Zone(cm)")+
  geom_jitter(aes(color = Treatments))+
  theme(legend.position = "none")
plot

library(ggpubr)
p1<- plot + stat_compare_means(method = "wilcox.test", label.y = 4.2, label.x = 1.3)
p1
#Normality test
hist(long$Measurement)

#Shapiro_wilk
shapiro.test(long$Measurement)
#p-value > 0.05 implying distribution of data are not significantly
#different from normal distribution. If > 0.05 we can assume normality.

#Power analysis
library(pwr)
power<- pwr.t.test(n=, d = 1, sig.level = 0.05, power = 0.7, type = c("two.sample"))
power
#t-tests
#the input you leave blank will be calculated
#following are t-test functions
#where n is the sample size and d is the effect size
#type indicates a one-sample test, two-sample test, or paired t-test
#a one sample t-test is to compare a single population to a single value
#a paired t-test is to compare a single population before and after an experiment
#two-sample test is when data of 2 samples are statistically independent






