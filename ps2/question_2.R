library("tidyverse")
library("estimatr")
tn_star <- read.csv("TN_STAR_reduced.csv")
tn_star %>%
  group_by(treat) %>%
  summarise(n=n(), min=min(math_score), mean=mean(math_score),
            sd=sd(math_score), max=max(math_score))
lm_robust(math_score ~ treat, data = tn_star)
control_group <- tn_star$math_score[tn_star$treat == 0]
treatment_group <- tn_star$math_score[tn_star$treat == 1]
t_test_result <- t.test(treatment_group, control_group)
print(t_test_result)
