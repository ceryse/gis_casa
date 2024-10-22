library(tidyverse)
library(sf)
library(janitor)

# read gender inequality index data
gii_data <- read_csv("gii_data.csv") %>%
  clean_names()

# read iso key
iso <- read_csv("iso.csv") %>%
  clean_names()

# read world countries geojson and merge with gender inequality index data
world_countries <- st_read("world_countries.geojson") %>%
  clean_names() %>%
  merge(., iso, by.x = "iso", by.y = "alpha_2_code") %>%
  merge(., gii_data, by.x = "alpha_3_code", by.y = "iso3") %>%
  mutate(., diff_2010_2019 = gii_2010 - gii_2019)





