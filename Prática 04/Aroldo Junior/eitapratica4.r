require(ISwR)
require(dplyr)
require(caret)

attach(rmr)
names(rmr)

# -------------------------------------------------------------------------- #
  
lm.rmr <- lm(body.weight~metabolic.rate)
plot(body.weight~metabolic.rate)
abline(lm.rmr)

# -------------------------------------------------------------------------- #

resid(lm.rmr)
options(lm.rmr)
list(rmr)
options(na.action = na.exclude)
plot(body.weight~metabolic.rate)
  
# -------------------------------------------------------------------------- #
    
lm.rmr <- lm(body.weight~metabolic.rate)
fitted(lm.rmr)
lines(metabolic.rate, fitted(lm.rmr))
segments(metabolic.rate, fitted(lm.rmr), metabolic.rate, body.weight)
abline(body.weight~metabolic.rate)