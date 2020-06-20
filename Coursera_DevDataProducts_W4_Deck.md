Developing Data Products, Shiny App, Pitch Deck
========================================================
author: Thomas Goeppert
date: June 21th 2020
autosize: true


Task
========================================================

This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.


Shiny App created
========================================================

In this app you can choose the max. price you can affort for a diamond.
The plot will filter to all diamonds available in this price range

Code for UI
========================================================


```r
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
```

Code for Server
========================================================


```r
# Define server logic required to draw create the Diamonds PlotLy

server <- function(input, output) {
# Select the Input from the slider and filter the data set  
  output$DMplot <- renderPlotly({
    daffortable <- diamonds %>% 
      filter(price < input$Slider)
# Create plot based on the filter above
    ggplotly(qplot(carat, price, data = daffortable, color = color,
                   geom=c("point")))
  })
}
```

