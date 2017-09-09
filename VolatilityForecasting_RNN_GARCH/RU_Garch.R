library(rugarch)
gjr.spec <- ugarchspec( # start ugarch specification
  variance.model = list(model = "gjrGARCH", # select Treshold-GARCH
                        garchOrder = c(1, 1)),# GARCH(1, 1), order c(1,1) is in fact the default
  mean.model = list(armaOrder = c(0, 0),
                    external.regressors = as.matrix(Returns_Data[, c("Return")])), 
  distribution.model = "sstd" # Student t as the conditional distribution
) # end  ugarch specification

gjr.spec # summary of the specification
sp.gjrfit <- ugarchfit(spec = gjr.spec, data = as.matrix(Returns_Data[, c("Return")])) 

sp.gjrfit 
str(sp.gjrfit)
