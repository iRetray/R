# Preprocesamiento de datos en R

covidDB <- read.csv("~/Descargas/Casos_positivos_de_COVID-19_en_Colombia.csv")
View(covidDB)

totalReportedCases = dim(covidDB)
totalReportedCases[1]

exampleReport = covidDB[5,]
exampleID = exampleReport[,2]
class(exampleID)

exampleIDasChar = as.character(exampleID)
class(exampleIDasChar)
exampleIDasNumber = as.numeric(exampleID)
class(exampleIDasNumber)

library(dplyr)

covidDB$ID.de.caso = as.character(covidDB$ID.de.caso)

covidDB %>% separate(covidDB$Fecha.de.diagnóstico, c("Dia", "Mes", "Año"))
View(covidDB)

names(covidDB) = c("Fecha de reporte WEB", "ID", "Fecha de notificación", "Departamento", "Nombre departamento", "Código municipio", "Municipio", "Edad",
                   "Unidad de medida de edad", "Sexo", "Tipo de contagio", "Ubicación del caso", "Estado", "Código ISO del país", "Procedencia", "Recuperado",    
                   "Fecha de inicio de síntomas", "Fecha de muerte", "Fecha de diagnóstico", "Fecha de recuperación",   
                   "Tipo de recuperación", "Pertenencia étnica","Nombre del grupo étnico")
View(covidDB)

covidDB$`Ubicación del caso` = factor(covidDB$`Ubicación del caso`, levels = c("Casa"), labels = c(1))
View(covidDB)

casesInHome = covidDB %>% filter(covidDB$`Ubicación del caso` == 1)
dim(casesInHome)

casesInCities = covidDB %>% filter(covidDB$Edad >= 70)
dim(casesInCities)

highestAge = covidDB %>% sort(covidDB$Edad, decreasing = TRUE)
View(highestAge)

highestAge[1]
highestAge[2]
highestAge[3]

covidDB[100,]

lowestAge = covidDB %>% sort(covidDB$Edad, decreasing = FALSE)
View(lowestAge)

twoColumns = c(covidDB$Sexo, covidDB$Edad)
View(twoColumns)

cun = covidDB %>% filter(covidDB$Edad >= 70)
