# use this file as template for your work.
# lines 7 to 12 will be used to generate your dataset. 
# In line 7, change the numbers within the parenthesis to the number of your UF ID.
# e.g. set.seed(1234) - change to - set.seed(my UF ID number). 
#Please select lines 7 to 12 and run it.

set.seed(68681820)
df <- data.frame(
  treatment=factor(rep(c("Control", "Intervention"), each=50)),
  measurement=round(c(rnorm(50, mean=55, sd=3),
                   rnorm(50, mean=68, sd=3)))
)

#After running the code above with your UF ID you will get a dataframe called "df". The UF ID will be your generator number and 
#this will guarantee your dataset is different from any other. The boxplot will be similar but not exactly the same among students.

# Make the boxplot using the following parameters:
# 1- from your dataframe (df) use "treatment" in the x axis and "measurement" in the y axis. But, in the final figure change "measurement" to "Age (years)".
# 2- show the points representing the distribution of the data and color the points by treatment.
# 3- keep the boxes black and white
# 4- keep the x axis text horizontal (not at 45 degrees or any other inclination) and in regular font (not italic)
# 5- do not include a graph legend depicting the color of treatments.

library(ggplot2)
ggplot(df, aes(x = treatment, y = measurement))+
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 0, face =c("plain")))+
  labs(y= "Age(years)")+
  geom_jitter(aes(color = treatment))+
  theme(legend.position = "none")
 
  


  
  
  