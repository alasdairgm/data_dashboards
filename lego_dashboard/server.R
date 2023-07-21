server <- function(input, output, session) {
  
  
## Data changes in correlation based on user input 'data_messiness'
  data_choice <- input$data_messiness
  browser()
  if (data_choice == "Low correlation"){
    slr_data_adjusted <- slr_data %>% 
      mutate(height = height + runif(nrow(slr_data), -1,1))
    
  }
  else if (data_choice == "Medium correlation"){
    slr_data_adjusted <- slr_data %>% 
      mutate(height = height + runif(nrow(slr_data), -15,15))
    
  }
  else{
    data_choice <- slr_data %>% 
           mutate(height = sample(height, size = nrow(slr_data)))
    
}
      
  


  output$height_vs_weight_plot <- renderPlot({
    slr_data_adjusted %>% 
      ggplot(aes(x = weight, y = height)) +
      geom_point(col = "steelblue", size = 6) +
      labs(x = "Weight (kg)",
           y = "Height (cm)"
      ) +
      #ylim(1, 5) +
      geom_smooth(method='lm', se = FALSE) +
      theme_minimal() +
      theme(axis.text = element_text(size = 15, face = "bold"),
            axis.title = element_text(size = 18, face = "bold"))
    
  }
  )
  
 
  
  
}
