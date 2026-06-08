#install.packages("haven")
#install.packages("tidyverse")
#install.packages("lavaan")
#install.packages("psych")
library(tidyverse)
library(haven)
library(lavaan)
library(psych)

#section on the DBSA scale
#data <- read_sav("Korea_Spring_Fall_2017 v5 (safe)+2018+2019+Spr2020 April 2023 fix.sav")
#dim(data)
#str(data)
#View(data)

#section on the PHQ data
dataPHQ <- read_sav("PHQ9 for DBSA_Depression_Adult_V1_regionalized_2023-03-08.sav", encoding = "latin1")

#dim(dataPHQ)
#View(dataPHQ)

#filtering for the people that took the scale to see their symptoms and not just to see the questions
clean_dataPHQ <- dataPHQ %>%
  filter(Whytaking_1 == 1 & is.na(Whytaking_3))

#filtering out people that have an "8" for status (who's to say, seems to be related to the year they took it)
clean_dataPHQ <- clean_dataPHQ %>% 
  filter(!(Status == 8))

#filtering out missing demographic data
clean_dataPHQ <- clean_dataPHQ %>% 
  filter(!(is.na(Age))) %>% 
  filter(!(is.na(Gender)))

#filtering out values 2 and 3 from Gender, as there is no way of knowing what they refer to - how to tell 
clean_dataPHQ <- clean_dataPHQ %>% 
  filter(Gender != 2) %>% 
  filter(Gender != 3)

#Recoding each of the Race columns into one categorical column
clean_dataPHQ$Race <- NA
clean_dataPHQ$Race <- factor(clean_dataPHQ$Race)
clean_dataPHQ <- clean_dataPHQ %>% 
  mutate(Race = case_when(Race_1 == 1 ~ "White", Race_2 == 1 ~ "African American", Race_3 == 1 ~ "Native American", Race_4 == 1 ~ "Asian/Pacific Islander", Race_5 == 1 ~ "Other", TRUE ~ NA_character_)) 
#NOTE: The data set allows for multiple selections, so I maybe should rewrite to account for that

#should I remove the people who took more than a few minutes to complete it? highest duration is 1 day...

#Removing useless columns and the phq1-9 columns in favor of the phq01-09 as the primary items
clean_dataPHQ <- clean_dataPHQ %>% 
  select(-c(StartDate, EndDate, Progress, Finished, RecordedDate, DistributionChannel, ResponseId, UserLanguage, seriousyn)) %>% 
  select(-c(phq1, phq2, phq3, phq4, phq5, phq6, phq7, phq8, phq9))

View(clean_dataPHQ)
dim(clean_dataPHQ)

