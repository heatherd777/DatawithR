set.seed(2112)
df <- data.frame(measurement=round((rnorm(50, mean=55, sd=3))))
shapiro.test(df$measurement)

library(pwr)
power<- pwr.t.test(n=, d = 1, sig.level = 0.05, power = 0.8, type = c("two.sample"))
power
