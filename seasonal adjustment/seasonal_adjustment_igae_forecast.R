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

#===============================================================#
#============== Seasonal Adjustment Forecast ===================#
#==================================================?============#

install.packages("ggplot2")
install.packages("ggthemes")
install.packages("glue")
install.packages("dplyr")
install.packages("broom")
install.packages("purrr")
install.packages("readxl")
install.packages("writexl")
install.packages("foreign")
install.packages("psych")
install.packages("xts")
install.packages("reshape2")
install.packages("seasonal")
install.packages("here")
install.packages("tidyquant")
install.packages("tidyverse")
install.packages("tsibble")
install.packages("lubridate")
install.packages("fable")
install.packages("IMFData")
install.packages("wbstats")
install.packages("WDI")
install.packages("banxicoR")
install.packages("httr")
install.packages("jsonlite")
install.packages("rjson")
install.packages("forecast")
install.packages("tseries")
install.packages("dplyr")
install.packages("vars")
install.packages("urca")
install.packages("mFilter")
install.packages("writexl")
install.packages("openxlsx")
install.packages("data.table")
install.packages("dml")



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


#====================================
#   Selecting the information

s_o = read.xlsx(file.choose())

# Time series data

s_o_1 = ts(s_o$igae, start = c(1993,1), frequency =  12)


ajuste<-seas(
             x = s_o_1, 
             spectrum.savelog = "peaks", 
             transform.function = "log", 
             regression.variables = c("tdnolpyear", "lpyear", 
                                      "easter[3]", "ao1995.10", "ao2020.4", "ao2020.5", 
                                      "ao2020.6", "ao2020.7", "ao2020.8", "ls1995.2", "ls2009.1", 
                                      "ls2020.4", "tc2021.8"), 
             regression.savelog = "aictest", 
             arima.model = "(0 1 [1 4 7])(0 1 1)", 
             forecast.maxlead = 24, 
             forecast.print = "none", 
             estimate.print = c("roots","regcmatrix", "acm"), 
             estimate.savelog = c("aicc","aic", "bic", "hq", "afc"), 
             check.print = "all", 
             check.savelog = c("lbq", "nrm"),
             x11.seasonalma = c("s3x3","s3x3", "s3x3", "s3x3", "s3x3", "s3x3",
                                "s3x5", "s3x5", "s3x5", "s3x3", "s3x3","s3x3"), 
             x11.savelog = "all",
             x11.sigmalim = c("2.0","3.0"),
             outlier.tcrate =("0.4")
            # slidingspans.savelog = "percent", 
             #slidingspans.additivesa = "percent", 
             #history.estimates = c("fcst","aic", "sadj", "sadjchng", "trend","trendchng"), 
             #history.savelog = c("asa", "ach","atr", "atc"), 
             )



#Comprobacion
d11<-data.frame(ajuste$data)
write_xlsx( x= d11, path = "D:/Documentos/Rstudio/Ajuste estacional/d11_igae.xlsx", col_names =TRUE)

x_1_fct = series(ajuste, "fct")
x_1_fct_1 = data.frame(x_1_fct)
write_xlsx( x= x_1_fct_1, path = "D:/Documentos/Rstudio/Ajuste estacional/forecast_igae.xlsx", col_names =TRUE)

#write.csv(d11, "d11.csv")





