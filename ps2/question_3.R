library("tidyverse")
library("estimatr")
gerber <- read.csv("Gerber_APSR_Reduced.csv")
lm_robust(vote ~ treat, data = gerber)
control_group <- gerber$vote[gerber$treat == 0]
treatment_group <- gerber$vote[gerber$treat == 1]
t_test_result <- t.test(treatment_group, control_group)
print(t_test_result)
