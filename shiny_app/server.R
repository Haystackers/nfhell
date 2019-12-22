nfl_pbp_2018 <- read.csv("~/git/nfhell/data/csv/2018/pbp-2018.csv", na.strings = c("", " ", NA)) %>% 
  select(-c('X', 'X.1', 'X.2', 'X.3','Description'))

games <- nfl_pbp_2018 %>% 
  select(GameDate, OffenseTeam, DefenseTeam) %>% 
  drop_na() %>% 
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
  output$game_date <- selectInput("game_date", "Game date:",
              choices = games$GameDate
  )
  
  output$game_teams <- selectInput("game_offense", "Game date:",
              choices = games[games$GameDate == input$game_date]$OffenseTeam
  )
}