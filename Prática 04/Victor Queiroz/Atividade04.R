#Load library ISwr
library(ISwR)
#Attach Data Set of Library ISwr
attach(rmr)
#Seeing variables
names(rmr)
#Verify the Model Linear 
lm(metabolic.rate~body.weight)
#Verify model Linear
summary(lm(metabolic.rate~body.weight))
#Graphic of Points
plot(body.weight,metabolic.rate)
#Estimated regression line
abline(lm(metabolic.rate~body.weight))
#waste and estimated values
lm.velo <-lm(metabolic.rate~body.weight)
#Difference between the values estimated and observed
resid(lm.velo)
#Analyzing the data
list(rmr)
#Graphic of Points
plot(body.weight,metabolic.rate)
#Line
lines(body.weight,fitted(lm.velo))
#workend without the data
options(na.action = na.exclude)
#Updates the data for the R understand what was deleted the data 
lm.velo <-lm(metabolic.rate~body.weight)
#Recalculate the values, deleted the data missing
fitted(lm.velo)
#Graphics of values observed connecteds the straight
segments(body.weight,fitted(lm.velo),body.weight,metabolic.rate)
abline(lm(metabolic.rate~body.weight))