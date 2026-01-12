
######## Welcome to Ankit Tutorial for R Shiny ###############
######################### Histogram ##########################
#open your R Studio 
#get the inbuild data set airquality

library(shiny)
data<-data(airquality)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Ozone level!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- airquality$Ozone 
    x    <- na.omit(x) #Remove all NA values from data frame
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "darkorange", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}

# Open your Shiny App ----
shinyApp(ui = ui, server = server)



