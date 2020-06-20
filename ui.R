
# Developing Data Products - Week 4 - Shiny App
# Thomas Goeppert
# June 6th 2020

library(shiny)
library(plotly)
library(tidyverse)
diamonds

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Which diamonds can you affort"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Slider",
                  "Select the max. price",
                  min = min(diamonds$price),
                  max = max(diamonds$price),
                  value = 750)
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("DMplot")
      
    )
  )
)