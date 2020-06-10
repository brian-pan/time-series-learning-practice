library(astsa)
library(fGarch)
library(magrittr)
library(tidyverse)
library(vars)
library(forecast)
library(Metrics)
library(tseries)
#1
my_data = read_csv( "ontario_marriages.csv" ) 

toronto_data = my_data %>% 
  filter(YEAR > 1980, CITY == "TORONTO" ) %>% 
  arrange( YEAR, MONTH ) 

marriages = ts( toronto_data$COUNT, start=c(1980,1), frequency=12)
plot(marriages, type='o', pch=20)
acf(marriages)
# Use the ```window``` function to extract a subset of the series from Jan 1990 till Dec 2000, and plot it.
window( marriages, start = c(1990,1), end = c(2000, 12) )

N=500
W = ts(rnorm(N))
acf(W, main = "")

R = cumsum(W)
acf(R)

X = W + c( 0, W[-N])
acf(X)

#2
library(astsa)
plot( jj, type="o", pch =20)
Tm = as.vector( time(jj) )
Qr = as.factor( cycle(jj) )

out = lm( log(jj) ~ Tm + Qr -1 )
summary(out)