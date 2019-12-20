source('~/git/nfhell/shiny_app/server.R')

ui <- pageWithSidebar(
  
  titlePanel("NFL Play-by-Play Data for the 2018-19 Season"),
  
  sidebarPanel(
    inputPanel(
      selectInput("game", "Game:",
        choices = games$GameDate
      )
    )
  ),
  
  mainPanel(
    dataTableOutput("dt")
  )
)