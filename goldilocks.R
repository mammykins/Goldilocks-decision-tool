#program: goldilocks.R
#Provide an empirically derived discrete probability distribution
#of the number of independent transgenic
#lines produced from inj micro-injections,
#with s (survival) and g0 (transgenic efficiency) user defined.

rm(list = ls()) #clear workspace
#setwd("C://Users//mwg//Documents//R//phd//goldilocks") #set wd
#getwd() #check wd has been changed, make sure file is here

if(!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}

#set.seed(1337) #for reproducible results set seed

#first need to define the nested functions
#user input is the number of injections, inj, the transformation efficiency
#and the survival

#####################
##################### Microinjection one embryo

injection <- function(s=s)
#function to sample one of two states, dead (0) or alive (1)
{
  u <- runif(n=1)
if (u < s) {
state <- 1
}
else {
  state <- 0
}
#show(state)
}

################################
################################ Trangenesis status of offspring
#derived from one microinjected embryo
#the meaning of state changes given the context, 
#where it is in the function

#transgenesis, takes the state of the embryo 
#and convert to transgenic status with probability g0
transgenesis <- function(s=s,g0=g0)
{
  state <- injection(s=s) #use injection function to define egg state, dead or alive
  u <- runif(n=1) #assign random number
  #show(u)
  if (state == 0){
    state <- 0
    } else if (u > g0){
      state <- 0
    } #state has to be 1 to get this far, state is changed to 0 if u is greater than g0 threshold, state remains 1 if u < g0
#show(state)
state
}
  
##########################################
##########################################
#repeat transgenesis inj times and record state in a vector, n
injections <- function(s=s,g0=g0,inj=inj)
{
n <- rep(0,inj) #pre-allocate vector
for(i in 1:inj) {
  n[i] <- transgenesis(s=s,g0=g0)
  }
#show(n)
n <- n #lexical scoping, need to assign it here
#class(n)
}  

##########################################
##########################################
#repeat injections B times and draw ecdf or discrete prob distribution
goldilocks <- function(s=0.3,g0=0.01,inj=500,B=150) {
  X <- rep(0,B) #pre-allocate vector
  for(i in 1:B) {
    X[i] <- sum(injections(s=s,g0=g0,inj=inj))
  }
  #show(table(X))
      
  x <- seq(from=0, to=10, by=1) #should make it adjust scale as appropraite really...
  y <- c(length(X[X==0])/B,length(X[X==1])/B,
         length(X[X==2])/B,length(X[X==3])/B,
         length(X[X==4])/B,length(X[X==5])/B,
         length(X[X==6])/B,length(X[X==7])/B,
         length(X[X==8])/B,length(X[X==9])/B,
         length(X[X>=10])/B
         )
  df <- data.frame(cbind(x,y))
  colnames(df) <- c("lines", "prob")
  
g <- ggplot(df, aes(lines, prob, ymin=0, ymax=prob))+
  geom_point(color="black")+
  labs(x="Number of independent transgenic lines", y="Relative Frequency")+
  theme(axis.text.x=element_text(angle=0, size=15, vjust=0.5)) +
  theme(axis.text.y=element_text(angle=0, size=15, vjust=0.5)) +
  scale_x_continuous(breaks=0:10) +
  theme_bw() +
  theme(
    axis.title.x = element_text(color="black", vjust=-0.35,face="bold"),
    axis.title.y = element_text(color="black", vjust=0.8,face="bold")
    ) +
  ylim(c(0,1))+
  geom_linerange(colour="black",size=0.5) #adds vertical lines, ymin and max given earlier

g

}
  
  
