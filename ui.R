
# Developing Data Products - Week 4 - Shiny App
# Thomas Goeppert
# June 21th 2020

library(shiny)
library(plotly)
library(tidyverse)

# Define UI for application to selcect price and print plot

ui <- fluidPage(
  
  # Application title
  
  titlePanel("Which diamonds can you affort"),
  
  # Sidebar with a slider input for the maximum Price
  sidebarLayout(
    sidebarPanel(
      sliderInput("Slider",
                  "Select the max. price",
                  min = min(diamonds$price),
                  max = max(diamonds$price),
                  value = 750)
      
    ),
    
    # Show a plot of available Diamonds in price range
    mainPanel(
      plotlyOutput("DMplot")
      
    )
  )
)