# Define server logic required to draw create the Diamonds PlotLy

server <- function(input, output) {
  
  output$DMplot <- renderPlotly({
    daffortable <- diamonds %>% 
      filter(price < input$Slider)
    
    ggplotly(qplot(carat, price, data = daffortable, color = color,
                   geom=c("point")))
  })
}