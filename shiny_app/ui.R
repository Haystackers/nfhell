source('~/git/nfhell/shiny_app/server.R')

ui <- pageWithSidebar(
  
  titlePanel("NFL Play-by-Play Data for the 2018-19 Season"),
  
  sidebarPanel(
    inputPanel(
      shiny::uiOutput("game_date"),
      shiny::uiOutput("game_teams")
    ),
    # tabsetPanel(
    #   tabPanel("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    #   tabPanel("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
    #            badgeColor = "green"
    #   ),
    #   tabPanel("Charts", icon = icon("bar-chart-o")),
    #   tabPanel("Source code for app", icon = icon("file-code-o"),
    #            href = "https://github.com/rstudio/shinydashboard/blob/gh-pages/_apps/sidebar/app.R"
    #   )
    # ),
    # sliderInput("threshold", "Threshold:", 1, 20, 5),
    # textInput("text", "Text input")
  ),
  
  mainPanel(
    dataTableOutput("dt")
  )
)