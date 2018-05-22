# Title: Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch

# Purpose: Define server.R for the application, which is to determine the best car for a trip. The mtcars dataset from R is used 

# Load R libraries
library(shiny) 
library(datasets) 
library(dplyr) 

# Main code
shinyServer(function(input, output) { 
# Show the cars that satisfy the selected filters 
   output$table <- renderDataTable({ 
   disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1) 
   hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1) 
   data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,  
           GasolineExpenditure = input$dis/mpg*input$cost, 
           Cylinders = cyl, Displacement = disp, Horsepower = hp,  
           Transmission = am) 
   data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl,  
           Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am) 
   data <- mutate(data, Transmission = ifelse(Transmission == 0, "Automatic", "Manual")) 
   data <- arrange(data, GasolineExpenditure) 
   data
   }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30)) 
}) 
