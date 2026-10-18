cohort<- paste0("p", 1:20)
treatment<- rep(c("Drug", "Placebo"), each = length(cohort)/2)
random_list <- sample(treatment)
assignment<- data.frame(Participant = cohort, Treatment = random_list)
assignment
