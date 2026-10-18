set.seed(2)

b<- rnorm(50, mean=10, sd=1)
shapiro.test(b)

set.seed(2)
df <- data.frame(
  treatment=factor(rep(c("Control", "Intervention"), each=50)),
  measurement=(c(rnorm(50, mean=121, sd=0.5),
                 rnorm(50, mean=94, sd=0.5)))
)

new.data<- df %>%
  filter(treatment =="Control" | treatment == "Intervention")
t_test<- t.test(measurement ~ treatment, data = new.data)
t_test