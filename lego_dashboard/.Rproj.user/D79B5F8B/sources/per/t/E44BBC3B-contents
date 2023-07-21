ui <- dashboardPage(
  dashboardHeader(), ## adds a header
  dashboardSidebar(), ## adds a sidebar
  
  dashboardBody(
    tabsetPanel(type = "tabs",
                tabPanel("Star ratings",
                         fluidRow(
                           column(
                             6,
                             selectInput(
                               inputId = "theme",
                               label = "Which theme?",
                               # choices = str_to_title(unique(lego$theme_name))
                               choices = unique(lego$theme_name)
                             )
                           ),
                         ),
                         # add a button to delay execution until we've selected all our desired filters
                         actionButton(inputId = "update", label =  "Update Everything"),
                         tags$br(),
                         tags$br(),
                         fluidRow(
                           column(6, plotOutput("rating_plot")),
                           column(6, plotOutput("price_plot"))
                         ),
                         tags$br(),
                         tags$br(),
                         tags$br(),
                         fluidRow(
                           column(
                             12,
                             DT::DTOutput("lego_table")
                           )
                         )
                ),
                tabPanel("Average ratings",
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
                           plotOutput("av_rating_plot")  
                         ),
                         tags$br(),
                         fluidRow(
                           plotOutput("av_rating_plot_zoomed")
                         )
                ),
                
                tabPanel("Legoland locations",
                         
                         leafletOutput("legoland_plot")  
                )
    )
  )
)