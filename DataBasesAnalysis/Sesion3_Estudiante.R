rm(list=ls()) 

getwd()

# Definir directorio de trabajo.
#===============================================================================



# DATA FRAME EN R
#===============================================================================
#Los data frames son una estructura de datos que generaliza las matrices, en el sentido en que las
#columnas (por lo general las variables) pueden ser de diferente tipo (por ejemplo, no todas tienen que ser numéricas).
#Sin embargo, todos los elementos de una misma columna deben ser del mismo tipo.
#Al igual que las filas y columnas de una matriz, todos los elementos de un data frame deben ser de la misma longitud.
#De este modo, pueden usarse funciones tales como dimnames, dim, nrow, etc., sobre un data frame como
#si se tratara de una matriz. Se puede acceder a los datos de un data frame como elementos de
#una matriz o de una lista.

#Ejercicio:
#Crear vectores que contengan: el nombre, la edad y numero de hermanos 
#de los estudiantes del curso.

library(help="datasets")

Edad <- c(NA,17,18,18,21)
Num_her <- c(1,2,3,3,4)
Names <- c("E1","E2","E3","E4","E5")
Estrato <- c(2,3,4,3,5)
Estrato <- as.factor(Estrato)
Semestre <- factor(c(2,3,4,4,7))
class(Edad)
class(Num_her)
class(Names)
class(Estrato)
class(Semestre)
Base <- data.frame(Edad,Num_her,Names,Estrato,Semestre)
Base
dim(Base)
str(Base)
head(Base,2)
tail(Base,2)
Base$Estrato
Base$Edad

#===============================================================================
#===============================================================================
# LIBRERIAS EN R
#===============================================================================
#Ampliación de las funcionalidades de R mediante
#paquetes o librerias.

#install.packages("dplyr") Instalación frecuente.
#install.packages("dplyr", dependencies = T) Instalación con las dependencias
#Una vez instalado el paquete se debe cargar con alguna de las siguientes opciones
#library(dplyr) o require(dplyr)
#Diferencia
#library() devuelve un error si el paquete solicitado no existe.
#requiere() genera una advertencia.
#Se puede utilizar una función de un paquete sin cargarlo, cargando 
#de la siguiente forma:
#rpart::car.test.frame


#Ejercicio: Explorar algunas librerias y bases de datos en R. 

# R contiene datasets que pueden ser utilizados directamente.

library(help=)

?cars
View(cars)
cars$speed

# bases de datos que se encuentran en "datasets"


# Otras librerias

library("pscl")
data(s109)
s109



#===============================================================================
#===============================================================================
# IMPORTAR Y EXPORTAR DATOS EN R
#===============================================================================

#IMPORTAR DATOS

#read.table(), funcion general.
#read.csv(), lectura de bases de datos en formato texto (.txt, .csv) con las variables separadas por comas, 
#asume que los valores decimales estan señalados por un punto.
#read.csv2(), es igual a la funci?n anterior, pero asume que los valores decimales estan separados 
#por coma.


#Ejercicio: Cargar archivos desde excel. Cargar la base Datos1
#Para importar datos desde excel se requiere la libreria "readxl"
#se usa el comando Data <-read_excel("Nombre del archivo")

library("readxl")
dataFromXML <- read_excel("Datos1.xlsx")
dataFromXML

library("haven")
saveRDS(dataFromXML, file="dataframeExported.rds")

exportedData <- readRDS("dataframeExported.rds")
exportedData



#Ejercicio: Cargar archivos de texto. Cargar la base Datos2 y Datos3
#Para importar datos de texto se requiere la libreria "readr"

#From text (base)


#From text (readr)



#Ejercicio: Cargar archivos desde un sitio web
#Para importar datos desde un sitio web se requiere la libreria "haven"
#importar la base de datos llamada binary.dta que esta alojado en los servidores de la UCLA (Universidad de California).
#Datos4<-read_dta("http://stats.idre.ucla.edu/stat/stata/dae/binary.dta")



#Cargar datos .dta desde el computador



#Ejercicio: Cargar datos .rds y .Rdata (también conocidos como .rda )
#Almacena objetos R en un formato nativo a R.
#Guardar el data frame Base que hemos creado anteriormente y cargarlo de nuevo.




#EXPORTAR DATOS
#Al igual que importar desde una extension predeterminada, 
#se puede exportar en cualquier extension.

#Ejericio: Exportar la base "Base" a extension .txt


#Ejericio: Exportar la base "Base" a extension .dta



#===============================================================================
#===============================================================================
# WEB SCRAPPING 
#===============================================================================
#El proceso y acciones para recopilar informacion de la Web se conoce como web scrapping. 
#Se puede acceder a los datos directamente pero actualmente es muy comon hacerlo a traves
#de APIs ("Aplication Programming Interface"/ interfaz de programación de aplicaciones), 
# ya que la mayoria de organismos/empresas tienen una o varias APIs.
# Se puede entender como un mecanismo que permite interactuar 
# (por ejemplo para hacer una peticion de datos) con un servidor de internet.

#Las APIs facilitan la recopilacion de datos al poder acceder a ellas de forma 
#programática ya que proveen de un proceso de acceso estandarizado: se envía 
#una "http request" a la API y se reciben los datos en un determinado formato, 
#generalmente JSON o XML.

#JSON (JavaScript Object Notation)
#XML (Extensible Markup Language).
#Para JSON, se recomienda usar el paquete jsonlite y para XML, xml2.

#Utilizar el paquete de R eurostat para acceder a la API de Eurostat y descargar datos directamente en R.
#Acceder a Eurostat a traves del package eurostat
#https://ec.europa.eu/eurostat/data/web-services


library("eurostat")


#------------- Se busca "un tema" con search_eurostat
T1 <- search_eurostat("employment", type = "all") 
T1$code[290]
T1[333,]

#-------------- Elegir una base de datos en Eurostat
DataBaseEurostat <- "cult_emp_sex"

#------------------ Descargar los datos con get_eurostat()
DataEuro <- get_eurostat(DataBaseEurostat, time_format = "raw", keepFlags = F)