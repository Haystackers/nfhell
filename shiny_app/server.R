library(tidyverse)

nfl_pbp_2018 <- read.csv("~/git/nfhell/data/csv/2018/pbp-2018.csv") %>% 
  select(-c('X', 'X.1', 'X.2', 'X.3'))

# glimpse(nfl_pbp_2018)

games <- nfl_pbp_2018 %>% 
  select(GameDate, OffenseTeam, DefenseTeam) %>% 
  unique() %>% 
  group_by(GameDate) %>% 
  mutate(
    n_games_on_this_date = n()
  ) %>% 
  ungroup()

server <- function(input, output) {
  output$dt <- renderDataTable(
    datatable(nfl_pbp_2018)  
  )
}
