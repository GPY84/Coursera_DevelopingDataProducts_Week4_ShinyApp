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