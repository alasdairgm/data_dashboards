server <- function(input, output, session) {
  
  
  lego_data_filtered <- reactive({
    lego %>% 
      filter(theme_name == input$theme)
  })
  
  
  ### tab 1 ####
  output$rating_plot <- renderPlot({
    lego_data_filtered() %>% 
      ggplot(aes(x = star_rating)) +
      geom_histogram(fill = "indianred") +
      labs(x = "Rating",
           y = "Number of sets in theme\n"
      ) +
      xlim(1, 5.1) +
      theme_minimal() +
      theme(axis.text = element_text(size = 15, face = "bold"),
            axis.title = element_text(size = 18, face = "bold"))
    
  }
  )
  
  output$price_plot <- renderPlot({
    lego_data_filtered() %>% 
      ggplot(aes(x = list_price, y = star_rating)) +
      geom_point(col = "steelblue", size = 6) +
      geom_smooth(method = "lm", se = FALSE) +
      labs(x = "Set price ($)",
           y = "Rating\n"
      ) +
      theme_minimal() +
      theme(axis.text = element_text(size = 15, face = "bold"),
            axis.title = element_text(size = 18, face = "bold"))
    
  }
  )

  output$lego_table <- DT::renderDataTable({
    lego_data_filtered() %>% 
      select(-country, -play_star_rating, -theme_name, -val_star_rating)
  })
  
  ### tab 2 ###
  output$av_rating_plot <- renderPlot({
    if (input$plot_type == "Simple bar chart"){
      lego %>% 
        group_by(theme_name) %>% 
        summarise(av_rating = mean(star_rating, na.rm = TRUE)) %>% 
        mutate(theme_name = fct_reorder(theme_name, av_rating)) %>% 
        ggplot() +
        geom_col(aes(x = theme_name, y = as.numeric(av_rating)), fill = "indianred") +
        labs(y = "Average set rating (stars)",
             x = "Theme",
             subtitle = "Lego themes arranged by mean star rating") +
        theme_minimal() +
        coord_cartesian(ylim = c(4, 5)) +
        theme(axis.text = element_text(size = 7, face = "bold", hjust = 1, angle = 45),
              axis.title = element_text(size = 12, face = "bold"),
              title = element_text(size = 14, face = "bold"))
    }
    
    else{
      lego %>% 
        mutate(theme_name = fct_reorder(theme_name, star_rating, median,  na.rm = TRUE)) %>% 
        ggplot(aes(x = theme_name, y = star_rating)) +
        geom_boxplot(fill = "goldenrod", col = "black") +
        stat_boxplot(geom = "errorbar") +
        labs(y = "Set rating (stars)",
             x = "Theme") +
        theme_minimal() +
        # coord_cartesian(ylim = c(4, 5)) +
        theme(axis.text = element_text(size = 6, face = "bold", hjust = 1, angle = 45),
              axis.title = element_text(size = 12, face = "bold"),
              title = element_text(size = 14, face = "bold")) +
        labs(subtitle = "Lego themes arranged by median star rating") 
      
    }
    
  }
  )
  
  output$av_rating_plot_zoomed <- renderPlot({
    if (input$plot_type == "Simple bar chart"){
      lego %>% 
        filter(theme_name %in% best_sets) %>% 
        group_by(theme_name) %>% 
        summarise(av_rating = mean(star_rating, na.rm = TRUE)) %>% 
        mutate(theme_name = fct_reorder(theme_name, av_rating)) %>% 
        ggplot() +
        geom_col(aes(x = theme_name, y = as.numeric(av_rating)), fill = "indianred") +
        labs(y = "Average set rating (stars)",
             x = "Theme",
             subtitle = "Top Lego themes* arranged by mean star rating") +
        theme_minimal() +
        coord_cartesian(ylim = c(4, 5)) +
        theme(axis.text = element_text(size = 9, face = "bold", hjust = 1, angle = 45),
              axis.title = element_text(size = 12, face = "bold"),
              title = element_text(size = 14, face = "bold"))
    }
    
    else{
      lego %>% 
        filter(theme_name %in% best_sets) %>% 
        mutate(theme_name = fct_reorder(theme_name, star_rating, median,  na.rm = TRUE)) %>% 
        ggplot(aes(x = theme_name, y = star_rating)) +
        geom_boxplot(fill = "goldenrod", col = "black") +
        stat_boxplot(geom = "errorbar") +
        labs(y = "Set rating (stars)",
             x = "Theme") +
        theme_minimal() +
        # coord_cartesian(ylim = c(4, 5)) +
        theme(axis.text = element_text(size = 9, face = "bold", hjust = 1, angle = 45),
              axis.title = element_text(size = 12, face = "bold"),
              title = element_text(size = 14, face = "bold")) +
        labs(subtitle = "Top Lego themes* arranged by median star rating") 
      
    }
    
  }
  )
  
  
  ### tab 3 ###
  output$legoland_plot <- renderLeaflet({
    leaflet(legoland_geo) %>% 
      addProviderTiles(providers$Stamen.Watercolor)  %>% 
      addCircleMarkers(lat = ~lat, lng = ~long,
                       label = ~htmlEscape(str_c("Legoland ", name)),
                       color = "yellow", fillColor = "yellow", fillOpacity = 0.8)
  })
  
}
