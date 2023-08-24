ui <- dashboardPage(
  dashboardHeader(
        title = "Lego dashboard"
  ), ## adds a header
  dashboardSidebar(
    sidebarMenu(
      menuItem("Set ratings exploration", tabName = "Set ratings", icon = icon("magnifying-glass-chart")),
      menuItem("Average ratings", tabName = "Average ratings", icon = icon("ranking-star")),
      menuItem("Legoland locations", tabName = "Legoland locations", icon = icon("map"))
    )
  ), ## adds a sidebar
  
  dashboardBody(
    tabItems(
      # tab 1 is to show ratings and prices
                tabItem(tabName = "Set ratings", 
                         br(),
                         fluidRow(
                           column(
                             6,
                             box(
                             selectInput(
                               inputId = "theme",
                               label = "Which Lego theme?",
                               choices = unique(lego$theme_name)
                             )
                             )
                           ),
                         ),
                         # add a button to delay execution until we've selected all our desired filters
                         actionButton(inputId = "update", label =  "Update Everything"),
                         tags$br(),
                         tags$br(),
                         fluidRow(
                           column(5, offset = 1, plotOutput("rating_plot")), # ratings histogram
                           column(5, plotOutput("price_plot"))  # ratings vs price scatterplot
                         ),
                         tags$br(),
                         tags$br(),
                         tags$br(),
                         fluidRow(
                           column(
                             12,
                             DT::DTOutput("lego_table") # data table
                           )
                         )
                ),
                ###### tab 2 - ratings by theme ######              
                tabItem(tabName = "Average ratings", 
                         br(),
                         fluidRow(
                           column(
                             4,
                             radioButtons(
                               inputId = "plot_type",
                               label = "Choose a plot type",
                               choices = c("Simple bar chart",  "Gnarly box plot")
                             )
                           )
                         ),
                         fluidRow(
                           column(width = 7,
                          plotOutput("av_rating_plot")
                           ),
                          column(width = 5,
                           plotOutput("av_rating_plot_zoomed")
                          )
                         ),
                         fluidRow(
                           column(width = 5,
                                  offset = 7,
                                  "*top 5 highest rated themes (including ties) with 5 or more sets")
                         )
                ),
                ###### tab 3 - legoland map ######
                
                tabItem(tabName = "Legoland locations", 
                         fluidRow(
                           column(
                             width = 8,
                             offset = 2,
                             br(),
                             h2("Legoland locations across the world"),
                             h4(" - click, drag, and zoom as you please")
                           )
                         ),
                         br(),
                         
                         fluidRow(
                           column(
                             width = 8,
                             offset = 2,
                             leafletOutput("legoland_plot") 
                           )
                         )
                )
    )
  )
)