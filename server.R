if(!require("shiny")) {
  install.packages("shiny")
  require("shiny")
}

#define four functions used:injection,transgenesis,injections,goldilocks
source("goldilocks.R")


# Define server logic required to draw figure
shinyServer(function(input, output) {
  
  # Expression that generates a ggplot2 The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    inj <- input$inj
    s <- input$s
    g0 <- input$g0
    # carry out function
    set.seed(1337) #reproducible
    goldilocks(s=s,g0=g0,inj=inj,B=250) #B number of simulations
    
    # draw the plot by calling the goldilocks function which is in its own file goldilocks.R
   
  })
})
