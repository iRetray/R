# GUIA DE INICIO RAPIDO EN R

# COMANDOS INICIALES

# Obtener directorio de trabajo y establecerlo
getwd()
setwd("C:/Users/julian.cruz/Desktop/R/DataBasesAnalysis")

# Crear variables
aNumber <- 5
anotherNumber = 2056
aText = "¡R is great!"
aNumber
anotherNumber
aText

# Instalar y usar librerias
library(dplyr)
# Ayuda sobre una lib
?dplyr #Documentacion de la lib
??dplyr #Buscar docs de la lib en R
# Ver datos de una base de datos
library(gapminder)
statsData = gapminder
View(statsData)
