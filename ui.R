if(!require("shiny")) {
  install.packages("shiny")
  require("shiny")
}

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  

  # Application title
  titlePanel("Goldilocks decision model"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(h4("Parameters"),
                 br(),
                 p("Provide typical probabilities for your species of interest."),
                 br(),
      sliderInput("s",
                  "Survival:",
                  min = 0,
                  max = 1,
                  value = 0.30),
      sliderInput("g0",
                  "Transformation efficiency:",
                  min = 0,
                  max = 0.2,
                  value = 0.010),
      br(),
      p("Adjust the number of injections until the probability distribution of getting the desired number of lines is ",
        strong("just right",style = "color:blue"),"."),
      br(),
      sliderInput("inj",
                  "Number of injections:",
                  min = 500,
                  max = 2000,
                  value = 1000),
      submitButton("Run simulation"),
      br(),
      br(),
      #img(src = "oxitecLogo.png", height = 72, width = 72),
      "Developed by ",
           span("Matthew Gregory.", style = "color:blue")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
