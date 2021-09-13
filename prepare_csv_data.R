
library(MplusAutomation)
library(tidyverse)
library(here)

lsay_data <- read.delim(here("data","lsaysubset.txt"), header = FALSE, na=c("9999")) %>% 
  select(1:8,49,466:475) %>% 
  `colnames<-`(c(
    'rand', 'LSAYID', 'REGION', 'URBAN', 'GENDER', 'MOTHED', 'FATHED', 'RACETH', 'EMTHIRTN',
    'ca28ar', 'ca28br', 'ca28cr', 'ca28hr', 'ca28ir', 'ca28kr', 'ca28lr', 'ca28er',
    'ca28fr', 'ca28gr')) %>% 
  relocate(ca28ar, ca28br, ca28cr, ca28er, ca28gr, ca28hr, ca28ir, ca28kr, ca28lr,
           .after="EMTHIRTN") %>% 
  select(-ca28fr) %>% 
  rename("gender"=GENDER,"math_irt"=EMTHIRTN, "enjoy"=ca28ar, "good"=ca28br, "undrstnd"=ca28cr, "nervous"=ca28er,
         "scared"=ca28gr, "useful"=ca28hr, "logical"=ca28ir, "job"=ca28kr,
         "adult"=ca28lr)

write_csv(lsay_data, here("data", "lsay_subset.csv"))
