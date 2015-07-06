# Goldilocks-decision-tool
‘Insect transformation with piggyBac: getting the number of injections just right’. 

An increasing number of insect laboratories worldwide are involved in the generation of transgenic lines, with many more attempting to do so for their chosen species. Historically such research has been somewhat hit-and-miss, with different laboratories putting different amounts of effort into this process. Given the qunatitative data that has been accrued other the years we can do better than that!

These data are integrated into a statistical model (using a bespoke Markov Chain Monte Carlo simulation) of the likelihood of success given various starting parameters. The model is available in an easy-to-use format (as an “app” in R using shiny), such that researchers starting out on a transgenic project can make predictions as to the likelihood of success given their starting conditions, and hence budget resources appropriately.

Researchers need an estimate of the probabilities of an embryo surviving injection as well as the transformation efficiency. If a researcher wishes to make 5 transgenic lines then they can use this information in conjunciton with this model to estimate how many injections will need to be carried out.

We think the predictive model could be very useful to a wide diversity of researchers in insect molecular biology, developmental biology, disease biology and genetics.

The app uses three files: goldilocks.R, server.R and ui.R that should be placed into the same folder.

Alternatively users can launch the app by running:

runGitHub( "Goldilocks-decision-tool", "mammykins")

Hope this helps in getting the number of injections just right!

