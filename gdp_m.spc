#D:\Documentos\WinX13\Data_time\GDP_total\gdp_m.spc was created on 26/03/2022 23:15:46
#Created using X-13A-S version 1.1 build 39

series{ 
    file = "gdp_m.txt"
    period = 12
    format = free
    start = 1993.01
}
transform{ 
    function = log
}
regression{ 
    variables = (Easter[4] Tdnolpyear lpyear AO1995.Oct AO2020.Apr AO2020.May AO2020.Jun AO2020.Jul LS1995.Feb LS2009.Jan)


    #aictest = ( td easter )
    #savelog = aictest
}
outlier{ 
    types = ( AO LS )
}
arima{ 
    model = (0 1 [1 4 7])(0 1 1)
}
forecast{ 
    maxlead = 12
    print = none
}
estimate{ 
    print = (roots regcmatrix acm)
    savelog = (aicc aic bic hq afc)
}
check{ 
    print = all
    savelog = (lbq nrm)
}
x11{ 
    seasonalma = ( s3x3 s3x3 s3x5 s3x3 s3x5 s3x5 s3x5 s3x5 s3x3 s3x5 s3x3 s3x3 )
    
    savelog = all
}
slidingspans{ 
    savelog = percent
    additivesa = percent
}
history{ 
    estimates = (fcst aic sadj sadjchng trend trendchng)
    savelog = (asa ach atr atc)
}
