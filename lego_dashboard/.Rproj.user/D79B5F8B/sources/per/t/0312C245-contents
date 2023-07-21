library(shiny)
library(tidyverse)
library(shinydashboard)
library(leaflet)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(htmltools)


## option 1: remove single-set Jurassic Park themes
# lego <- read_csv("data/lego_sets.csv") %>% 
#   select(-prod_long_desc) %>% 
#   mutate(theme_name_remove = str_detect(
#     theme_name, "Attack|Rampage|Transport|Pursuit|Breakout|Chase|Escape"
#     # theme_name, "Nothing"
#   )) %>% 
#   filter(country == "US",
#          theme_name_remove == 0) %>% 
#   relocate(set_name, .before = 1)

## option 2: group single-set Jurassic Park themes
lego <- read_csv("data/lego_sets.csv") %>% 
  select(-prod_long_desc) %>% 
  group_by(theme_name) %>% 
  mutate(theme_name = ifelse(str_detect(
    theme_name, "Attack|Rampage|Transport|Pursuit|Breakout|Chase|Escape"),
    'Jurassic Park', theme_name)) %>% 
  ungroup() %>% 
  filter(country == "US",
         theme_name != "BOOST") %>% 
  relocate(set_name, .before = 1)

lego_data2 <- lego 

# manually-created dataset on legoland locations
legoland_geo <- tibble(name = c("Windsor", "Billund", "California", "Florida", "New York", "Malaysia", "Dubai", "Japan", "Korea", "Germany"),
                       lat = c(51.46, 55.74, 33.13, 27.99, 41.38, 1.43, 24.92, 35.05, 37.88, 48.43),
                       long = c(-0.65, 9.13, -117.31, -81.69, -74.31, 103.63, 55.01, 136.84, 127.70, 10.30))
