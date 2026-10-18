set.seed(2)
df <- data.frame(
  treatment=factor(rep(c("T1", "T2", "T3"), each=50)),
  measurement=(c(rnorm(50, mean=121, sd=0.5),
                 rnorm(50, mean=94, sd=0.5),
                 rnorm(50, mean = 90, sd=1)))
)

library(agricolae)
model<- aov(measurement ~ treatment, data = df)
model
summary(model)
#Tukey
tukey_results<- HSD.test(model, "treatment", group = TRUE)
print(tukey_results$groups)
shapiro.test(residuals(model))