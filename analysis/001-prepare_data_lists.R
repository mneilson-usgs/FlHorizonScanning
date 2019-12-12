library(tidyverse)
library(readxl)
library(stringr)
library(rfishbase)

lemis_fish <- read_excel('./data/fish_lemis_purpose_of_import_matched.xls',
                         sheet = 'WoRMS match')

lemis_fish_filtered <- lemis_fish %>% 
  filter(str_detect(`scientific name`, ' ')) %>%
  filter(!str_detect(`scientific name`, 'sp.| sp ?|Various')) %>% 
  filter(!str_detect(replace_na(`Mandrak comment`, ''), 'Native|native')) %>%
  mutate(fb_names = map(`scientific name`, validate_names))

