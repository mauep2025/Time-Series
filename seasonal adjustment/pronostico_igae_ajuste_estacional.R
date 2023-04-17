# ******************************************************************************
# Secretaria de Hacienda y Credito Publico
# Unidad de Planeacion Economica de la Hacienda Publica
# Direccion General de Analisis Macroeconomico
# ------------------------------------------------------------------------------
# Last edited:
# ******************************************************************************

# ------------------------------------------------------------------------------
# Upload required libraries 
# ------------------------------------------------------------------------------

#===================================================================#
#================ Ajuste estacional y pronósticos  =================#
#===================================================================#

library(ggplot2)
library(ggthemes)
library(glue)
library(dplyr)
library(broom)
library(purrr)
library(readxl)
library(writexl)
library(foreign)
library(psych)
library(xts)
library(reshape2)
library(seasonal)
library(here)
library(tidyquant)
library(tidyverse)
library(tsibble)
library(lubridate)
library(fable)
library(IMFData)
library(wbstats)
library(WDI)
library(banxicoR)
library(httr)
library(jsonlite)
library(rjson)
library(forecast)
library(tseries)
library(dplyr)
library(vars)
library(urca)
library(mFilter)
library(writexl)
library(openxlsx)
library(data.table)
library(dml)
library(writexl)





#-------- Calling for the data

xyx <- read.csv(file.choose())

xyx_1 <- ts(xyx$tribu, start = c(2004,12), frequency =12)



#---- Seasonal adjustment model

xyxS <- seas (
  x = xyx_1,
  x11="",
  transform.function = "log",
  #estimate= TRUE,
  out = FALSE,
  arima.model = "(0 1 1)(0 1 2)",
  x11.seasonalma = c("s3x5")
)


#---- Forecasting 






