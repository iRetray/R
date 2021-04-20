# Actividad de libreria y bases de datos

install.packages("WDI")
library("WDI")
help(WDI)

aa = WDIsearch('gdp')
Data = WDI(indicator = "NY.GDP.PCAP.KD")
Data1 = WDI(indicator = "NY.GDP.PCAP.KD", country = c('MX', 'CA', 'US'), start = 1960, end = 2017)

aa
class(aa)
dim(aa)
help(dim)

aa[38]

Data
dim(Data)

install.packages("dplyr")
library("dplyr")

dataFromColombia = Data %>% filter(iso2c == "CO")
dataFromColombia
dim(dataFromColombia)

anotherFilterType = Data %>% filter(country == "Colombia")
anotherFilterType
dim(anotherFilterType)

Data2 = WDI(country = "CO", start = 1970, end = 2015)
Data2

Data2[30,]

Data2[3,]

write.table(x = Data2, file = "Data2ExportadoComoTexto.txt", sep = ",",
            row.names = TRUE, col.names = TRUE)

saveRDS(object = Data2, file = "Data2ExportadoComoRDS.rds")

citation(package = "WDI")