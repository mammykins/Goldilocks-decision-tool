# Goldilocks-decision-tool
‘Insect transformation with piggyBac: getting the number of injections just right’. 

An increasing number of insect laboratories worldwide are involved in the generation of transgenic lines, with many more attempting to do so for their chosen species. Historically such research has been somewhat hit-and-miss, with different laboratories putting different amounts of effort into this process. Given the qunatitative data that has been accrued other the years we can do better than that!

These data are integrated into a statistical model (using a bespoke Markov Chain Monte Carlo simulation) of the likelihood of success given various starting parameters. The model is available in an easy-to-use format (as an “app” in R using shiny), such that researchers starting out on a transgenic project can make predictions as to the likelihood of success given their starting conditions, and hence budget resources appropriately.

Researchers need an estimate of the probabilities of an embryo surviving injection (injection survivors / eggs injected) as well as the transformation efficiency (number of independent lines / injection survivors). If a researcher wishes to be 95% sure that they will make at least one transgenic line in diamondback moth, then they can use this information in conjunciton with this model to elucidate the number of injections that is just right.

We think the predictive model could be very useful to a wide diversity of researchers in insect molecular biology, developmental biology, disease biology and genetics.

The app uses three files: goldilocks.R, server.R and ui.R that should be placed into the same folder.

Alternatively users can launch the app by loading shiny in R and then running:

library(shiny)  
runGitHub( "Goldilocks-decision-tool", "mammykins")

The app has also been posted on the RStudio shiny servers for your convenience if you are new to R.   https://mammykins.shinyapps.io/App-gold

Hope this helps in getting the number of injections just right!

N.B. 10 transgenic lines on the x-axis represents 10 or greater.
