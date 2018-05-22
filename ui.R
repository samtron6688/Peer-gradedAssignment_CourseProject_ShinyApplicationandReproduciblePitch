# Title: Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch
 
# Purpose: Define UI for the application, which is to determine the best car for a trip. The mtcars dataset from R is used 

# Load R libraries
library(shiny)
library(markdown) 

# Main code
shinyUI(navbarPage("Determine the best car for a trip", 
   tabPanel("Table", 
            sidebarLayout(
            sidebarPanel(
                   helpText("Info on the trip and car characteristics"), 
                   numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000), 
                   numericInput('cost', 'Gasoline Price (per gallon):', 2.31, min = 2, max = 5, step = 0.01), 
                   numericInput('gas', 'Maximum expenditure on gasoline:', 60, min = 1, max = 1000), 
                   checkboxGroupInput('cyl', 'Number of cylinders:', c("Four" = 4, "Six" = 6, "Eight" = 8), selected = c(4, 6, 8)), 
                   sliderInput('disp', 'Displacement', min = 70, max = 480, value = c(70, 480), step = 10), 
                   sliderInput('hp', 'Gross horsepower', min = 50, max = 340, value = c(50, 340), step = 10), 
                   checkboxGroupInput('am', 'Transmission:', c("Automatic" = 0, "Manual" = 1), selected = c(0, 1)) 
                   ), 
           mainPanel(
                   dataTableOutput('table')
                   )
           )
           ),
   tabPanel("Readme",
            mainPanel(
                    includeMarkdown("readme.Rmd")
                    )
            )
   )
   )    